From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Jan 2023 23:08:45 +0530
Subject: [PATCH 2/9] lib: sbi: Use finer permission semantics for address validation
In-Reply-To: <20221220104625.80667-3-hchauhan@ventanamicro.com>
References: <20221220104625.80667-1-hchauhan@ventanamicro.com> <20221220104625.80667-3-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3jwFjWiZ+pSQ-5fs5m2iW==iOkXX7OnqAFeWz2R9da_w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 20, 2022 at 4:17 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Use the fine grained permisssion semantics for address validation
> of a given region.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_domain.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 3205595..8f9306c 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -107,24 +107,33 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
>  {
>         bool rmmio, mmio = FALSE;
>         struct sbi_domain_memregion *reg;
> -       unsigned long rstart, rend, rflags, rwx = 0;
> +       unsigned long rstart, rend, rflags, rwx = 0, rrwx = 0;
>
>         if (!dom)
>                 return FALSE;
>
> +       /*
> +        * Use M_{R/W/X} bits because the SU-bits are at the
> +        * same relative offsets. If the mode is not M, the SU
> +        * bits will fall at same offsets after the shift.
> +        */
>         if (access_flags & SBI_DOMAIN_READ)
> -               rwx |= SBI_DOMAIN_MEMREGION_READABLE;
> +               rwx |= SBI_DOMAIN_MEMREGION_M_READABLE;
> +
>         if (access_flags & SBI_DOMAIN_WRITE)
> -               rwx |= SBI_DOMAIN_MEMREGION_WRITEABLE;
> +               rwx |= SBI_DOMAIN_MEMREGION_M_WRITABLE;
> +
>         if (access_flags & SBI_DOMAIN_EXECUTE)
> -               rwx |= SBI_DOMAIN_MEMREGION_EXECUTABLE;
> +               rwx |= SBI_DOMAIN_MEMREGION_M_EXECUTABLE;
> +
>         if (access_flags & SBI_DOMAIN_MMIO)
>                 mmio = TRUE;
>
>         sbi_domain_for_each_memregion(dom, reg) {
>                 rflags = reg->flags;
> -               if (mode == PRV_M && !(rflags & SBI_DOMAIN_MEMREGION_MMODE))
> -                       continue;
> +               rrwx = (mode == PRV_M ? (rflags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK)
> +                       : (rflags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
> +                       >> SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT);
>
>                 rstart = reg->base;
>                 rend = (reg->order < __riscv_xlen) ?
> @@ -133,7 +142,7 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
>                         rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? TRUE : FALSE;
>                         if (mmio != rmmio)
>                                 return FALSE;
> -                       return ((rflags & rwx) == rwx) ? TRUE : FALSE;
> +                       return ((rrwx & rwx) == rwx) ? TRUE : FALSE;
>                 }
>         }
>
> --
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

