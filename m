From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 Nov 2021 18:15:28 +0530
Subject: [PATCH v5 06/12] lib: sbi: Always enable access for all counters
In-Reply-To: <20211108185307.389145-7-atish.patra@wdc.com>
References: <20211108185307.389145-1-atish.patra@wdc.com>
 <20211108185307.389145-7-atish.patra@wdc.com>
Message-ID: <CAAhSdy3v80jcRFdqUdOFmL2snGs_iT=CSpR5=zD46M3H=hYJHQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 9, 2021 at 12:23 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> OpenSBI doesn't use any counters for its own usage. Thus, all the counters
> can be made accessible for lower privilege mode always. However, the
> mcountinhibit must be set so that the counter doesn't increment.
> As a result, we don't have to enable/disable mcounteren at every start/stop.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hart.c | 21 +++++++--------------
>  lib/sbi/sbi_pmu.c  | 16 ++++------------
>  2 files changed, 11 insertions(+), 26 deletions(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index fccd19b7eb31..69b57a781cfd 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -56,20 +56,13 @@ static void mstatus_init(struct sbi_scratch *scratch)
>             sbi_hart_has_feature(scratch, SBI_HART_HAS_SCOUNTEREN))
>                 csr_write(CSR_SCOUNTEREN, 7);
>
> -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTEREN)) {
> -               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> -                       /**
> -                        * Just enable the default counters (CY, TM, IR) because
> -                        * some OS (e.g FreeBSD) expect them to be enabled.
> -                        *
> -                        * All other counters will be enabled at runtime after
> -                        * S-mode request.
> -                        */
> -                       csr_write(CSR_MCOUNTEREN, 7);
> -               else
> -                       /* Supervisor mode usage are enabled by default */
> -                       csr_write(CSR_MCOUNTEREN, -1);
> -       }
> +       /**
> +        * OpenSBI doesn't use any PMU counters in M-mode.
> +        * Supervisor mode usage for all counters are enabled by default
> +        * But counters will not run until mcountinhibit is set.
> +        */
> +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTEREN))
> +               csr_write(CSR_MCOUNTEREN, -1);
>
>         /* All programmable counters will start running at runtime after S-mode request */
>         if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index eb0c2ff5d258..e2373ff6d9f7 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -275,7 +275,6 @@ static void pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
>
>  static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
>  {
> -       unsigned long mctr_en = csr_read(CSR_MCOUNTEREN);
>         unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
> @@ -283,15 +282,13 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
>         if (cidx > num_hw_ctrs || cidx == 1)
>                 return SBI_EINVAL;
>
> -       if (__test_bit(cidx, &mctr_en) && !__test_bit(cidx, &mctr_inhbt))
> +       if (!__test_bit(cidx, &mctr_inhbt))
>                 return SBI_EALREADY_STARTED;
>
> -       __set_bit(cidx, &mctr_en);
>         __clear_bit(cidx, &mctr_inhbt);
>
>         if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
>                 pmu_ctr_enable_irq_hw(cidx);
> -       csr_write(CSR_MCOUNTEREN, mctr_en);
>         csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
>
>         if (ival_update)
> @@ -345,17 +342,14 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>
>  static int pmu_ctr_stop_hw(uint32_t cidx)
>  {
> -       unsigned long mctr_en = csr_read(CSR_MCOUNTEREN);
>         unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
>
>         /* Make sure the counter index lies within the range and is not TM bit */
>         if (cidx > num_hw_ctrs || cidx == 1)
>                 return SBI_EINVAL;
>
> -       if (__test_bit(cidx, &mctr_en) && !__test_bit(cidx, &mctr_inhbt)) {
> +       if (!__test_bit(cidx, &mctr_inhbt)) {
>                 __set_bit(cidx, &mctr_inhbt);
> -               __clear_bit(cidx, &mctr_en);
> -               csr_write(CSR_MCOUNTEREN, mctr_en);
>                 csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
>                 return 0;
>         } else
> @@ -449,7 +443,6 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>         unsigned long ctr_mask;
>         int i, ret = 0, ctr_idx = SBI_ENOTSUPP;
>         struct sbi_pmu_hw_event *temp;
> -       unsigned long mctr_en = csr_read(CSR_MCOUNTEREN);
>         unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
>         int evt_idx_code = get_cidx_code(event_idx);
>
> @@ -474,8 +467,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>
>                 ctr_mask = temp->counters & (cmask << cbase);
>                 for_each_set_bit_from(cbase, &ctr_mask, SBI_PMU_HW_CTR_MAX) {
> -                       if (!__test_bit(cbase, &mctr_en) &&
> -                           __test_bit(cbase, &mctr_inhbt)) {
> +                       if (__test_bit(cbase, &mctr_inhbt)) {
>                                 ctr_idx = cbase;
>                                 break;
>                         }
> @@ -647,7 +639,7 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
>                 return;
>
>         csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
> -       csr_write(CSR_MCOUNTEREN, 7);
> +       csr_write(CSR_MCOUNTEREN, -1);
>         pmu_reset_event_map(hartid);
>  }
>
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

