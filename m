From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:33 +0530
Subject: [PATCH v2 02/18] platform: Allow platforms to specify heap size
In-Reply-To: <20230605113749.230696-1-apatel@ventanamicro.com>
References: <20230605113749.230696-1-apatel@ventanamicro.com>
Message-ID: <20230605113749.230696-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We extend struct sbi_platform and struct sbi_scratch to allow platforms
specify the heap size to the OpenSBI firmwares. The OpenSBI firmwares
will use this information to determine the location of heap and provide
heap base address in per-HART scratch space.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 firmware/fw_base.S                 | 15 +++++++++++++++
 include/sbi/sbi_platform.h         | 18 +++++++++++++++---
 include/sbi/sbi_scratch.h          | 28 ++++++++++++++++++----------
 platform/fpga/ariane/platform.c    |  1 +
 platform/fpga/openpiton/platform.c |  2 ++
 platform/generic/platform.c        |  3 ++-
 platform/kendryte/k210/platform.c  |  2 ++
 platform/nuclei/ux600/platform.c   |  2 ++
 platform/template/platform.c       |  1 +
 9 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index e37df09..fff09e1 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -255,20 +255,28 @@ _bss_zero:
 	/* Preload HART details
 	 * s7 -> HART Count
 	 * s8 -> HART Stack Size
+	 * s9 -> Heap Size
+	 * s10 -> Heap Offset
 	 */
 	lla	a4, platform
 #if __riscv_xlen > 32
 	lwu	s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
 	lwu	s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
+	lwu	s9, SBI_PLATFORM_HEAP_SIZE_OFFSET(a4)
 #else
 	lw	s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
 	lw	s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
+	lw	s9, SBI_PLATFORM_HEAP_SIZE_OFFSET(a4)
 #endif
 
 	/* Setup scratch space for all the HARTs*/
 	lla	tp, _fw_end
 	mul	a5, s7, s8
 	add	tp, tp, a5
+	/* Setup heap base address */
+	lla	s10, _fw_start
+	sub	s10, tp, s10
+	add	tp, tp, s9
 	/* Keep a copy of tp */
 	add	t3, tp, zero
 	/* Counter */
@@ -283,8 +291,11 @@ _scratch_init:
 	 * t3 -> the firmware end address
 	 * s7 -> HART count
 	 * s8 -> HART stack size
+	 * s9 -> Heap Size
+	 * s10 -> Heap Offset
 	 */
 	add	tp, t3, zero
+	sub	tp, tp, s9
 	mul	a5, s8, t1
 	sub	tp, tp, a5
 	li	a5, SBI_SCRATCH_SIZE
@@ -302,6 +313,10 @@ _scratch_init:
 	REG_L	a5, 0(a4)
 	REG_S	a5, SBI_SCRATCH_FW_RW_OFFSET(tp)
 
+	/* Store fw_heap_offset and fw_heap_size in scratch space */
+	REG_S	s10, SBI_SCRATCH_FW_HEAP_OFFSET(tp)
+	REG_S	s9, SBI_SCRATCH_FW_HEAP_SIZE_OFFSET(tp)
+
 	/* Store next arg1 in scratch space */
 	MOV_3R	s0, a0, s1, a1, s2, a2
 	call	fw_next_arg1
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 546c0a6..3e9616f 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -29,12 +29,16 @@
 #define SBI_PLATFORM_HART_COUNT_OFFSET (0x50)
 /** Offset of hart_stack_size in struct sbi_platform */
 #define SBI_PLATFORM_HART_STACK_SIZE_OFFSET (0x54)
+/** Offset of heap_size in struct sbi_platform */
+#define SBI_PLATFORM_HEAP_SIZE_OFFSET (0x58)
+/** Offset of reserved in struct sbi_platform */
+#define SBI_PLATFORM_RESERVED_OFFSET (0x5c)
 /** Offset of platform_ops_addr in struct sbi_platform */
-#define SBI_PLATFORM_OPS_OFFSET (0x58)
+#define SBI_PLATFORM_OPS_OFFSET (0x60)
 /** Offset of firmware_context in struct sbi_platform */
-#define SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET (0x58 + __SIZEOF_POINTER__)
+#define SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET (0x60 + __SIZEOF_POINTER__)
 /** Offset of hart_index2id in struct sbi_platform */
-#define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x58 + (__SIZEOF_POINTER__ * 2))
+#define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x60 + (__SIZEOF_POINTER__ * 2))
 
 #define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
 
@@ -138,6 +142,10 @@ struct sbi_platform_operations {
 /** Platform default per-HART stack size for exception/interrupt handling */
 #define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE	8192
 
+/** Platform default heap size */
+#define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)	\
+					(0x8000 + 0x800 * (__num_hart))
+
 /** Representation of a platform */
 struct sbi_platform {
 	/**
@@ -160,6 +168,10 @@ struct sbi_platform {
 	u32 hart_count;
 	/** Per-HART stack size for exception/interrupt handling */
 	u32 hart_stack_size;
+	/** Size of heap shared by all HARTs */
+	u32 heap_size;
+	/** Reserved for future use */
+	u32 reserved;
 	/** Pointer to sbi platform operations */
 	unsigned long platform_ops_addr;
 	/** Pointer to system firmware specific context */
diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 58f2d06..9894c70 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -20,26 +20,30 @@
 #define SBI_SCRATCH_FW_SIZE_OFFSET		(1 * __SIZEOF_POINTER__)
 /** Offset (in sbi_scratch) of the R/W Offset */
 #define SBI_SCRATCH_FW_RW_OFFSET		(2 * __SIZEOF_POINTER__)
+/** Offset of fw_heap_offset member in sbi_scratch */
+#define SBI_SCRATCH_FW_HEAP_OFFSET		(3 * __SIZEOF_POINTER__)
+/** Offset of fw_heap_size_offset member in sbi_scratch */
+#define SBI_SCRATCH_FW_HEAP_SIZE_OFFSET		(4 * __SIZEOF_POINTER__)
 /** Offset of next_arg1 member in sbi_scratch */
-#define SBI_SCRATCH_NEXT_ARG1_OFFSET		(3 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_NEXT_ARG1_OFFSET		(5 * __SIZEOF_POINTER__)
 /** Offset of next_addr member in sbi_scratch */
-#define SBI_SCRATCH_NEXT_ADDR_OFFSET		(4 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_NEXT_ADDR_OFFSET		(6 * __SIZEOF_POINTER__)
 /** Offset of next_mode member in sbi_scratch */
-#define SBI_SCRATCH_NEXT_MODE_OFFSET		(5 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_NEXT_MODE_OFFSET		(7 * __SIZEOF_POINTER__)
 /** Offset of warmboot_addr member in sbi_scratch */
-#define SBI_SCRATCH_WARMBOOT_ADDR_OFFSET	(6 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_WARMBOOT_ADDR_OFFSET	(8 * __SIZEOF_POINTER__)
 /** Offset of platform_addr member in sbi_scratch */
-#define SBI_SCRATCH_PLATFORM_ADDR_OFFSET	(7 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_PLATFORM_ADDR_OFFSET	(9 * __SIZEOF_POINTER__)
 /** Offset of hartid_to_scratch member in sbi_scratch */
-#define SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET	(8 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET	(10 * __SIZEOF_POINTER__)
 /** Offset of trap_exit member in sbi_scratch */
-#define SBI_SCRATCH_TRAP_EXIT_OFFSET		(9 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_TRAP_EXIT_OFFSET		(11 * __SIZEOF_POINTER__)
 /** Offset of tmp0 member in sbi_scratch */
-#define SBI_SCRATCH_TMP0_OFFSET			(10 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_TMP0_OFFSET			(12 * __SIZEOF_POINTER__)
 /** Offset of options member in sbi_scratch */
-#define SBI_SCRATCH_OPTIONS_OFFSET		(11 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_OPTIONS_OFFSET		(13 * __SIZEOF_POINTER__)
 /** Offset of extra space in sbi_scratch */
-#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(12 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(14 * __SIZEOF_POINTER__)
 /** Maximum size of sbi_scratch (4KB) */
 #define SBI_SCRATCH_SIZE			(0x1000)
 
@@ -57,6 +61,10 @@ struct sbi_scratch {
 	unsigned long fw_size;
 	/** Offset (in bytes) of the R/W section */
 	unsigned long fw_rw_offset;
+	/** Offset (in bytes) of the heap area */
+	unsigned long fw_heap_offset;
+	/** Size (in bytes) of the heap area */
+	unsigned long fw_heap_size;
 	/** Arg1 (or 'a1' register) of next booting stage for this HART */
 	unsigned long next_arg1;
 	/** Address of next booting stage for this HART */
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 1e341c2..975528f 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -185,5 +185,6 @@ const struct sbi_platform platform = {
 	.features = SBI_PLATFORM_DEFAULT_FEATURES,
 	.hart_count = ARIANE_HART_COUNT,
 	.hart_stack_size = SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
+	.heap_size = SBI_PLATFORM_DEFAULT_HEAP_SIZE(ARIANE_HART_COUNT),
 	.platform_ops_addr = (unsigned long)&platform_ops
 };
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 57ae698..e59dc99 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -220,5 +220,7 @@ const struct sbi_platform platform = {
 	.features = SBI_PLATFORM_DEFAULT_FEATURES,
 	.hart_count = OPENPITON_DEFAULT_HART_COUNT,
 	.hart_stack_size = SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
+	.heap_size =
+		SBI_PLATFORM_DEFAULT_HEAP_SIZE(OPENPITON_DEFAULT_HART_COUNT),
 	.platform_ops_addr = (unsigned long)&platform_ops
 };
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index eeefef4..0c9cd95 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -115,7 +115,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 	}
 
 	platform.hart_count = hart_count;
-
+	platform.heap_size = SBI_PLATFORM_DEFAULT_HEAP_SIZE(hart_count);
 	platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
 
 	/* Return original FDT pointer */
@@ -315,5 +315,6 @@ struct sbi_platform platform = {
 	.hart_count		= SBI_HARTMASK_MAX_BITS,
 	.hart_index2id		= generic_hart_index2id,
 	.hart_stack_size	= SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
+	.heap_size		= SBI_PLATFORM_DEFAULT_HEAP_SIZE(0),
 	.platform_ops_addr	= (unsigned long)&platform_ops
 };
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index 7eb9015..637a217 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -196,5 +196,7 @@ const struct sbi_platform platform = {
 	.features		= 0,
 	.hart_count		= K210_HART_COUNT,
 	.hart_stack_size	= SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
+	.heap_size		=
+			SBI_PLATFORM_DEFAULT_HEAP_SIZE(K210_HART_COUNT),
 	.platform_ops_addr	= (unsigned long)&platform_ops
 };
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 4eccff1..6fd6cd7 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -244,5 +244,7 @@ const struct sbi_platform platform = {
 	.features		= SBI_PLATFORM_DEFAULT_FEATURES,
 	.hart_count		= UX600_HART_COUNT,
 	.hart_stack_size	= SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
+	.heap_size		=
+			SBI_PLATFORM_DEFAULT_HEAP_SIZE(UX600_HART_COUNT),
 	.platform_ops_addr	= (unsigned long)&platform_ops
 };
diff --git a/platform/template/platform.c b/platform/template/platform.c
index 8adc431..86381ca 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -152,5 +152,6 @@ const struct sbi_platform platform = {
 	.features		= SBI_PLATFORM_DEFAULT_FEATURES,
 	.hart_count		= 1,
 	.hart_stack_size	= SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
+	.heap_size		= SBI_PLATFORM_DEFAULT_HEAP_SIZE(1),
 	.platform_ops_addr	= (unsigned long)&platform_ops
 };
-- 
2.34.1


