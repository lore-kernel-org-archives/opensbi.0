From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Mar 2024 11:06:52 +0530
Subject: [PATCH 1/2] lib: utils/timer: Optimize current hart scratch access
In-Reply-To: <20240318144932.4165729-2-samuel.holland@sifive.com>
References: <20240318144932.4165729-1-samuel.holland@sifive.com> <20240318144932.4165729-2-samuel.holland@sifive.com>
Message-ID: <CAAhSdy3BYxCzk2CdUhgrrCfFGxicqUvcE7kpne6AMJBBudRa1w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 18, 2024 at 8:19?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> The address of the local scratch area is stored in each hart's mscratch
> CSR. It is more efficient to read the CSR than to compute the address
> from the hart ID.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
>  lib/utils/timer/aclint_mtimer.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> index 271e6252..9acb26eb 100644
> --- a/lib/utils/timer/aclint_mtimer.c
> +++ b/lib/utils/timer/aclint_mtimer.c
> @@ -72,14 +72,10 @@ static u64 mtimer_value(void)
>  static void mtimer_event_stop(void)
>  {
>         u32 target_hart = current_hartid();
> -       struct sbi_scratch *scratch;
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>         struct aclint_mtimer_data *mt;
>         u64 *time_cmp;
>
> -       scratch = sbi_hartid_to_scratch(target_hart);
> -       if (!scratch)
> -               return;
> -
>         mt = mtimer_get_hart_data_ptr(scratch);
>         if (!mt)
>                 return;
> @@ -92,14 +88,10 @@ static void mtimer_event_stop(void)
>  static void mtimer_event_start(u64 next_event)
>  {
>         u32 target_hart = current_hartid();
> -       struct sbi_scratch *scratch;
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>         struct aclint_mtimer_data *mt;
>         u64 *time_cmp;
>
> -       scratch = sbi_hartid_to_scratch(target_hart);
> -       if (!scratch)
> -               return;
> -
>         mt = mtimer_get_hart_data_ptr(scratch);
>         if (!mt)
>                 return;
> @@ -155,13 +147,9 @@ int aclint_mtimer_warm_init(void)
>  {
>         u64 *mt_time_cmp;
>         u32 target_hart = current_hartid();
> -       struct sbi_scratch *scratch;
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>         struct aclint_mtimer_data *mt;
>
> -       scratch = sbi_hartid_to_scratch(target_hart);
> -       if (!scratch)
> -               return SBI_ENOENT;
> -
>         mt = mtimer_get_hart_data_ptr(scratch);
>         if (!mt)
>                 return SBI_ENODEV;
> --
> 2.43.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

