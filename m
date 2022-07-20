From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Jul 2022 12:37:26 +0200
Subject: [PATCH v2  3/4] lib: sbi: Fix possible buffer overrun in counter
 validation
In-Reply-To: <20220719224615.3080494-4-atishp@rivosinc.com>
References: <20220719224615.3080494-1-atishp@rivosinc.com>
 <20220719224615.3080494-4-atishp@rivosinc.com>
Message-ID: <20220720103726.c6g2c3q2hktbgpx3@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 19, 2022 at 03:46:14PM -0700, Atish Patra wrote:
> The active_events array is accessed with counter ID passed from the supervisor
> software before the counter ID bound check. This may cause a buffer overrun
> if a supervisor passes an invalid counter ID.
> 
> Fix this by moving the access part after the bound check.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  lib/sbi/sbi_pmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 1170cba43b3d..a159d72ac6dc 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -144,13 +144,13 @@ static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
>  	uint32_t event_idx_type;
>  	u32 hartid = current_hartid();
>  
> -	event_idx_val = active_events[hartid][cidx];
> -
> -	if (cidx >= total_ctrs || (event_idx_val == SBI_PMU_EVENT_IDX_INVALID))
> +	if (cidx >= total_ctrs)
>  		return SBI_EINVAL;
>  
> +	event_idx_val = active_events[hartid][cidx];
>  	event_idx_type = get_cidx_type(event_idx_val);
> -	if (event_idx_type >= SBI_PMU_EVENT_TYPE_MAX)
> +	if (event_idx_val == SBI_PMU_EVENT_IDX_INVALID ||
> +	    event_idx_type >= SBI_PMU_EVENT_TYPE_MAX)
>  		return SBI_EINVAL;
>  
>  	*event_idx_code = get_cidx_code(event_idx_val);
> -- 
> 2.25.1
> 

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

