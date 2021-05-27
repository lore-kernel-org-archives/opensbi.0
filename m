From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:44 -0700
Subject: [PATCH v2 15/15] platform: generic: Add PMU support
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-16-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add PMU support for generic platform. Generic platform solely relies on
the device tree to parse all pmu related information. If any event is
not described in device tree, generic platform will not support it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 platform/generic/platform.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index da0c1af8f92e..44a9c73fba0c 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -16,6 +16,7 @@
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/fdt/fdt_pmu.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/timer/fdt_timer.h>
@@ -184,6 +185,33 @@ static u64 generic_tlbr_flush_limit(void)
 	return SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT;
 }
 
+static int generic_pmu_init(void)
+{
+	return fdt_pmu_setup(sbi_scratch_thishart_arg1_ptr());
+}
+
+static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
+					       uint64_t data)
+{
+	uint64_t evt_val = 0;
+
+	/* data is valid only for raw events and is equal to event selector */
+	if (event_idx == SBI_PMU_EVENT_RAW_IDX)
+		evt_val = data;
+	else {
+		/**
+		 * Generic platform follows the SBI specification recommendation
+		 * i.e. zero extended event_idx is used as mhpmevent value for
+		 * hardware general/cache events if platform does't define one.
+		 */
+		evt_val = fdt_pmu_get_select_value(event_idx);
+		if (!evt_val)
+			evt_val = (uint64_t)event_idx;
+	}
+
+	return evt_val;
+}
+
 const struct sbi_platform_operations platform_ops = {
 	.early_init		= generic_early_init,
 	.final_init		= generic_final_init,
@@ -195,6 +223,8 @@ const struct sbi_platform_operations platform_ops = {
 	.irqchip_exit		= fdt_irqchip_exit,
 	.ipi_init		= fdt_ipi_init,
 	.ipi_exit		= fdt_ipi_exit,
+	.pmu_init		= generic_pmu_init,
+	.pmu_xlate_to_mhpmevent = generic_pmu_xlate_to_mhpmevent,
 	.get_tlbr_flush_limit	= generic_tlbr_flush_limit,
 	.timer_init		= fdt_timer_init,
 	.timer_exit		= fdt_timer_exit,
-- 
2.25.1


