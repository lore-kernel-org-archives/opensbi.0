From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Aug 2024 08:50:45 +0530
Subject: [PATCH] lib: sbi: dbtr: fix potential NULL pointer dereferences
In-Reply-To: <20240801122742.5001-1-carlos.lopezr4096@gmail.com>
References: <20240801122742.5001-1-carlos.lopezr4096@gmail.com>
Message-ID: <CAAhSdy1CT5eBaNvXep7ew9eCGPVA968p6q_BdzDiDQANdE5XGw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 1, 2024 at 6:03?PM Carlos L?pez <carlos.lopezr4096@gmail.com> wrote:
>
> In several dbtr functions, we first check that the dbtr trigger is not
> NULL and that its state is what we expect. However, it only makes
> sense to perform the second check if the dbtr trigger is not NULL.
> Othwerwise we will dereference a NULL pointer. Thus, change the
> condition so that it shortcuts to the first check if necessary.
>
> Signed-off-by: Carlos L?pez <carlos.lopezr4096@gmail.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_dbtr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 6e2083e..27a8b91 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -357,7 +357,7 @@ static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
>         unsigned long state;
>         unsigned long tdata1;
>
> -       if (!trig && !(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
> +       if (!trig || !(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
>                 return;
>
>         state = trig->state;
> @@ -403,7 +403,7 @@ static void dbtr_trigger_disable(struct sbi_dbtr_trigger *trig)
>  {
>         unsigned long tdata1;
>
> -       if (!trig && !(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
> +       if (!trig || !(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
>                 return;
>
>         tdata1 = trig->tdata1;
> @@ -429,7 +429,7 @@ static void dbtr_trigger_disable(struct sbi_dbtr_trigger *trig)
>
>  static void dbtr_trigger_clear(struct sbi_dbtr_trigger *trig)
>  {
> -       if (!trig && !(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
> +       if (!trig || !(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
>                 return;
>
>         csr_write(CSR_TSELECT, trig->index);
> --
> 2.39.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

