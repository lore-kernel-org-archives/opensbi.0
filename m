From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 18 Oct 2024 10:40:04 +0200
Subject: [PATCH v4 3/7] lib: sbi: add Ssdbltrp ISA extension support
In-Reply-To: <20241018084010.406285-1-cleger@rivosinc.com>
References: <20241018084010.406285-1-cleger@rivosinc.com>
Message-ID: <20241018084010.406285-4-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add Ssdbltrp trap handler support for S-mode double trap handling. If
the trap is received while in VS-mode, then the trap is redirected to
S-mode. If caught while in HS-mode, then an error is returned to the top
trap handler which will panic.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi/riscv_encoding.h |  4 +++-
 include/sbi/sbi_hart.h       |  2 ++
 include/sbi/sbi_trap_ldst.h  |  2 ++
 lib/sbi/objects.mk           |  1 +
 lib/sbi/sbi_double_trap.c    | 30 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |  4 ++++
 lib/sbi/sbi_trap.c           |  4 ++++
 7 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 lib/sbi/sbi_double_trap.c

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 980abdb..2264427 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -216,6 +216,7 @@
 #define ENVCFG_PBMTE			(_ULL(1) << 62)
 #define ENVCFG_ADUE			(_ULL(1) << 61)
 #define ENVCFG_CDE			(_ULL(1) << 60)
+#define ENVCFG_DTE			(_ULL(1) << 59)
 #define ENVCFG_PMM			(_ULL(0x3) << 32)
 #define ENVCFG_PMM_PMLEN_0		(_ULL(0x0) << 32)
 #define ENVCFG_PMM_PMLEN_7		(_ULL(0x2) << 32)
@@ -773,7 +774,8 @@
 #define CAUSE_FETCH_PAGE_FAULT		0xc
 #define CAUSE_LOAD_PAGE_FAULT		0xd
 #define CAUSE_STORE_PAGE_FAULT		0xf
-#define CAUSE_SW_CHECK_EXCP			0x12
+#define CAUSE_DOUBLE_TRAP		0x10
+#define CAUSE_SW_CHECK_EXCP		0x12
 #define CAUSE_FETCH_GUEST_PAGE_FAULT	0x14
 #define CAUSE_LOAD_GUEST_PAGE_FAULT	0x15
 #define CAUSE_VIRTUAL_INST_FAULT	0x16
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 22d8327..4c36c77 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -73,6 +73,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_ZICFILP,
 	/** HART has zicfiss extension */
 	SBI_HART_EXT_ZICFISS,
+	/** Hart has Ssdbltrp extension */
+	SBI_HART_EXT_SSDBLTRP,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
index 8aee316..4c5cc37 100644
--- a/include/sbi/sbi_trap_ldst.h
+++ b/include/sbi/sbi_trap_ldst.h
@@ -28,4 +28,6 @@ int sbi_load_access_handler(struct sbi_trap_context *tcntx);
 
 int sbi_store_access_handler(struct sbi_trap_context *tcntx);
 
+int sbi_double_trap_handler(struct sbi_trap_context *tcntx);
+
 #endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 535aa70..7be943f 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -66,6 +66,7 @@ libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
 libsbi-objs-y += sbi_domain_context.o
 libsbi-objs-y += sbi_domain.o
+libsbi-objs-y += sbi_double_trap.o
 libsbi-objs-y += sbi_emulate_csr.o
 libsbi-objs-y += sbi_fifo.o
 libsbi-objs-y += sbi_fwft.o
diff --git a/lib/sbi/sbi_double_trap.c b/lib/sbi/sbi_double_trap.c
new file mode 100644
index 0000000..96f2fa5
--- /dev/null
+++ b/lib/sbi/sbi_double_trap.c
@@ -0,0 +1,30 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Rivos Inc.
+ *
+ * Authors:
+ *   Cl?ment L?ger <clement.leger@rivosinc.com>
+ */
+
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_sse.h>
+#include <sbi/sbi_trap.h>
+
+int sbi_double_trap_handler(struct sbi_trap_context *tcntx)
+{
+	struct sbi_trap_regs *regs = &tcntx->regs;
+	const struct sbi_trap_info *trap = &tcntx->trap;
+	bool prev_virt = sbi_regs_from_virt(regs);
+
+	if (sbi_mstatus_prev_mode(regs->mstatus) != PRV_S)
+		return SBI_ERR_INVALID_PARAM;
+
+	/* Exception was taken in VS-mode, redirect it to S-mode */
+	if (prev_virt)
+		return sbi_trap_redirect(regs, trap);
+
+	return SBI_ENOTSUPP;
+}
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d9aef31..dc0863a 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -117,6 +117,9 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		menvcfg_val |= ((uint64_t)csr_read(CSR_MENVCFGH)) << 32;
 #endif
 
+		/* Disable double trap by default */
+		menvcfg_val &= ~ENVCFG_DTE;
+
 #define __set_menvcfg_ext(__ext, __bits)				\
 		if (sbi_hart_has_extension(scratch, __ext))		\
 			menvcfg_val |= __bits;
@@ -684,6 +687,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smnpm, SBI_HART_EXT_SMNPM),
 	__SBI_HART_EXT_DATA(zicfilp, SBI_HART_EXT_ZICFILP),
 	__SBI_HART_EXT_DATA(zicfiss, SBI_HART_EXT_ZICFISS),
+	__SBI_HART_EXT_DATA(ssdbltrp, SBI_HART_EXT_SSDBLTRP),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index fd70e67..d2de0c8 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -350,6 +350,10 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
 		rc  = sbi_store_access_handler(tcntx);
 		msg = "store fault handler failed";
 		break;
+	case CAUSE_DOUBLE_TRAP:
+		rc  = sbi_double_trap_handler(tcntx);
+		msg = "double trap handler failed";
+		break;
 	default:
 		/* If the trap came from S or U mode, redirect it there */
 		msg = "trap redirect failed";
-- 
2.45.2


