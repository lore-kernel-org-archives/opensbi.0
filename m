From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 12 Mar 2024 15:57:57 +0530
Subject: [PATCH v2 03/10] include: sbi: Add trap_context pointer in struct sbi_scratch
In-Reply-To: <20240312102804.1436376-1-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
Message-ID: <20240312102804.1436376-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To track nested traps, the struct sbi_scratch needs a pointer the
current trap context so add trap_context pointer in struct sbi_context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 firmware/fw_base.S        |  3 ++-
 include/sbi/sbi_scratch.h | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index c404d8b..539fd1d 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -298,7 +298,8 @@ _scratch_init:
 	/* Store hartid-to-scratch function address in scratch space */
 	lla	a4, _hartid_to_scratch
 	REG_S	a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
-	/* Clear tmp0 in scratch space */
+	/* Clear trap_context and tmp0 in scratch space */
+	REG_S	zero, SBI_SCRATCH_TRAP_CONTEXT_OFFSET(tp)
 	REG_S	zero, SBI_SCRATCH_TMP0_OFFSET(tp)
 	/* Store firmware options in scratch space */
 	MOV_3R	s0, a0, s1, a1, s2, a2
diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 55b937f..12e6a98 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -36,12 +36,14 @@
 #define SBI_SCRATCH_PLATFORM_ADDR_OFFSET	(9 * __SIZEOF_POINTER__)
 /** Offset of hartid_to_scratch member in sbi_scratch */
 #define SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET	(10 * __SIZEOF_POINTER__)
+/** Offset of trap_context member in sbi_scratch */
+#define SBI_SCRATCH_TRAP_CONTEXT_OFFSET		(11 * __SIZEOF_POINTER__)
 /** Offset of tmp0 member in sbi_scratch */
-#define SBI_SCRATCH_TMP0_OFFSET			(11 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_TMP0_OFFSET			(12 * __SIZEOF_POINTER__)
 /** Offset of options member in sbi_scratch */
-#define SBI_SCRATCH_OPTIONS_OFFSET		(12 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_OPTIONS_OFFSET		(13 * __SIZEOF_POINTER__)
 /** Offset of extra space in sbi_scratch */
-#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(13 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(14 * __SIZEOF_POINTER__)
 /** Maximum size of sbi_scratch (4KB) */
 #define SBI_SCRATCH_SIZE			(0x1000)
 
@@ -75,6 +77,8 @@ struct sbi_scratch {
 	unsigned long platform_addr;
 	/** Address of HART ID to sbi_scratch conversion function */
 	unsigned long hartid_to_scratch;
+	/** Address of current trap context */
+	unsigned long trap_context;
 	/** Temporary storage */
 	unsigned long tmp0;
 	/** Options for OpenSBI library */
@@ -125,6 +129,11 @@ _Static_assert(
 		== SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET,
 	"struct sbi_scratch definition has changed, please redefine "
 	"SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, trap_context)
+		== SBI_SCRATCH_TRAP_CONTEXT_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_TRAP_CONTEXT_OFFSET");
 _Static_assert(
 	offsetof(struct sbi_scratch, tmp0)
 		== SBI_SCRATCH_TMP0_OFFSET,
-- 
2.34.1


