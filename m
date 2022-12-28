From: Samuel Holland <samuel@sholland.org>
Date: Wed, 28 Dec 2022 13:11:24 -0600
Subject: [PATCH 2/2] platform: generic: allwinner: Advertise nonretentive suspend
In-Reply-To: <20221228191125.37584-1-samuel@sholland.org>
References: <20221228191125.37584-1-samuel@sholland.org>
Message-ID: <20221228191125.37584-2-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add D1's nonretentive suspend state to the devicetree so S-mode software
knows about it and can use it.

Latency and power measurements were taken on an Allwinner Nezha board:
 - Entry latency was measured from the beginning of sbi_ecall_handler()
   to before the call to wfi() in sun20i_d1_hart_suspend().
 - Exit latency was measured from the beginning of sbi_init() to before
   the call to sbi_hart_switch_mode() in init_warmboot().
 - There was a 17.5 mW benefit from non-retentive suspend compared to
   WFI, with a 170 mW cost during the 107 us entry/exit period. This
   provides a break-even point around 1040 us. Residency includes entry
   latency, so round this up to 1100 us.
 - The hardware power sequence latency (after the WFI) is assumed to be
   negligible, so set the wakeup latency to the exit latency.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 platform/generic/allwinner/sun20i-d1.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 1da9e5b..8ca556e 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_pmu.h>
+#include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip_plic.h>
 
@@ -202,6 +203,24 @@ static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
 	return 0;
 }
 
+static const struct sbi_cpu_idle_state sun20i_d1_cpu_idle_states[] = {
+	{
+		.name			= "cpu-nonretentive",
+		.suspend_param		= SBI_HSM_SUSPEND_NON_RET_DEFAULT,
+		.local_timer_stop	= true,
+		.entry_latency_us	= 40,
+		.exit_latency_us	= 67,
+		.min_residency_us	= 1100,
+		.wakeup_latency_us	= 67,
+	},
+	{ }
+};
+
+static int sun20i_d1_fdt_fixup(void *fdt, const struct fdt_match *match)
+{
+	return fdt_add_cpu_idle_states(fdt, sun20i_d1_cpu_idle_states);
+}
+
 static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
 {
 	unsigned long mip_val;
@@ -265,5 +284,6 @@ static const struct fdt_match sun20i_d1_match[] = {
 const struct platform_override sun20i_d1 = {
 	.match_table	= sun20i_d1_match,
 	.final_init	= sun20i_d1_final_init,
+	.fdt_fixup	= sun20i_d1_fdt_fixup,
 	.extensions_init = sun20i_d1_extensions_init,
 };
-- 
2.37.4


