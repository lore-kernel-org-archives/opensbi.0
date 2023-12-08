From: Xiang W <wxjstz@126.com>
Date: Fri, 08 Dec 2023 09:31:03 +0800
Subject: [v2 2/2] lib: sbi_pmu: Fix the counter info function
In-Reply-To: <20231207222351.1874852-3-atishp@rivosinc.com>
References: <20231207222351.1874852-1-atishp@rivosinc.com>
	 <20231207222351.1874852-3-atishp@rivosinc.com>
Message-ID: <737520e9d294ce0b74e026172be894c164b6d4c3.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-07???? 14:23 -0800?Atish Patra???
> The counter info should only return valid hardware counters for the ones
> set in the counter mask. Otherwise, it will report incorrect number of
> hardware counters to the supervisor if the platform has discontiguous
> counters.
> 
> Fixes: c744ed77b18c ("lib: sbi_pmu: Enable noncontigous hpm event and counters")
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
Look good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?include/sbi/sbi_pmu.h | 1 +
> ?lib/sbi/sbi_pmu.c???? | 8 ++++++--
> ?2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> index 16f687733baa..bd0392e5fe5a 100644
> --- a/include/sbi/sbi_pmu.h
> +++ b/include/sbi/sbi_pmu.h
> @@ -23,6 +23,7 @@ struct sbi_scratch;
> ?#define SBI_PMU_HW_CTR_MAX 32
> ?#define SBI_PMU_CTR_MAX	?? (SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX)
> ?#define SBI_PMU_FIXED_CTR_MASK 0x07
> +#define SBI_PMU_CY_IR_MASK	0x05
> ?
> ?struct sbi_pmu_device {
> ?	/** Name of the PMU platform device */
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 1ac8562a9c99..3f1d1dda24fc 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -891,13 +891,17 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
> ?	int width;
> ?	union sbi_pmu_ctr_info cinfo = {0};
> ?	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +	unsigned long counter_mask = (unsigned long)sbi_hart_mhpm_mask(scratch) |
> +				???? SBI_PMU_CY_IR_MASK;
> ?
> -	/* Sanity check. Counter1 is not mapped at all */
> -	if (cidx >= total_ctrs || cidx == 1)
> +	/* Sanity check */
> +	if (cidx >= total_ctrs)
> ?		return SBI_EINVAL;
> ?
> ?	/* We have 31 HW counters with 31 being the last index(MHPMCOUNTER31) */
> ?	if (cidx < num_hw_ctrs) {
> +		if (!(__test_bit(cidx, &counter_mask)))
> +			return SBI_EINVAL;
> ?		cinfo.type = SBI_PMU_CTR_TYPE_HW;
> ?		cinfo.csr = CSR_CYCLE + cidx;
> ?		/* mcycle & minstret are always 64 bit */
> -- 
> 2.34.1
> 
> 


