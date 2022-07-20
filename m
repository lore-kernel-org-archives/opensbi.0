From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Jul 2022 12:40:08 +0200
Subject: [PATCH v2  4/4] lib: sbi: Fix fw_event_map initialization
In-Reply-To: <20220719224615.3080494-5-atishp@rivosinc.com>
References: <20220719224615.3080494-1-atishp@rivosinc.com>
 <20220719224615.3080494-5-atishp@rivosinc.com>
Message-ID: <20220720104008.wkt5o6melyexci36@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 19, 2022 at 03:46:15PM -0700, Atish Patra wrote:
> fw_event_map represents array of firmware events. It should initialized
                                                             ^ be
> for maximum number of firmware events not counters.
     ^ the
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  lib/sbi/sbi_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index a159d72ac6dc..a622054595c1 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -757,7 +757,7 @@ static void pmu_reset_event_map(u32 hartid)
>  	/* Initialize the counter to event mapping table */
>  	for (j = 3; j < total_ctrs; j++)
>  		active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
> -	for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
> +	for (j = 0; j < SBI_PMU_FW_EVENT_MAX; j++)
>  		sbi_memset(&fw_event_map[hartid][j], 0,
>  			   sizeof(struct sbi_pmu_fw_event));
>  }
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

