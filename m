From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 19 Apr 2021 12:39:23 +0000
Subject: [RFC 14/14] platform: generic: Add PMU support
In-Reply-To: <20210319221305.2138412-15-atish.patra@wdc.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
 <20210319221305.2138412-15-atish.patra@wdc.com>
Message-ID: <DM6PR04MB6201CCDA7E293B27D2B0A0688D499@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atish.patra@wdc.com>
> Sent: 20 March 2021 03:43
> To: opensbi at lists.infradead.org
> Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel <Anup.Patel@wdc.com>
> Subject: [RFC 14/14] platform: generic: Add PMU support
> 
> Add PMU support for generic platform. Generic platform solely relies on the
> device tree to parse all pmu related information. If any event is not described
> in device tree, generic platform will not support it.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  platform/generic/platform.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c index
> 8c1e06f1244c..03f8bca2cb2d 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -16,6 +16,7 @@
>  #include <sbi_utils/fdt/fdt_domain.h>
>  #include <sbi_utils/fdt/fdt_fixup.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/fdt/fdt_pmu.h>
>  #include <sbi_utils/irqchip/fdt_irqchip.h>  #include
> <sbi_utils/serial/fdt_serial.h>  #include <sbi_utils/timer/fdt_timer.h> @@ -
> 204,6 +205,35 @@ static void generic_system_reset(u32 reset_type, u32
> reset_reason)
>  	fdt_system_reset(reset_type, reset_reason);  }
> 
> +static int generic_pmu_init(void)
> +{
> +	return fdt_pmu_setup(sbi_scratch_thishart_arg1_ptr());
> +}
> +
> +static uint64_t generic_pmu_get_mhpmevent_value(uint32_t event_idx,
> +						uint64_t data)
> +{
> +	uint64_t result = 0;
> +
> +
> +	/* data is valid only for raw events and is equal to event selector */
> +	if (event_idx == SBI_PMU_EVENT_RAW_IDX)
> +		result = data;
> +	else
> +		result = fdt_pmu_get_select_value(event_idx);
> +
> +	/**
> +	 * Generic platform follows the SBI specification recommendation to
> +	 * compute the mhpmevent value i.e.
> +	 * xyz[0:19]    : event_idx
> +	 * xyz[20:XLEN] : event_data[0:(XLEN-20)]
> +	 */
> +	result = result << SBI_PMU_EVENT_IDX_OFFSET |
> +		(event_idx & SBI_PMU_EVENT_IDX_MASK);
> +
> +	return result;
> +}
> +
>  const struct sbi_platform_operations platform_ops = {
>  	.early_init		= generic_early_init,
>  	.final_init		= generic_final_init,
> @@ -219,6 +249,8 @@ const struct sbi_platform_operations platform_ops =
> {
>  	.ipi_clear		= fdt_ipi_clear,
>  	.ipi_init		= fdt_ipi_init,
>  	.ipi_exit		= fdt_ipi_exit,
> +	.pmu_init		= generic_pmu_init,
> +	.get_mhpmevent_value    = generic_pmu_get_mhpmevent_value,
>  	.get_tlbr_flush_limit	= generic_tlbr_flush_limit,
>  	.timer_value		= fdt_timer_value,
>  	.timer_event_stop	= fdt_timer_event_stop,
> --
> 2.25.1

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup


