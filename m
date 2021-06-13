From: Anup Patel <Anup.Patel@wdc.com>
Date: Sun, 13 Jun 2021 04:10:05 +0000
Subject: [PATCH v2 09/15] lib: sbi: Add PMU specific platform hooks
In-Reply-To: <20210527003044.889681-10-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
 <20210527003044.889681-10-atish.patra@wdc.com>
Message-ID: <CO6PR04MB78124C9B1046AB91E41F43428D329@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atish.patra@wdc.com>
> Sent: 27 May 2021 06:01
> To: opensbi at lists.infradead.org
> Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel <Anup.Patel@wdc.com>
> Subject: [PATCH v2 09/15] lib: sbi: Add PMU specific platform hooks
> 
> A platform hook to initialize PMU allows platform vendors to provide their
> own mechanism to define pmu event-counter mappings in addition to the DT
> based approach.
> 
> Another platform hook that allows platform vendors customize the final
> mhpmevent value configuration.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  include/sbi/sbi_platform.h | 39
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h index
> f8074d28db65..8e6caea6965b 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -89,6 +89,12 @@ struct sbi_platform_operations {
>  	/** Initialize (or populate) domains for the platform */
>  	int (*domains_init)(void);
> 
> +	/** Initialize hw performance counters */
> +	int (*pmu_init)(void);
> +
> +	/** Get platform specific mhpmevent value */
> +	uint64_t (*pmu_xlate_to_mhpmevent)(uint32_t event_idx, uint64_t
> data);
> +
>  	/** Initialize the platform console */
>  	int (*console_init)(void);
> 
> @@ -391,6 +397,39 @@ static inline int sbi_platform_domains_init(const
> struct sbi_platform *plat)
>  	return 0;
>  }
> 
> +/**
> + * Setup hw PMU events for the platform
> + *
> + * @param plat pointer to struct sbi_platform
> + *
> + * @return 0 on success and negative error code on failure  */ static
> +inline int sbi_platform_pmu_init(const struct sbi_platform *plat) {
> +	if (plat && sbi_platform_ops(plat)->pmu_init)
> +		return sbi_platform_ops(plat)->pmu_init();
> +	return 0;
> +}
> +
> +/**
> + * Get the value to be written in mhpmeventx for event_idx
> + *
> + * @param plat pointer to struct sbi_platform
> + * @param event_idx ID of the PMU event
> + * @param data Additional configuration data passed from supervisor
> +software
> + *
> + * @return expected value by the platform or 0 if platform doesn't know
> +about
> + * the event
> + */
> +static inline int sbi_platform_pmu_xlate_to_mhpmevent(const struct
> sbi_platform *plat,
> +						      uint32_t event_idx,
> uint64_t data) {

Return value should be "uint64_t" instead of "int"

> +	if (plat && sbi_platform_ops(plat)->pmu_xlate_to_mhpmevent)
> +		return sbi_platform_ops(plat)-
> >pmu_xlate_to_mhpmevent(event_idx,
> +								      data);
> +	return 0;
> +}
> +
>  /**
>   * Initialize the platform console
>   *
> --
> 2.25.1

Otherwise looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

