From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Jan 2023 23:17:31 +0530
Subject: [PATCH 5/9] lib: sbi: Modify the boot time region flag prints
In-Reply-To: <20221220104625.80667-6-hchauhan@ventanamicro.com>
References: <20221220104625.80667-1-hchauhan@ventanamicro.com> <20221220104625.80667-6-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy1t65PNfW1WOH-C=bZ18oNdfGm9YtyCQJQ4ancNik5hxg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 20, 2022 at 4:17 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> With the finer permission semantics, the region access
> permissions must be displayed separately for M and SU mode.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_domain.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 01eff18..39a00f3 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -344,15 +344,25 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
>                            dom->index, i, suffix, rstart, rend);
>
>                 k = 0;
> -               if (reg->flags & SBI_DOMAIN_MEMREGION_MMODE)
> -                       sbi_printf("%cM", (k++) ? ',' : '(');
> +
> +               sbi_printf("M: ");
>                 if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
>                         sbi_printf("%cI", (k++) ? ',' : '(');
> -               if (reg->flags & SBI_DOMAIN_MEMREGION_READABLE)
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
> +                       sbi_printf("%cR", (k++) ? ',' : '(');
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
> +                       sbi_printf("%cW", (k++) ? ',' : '(');
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
> +                       sbi_printf("%cX", (k++) ? ',' : '(');
> +               sbi_printf("%s ", (k++) ? ")" : "()");
> +
> +               k = 0;
> +               sbi_printf("S/U: ");
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
>                         sbi_printf("%cR", (k++) ? ',' : '(');
> -               if (reg->flags & SBI_DOMAIN_MEMREGION_WRITEABLE)
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
>                         sbi_printf("%cW", (k++) ? ',' : '(');
> -               if (reg->flags & SBI_DOMAIN_MEMREGION_EXECUTABLE)
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
>                         sbi_printf("%cX", (k++) ? ',' : '(');
>                 sbi_printf("%s\n", (k++) ? ")" : "()");
>
> --
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

