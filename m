From: Anup Patel <anup@brainfault.org>
Date: Sun, 9 Jul 2023 11:12:14 +0530
Subject: [PATCH v2] lib: sbi: Fix Priv spec version for [m|s]counteren and
 mcountinhibit CSRs
In-Reply-To: <20230706063028.3548148-1-leyfoon.tan@starfivetech.com>
References: <20230706063028.3548148-1-leyfoon.tan@starfivetech.com>
Message-ID: <CAAhSdy0c=aZ4eiRTmBbBz9O4C4QYFsOJOe7YenBBp=pQm4K81g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 6, 2023 at 12:01?PM Ley Foon Tan
<leyfoon.tan@starfivetech.com> wrote:
>
> Fix Priv spec version typo in commit d4b563c881d6 ("lib: sbi: Remove MCOUNTEREN
> and SCOUNTEREN hart features").
>
> At least Priv spec v1.11 is required for [m|s]counteren and mcountinhibit CSRs.
>
> Fixes: d4b563c881d6 ("lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart features")
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
> v2:
> - Change Priv spec version to v1.11.
> - Update git commit description.
> ---
>  lib/sbi/sbi_hart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 6e52cbd..d4b8cad 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -664,7 +664,7 @@ __mhpm_skip:
>                 hfeatures->priv_version = SBI_HART_PRIV_VER_1_12;
>
>         /* Counter overflow/filtering is not useful without mcounter/inhibit */
> -       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> +       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11) {
>                 /* Detect if hart supports sscofpmf */
>                 csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
>                 if (!trap.cause)
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

