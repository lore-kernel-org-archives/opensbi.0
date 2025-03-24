From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 24 Mar 2025 08:48:09 -0700
Subject: [PATCH v2 5/5] lib: utils: Use fdt_cpu_get_timebase_frequency()
In-Reply-To: <20250324154858.4147529-1-samuel.holland@sifive.com>
References: <20250324154858.4147529-1-samuel.holland@sifive.com>
Message-ID: <20250324154858.4147529-6-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since fdt_cpu_init() already parsed the /cpus node, use the cached value
instead of parsing the DT again.

The logic should otherwise be equivalent.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 include/sbi_utils/fdt/fdt_helper.h |  2 --
 lib/utils/fdt/fdt_helper.c         | 21 ---------------------
 lib/utils/timer/fdt_timer_mtimer.c |  7 ++++---
 lib/utils/timer/fdt_timer_plmt.c   |  8 +++++---
 platform/fpga/openpiton/platform.c |  6 +++---
 5 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index f94e535f..0d81efcc 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -51,8 +51,6 @@ bool fdt_node_is_enabled(const void *fdt, int nodeoff);
 
 int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
 
-int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
-
 int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
 			     unsigned long *extensions);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 13f38510..3645e379 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -266,27 +266,6 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid)
 	return 0;
 }
 
-int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
-{
-	const fdt32_t *val;
-	int len, cpus_offset;
-
-	if (!fdt || !freq)
-		return SBI_EINVAL;
-
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return cpus_offset;
-
-	val = fdt_getprop(fdt, cpus_offset, "timebase-frequency", &len);
-	if (len > 0 && val)
-		*freq = fdt32_to_cpu(*val);
-	else
-		return SBI_ENOENT;
-
-	return 0;
-}
-
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
 static unsigned long fdt_isa_bitmap_offset;
diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index 224534d8..7dfc63f3 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_list.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/timer/fdt_timer.h>
 #include <sbi_utils/timer/aclint_mtimer.h>
@@ -55,10 +56,10 @@ static int timer_mtimer_cold_init(const void *fdt, int nodeoff,
 	mt->has_64bit_mmio = true;
 	mt->has_shared_mtime = false;
 
-	rc = fdt_parse_timebase_frequency(fdt, &mt->mtime_freq);
-	if (rc) {
+	mt->mtime_freq = fdt_cpu_get_timebase_frequency();
+	if (!mt->mtime_freq) {
 		sbi_free(mtn);
-		return rc;
+		return SBI_ENOENT;
 	}
 
 	if (is_clint) { /* SiFive CLINT */
diff --git a/lib/utils/timer/fdt_timer_plmt.c b/lib/utils/timer/fdt_timer_plmt.c
index 1e146689..23ca8f3d 100644
--- a/lib/utils/timer/fdt_timer_plmt.c
+++ b/lib/utils/timer/fdt_timer_plmt.c
@@ -7,6 +7,8 @@
  *   Yu Chien Peter Lin <peterlin@andestech.com>
  */
 
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/timer/fdt_timer.h>
 #include <sbi_utils/timer/andes_plmt.h>
@@ -27,9 +29,9 @@ static int fdt_plmt_cold_timer_init(const void *fdt, int nodeoff,
 	plmt.time_val = (u64 *)plmt_base;
 	plmt.time_cmp = (u64 *)(plmt_base + 0x8);
 
-	rc = fdt_parse_timebase_frequency(fdt, &plmt.timer_freq);
-	if (rc)
-		return rc;
+	plmt.timer_freq = fdt_cpu_get_timebase_frequency();
+	if (!plmt.timer_freq)
+		return SBI_ENOENT;
 
 	rc = plmt_cold_timer_init(&plmt);
 	if (rc)
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 2789c5c8..3a7d0ac9 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -80,8 +80,8 @@ static int openpiton_early_init(bool cold_boot)
 	const void *fdt;
 	struct platform_uart_data uart_data = { 0 };
 	struct plic_data plic_data;
-	unsigned long aclint_freq;
 	uint64_t clint_addr;
+	u32 aclint_freq;
 	int rc;
 
 	if (!cold_boot)
@@ -100,8 +100,8 @@ static int openpiton_early_init(bool cold_boot)
 	if (!rc)
 		plic = plic_data;
 
-	rc = fdt_parse_timebase_frequency(fdt, &aclint_freq);
-	if (!rc)
+	aclint_freq = fdt_cpu_get_timebase_frequency();
+	if (aclint_freq)
 		mtimer.mtime_freq = aclint_freq;
 
 	rc = fdt_parse_compat_addr(fdt, &clint_addr, "riscv,clint0");
-- 
2.47.2


