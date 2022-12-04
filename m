From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Dec 2022 21:59:24 +0530
Subject: [PATCH v2 1/3] lib: sbi: Simplified mmio match checking
In-Reply-To: <20221124031605.216192-2-wxjstz@126.com>
References: <20221124031605.216192-1-wxjstz@126.com> <20221124031605.216192-2-wxjstz@126.com>
Message-ID: <CAAhSdy1q327TWgEGSx9-+rJyZxEzxrstB-nNEMzTN7XbE-EtgA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 24, 2022 at 8:46 AM Xiang W <wxjstz@126.com> wrote:
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_domain.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index f24a8e5..fec9074 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -105,7 +105,7 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
>                            unsigned long addr, unsigned long mode,
>                            unsigned long access_flags)
>  {
> -       bool mmio = FALSE;
> +       bool rmmio, mmio = FALSE;
>         struct sbi_domain_memregion *reg;
>         unsigned long rstart, rend, rflags, rwx = 0;
>
> @@ -130,8 +130,8 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
>                 rend = (reg->order < __riscv_xlen) ?
>                         rstart + ((1UL << reg->order) - 1) : -1UL;
>                 if (rstart <= addr && addr <= rend) {
> -                       if ((mmio && !(rflags & SBI_DOMAIN_MEMREGION_MMIO)) ||
> -                           (!mmio && (rflags & SBI_DOMAIN_MEMREGION_MMIO)))
> +                       rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? TRUE : FALSE;
> +                       if (mmio != rmmio)
>                                 return FALSE;
>                         return ((rflags & rwx) == rwx) ? TRUE : FALSE;
>                 }
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Please try to have at least one sentence in the commit description.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

