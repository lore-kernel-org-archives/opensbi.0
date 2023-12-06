From: Xiang W <wxjstz@126.com>
Date: Wed, 06 Dec 2023 15:46:22 +0800
Subject: [v1 2/2] lib: sbi_pmu: Fix the counter info function
In-Reply-To: <20231206010844.1739845-3-atishp@rivosinc.com>
References: <20231206010844.1739845-1-atishp@rivosinc.com>
	 <20231206010844.1739845-3-atishp@rivosinc.com>
Message-ID: <883aa8bf780ce4f8b92ef08efd118b6baf704975.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-05???? 17:08 -0800?Atish Patra???
> The counter info should only return valid hardware counters for the ones
> set in the counter mask. Otherwise, it will report incorrect number of
> hardware counters to the supervisor if the platform has discontiguous
> counters.
> 
> Fixes: c744ed77b18c ("lib: sbi_pmu: Enable noncontigous hpm event and counters")
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> ?lib/sbi/sbi_pmu.c | 3 +++
> ?1 file changed, 3 insertions(+)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 185068bb1f43..ac5ae0af7da4 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -885,6 +885,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
> ?	int width;
> ?	union sbi_pmu_ctr_info cinfo = {0};
> ?	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +	unsigned long counter_mask = (unsigned long)sbi_hart_mhpm_mask(scratch) | 0x5;
> ?
> ?	/* Sanity check. Counter1 is not mapped at all */
> ?	if (cidx >= total_ctrs || cidx == 1)
Because counter_mask does not contain counter1, the cidx==1 check can be removed here.

Regards,
Xiang W

> @@ -892,6 +893,8 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
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


