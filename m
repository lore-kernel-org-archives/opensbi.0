From: Anup Patel <anup@brainfault.org>
Date: Sun, 9 Jul 2023 11:11:22 +0530
Subject: [PATCH v2 3/4] lib: sbi: Alphabetically sort HART ISA extensions
In-Reply-To: <20230706041542.1069059-4-apatel@ventanamicro.com>
References: <20230706041542.1069059-1-apatel@ventanamicro.com> <20230706041542.1069059-4-apatel@ventanamicro.com>
Message-ID: <CAAhSdy2tro5EG1aCj3iWvZ0kmtYPSpsMvLcu_FaMe8L5qJKSzw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 6, 2023 at 9:46?AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Let us follow alphabetical order for HART ISA extension so that
> it is simpler to maintain.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  include/sbi/sbi_hart.h | 10 +++++-----
>  lib/sbi/sbi_hart.c     | 16 ++++++++--------
>  2 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 938248f..b97f78c 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -26,16 +26,16 @@ enum sbi_hart_priv_versions {
>
>  /** Possible ISA extensions of a hart */
>  enum sbi_hart_extensions {
> -       /** Hart has Sscofpmt extension */
> -       SBI_HART_EXT_SSCOFPMF = 0,
> -       /** HART has Zicntr extension (i.e. HW cycle, time & instret CSRs) */
> -       SBI_HART_EXT_ZICNTR,
>         /** HART has AIA M-mode CSRs */
> -       SBI_HART_EXT_SMAIA,
> +       SBI_HART_EXT_SMAIA = 0,
>         /** HART has Smstateen CSR **/
>         SBI_HART_EXT_SMSTATEEN,
> +       /** Hart has Sscofpmt extension */
> +       SBI_HART_EXT_SSCOFPMF,
>         /** HART has Sstc extension */
>         SBI_HART_EXT_SSTC,
> +       /** HART has Zicntr extension (i.e. HW cycle, time & instret CSRs) */
> +       SBI_HART_EXT_ZICNTR,
>         /** HART has Zihpm extension */
>         SBI_HART_EXT_ZIHPM,
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index ff6f582..2eacefb 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -438,20 +438,20 @@ static inline char *sbi_hart_extension_id2string(int ext)
>         char *estr = NULL;
>
>         switch (ext) {
> -       case SBI_HART_EXT_SSCOFPMF:
> -               estr = "sscofpmf";
> -               break;
> -       case SBI_HART_EXT_ZICNTR:
> -               estr = "zicntr";
> -               break;
>         case SBI_HART_EXT_SMAIA:
>                 estr = "smaia";
>                 break;
> +       case SBI_HART_EXT_SMSTATEEN:
> +               estr = "smstateen";
> +               break;
> +       case SBI_HART_EXT_SSCOFPMF:
> +               estr = "sscofpmf";
> +               break;
>         case SBI_HART_EXT_SSTC:
>                 estr = "sstc";
>                 break;
> -       case SBI_HART_EXT_SMSTATEEN:
> -               estr = "smstateen";
> +       case SBI_HART_EXT_ZICNTR:
> +               estr = "zicntr";
>                 break;
>         case SBI_HART_EXT_ZIHPM:
>                 estr = "zihpm";
> --
> 2.34.1
>

