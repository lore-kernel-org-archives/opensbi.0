From: Anup Patel <anup@brainfault.org>
Date: Wed, 12 Jul 2023 11:52:27 +0530
Subject: [PATCH v3 06/10] lib: sbi: Grant SU R/W/X permissions to whole memory
In-Reply-To: <20230712043436.100548-7-hchauhan@ventanamicro.com>
References: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
 <20230712043436.100548-1-hchauhan@ventanamicro.com> <20230712043436.100548-7-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy0Gzyp0QYvzoMQjPQ5TZhpaTRqgC=qLOUYApcjrzXHE8A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 10:05?AM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Since pmp entries have implicit priority on index, previous entries will
> deny access to SU on M-mode region. Also, M-mode will not have access to
> SU region while previous entries will allow access to M-mode regions.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 38a5902..acd0f74 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -772,11 +772,17 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>
>         root.fw_region_inited = true;
>
> -       /* Root domain allow everything memory region */
> +       /*
> +        * Allow SU RWX on rest of the memory region. Since pmp entries
> +        * have implicit priority on index, previous entries will
> +        * deny access to SU on M-mode region. Also, M-mode will not
> +        * have access to SU region while previous entries will allow
> +        * access to M-mode regions.
> +        */
>         sbi_domain_memregion_init(0, ~0UL,
> -                                 (SBI_DOMAIN_MEMREGION_READABLE |
> -                                  SBI_DOMAIN_MEMREGION_WRITEABLE |
> -                                  SBI_DOMAIN_MEMREGION_EXECUTABLE),
> +                                 (SBI_DOMAIN_MEMREGION_SU_READABLE |
> +                                  SBI_DOMAIN_MEMREGION_SU_WRITABLE |
> +                                  SBI_DOMAIN_MEMREGION_SU_EXECUTABLE),
>                                   &root_memregs[root_memregs_count++]);
>
>         /* Root domain memory region end */
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

