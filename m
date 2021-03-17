From: Vincent Chen <vincent.chen@sifive.com>
Date: Wed, 17 Mar 2021 09:16:36 +0800
Subject: [PATCH v3 0/2] Support position independent execution 
Message-ID: <1615943798-14296-1-git-send-email-vincent.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch set enables OpenSBI to support position-independent execution
so that one OpenSBI generic firmware can run on multiple platforms, even
if they have different memory base addresses. However, the PIC code will
decrease a bit of performance.

The performance loss of PIC comes from two additional operations. One is
from the symbol relocation in the beginning stage, and another one is
from the GOT reference (auipc + load GOT) in the OpenSBI lifetime. The
former only affects the boot time, but the latter will affect the
performance of the OpenSBI payload such as the Linux kernel. After
analyzing the fw_payload.elf of the generic platform, 27 symbols use the
GOT reference method to get their address. Fortunately, 17 of these
symbols are accessed once during the initialized step. Only the remaining
10 symbols may be called repeatedly during the lifetime, which are
1. hartid_to_domain_table
2. hartid_to_scratch_table
3. sbi_hart_expected_trap
4. sbi_tlb_local_hfence_vvma
5. sbi_tlb_local_hfence_gvma
6. sbi_tlb_local_sfence_vma_asid
7. sbi_tlb_local_fence_i
8. sbi_tlb_local_hfence_gvma
9. sbi_tlb_local_hfence_vvma
10. sbi_tlb_local_sfence_vma
From these 10 symbols, I think the IPI handler may be one of the critical
and commonly used paths affected by the PIC mode. Therefore, I create two
kernel modules, One keeps issuing the REMOTE_FENCE_I request and the other
one keeps issuing REMOTE_SFENCE_VMA request. These two modules are executed
on the unleashed board to measure the consumed time of the sbi_tlb_request().
I found the PIC causes a 1.6% and 4.1% performance loss in addressing
REMOTE_FENCE_I and REMOTE_SFENCE_VMA, respectively. In addition, to observe
the impact of PIC mode in the general usage cases, I use SPEC2006 to
benchmark performance. However, I could not observe any performance impact
from the results. Based on the above two results, I think the performance
impact of the PIC may not be obvious in general usage. Just in case, this
patch still creates an FW_PIC option for users to configure the build options.

Changes from v2 patch:
1. Drop the relocation in FW_JUMP_FDT_ADDR, FW_JUMP_ADDR and FW_PAYLOAD_FDT_ADDR.
2. Code refinement

Changes from v1 patch:
1. Add -fpic to ASFLAGS and then remove the ".option pic" from fw_base.S
2. Append the required flags to $(firmware-genflags-y), $(firmware-cflags-y)
   and $(firmware-ldflags-y) instead of modifying top Makefile.
3. Rearrange the patches

Vincent Chen (2):
  firmware: Use lla to access all global symbols
  firmware: Support position independent execution

 Makefile                      |   2 +-
 firmware/fw_base.S            | 150 +++++++++++++++++++++++++++++-------------
 firmware/fw_base.ldS          |  13 ++++
 firmware/fw_dynamic.S         |  18 ++---
 firmware/fw_jump.S            |   2 +-
 firmware/fw_payload.S         |   2 +-
 firmware/objects.mk           |   7 ++
 firmware/payloads/test_head.S |  18 ++---
 include/sbi/riscv_elf.h       |  14 ++++
 9 files changed, 160 insertions(+), 66 deletions(-)
 create mode 100644 include/sbi/riscv_elf.h

-- 
2.7.4


