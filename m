From: guoren@kernel.org <guoren@kernel.org>
Date: Tue, 23 May 2023 05:46:49 -0400
Subject: [RFC PATCH 2/2] lib: reset: thead: Correct the naming convention of dts
In-Reply-To: <20230523094649.4100554-1-guoren@kernel.org>
References: <20230523094649.4100554-1-guoren@kernel.org>
Message-ID: <20230523094649.4100554-3-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

Correct the naming convention to fit Linux kernel upstream rule.

Link: https://lore.kernel.org/linux-riscv/CAJF2gTRG5edPnVmhMtv67OANpOynL0br0wcrQCave88_KkyZcg at mail.gmail.com/
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>
Cc: Jisheng Zhang <jszhang@kernel.org>
Cc: Wei Fu <wefu@redhat.com>
---
 docs/platform/thead-c9xx.md       | 21 +++++-------
 lib/utils/reset/fdt_reset_thead.c | 57 +++++++++++++++----------------
 2 files changed, 35 insertions(+), 43 deletions(-)

diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
index 8bb9e91f1a9b..35cca94b5bb9 100644
--- a/docs/platform/thead-c9xx.md
+++ b/docs/platform/thead-c9xx.md
@@ -19,9 +19,6 @@ because it uses generic platform.
 CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic /usr/bin/make
 ```
 
-The *T-HEAD C9xx* DTB provided to OpenSBI generic firmwares will usually have
-"riscv,clint0", "riscv,plic0", "thead,reset-sample" compatible strings.
-
 DTS Example1: (Single core, eg: Allwinner D1 - c906)
 ----------------------------------------------------
 
@@ -75,8 +72,8 @@ DTS Example1: (Single core, eg: Allwinner D1 - c906)
 	}
 ```
 
-DTS Example2: (Multi cores with soc reset-regs)
------------------------------------------------
+DTS Example2: (Multi cores, eg: T-HEAD th1520 - c910)
+-----------------------------------------------------
 
 ```
 	cpus {
@@ -143,13 +140,11 @@ DTS Example2: (Multi cores with soc reset-regs)
 		compatible = "simple-bus";
 		ranges;
 
-		reset: reset-sample {
-			compatible = "thead,reset-sample";
-			entry-reg = <0xff 0xff019050>;
-			entry-cnt = <4>;
-			control-reg = <0xff 0xff015004>;
-			control-val = <0x1c>;
-			csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
+		reset-controller at ffff019050 {
+			compatible = "thead,th1520-cpu-reset";
+			reg = <0xff 0xff019050 0x0 0x4>, <0xff 0xff015004 0x0 0x0>;
+			reset-ctrl-val = <0x1c>;
+			csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc 0x7ce>;
 		};
 
 		clint0: clint at ffdc000000 {
@@ -186,7 +181,7 @@ DTS Example2: (Multi cores with old reset csrs)
 -----------------------------------------------
 ```
 	reset: reset-sample {
-		compatible = "thead,reset-sample";
+		compatible = "thead,common-cpu-reset";
 		using-csr-reset;
 		csr-copy = <0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc
 			    0x3b0 0x3b1 0x3b2 0x3b3
diff --git a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
index ff7d2981b42f..760c117f6178 100644
--- a/lib/utils/reset/fdt_reset_thead.c
+++ b/lib/utils/reset/fdt_reset_thead.c
@@ -5,6 +5,8 @@
 #include <libfdt.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_system.h>
@@ -58,11 +60,10 @@ extern void __thead_pre_start_warm(void);
 static int thead_reset_init(void *fdt, int nodeoff,
 				 const struct fdt_match *match)
 {
-	char *p;
-	const fdt64_t *val;
+	int rc, len, i;
+	u32 tmp;
 	const fdt32_t *val_w;
-	int len, i;
-	u32 t, tmp = 0;
+	uint64_t reg_addr, reg_size;
 
 	/* Prepare clone csrs */
 	val_w = fdt_getprop(fdt, nodeoff, "csr-copy", &len);
@@ -85,45 +86,41 @@ static int thead_reset_init(void *fdt, int nodeoff,
 	if (fdt_getprop(fdt, nodeoff, "using-csr-reset", &len)) {
 		csr_write(0x7c7, (ulong)&__thead_pre_start_warm);
 		csr_write(0x7c6, -1);
+		goto out;
 	}
 
 	/* Custom reset method for secondary harts */
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
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
+	if (rc < 0)
+		return SBI_ENODEV;
+
+	for (i = 0; i < reg_size; i++) {
+		tmp = (ulong)&__thead_pre_start_warm;
+		writel(tmp, (char *)(ulong)reg_addr + (i * 8));
+		tmp = (u64)(ulong)&__thead_pre_start_warm >> 32;
+		writel(tmp, (char *)(ulong)reg_addr + (i * 8) + 4);
+	}
 
-		val = fdt_getprop(fdt, nodeoff, "control-reg", &len);
-		if (len > 0 && val) {
-			p = (void *)(ulong)fdt64_to_cpu(*val);
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 1, &reg_addr, &reg_size);
+	if (rc < 0)
+		return SBI_ENODEV;
 
-			val_w = fdt_getprop(fdt, nodeoff, "control-val", &len);
-			if (len > 0 && val_w) {
-				tmp = fdt32_to_cpu(*val_w);
-				tmp |= readl(p);
-				writel(tmp, p);
-			}
-		}
+	val_w = fdt_getprop(fdt, nodeoff, "reset-ctrl-val", &len);
+	if (len > 0 && val_w) {
+		tmp = fdt32_to_cpu(*val_w);
+		tmp |= readl((char *)(ulong)reg_addr);
+		writel(tmp,  (char *)(ulong)reg_addr);
 	}
 
+out:
 	sbi_system_reset_add_device(&thead_reset);
 
 	return 0;
 }
 
 static const struct fdt_match thead_reset_match[] = {
-	{ .compatible = "thead,reset-sample" },
+	{ .compatible = "thead,common-cpu-reset" },
+	{ .compatible = "thead,th1520-cpu-reset" },
 	{ },
 };
 
-- 
2.36.1


