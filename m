From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Nov 2021 16:18:51 +0530
Subject: [PATCH v3 06/11] lib: sbi: Always enable access for all counters
In-Reply-To: <20211102150959.492991-7-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
 <20211102150959.492991-7-atish.patra@wdc.com>
Message-ID: <CAAhSdy1cvryvtQb4_9=TWLg_yh0x5K=yFKB9GXQRDt5Shs+EcA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 2, 2021 at 8:40 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> OpenSBI doesn't use any counters for its own usage. Thus, all the counters
> can be made accessible for lower privilege mode always. However, the
> mcountinhibit must be set so that the counter don't increment.
> As a result, we don't have enable/disable mcounteren at every start/stop.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  lib/sbi/sbi_hart.c | 21 +++++++--------------
>  lib/sbi/sbi_pmu.c  | 16 ++++------------
>  2 files changed, 11 insertions(+), 26 deletions(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 6076bea2470d..8c7870b735ee 100644
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
> index 4214b8e9026f..b7bd120a6f68 100644
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
>         if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOF))
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
> @@ -448,7 +442,6 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>         unsigned long ctr_mask;
>         int i, ret = 0, ctr_idx = SBI_ENOTSUPP;
>         struct sbi_pmu_hw_event *temp;
> -       unsigned long mctr_en = csr_read(CSR_MCOUNTEREN);
>         unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
>         int evt_idx_code = get_cidx_code(event_idx);
>
> @@ -473,8 +466,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>
>                 ctr_mask = temp->counters & (cmask << cbase);
>                 for_each_set_bit_from(cbase, &ctr_mask, SBI_PMU_HW_CTR_MAX) {
> -                       if (!__test_bit(cbase, &mctr_en) &&
> -                           __test_bit(cbase, &mctr_inhbt)) {
> +                       if (__test_bit(cbase, &mctr_inhbt)) {
>                                 ctr_idx = cbase;
>                                 break;
>                         }
> @@ -646,7 +638,7 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
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

