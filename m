From: dramforever <dramforever@live.com>
Date: Thu,  9 Jun 2022 15:06:29 +0800
Subject: [PATCH 0/3] Fixes for tval/tinst when using sbi_trap_redirect()
Message-ID: <TYYP286MB1439F38753D033042F83C8E0C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I went through usages of sbi_trap_redirect() and saw some cases where
after redirecting, stval/htinst could be set to incorrect values. I
tried fixing what I noticed.

Note that these patches are *UNTESTED*.

- For the htinst fixes, no current implementation (QEMU or Spike) of the
  hypervisor extension writes mtinst/htinst to non-zero values, so the
  code paths are unused.
- The sbi_get_insn() fix requires a rare occasion where the instruction
  is fetched normally then unmapped from memory before OpenSBI can load
  it again, and I have not been reproduce.

Please bear in mind when reviewing.

dramforever (3):
  include: sbi: Add mtinst/htinst psuedoinstructions
  lib: sbi: Fixup tinst for exceptions in sbi_misaligned_*()
  lib: sbi: Fix tval and tinst for sbi_get_insn()

 include/sbi/riscv_encoding.h  | 20 ++++++++++++++++++++
 lib/sbi/sbi_misaligned_ldst.c | 16 ++++++++++++++++
 lib/sbi/sbi_unpriv.c          |  8 +++++---
 3 files changed, 41 insertions(+), 3 deletions(-)

-- 
2.36.0


