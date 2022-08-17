From: Heiko Stuebner <heiko@sntech.de>
Date: Wed, 17 Aug 2022 13:20:03 +0200
Subject: [PATCH v2 4/5] platform: generic: allwinner: add an extension for C9xx cores
In-Reply-To: <20220817112004.745776-1-heiko@sntech.de>
References: <20220817112004.745776-1-heiko@sntech.de>
Message-ID: <20220817112004.745776-5-heiko@sntech.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The T-Head c9xx cores extend the RISC-V ISA in a number of ways,
both adding new instructions and also new (and extended) CSRs.

Add an extension constant for this and set it in extension-init.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/sbi/riscv_thead_c9xx.h         | 127 +++++++++++++++++++++++++
 include/sbi/sbi_hart.h                 |   3 +
 lib/sbi/sbi_hart.c                     |   3 +
 platform/generic/allwinner/sun20i-d1.c |  10 ++
 4 files changed, 143 insertions(+)
 create mode 100644 include/sbi/riscv_thead_c9xx.h

diff --git a/include/sbi/riscv_thead_c9xx.h b/include/sbi/riscv_thead_c9xx.h
new file mode 100644
index 0000000..bab0408
--- /dev/null
+++ b/include/sbi/riscv_thead_c9xx.h
@@ -0,0 +1,127 @@
+#ifndef __RISCV_THEAD_C9XX_H____
+#define __RISCV_THEAD_C9XX_H____
+
+/* T-HEAD C9xx M mode CSR.  */
+#define THEAD_C9XX_CSR_MXSTATUS		0x7c0
+#define THEAD_C9XX_CSR_MHCR		0x7c1
+#define THEAD_C9XX_CSR_MCOR		0x7c2
+#define THEAD_C9XX_CSR_MCCR2		0x7c3
+#define THEAD_C9XX_CSR_MCER2		0x7c4
+#define THEAD_C9XX_CSR_MHINT		0x7c5
+#define THEAD_C9XX_CSR_MRMR		0x7c6
+#define THEAD_C9XX_CSR_MRVBR		0x7c7
+#define THEAD_C9XX_CSR_MCER		0x7c8
+#define THEAD_C9XX_CSR_MCOUNTERWEN	0x7c9
+#define THEAD_C9XX_CSR_MCOUNTERINTEN	0x7ca
+#define THEAD_C9XX_CSR_MCOUNTEROF	0x7cb
+#define THEAD_C9XX_CSR_MHINT2		0x7cc
+#define THEAD_C9XX_CSR_MHINT3		0x7cd
+#define THEAD_C9XX_CSR_MRADDR		0x7e0
+#define THEAD_C9XX_CSR_MEXSTATUS	0x7e1
+#define THEAD_C9XX_CSR_MNMICAUSE	0x7e2
+#define THEAD_C9XX_CSR_MNMIPC		0x7e3
+#define THEAD_C9XX_CSR_MHPMCR		0x7f0
+#define THEAD_C9XX_CSR_MHPMSR		0x7f1
+#define THEAD_C9XX_CSR_MHPMER		0x7f2
+#define THEAD_C9XX_CSR_MSMPR		0x7f3
+#define THEAD_C9XX_CSR_MTEECFG		0x7f4
+#define THEAD_C9XX_CSR_MZONEID		0x7f5
+#define THEAD_C9XX_CSR_ML2CPID		0x7f6
+#define THEAD_C9XX_CSR_ML2WP		0x7f7
+#define THEAD_C9XX_CSR_MDTCMCR		0x7f8
+#define THEAD_C9XX_CSR_USP		0x7d1
+#define THEAD_C9XX_CSR_MCINS		0x7d2
+#define THEAD_C9XX_CSR_MCINDEX		0x7d3
+#define THEAD_C9XX_CSR_MCDATA0		0x7d4
+#define THEAD_C9XX_CSR_MCDATA1		0x7d5
+#define THEAD_C9XX_CSR_MEICR		0x7d6
+#define THEAD_C9XX_CSR_MEICR2		0x7d7
+#define THEAD_C9XX_CSR_MBEADDR		0x7d8
+#define THEAD_C9XX_CSR_MCPUID		0xfc0
+#define THEAD_C9XX_CSR_MAPBADDR		0xfc1
+#define THEAD_C9XX_CSR_MWMSR		0xfc2
+#define THEAD_C9XX_CSR_MHALTCAUSE	0xfe0
+#define THEAD_C9XX_CSR_MDBGINFO		0xfe1
+#define THEAD_C9XX_CSR_MPCFIFO		0xfe2
+
+/* T-HEAD C9xx S mode CSR.  */
+#define THEAD_C9XX_CSR_SXSTATUS		0x5c0
+#define THEAD_C9XX_CSR_SHCR		0x5c1
+#define THEAD_C9XX_CSR_SCER2		0x5c2
+#define THEAD_C9XX_CSR_SCER		0x5c3
+#define THEAD_C9XX_CSR_SCOUNTERINTEN	0x5c4
+#define THEAD_C9XX_CSR_SCOUNTEROF	0x5c5
+#define THEAD_C9XX_CSR_SHINT		0x5c6
+#define THEAD_C9XX_CSR_SHINT2		0x5c7
+#define THEAD_C9XX_CSR_SHPMINHIBIT	0x5c8
+#define THEAD_C9XX_CSR_SHPMCR		0x5c9
+#define THEAD_C9XX_CSR_SHPMSR		0x5ca
+#define THEAD_C9XX_CSR_SHPMER		0x5cb
+#define THEAD_C9XX_CSR_SL2CPID		0x5cc
+#define THEAD_C9XX_CSR_SL2WP		0x5cd
+#define THEAD_C9XX_CSR_SBEADDR		0x5d0
+#define THEAD_C9XX_CSR_SCYCLE		0x5e0
+#define THEAD_C9XX_CSR_SHPMCOUNTER1	0x5e1
+#define THEAD_C9XX_CSR_SHPMCOUNTER2	0x5e2
+#define THEAD_C9XX_CSR_SHPMCOUNTER3	0x5e3
+#define THEAD_C9XX_CSR_SHPMCOUNTER4	0x5e4
+#define THEAD_C9XX_CSR_SHPMCOUNTER5	0x5e5
+#define THEAD_C9XX_CSR_SHPMCOUNTER6	0x5e6
+#define THEAD_C9XX_CSR_SHPMCOUNTER7	0x5e7
+#define THEAD_C9XX_CSR_SHPMCOUNTER8	0x5e8
+#define THEAD_C9XX_CSR_SHPMCOUNTER9	0x5e9
+#define THEAD_C9XX_CSR_SHPMCOUNTER10	0x5ea
+#define THEAD_C9XX_CSR_SHPMCOUNTER11	0x5eb
+#define THEAD_C9XX_CSR_SHPMCOUNTER12	0x5ec
+#define THEAD_C9XX_CSR_SHPMCOUNTER13	0x5ed
+#define THEAD_C9XX_CSR_SHPMCOUNTER14	0x5ee
+#define THEAD_C9XX_CSR_SHPMCOUNTER15	0x5ef
+#define THEAD_C9XX_CSR_SHPMCOUNTER16	0x5f0
+#define THEAD_C9XX_CSR_SHPMCOUNTER17	0x5f1
+#define THEAD_C9XX_CSR_SHPMCOUNTER18	0x5f2
+#define THEAD_C9XX_CSR_SHPMCOUNTER19	0x5f3
+#define THEAD_C9XX_CSR_SHPMCOUNTER20	0x5f4
+#define THEAD_C9XX_CSR_SHPMCOUNTER21	0x5f5
+#define THEAD_C9XX_CSR_SHPMCOUNTER22	0x5f6
+#define THEAD_C9XX_CSR_SHPMCOUNTER23	0x5f7
+#define THEAD_C9XX_CSR_SHPMCOUNTER24	0x5f8
+#define THEAD_C9XX_CSR_SHPMCOUNTER25	0x5f9
+#define THEAD_C9XX_CSR_SHPMCOUNTER26	0x5fa
+#define THEAD_C9XX_CSR_SHPMCOUNTER27	0x5fb
+#define THEAD_C9XX_CSR_SHPMCOUNTER28	0x5fc
+#define THEAD_C9XX_CSR_SHPMCOUNTER29	0x5fd
+#define THEAD_C9XX_CSR_SHPMCOUNTER30	0x5fe
+#define THEAD_C9XX_CSR_SHPMCOUNTER31	0x5ff
+
+/* T-HEAD C9xx U mode CSR.  */
+#define THEAD_C9XX_CSR_FXCR		0x800
+
+/* T-HEAD C9xx MMU extentions.  */
+#define THEAD_C9XX_CSR_SMIR		0x9c0
+#define THEAD_C9XX_CSR_SMEL		0x9c1
+#define THEAD_C9XX_CSR_SMEH		0x9c2
+#define THEAD_C9XX_CSR_SMCIR		0x9c3
+
+/* T-HEAD C9xx Security CSR(May be droped).  */
+#define THEAD_C9XX_CSR_MEBR		0xbe0
+#define THEAD_C9XX_CSR_NT_MSTATUS	0xbe1
+#define THEAD_C9XX_CSR_NT_MIE		0xbe2
+#define THEAD_C9XX_CSR_NT_MTVEC		0xbe3
+#define THEAD_C9XX_CSR_NT_MTVT		0xbe4
+#define THEAD_C9XX_CSR_NT_MEPC		0xbe5
+#define THEAD_C9XX_CSR_NT_MCAUSE	0xbe6
+#define THEAD_C9XX_CSR_NT_MIP		0xbe7
+#define THEAD_C9XX_CSR_NT_MINTSTATE	0xbe8
+#define THEAD_C9XX_CSR_NT_MXSTATUS	0xbe9
+#define THEAD_C9XX_CSR_NT_MEBR		0xbea
+#define THEAD_C9XX_CSR_NT_MSP		0xbeb
+#define THEAD_C9XX_CSR_T_USP		0xbec
+#define THEAD_C9XX_CSR_T_MDCR		0xbed
+#define THEAD_C9XX_CSR_T_MPCR		0xbee
+#define THEAD_C9XX_CSR_PMPTEECFG	0xbef
+
+/* T-HEAD C9xx MIP CSR extension */
+#define THEAD_C9XX_IRQ_PMU_OVF		17
+#define THEAD_C9XX_MIP_MOIP		(_UL(1) << THEAD_C9XX_IRQ_PMU_OVF)
+
+#endif
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 4661506..a9a9a4d 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -37,6 +37,9 @@ enum sbi_hart_extensions {
 	/** HART has Sstc extension */
 	SBI_HART_EXT_SSTC,
 
+	/** HART is a C9xx core with its ISA extensions */
+	SBI_HART_EXT_THEAD_C9XX,
+
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
 };
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 5b33623..66bbc0b 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -434,6 +434,9 @@ static inline char *sbi_hart_extension_id2string(int ext)
 	case SBI_HART_EXT_SMSTATEEN:
 		estr = "smstateen";
 		break;
+	case SBI_HART_EXT_THEAD_C9XX:
+		estr = "c9xx";
+		break;
 	default:
 		break;
 	}
diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 5b2656c..d295a2c 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -9,6 +9,7 @@
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip_plic.h>
@@ -199,6 +200,14 @@ static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
 	return 0;
 }
 
+static int sun20i_d1_extensions_init(unsigned long *extensions,
+				     const struct fdt_match *match)
+{
+	*extensions |= BIT(SBI_HART_EXT_THEAD_C9XX);
+
+	return 0;
+}
+
 static const struct fdt_match sun20i_d1_match[] = {
 	{ .compatible = "allwinner,sun20i-d1" },
 	{ },
@@ -207,4 +216,5 @@ static const struct fdt_match sun20i_d1_match[] = {
 const struct platform_override sun20i_d1 = {
 	.match_table	= sun20i_d1_match,
 	.final_init	= sun20i_d1_final_init,
+	.extensions_init = sun20i_d1_extensions_init,
 };
-- 
2.35.1


