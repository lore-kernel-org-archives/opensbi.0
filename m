From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 16 Nov 2022 14:56:32 +0000
Subject: [PATCH] lib: sbi: Bypass CY and IR bit setting in mcountinhibit
In-Reply-To: <20221116101826.10465-1-eric.lin@sifive.com>
References: <20221116101826.10465-1-eric.lin@sifive.com>
Message-ID: <E95DA6B1-DCB9-45D9-BB30-8EC53F2D1596@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 16 Nov 2022, at 10:18, Eric Lin <eric.lin@sifive.com> wrote:
> 
> CYCLE and INSTRET counters are part of uABI and they were
> re-enable for userspace in Linux riscv pmu driver.
> 
> To make these counters increase normally in userspace, we bypass
> CY and IR bit checking when setting mcountinhibit register.
> 
> LINK:https://lore.kernel.org/all/20220928131807.30386-1-palmer at rivosinc.com/
> Signed-off-by: Eric Lin <eric.lin@sifive.com>

If Linux is making SBI calls it doesn?t want then it should stop making
those calls. S-mode requesting CY and IR inhibit bits be set is totally
legitimate in some circumstances, it?s not up to firmware to enforce a
specific S-mode OS policy.

Jess

> ---
> lib/sbi/sbi_pmu.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 91d9ccc..28107e5 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -318,7 +318,7 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
> 	if (cidx >= num_hw_ctrs || cidx == 1)
> 		return SBI_EINVAL;
> 
> -	if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
> +	if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11 || cidx == 0 || cidx == 2)
> 		goto skip_inhibit_update;
> 
> 	/*
> @@ -413,7 +413,7 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
> 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> 	unsigned long mctr_inhbt;
> 
> -	if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
> +	if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11 || cidx == 0 || cidx == 2)
> 		return 0;
> 
> 	mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
> -- 
> 2.36.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


