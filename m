From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Wed, 05 Feb 2025 17:03:50 +0000
Subject: [PATCH v2 0/2] Enable Ssctr Ext using mstateen and add FWFT
 support for CTR.
Message-ID: <20250205-ctr_upstream_v2-v2-0-2910f2c74e22@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Control Transfer Records (CTR) extension provides a method to
record a limited branch history in register-accessible internal chip
storage.

These two patches add support to allow S-mode to access Ssctr. Also this adds
support for SBI_FWFT_CONTROL_TRANSFER_RECORD bit in FWFT ext.

In case of M-mode firmware (Opensbi etc) we keep Ssctr always enabled and return
SBI_ERR_DENIED on sbi_fwft_set() call to notify that Ssctr is always enabled by
default.

A hypervisor on the other hand can keep Ssctr disabled by default to avoid
saving-restoring CTR state on vcpu switch. A guest vcpu has to request SBI
implementation to enable CTR extension when kernel uses it.

I have proposed SBI_FWFT_CONTROL_TRANSFER_RECORD bit in FWFT extension
in tech-prs group [0]. I am deliberately sending this series a bit early to
gather feedback on the patches.

I have created a wiki to run CTR demo on kvm host and guest to
demonstrate lazy save/restore use-case working with FWFT bit. Wiki can
be found here [1].

[0]: https://lists.riscv.org/g/tech-prs/message/1333
[1]: https://github.com/rajnesh-kanwal/linux/wiki/Running-CTR-basic-demo-on-KVM-QEMU-RISCV-Virt-machine

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
Changelog:
v1: Incorporated feedback from Anup and Atish.
  - Added FWFT bit to enable/disable Ssctr Ext to allow lazy context
    save restore.
  - https://patchwork.ozlabs.org/project/opensbi/patch/20240529150210.125200-1-rkanwal at rivosinc.com/

---
Rajnesh Kanwal (2):
      lib: sbi: Enable Control Transfer Records (CTR) Ext using xstateen.
      lib: sbi: fwft: Add FWFT support for Control transfer records ext

 include/sbi/riscv_encoding.h      | 13 +++++++++++++
 include/sbi/sbi_ecall_interface.h |  4 +++-
 include/sbi/sbi_hart.h            |  4 ++++
 lib/sbi/sbi_fwft.c                | 30 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c                | 19 +++++++++++++++++++
 5 files changed, 69 insertions(+), 1 deletion(-)
---
base-commit: a2807646a85878cb631cbc2b012cf888fc4427d7
change-id: 20250205-ctr_upstream_v2-7ef621789677

Best regards,
-- 
Best regards
Rajnesh Kanwal


