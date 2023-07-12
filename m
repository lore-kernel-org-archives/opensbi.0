From: Anup Patel <anup@brainfault.org>
Date: Wed, 12 Jul 2023 11:54:11 +0530
Subject: [PATCH v3 08/10] lib: sbi: Change the order of PMP initialization
In-Reply-To: <20230712043436.100548-9-hchauhan@ventanamicro.com>
References: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
 <20230712043436.100548-1-hchauhan@ventanamicro.com> <20230712043436.100548-9-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy0UksK=rgtQGK9fL7oY-AaYvaQHUBHcxwm3jGZJXTSnRw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 10:05?AM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Configure PMP at last when all other initializations have been done.
> Because if SMEPMP is detected, M-mode access to the S/U space will be
> rescinded.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  lib/sbi/sbi_init.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 423e6d8..35e6633 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -356,13 +356,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>                 sbi_hart_hang();
>         }
>
> -       rc = sbi_hart_pmp_configure(scratch);
> -       if (rc) {
> -               sbi_printf("%s: PMP configure failed (error %d)\n",
> -                          __func__, rc);
> -               sbi_hart_hang();
> -       }
> -
>         /*
>          * Note: Platform final initialization should be after finalizing
>          * domains so that it sees correct domain assignment and PMP
> @@ -392,6 +385,17 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>
>         sbi_boot_print_hart(scratch, hartid);
>
> +       /*
> +        * Configure PMP at last because if SMEPMP is detected,
> +        * M-mode access to the S/U space will be rescinded.
> +        */
> +       rc = sbi_hart_pmp_configure(scratch);
> +       if (rc) {
> +               sbi_printf("%s: PMP configure failed (error %d)\n",
> +                          __func__, rc);
> +               sbi_hart_hang();
> +       }
> +
>         wake_coldboot_harts(scratch, hartid);
>
>         count = sbi_scratch_offset_ptr(scratch, init_count_offset);
> @@ -445,11 +449,15 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
>         if (rc)
>                 sbi_hart_hang();
>
> -       rc = sbi_hart_pmp_configure(scratch);
> +       rc = sbi_platform_final_init(plat, false);
>         if (rc)
>                 sbi_hart_hang();
>
> -       rc = sbi_platform_final_init(plat, false);
> +       /*
> +        * Configure PMP at last because if SMEPMP is detected,
> +        * M-mode access to the S/U space will be rescinded.
> +        */
> +       rc = sbi_hart_pmp_configure(scratch);
>         if (rc)
>                 sbi_hart_hang();
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

