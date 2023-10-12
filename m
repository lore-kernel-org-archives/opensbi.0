From: guoren@kernel.org <guoren@kernel.org>
Date: Thu, 12 Oct 2023 04:59:13 -0400
Subject: [PATCH] utils/reset: Remove fdt_reset_thead
Message-ID: <20231012085913.1679067-1-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

In the past, we used fdt_reset_thead to help customers with prototype
verification. However, with the emergence of the Big-little SoC system,
it can no longer meet the demand. Therefore, we use zero_stage_boot
instead of fdt_reset_thead. It cleans up the opensbi code and ends the
disputation of reset_sample's dts.

This patch removes the fdt_reset_thead component and updates the related
doc.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 docs/platform/thead-c9xx.md           | 183 +-------------------------
 lib/utils/reset/Kconfig               |   4 -
 lib/utils/reset/fdt_reset_thead.c     | 134 -------------------
 lib/utils/reset/fdt_reset_thead.h     |  23 ----
 lib/utils/reset/fdt_reset_thead_asm.S |  47 -------
 lib/utils/reset/objects.mk            |   4 -
 platform/generic/configs/defconfig    |   1 -
 7 files changed, 7 insertions(+), 389 deletions(-)
 delete mode 100644 lib/utils/reset/fdt_reset_thead.c
 delete mode 100644 lib/utils/reset/fdt_reset_thead.h
 delete mode 100644 lib/utils/reset/fdt_reset_thead_asm.S

diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
index 8bb9e91f1a9b..cc05b58ca6b6 100644
--- a/docs/platform/thead-c9xx.md
+++ b/docs/platform/thead-c9xx.md
@@ -1,7 +1,7 @@
 T-HEAD C9xx Series Processors
 =============================
 
-The **C9xx** series processors are high-performance RISC-V architecture
+The C9xx series processors are high-performance RISC-V architecture
 multi-core processors with AI vector acceleration engine.
 
 For more details, refer [T-HEAD.CN](https://www.t-head.cn/)
@@ -12,185 +12,16 @@ To build the platform-specific library and firmware images, provide the
 Platform Options
 ----------------
 
-The *T-HEAD C9xx* does not have any platform-specific compile options
+The T-HEAD C9xx does not have any platform-specific compile options
 because it uses generic platform.
 
 ```
-CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic /usr/bin/make
+CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic make
 ```
 
-The *T-HEAD C9xx* DTB provided to OpenSBI generic firmwares will usually have
-"riscv,clint0", "riscv,plic0", "thead,reset-sample" compatible strings.
+Here is the simplest boot flow for a fpga prototype:
 
-DTS Example1: (Single core, eg: Allwinner D1 - c906)
-----------------------------------------------------
+ (Jtag gdbinit) -> (zsb) -> (opensbi) -> (linux)
 
-```
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <3000000>;
-		cpu at 0 {
-			device_type = "cpu";
-			reg = <0>;
-			status = "okay";
-			compatible = "riscv";
-			riscv,isa = "rv64imafdcv";
-			mmu-type = "riscv,sv39";
-			cpu0_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-			};
-		};
-	};
-
-	soc {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		compatible = "simple-bus";
-		ranges;
-
-		clint0: clint at 14000000 {
-			compatible = "allwinner,sun20i-d1-clint";
-			interrupts-extended = <
-				&cpu0_intc  3 &cpu0_intc  7
-				>;
-			reg = <0x0 0x14000000 0x0 0x04000000>;
-		};
-
-		intc: interrupt-controller at 10000000 {
-			#interrupt-cells = <1>;
-			compatible = "allwinner,sun20i-d1-plic",
-				     "thead,c900-plic";
-			interrupt-controller;
-			interrupts-extended = <
-				&cpu0_intc  0xffffffff &cpu0_intc  9
-				>;
-			reg = <0x0 0x10000000 0x0 0x04000000>;
-			reg-names = "control";
-			riscv,max-priority = <7>;
-			riscv,ndev = <200>;
-		};
-	}
-```
-
-DTS Example2: (Multi cores with soc reset-regs)
------------------------------------------------
-
-```
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <3000000>;
-		cpu at 0 {
-			device_type = "cpu";
-			reg = <0>;
-			status = "okay";
-			compatible = "riscv";
-			riscv,isa = "rv64imafdc";
-			mmu-type = "riscv,sv39";
-			cpu0_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-			};
-		};
-		cpu at 1 {
-			device_type = "cpu";
-			reg = <1>;
-			status = "fail";
-			compatible = "riscv";
-			riscv,isa = "rv64imafdc";
-			mmu-type = "riscv,sv39";
-			cpu1_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-			};
-		};
-		cpu at 2 {
-			device_type = "cpu";
-			reg = <2>;
-			status = "fail";
-			compatible = "riscv";
-			riscv,isa = "rv64imafdc";
-			mmu-type = "riscv,sv39";
-			cpu2_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-			};
-		};
-		cpu at 3 {
-			device_type = "cpu";
-			reg = <3>;
-			status = "fail";
-			compatible = "riscv";
-			riscv,isa = "rv64imafdc";
-			mmu-type = "riscv,sv39";
-			cpu3_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-			};
-		};
-	};
-
-	soc {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		compatible = "simple-bus";
-		ranges;
-
-		reset: reset-sample {
-			compatible = "thead,reset-sample";
-			entry-reg = <0xff 0xff019050>;
-			entry-cnt = <4>;
-			control-reg = <0xff 0xff015004>;
-			control-val = <0x1c>;
-			csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
-		};
-
-		clint0: clint at ffdc000000 {
-			compatible = "riscv,clint0";
-			interrupts-extended = <
-				&cpu0_intc  3 &cpu0_intc  7
-				&cpu1_intc  3 &cpu1_intc  7
-				&cpu2_intc  3 &cpu2_intc  7
-				&cpu3_intc  3 &cpu3_intc  7
-				&cpu4_intc  3 &cpu4_intc  7
-				>;
-			reg = <0xff 0xdc000000 0x0 0x04000000>;
-		};
-
-		intc: interrupt-controller at ffd8000000 {
-			#interrupt-cells = <1>;
-			compatible = "thead,c900-plic";
-			interrupt-controller;
-			interrupts-extended = <
-				&cpu0_intc  0xffffffff &cpu0_intc  9
-				&cpu1_intc  0xffffffff &cpu1_intc  9
-				&cpu2_intc  0xffffffff &cpu2_intc  9
-				&cpu3_intc  0xffffffff &cpu3_intc  9
-				>;
-			reg = <0xff 0xd8000000 0x0 0x04000000>;
-			reg-names = "control";
-			riscv,max-priority = <7>;
-			riscv,ndev = <80>;
-		};
-	}
-```
-
-DTS Example2: (Multi cores with old reset csrs)
------------------------------------------------
-```
-	reset: reset-sample {
-		compatible = "thead,reset-sample";
-		using-csr-reset;
-		csr-copy = <0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc
-			    0x3b0 0x3b1 0x3b2 0x3b3
-			    0x3b4 0x3b5 0x3b6 0x3b7
-			    0x3a0>;
-	};
-```
+For more details, refer:
+ [zero stage boot](https://github.com/c-sky/zero_stage_boot)
diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index 23f50c4dfe40..b26260db1678 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -33,10 +33,6 @@ config FDT_RESET_SYSCON
 	depends on FDT_REGMAP
 	default n
 
-config FDT_RESET_THEAD
-	bool "T-HEAD FDT reset driver"
-	default n
-
 endif
 
 endmenu
diff --git a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
deleted file mode 100644
index e1d6885debae..000000000000
--- a/lib/utils/reset/fdt_reset_thead.c
+++ /dev/null
@@ -1,134 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- */
-
-#include <libfdt.h>
-#include <sbi/riscv_io.h>
-#include <sbi/sbi_bitops.h>
-#include <sbi/sbi_hart.h>
-#include <sbi/sbi_scratch.h>
-#include <sbi/sbi_system.h>
-#include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/reset/fdt_reset.h>
-
-#include "fdt_reset_thead.h"
-
-struct custom_csr custom_csr[MAX_CUSTOM_CSR];
-
-#define CSR_OPCODE 0x39073
-static void clone_csrs(int cnt)
-{
-	unsigned long i;
-
-	for (i = 0; i < cnt; i++) {
-		/* Write csr BIT[31 - 20] to stub */
-		__reset_thead_csr_stub[3*i + 1] =
-				CSR_OPCODE | (custom_csr[i].index << 20);
-
-		/* Mask csr BIT[31 - 20] */
-		*(u32 *)&__fdt_reset_thead_csrr &= BIT(20) - 1;
-		smp_mb();
-
-		/* Write csr BIT[31 - 20] to __fdt_reset_thead_csrr */
-		*(u32 *)&__fdt_reset_thead_csrr |= custom_csr[i].index << 20;
-		smp_mb();
-
-		RISCV_FENCE_I;
-
-		custom_csr[i].value = __fdt_reset_thead_csrr();
-	}
-}
-
-static int thead_system_reset_check(u32 type, u32 reason)
-{
-	return 1;
-}
-
-static void thead_system_reset(u32 type, u32 reason)
-{
-	ebreak();
-}
-
-static struct sbi_system_reset_device thead_reset = {
-	.name = "thead_reset",
-	.system_reset_check = thead_system_reset_check,
-	.system_reset = thead_system_reset
-};
-
-extern void __thead_pre_start_warm(void);
-static int thead_reset_init(void *fdt, int nodeoff,
-				 const struct fdt_match *match)
-{
-	char *p;
-	const fdt64_t *val;
-	const fdt32_t *val_w;
-	int len, i;
-	u32 t, tmp = 0;
-
-	/* Prepare clone csrs */
-	val_w = fdt_getprop(fdt, nodeoff, "csr-copy", &len);
-	if (len > 0 && val_w) {
-		int cnt;
-
-		cnt = len / sizeof(fdt32_t);
-		if (cnt > MAX_CUSTOM_CSR)
-			sbi_hart_hang();
-
-		for (i = 0; i < cnt; i++) {
-			custom_csr[i].index = fdt32_to_cpu(val_w[i]);
-		}
-
-		if (cnt)
-			clone_csrs(cnt);
-	}
-
-	/* Old reset method for secondary harts */
-	if (fdt_getprop(fdt, nodeoff, "using-csr-reset", &len)) {
-		csr_write(0x7c7, (ulong)&__thead_pre_start_warm);
-		csr_write(0x7c6, -1);
-	}
-
-	/* Custom reset method for secondary harts */
-	val = fdt_getprop(fdt, nodeoff, "entry-reg", &len);
-	if (len > 0 && val) {
-          p = (char *)(ulong)fdt64_to_cpu(*val);
-
-		val_w = fdt_getprop(fdt, nodeoff, "entry-cnt", &len);
-		if (len > 0 && val_w) {
-			tmp = fdt32_to_cpu(*val_w);
-
-			for (i = 0; i < tmp; i++) {
-				t = (ulong)&__thead_pre_start_warm;
-				writel(t, p + (8 * i));
-				t = (u64)(ulong)&__thead_pre_start_warm >> 32;
-				writel(t, p + (8 * i) + 4);
-			}
-		}
-
-		val = fdt_getprop(fdt, nodeoff, "control-reg", &len);
-		if (len > 0 && val) {
-			p = (void *)(ulong)fdt64_to_cpu(*val);
-
-			val_w = fdt_getprop(fdt, nodeoff, "control-val", &len);
-			if (len > 0 && val_w) {
-				tmp = fdt32_to_cpu(*val_w);
-				tmp |= readl(p);
-				writel(tmp, p);
-			}
-		}
-	}
-
-	sbi_system_reset_add_device(&thead_reset);
-
-	return 0;
-}
-
-static const struct fdt_match thead_reset_match[] = {
-	{ .compatible = "thead,reset-sample" },
-	{ },
-};
-
-struct fdt_reset fdt_reset_thead = {
-	.match_table = thead_reset_match,
-	.init = thead_reset_init
-};
diff --git a/lib/utils/reset/fdt_reset_thead.h b/lib/utils/reset/fdt_reset_thead.h
deleted file mode 100644
index d7a686ec9317..000000000000
--- a/lib/utils/reset/fdt_reset_thead.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- */
-
-#ifndef __FDT_RESET_THEAD_H__
-#define __FDT_RESET_THEAD_H__
-
-#define MAX_CUSTOM_CSR	32
-
-#ifndef __ASSEMBLER__
-struct custom_csr {
-	unsigned long index;
-	unsigned long value;
-};
-
-u64  __fdt_reset_thead_csrr(void);
-
-extern struct custom_csr custom_csr[MAX_CUSTOM_CSR];
-extern u32 __reset_thead_csr_stub[];
-
-#endif /* __ASSEMBLER__ */
-
-#endif /* __FDT_RESET_THEAD_H__ */
diff --git a/lib/utils/reset/fdt_reset_thead_asm.S b/lib/utils/reset/fdt_reset_thead_asm.S
deleted file mode 100644
index 8237951fd82d..000000000000
--- a/lib/utils/reset/fdt_reset_thead_asm.S
+++ /dev/null
@@ -1,47 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- */
-
-#include <sbi/riscv_asm.h>
-#include "fdt_reset_thead.h"
-
-/*
- * csrrs rd, csr, rs1
- * |31   20|19   15|14   12|11  7|6       0|
- *    csr     rs1     010     rd   1110011
- */
-#define CSR_STUB	addi    x0, x0, 0
-
-	.option norvc
-	.align 3
-	.global __fdt_reset_thead_csrr
-__fdt_reset_thead_csrr:
-	csrrs a0, 0, x0
-	ret
-
-	.align 3
-	.global __thead_pre_start_warm
-__thead_pre_start_warm:
-	/*
-	 * Clear L1 cache & BTB & BHT ...
-	 */
-	li	t1, 0x70013
-	csrw	0x7c2, t1
-	fence rw,rw
-
-	lla	t1, custom_csr
-
-	.global __reset_thead_csr_stub
-__reset_thead_csr_stub:
-.rept	MAX_CUSTOM_CSR
-	REG_L	t2, 8(t1)
-	CSR_STUB
-	addi	t1, t1, 16
-.endr
-	/*
-	 * Clear L1 cache & BTB & BHT ...
-	 */
-	li	t1, 0x70013
-	csrw	0x7c2, t1
-	fence rw,rw
-	j _start_warm
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index ea9cedcd8002..b5222347b213 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -26,7 +26,3 @@ libsbiutils-objs-$(CONFIG_FDT_RESET_SUNXI_WDT) += reset/fdt_reset_sunxi_wdt.o
 carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SYSCON) += fdt_syscon_poweroff
 carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SYSCON) += fdt_syscon_reboot
 libsbiutils-objs-$(CONFIG_FDT_RESET_SYSCON) += reset/fdt_reset_syscon.o
-
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_THEAD) += fdt_reset_thead
-libsbiutils-objs-$(CONFIG_FDT_RESET_THEAD) += reset/fdt_reset_thead.o
-libsbiutils-objs-$(CONFIG_FDT_RESET_THEAD) += reset/fdt_reset_thead_asm.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index c432bc2f8936..95bab61ea5d9 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -27,7 +27,6 @@ CONFIG_FDT_RESET_GPIO=y
 CONFIG_FDT_RESET_HTIF=y
 CONFIG_FDT_RESET_SUNXI_WDT=y
 CONFIG_FDT_RESET_SYSCON=y
-CONFIG_FDT_RESET_THEAD=y
 CONFIG_FDT_SERIAL=y
 CONFIG_FDT_SERIAL_CADENCE=y
 CONFIG_FDT_SERIAL_GAISLER=y
-- 
2.36.1


