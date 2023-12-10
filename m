From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 10 Dec 2023 11:41:30 +0530
Subject: [PATCH] lib: sbi: Improve sbi_hsm_hart_interruptible_mask
In-Reply-To: <20231127123933.48851-1-wxjstz@126.com>
References: <20231127123933.48851-1-wxjstz@126.com>
Message-ID: <CAK9=C2X8T9ZZR1yv1iEsx4MzzJd+grctTZ5CzPpBHA-SObP+Xw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 27, 2023 at 6:10?PM Xiang W <wxjstz@126.com> wrote:
>
> Improve bit scanning with for_each_set_bit.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_hsm.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 147f954..bffac27 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -114,22 +114,18 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
>                                     ulong hbase, ulong *out_hmask)
>  {
>         int hstate;
> -       ulong i, hmask, dmask;
> +       ulong i, dmask;
>
>         *out_hmask = 0;
>         if (!sbi_hartid_valid(hbase))
>                 return SBI_EINVAL;
>
>         dmask = sbi_domain_get_assigned_hartmask(dom, hbase);
> -       for (i = 0; i < BITS_PER_LONG; i++) {
> -               hmask = 1UL << i;
> -               if (!(dmask & hmask))
> -                       continue;
> -
> +       for_each_set_bit(i, &dmask, BITS_PER_LONG) {

We have intentionally avoided using for_each_set_bit() here because
for_each_set_bit() is quite heavy handed and involves function calls to
find_first_bit() and find_next_bit. The for_each_set_bitbetter for dealing
with large bitmaps but for small bitmaps it becomes an overkill.

Also, please keep in mind that sbi_hsm_hart_interruptible_mask() is
in hot-path because it is called by sbi_ipi_send_many().

>                 hstate = __sbi_hsm_hart_get_state(hbase + i);
>                 if (hstate == SBI_HSM_STATE_STARTED ||
>                     hstate == SBI_HSM_STATE_SUSPENDED)
> -                       *out_hmask |= hmask;
> +                       *out_hmask |= 1UL << i;
>         }
>
>         return 0;
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

