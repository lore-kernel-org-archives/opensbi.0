From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Jul 2022 12:29:48 +0200
Subject: [PATCH v2  2/4] lib: sbi: Add the bound check for events during
 config match
In-Reply-To: <20220719224615.3080494-3-atishp@rivosinc.com>
References: <20220719224615.3080494-1-atishp@rivosinc.com>
 <20220719224615.3080494-3-atishp@rivosinc.com>
Message-ID: <20220720102948.ffachuxzcfj5qwfa@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 19, 2022 at 03:46:13PM -0700, Atish Patra wrote:
> Currently, there is no sanity check for firmware event code. We don't see
> any issue as Linux kernel driver does a bound check on firmware events
> already. However, OpenSBI can't assume sane supervisor mode software
> always. Thus, an invalid event idx can cause a buffer overflow error.
> For hardware events, the match will fail for invalid event code anyways.
> However, a search is unecessary if event code is invalid.
> 
> Add a event ID validation function to solve the issue.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  lib/sbi/sbi_pmu.c | 39 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 31631a2fab80..1170cba43b3d 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -107,6 +107,37 @@ static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
>  	return FALSE;
>  }
>  
> +static int pmu_event_validate(unsigned long event_idx)
> +{
> +	uint32_t event_idx_type = get_cidx_type(event_idx);
> +	uint32_t event_idx_code = get_cidx_code(event_idx);
> +	uint32_t event_idx_code_max = -1;
> +
> +	switch(event_idx_type) {
> +	case SBI_PMU_EVENT_TYPE_HW:
> +		event_idx_code_max = SBI_PMU_HW_GENERAL_MAX;
> +		break;
> +	case SBI_PMU_EVENT_TYPE_FW:
> +		event_idx_code_max = SBI_PMU_FW_MAX;
> +		break;
> +	case SBI_PMU_EVENT_TYPE_HW_CACHE:
> +		event_idx_code_max = ((SBI_PMU_HW_CACHE_MAX & 0xFFF) << 0x03) |
> +				       (SBI_PMU_HW_CACHE_OP_MAX & 0x3) << 0x01 |
> +					0x01;

We need to check these fields independently, otherwise event_idx_code
could be something like 6, which is less than event_idx_code_max (63),
but represents a code with an invalid op_id.

> +		break;
> +	case SBI_PMU_EVENT_TYPE_HW_RAW:
> +		event_idx_code_max = 1; // event_idx.code should be zero
> +		break;
> +	default:
> +		return SBI_EINVAL;
> +	}
> +
> +	if (event_idx_code < event_idx_code_max)
> +		return event_idx_type;
> +	else

nit: no need for the 'else'

> +		return SBI_EINVAL;
> +}
> +
>  static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
>  {
>  	uint32_t event_idx_val;
> @@ -614,12 +645,16 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>  {
>  	int ctr_idx = SBI_ENOTSUPP;
>  	u32 hartid = current_hartid();
> -	int event_type = get_cidx_type(event_idx);
> +	int event_type;
>  	struct sbi_pmu_fw_event *fevent;
>  	uint32_t fw_evt_code;
>  
>  	/* Do a basic sanity check of counter base & mask */
> -	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs || event_type >= SBI_PMU_EVENT_TYPE_MAX)
> +	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
> +		return SBI_EINVAL;
> +
> +	event_type = pmu_event_validate(event_idx);
> +	if (event_type < 0)
>  		return SBI_EINVAL;
>  
>  	if (flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
> -- 
> 2.25.1
>

Thanks,
drew 

