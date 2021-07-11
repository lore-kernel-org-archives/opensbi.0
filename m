From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 11 Jul 2021 07:15:23 -0700
Subject: [PATCH] lib: sbi: Fix sbi_pmu_exit() for systems not having
 MCOUNTINHIBIT csr
In-Reply-To: <20210711090315.1644931-1-anup.patel@wdc.com>
References: <20210711090315.1644931-1-anup.patel@wdc.com>
Message-ID: <CAOnJCUKfORt_=yySLSV=0HyocNMmP97R9Hdb_59VB2Ko7TKHPQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 2:03 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sbi_pmu_exit() crashes on systems not having MCOUNTINHIBIT csr
> so to fix this we check SBI_HART_HAS_MCOUNTINHIBIT feature in
> sbi_pmu_exit() and do nothing if it is not available.
>
> Fixes: 13d40f21d588 ("lib: sbi: Add PMU support")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/sbi/sbi_pmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 4092e6f..c276a46 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -583,6 +583,10 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
>  {
>         u32 hartid = current_hartid();
>
> +       /* SBI PMU is not supported if mcountinhibit is not available */
> +       if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> +               return;
> +

Arrgh. Apologies for overlooking this while testing.
Thanks for the quick fix.

>         csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
>         csr_write(CSR_MCOUNTEREN, 7);
>         pmu_reset_event_map(hartid);
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

