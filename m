From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 19 Jul 2022 10:47:15 +0200
Subject: [PATCH 2/2] lib: sbi: Fix counter index sanity check
In-Reply-To: <20220718200458.3015600-2-atishp@rivosinc.com>
References: <20220718200458.3015600-1-atishp@rivosinc.com>
 <20220718200458.3015600-2-atishp@rivosinc.com>
Message-ID: <20220719084715.mpuogf5g2x4qy4me@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 18, 2022 at 01:04:58PM -0700, Atish Patra wrote:
> The current implementation computes the possible counter range
> by doing a left shift of counter base. However, this may overflow depending
> on the counter base value. In case of overflow, the highest counter id
> may be computed incorrectly. As per the SBI specification, the respective
> function should return an error if any of the counter is not valid.
> 
> Fix the counter index check by avoiding left shifting while doing the
> sanity checks.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  lib/sbi/sbi_pmu.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 65bc9dd63f6b..29e7e2954ae3 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -346,25 +346,26 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>  {
>  	int event_idx_type;
>  	uint32_t event_code;
> -	unsigned long ctr_mask = cmask << cbase;
>  	int ret = SBI_EINVAL;
>  	bool bUpdate = FALSE;
> +	int i, cidx;
>  
> -	if (sbi_fls(ctr_mask) >= total_ctrs)
> +	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
>  		return ret;
>  
>  	if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
>  		bUpdate = TRUE;
>  
> -	for_each_set_bit_from(cbase, &ctr_mask, total_ctrs) {
> -		event_idx_type = pmu_ctr_validate(cbase, &event_code);
> +	for_each_set_bit(i, &cmask, total_ctrs) {
> +		cidx = i + cbase;

I guess this for_each_set_bit_from() to for_each_set_bit() change is
necessary to avoid skipping cidx == cbase after we no longer shift
the mask. Might be nice to point that out in the commit message since
it's a bit subtle.

> +		event_idx_type = pmu_ctr_validate(cidx, &event_code);
>  		if (event_idx_type < 0)
>  			/* Continue the start operation for other counters */
>  			continue;
>  		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
> -			ret = pmu_ctr_start_fw(cbase, event_code, ival, bUpdate);
> +			ret = pmu_ctr_start_fw(cidx, event_code, ival, bUpdate);
>  		else
> -			ret = pmu_ctr_start_hw(cbase, ival, bUpdate);
> +			ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
>  	}
>  
>  	return ret;
> @@ -424,25 +425,26 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
>  	int ret = SBI_EINVAL;
>  	int event_idx_type;
>  	uint32_t event_code;
> -	unsigned long ctr_mask = cmask << cbase;
> +	int i, cidx;
>  
> -	if (sbi_fls(ctr_mask) >= total_ctrs)
> +	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
>  		return SBI_EINVAL;
>  
> -	for_each_set_bit_from(cbase, &ctr_mask, total_ctrs) {
> -		event_idx_type = pmu_ctr_validate(cbase, &event_code);
> +	for_each_set_bit(i, &cmask, total_ctrs) {
> +		cidx = i + cbase;
> +		event_idx_type = pmu_ctr_validate(cidx, &event_code);
>  		if (event_idx_type < 0)
>  			/* Continue the stop operation for other counters */
>  			continue;
>  
>  		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
> -			ret = pmu_ctr_stop_fw(cbase, event_code);
> +			ret = pmu_ctr_stop_fw(cidx, event_code);
>  		else
> -			ret = pmu_ctr_stop_hw(cbase);
> +			ret = pmu_ctr_stop_hw(cidx);
>  
>  		if (flag & SBI_PMU_STOP_FLAG_RESET) {
> -			active_events[hartid][cbase] = SBI_PMU_EVENT_IDX_INVALID;
> -			pmu_reset_hw_mhpmevent(cbase);
> +			active_events[hartid][cidx] = SBI_PMU_EVENT_IDX_INVALID;
> +			pmu_reset_hw_mhpmevent(cidx);
>  		}
>  	}
>  
> @@ -618,10 +620,9 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>  	int event_type = get_cidx_type(event_idx);
>  	struct sbi_pmu_fw_event *fevent;
>  	uint32_t fw_evt_code;
> -	unsigned long tmp = cidx_mask << cidx_base;
>  
>  	/* Do a basic sanity check of counter base & mask */
> -	if (sbi_fls(tmp) >= total_ctrs || event_type >= SBI_PMU_EVENT_TYPE_MAX)
> +	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs || event_type >= SBI_PMU_EVENT_TYPE_MAX)
>  		return SBI_EINVAL;
>  
>  	if (flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

