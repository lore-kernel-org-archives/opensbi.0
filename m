From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 24 Aug 2020 19:22:42 +0530
Subject: [PATCH v2 4/5] include: sbi: Few cosmetic changes in riscv_encoding.h
In-Reply-To: <20200824135243.136769-1-anup.patel@wdc.com>
References: <20200824135243.136769-1-anup.patel@wdc.com>
Message-ID: <20200824135243.136769-5-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch does following cosmentic changes to riscv_encoding.h:
1. Re-organize CSR defines to match CSR listing in latest RISC-V
   privilege spec
2. Rename CSR_HCOUNTERNEN to CSR_HCOUNTEREN

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/riscv_encoding.h | 226 +++++++++++++++++++++--------------
 1 file changed, 139 insertions(+), 87 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 073261f..ccd2c69 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -171,18 +171,27 @@
 #define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
 #endif
 
-#define CSR_USTATUS			0x0
-#define CSR_FFLAGS			0x1
-#define CSR_FRM				0x2
-#define CSR_FCSR			0x3
+/* ===== User-level CSRs ===== */
+
+/* User Trap Setup (N-extension) */
+#define CSR_USTATUS			0x000
+#define CSR_UIE				0x004
+#define CSR_UTVEC			0x005
+
+/* User Trap Handling (N-extension) */
+#define CSR_USCRATCH			0x040
+#define CSR_UEPC			0x041
+#define CSR_UCAUSE			0x042
+#define CSR_UTVAL			0x043
+#define CSR_UIP				0x044
+
+/* User Floating-point CSRs */
+#define CSR_FFLAGS			0x001
+#define CSR_FRM				0x002
+#define CSR_FCSR			0x003
+
+/* User Counters/Timers */
 #define CSR_CYCLE			0xc00
-#define CSR_UIE				0x4
-#define CSR_UTVEC			0x5
-#define CSR_USCRATCH			0x40
-#define CSR_UEPC			0x41
-#define CSR_UCAUSE			0x42
-#define CSR_UTVAL			0x43
-#define CSR_UIP				0x44
 #define CSR_TIME			0xc01
 #define CSR_INSTRET			0xc02
 #define CSR_HPMCOUNTER3			0xc03
@@ -214,31 +223,84 @@
 #define CSR_HPMCOUNTER29		0xc1d
 #define CSR_HPMCOUNTER30		0xc1e
 #define CSR_HPMCOUNTER31		0xc1f
+#define CSR_CYCLEH			0xc80
+#define CSR_TIMEH			0xc81
+#define CSR_INSTRETH			0xc82
+#define CSR_HPMCOUNTER3H		0xc83
+#define CSR_HPMCOUNTER4H		0xc84
+#define CSR_HPMCOUNTER5H		0xc85
+#define CSR_HPMCOUNTER6H		0xc86
+#define CSR_HPMCOUNTER7H		0xc87
+#define CSR_HPMCOUNTER8H		0xc88
+#define CSR_HPMCOUNTER9H		0xc89
+#define CSR_HPMCOUNTER10H		0xc8a
+#define CSR_HPMCOUNTER11H		0xc8b
+#define CSR_HPMCOUNTER12H		0xc8c
+#define CSR_HPMCOUNTER13H		0xc8d
+#define CSR_HPMCOUNTER14H		0xc8e
+#define CSR_HPMCOUNTER15H		0xc8f
+#define CSR_HPMCOUNTER16H		0xc90
+#define CSR_HPMCOUNTER17H		0xc91
+#define CSR_HPMCOUNTER18H		0xc92
+#define CSR_HPMCOUNTER19H		0xc93
+#define CSR_HPMCOUNTER20H		0xc94
+#define CSR_HPMCOUNTER21H		0xc95
+#define CSR_HPMCOUNTER22H		0xc96
+#define CSR_HPMCOUNTER23H		0xc97
+#define CSR_HPMCOUNTER24H		0xc98
+#define CSR_HPMCOUNTER25H		0xc99
+#define CSR_HPMCOUNTER26H		0xc9a
+#define CSR_HPMCOUNTER27H		0xc9b
+#define CSR_HPMCOUNTER28H		0xc9c
+#define CSR_HPMCOUNTER29H		0xc9d
+#define CSR_HPMCOUNTER30H		0xc9e
+#define CSR_HPMCOUNTER31H		0xc9f
+
+/* ===== Supervisor-level CSRs ===== */
+
+/* Supervisor Trap Setup */
 #define CSR_SSTATUS			0x100
+#define CSR_SEDELEG			0x102
+#define CSR_SIDELEG			0x103
 #define CSR_SIE				0x104
 #define CSR_STVEC			0x105
 #define CSR_SCOUNTEREN			0x106
+
+/* Supervisor Trap Handling */
 #define CSR_SSCRATCH			0x140
 #define CSR_SEPC			0x141
 #define CSR_SCAUSE			0x142
 #define CSR_STVAL			0x143
 #define CSR_SIP				0x144
+
+/* Supervisor Protection and Translation */
 #define CSR_SATP			0x180
 
+/* ===== Hypervisor-level CSRs ===== */
+
+/* Hypervisor Trap Setup (H-extension) */
 #define CSR_HSTATUS			0x600
 #define CSR_HEDELEG			0x602
 #define CSR_HIDELEG			0x603
 #define CSR_HIE				0x604
-#define CSR_HTIMEDELTA			0x605
-#define CSR_HTIMEDELTAH			0x615
-#define CSR_HCOUNTERNEN			0x606
+#define CSR_HCOUNTEREN			0x606
 #define CSR_HGEIE			0x607
+
+/* Hypervisor Trap Handling (H-extension) */
 #define CSR_HTVAL			0x643
 #define CSR_HIP				0x644
+#define CSR_HVIP			0x645
 #define CSR_HTINST			0x64a
+#define CSR_HGEIP			0xe12
+
+/* Hypervisor Protection and Translation (H-extension) */
 #define CSR_HGATP			0x680
-#define CSR_HGEIP			0xe07
 
+/* Hypervisor Counter/Timer Virtualization Registers (H-extension) */
+#define CSR_HTIMEDELTA			0x605
+#define CSR_HTIMEDELTAH			0x615
+
+/* Virtual Supervisor Registers (H-extension) */
 #define CSR_VSSTATUS			0x200
 #define CSR_VSIE			0x204
 #define CSR_VSTVEC			0x205
@@ -249,6 +311,15 @@
 #define CSR_VSIP			0x244
 #define CSR_VSATP			0x280
 
+/* ===== Machine-level CSRs ===== */
+
+/* Machine Information Registers */
+#define CSR_MVENDORID			0xf11
+#define CSR_MARCHID			0xf12
+#define CSR_MIMPID			0xf13
+#define CSR_MHARTID			0xf14
+
+/* Machine Trap Setup */
 #define CSR_MSTATUS			0x300
 #define CSR_MISA			0x301
 #define CSR_MEDELEG			0x302
@@ -257,6 +328,8 @@
 #define CSR_MTVEC			0x305
 #define CSR_MCOUNTEREN			0x306
 #define CSR_MSTATUSH			0x310
+
+/* Machine Trap Handling */
 #define CSR_MSCRATCH			0x340
 #define CSR_MEPC			0x341
 #define CSR_MCAUSE			0x342
@@ -264,6 +337,8 @@
 #define CSR_MIP				0x344
 #define CSR_MTINST			0x34a
 #define CSR_MTVAL2			0x34b
+
+/* Machine Memory Protection */
 #define CSR_PMPCFG0			0x3a0
 #define CSR_PMPCFG1			0x3a1
 #define CSR_PMPCFG2			0x3a2
@@ -344,14 +419,8 @@
 #define CSR_PMPADDR61			0x3ed
 #define CSR_PMPADDR62			0x3ee
 #define CSR_PMPADDR63			0x3ef
-#define CSR_TSELECT			0x7a0
-#define CSR_TDATA1			0x7a1
-#define CSR_TDATA2			0x7a2
-#define CSR_TDATA3			0x7a3
-#define CSR_DCSR			0x7b0
-#define CSR_DPC				0x7b1
-#define CSR_DSCRATCH			0x7b2
 
+/* Machine Counters/Timers */
 #define CSR_MCYCLE			0xb00
 #define CSR_MINSTRET			0xb02
 #define CSR_MHPMCOUNTER3		0xb03
@@ -383,71 +452,6 @@
 #define CSR_MHPMCOUNTER29		0xb1d
 #define CSR_MHPMCOUNTER30		0xb1e
 #define CSR_MHPMCOUNTER31		0xb1f
-#define CSR_MHPMEVENT3			0x323
-#define CSR_MHPMEVENT4			0x324
-#define CSR_MHPMEVENT5			0x325
-#define CSR_MHPMEVENT6			0x326
-#define CSR_MHPMEVENT7			0x327
-#define CSR_MHPMEVENT8			0x328
-#define CSR_MHPMEVENT9			0x329
-#define CSR_MHPMEVENT10			0x32a
-#define CSR_MHPMEVENT11			0x32b
-#define CSR_MHPMEVENT12			0x32c
-#define CSR_MHPMEVENT13			0x32d
-#define CSR_MHPMEVENT14			0x32e
-#define CSR_MHPMEVENT15			0x32f
-#define CSR_MHPMEVENT16			0x330
-#define CSR_MHPMEVENT17			0x331
-#define CSR_MHPMEVENT18			0x332
-#define CSR_MHPMEVENT19			0x333
-#define CSR_MHPMEVENT20			0x334
-#define CSR_MHPMEVENT21			0x335
-#define CSR_MHPMEVENT22			0x336
-#define CSR_MHPMEVENT23			0x337
-#define CSR_MHPMEVENT24			0x338
-#define CSR_MHPMEVENT25			0x339
-#define CSR_MHPMEVENT26			0x33a
-#define CSR_MHPMEVENT27			0x33b
-#define CSR_MHPMEVENT28			0x33c
-#define CSR_MHPMEVENT29			0x33d
-#define CSR_MHPMEVENT30			0x33e
-#define CSR_MHPMEVENT31			0x33f
-#define CSR_MVENDORID			0xf11
-#define CSR_MARCHID			0xf12
-#define CSR_MIMPID			0xf13
-#define CSR_MHARTID			0xf14
-#define CSR_CYCLEH			0xc80
-#define CSR_TIMEH			0xc81
-#define CSR_INSTRETH			0xc82
-#define CSR_HPMCOUNTER3H		0xc83
-#define CSR_HPMCOUNTER4H		0xc84
-#define CSR_HPMCOUNTER5H		0xc85
-#define CSR_HPMCOUNTER6H		0xc86
-#define CSR_HPMCOUNTER7H		0xc87
-#define CSR_HPMCOUNTER8H		0xc88
-#define CSR_HPMCOUNTER9H		0xc89
-#define CSR_HPMCOUNTER10H		0xc8a
-#define CSR_HPMCOUNTER11H		0xc8b
-#define CSR_HPMCOUNTER12H		0xc8c
-#define CSR_HPMCOUNTER13H		0xc8d
-#define CSR_HPMCOUNTER14H		0xc8e
-#define CSR_HPMCOUNTER15H		0xc8f
-#define CSR_HPMCOUNTER16H		0xc90
-#define CSR_HPMCOUNTER17H		0xc91
-#define CSR_HPMCOUNTER18H		0xc92
-#define CSR_HPMCOUNTER19H		0xc93
-#define CSR_HPMCOUNTER20H		0xc94
-#define CSR_HPMCOUNTER21H		0xc95
-#define CSR_HPMCOUNTER22H		0xc96
-#define CSR_HPMCOUNTER23H		0xc97
-#define CSR_HPMCOUNTER24H		0xc98
-#define CSR_HPMCOUNTER25H		0xc99
-#define CSR_HPMCOUNTER26H		0xc9a
-#define CSR_HPMCOUNTER27H		0xc9b
-#define CSR_HPMCOUNTER28H		0xc9c
-#define CSR_HPMCOUNTER29H		0xc9d
-#define CSR_HPMCOUNTER30H		0xc9e
-#define CSR_HPMCOUNTER31H		0xc9f
 #define CSR_MCYCLEH			0xb80
 #define CSR_MINSTRETH			0xb82
 #define CSR_MHPMCOUNTER3H		0xb83
@@ -480,6 +484,52 @@
 #define CSR_MHPMCOUNTER30H		0xb9e
 #define CSR_MHPMCOUNTER31H		0xb9f
 
+/* Machine Counter Setup */
+#define CSR_MCOUNTINHIBIT		0x320
+#define CSR_MHPMEVENT3			0x323
+#define CSR_MHPMEVENT4			0x324
+#define CSR_MHPMEVENT5			0x325
+#define CSR_MHPMEVENT6			0x326
+#define CSR_MHPMEVENT7			0x327
+#define CSR_MHPMEVENT8			0x328
+#define CSR_MHPMEVENT9			0x329
+#define CSR_MHPMEVENT10			0x32a
+#define CSR_MHPMEVENT11			0x32b
+#define CSR_MHPMEVENT12			0x32c
+#define CSR_MHPMEVENT13			0x32d
+#define CSR_MHPMEVENT14			0x32e
+#define CSR_MHPMEVENT15			0x32f
+#define CSR_MHPMEVENT16			0x330
+#define CSR_MHPMEVENT17			0x331
+#define CSR_MHPMEVENT18			0x332
+#define CSR_MHPMEVENT19			0x333
+#define CSR_MHPMEVENT20			0x334
+#define CSR_MHPMEVENT21			0x335
+#define CSR_MHPMEVENT22			0x336
+#define CSR_MHPMEVENT23			0x337
+#define CSR_MHPMEVENT24			0x338
+#define CSR_MHPMEVENT25			0x339
+#define CSR_MHPMEVENT26			0x33a
+#define CSR_MHPMEVENT27			0x33b
+#define CSR_MHPMEVENT28			0x33c
+#define CSR_MHPMEVENT29			0x33d
+#define CSR_MHPMEVENT30			0x33e
+#define CSR_MHPMEVENT31			0x33f
+
+/* Debug/Trace Registers */
+#define CSR_TSELECT			0x7a0
+#define CSR_TDATA1			0x7a1
+#define CSR_TDATA2			0x7a2
+#define CSR_TDATA3			0x7a3
+
+/* Debug Mode Registers */
+#define CSR_DCSR			0x7b0
+#define CSR_DPC				0x7b1
+#define CSR_DSCRATCH0			0x7b2
+#define CSR_DSCRATCH1			0x7b3
+
+/* ===== Trap/Exception Causes ===== */
+
 #define CAUSE_MISALIGNED_FETCH		0x0
 #define CAUSE_FETCH_ACCESS		0x1
 #define CAUSE_ILLEGAL_INSTRUCTION	0x2
@@ -500,6 +550,8 @@
 #define CAUSE_VIRTUAL_INST_FAULT	0x16
 #define CAUSE_STORE_GUEST_PAGE_FAULT	0x17
 
+/* ===== Instruction Encodings ===== */
+
 #define INSN_MATCH_LB			0x3
 #define INSN_MASK_LB			0x707f
 #define INSN_MATCH_LH			0x1003
-- 
2.25.1


