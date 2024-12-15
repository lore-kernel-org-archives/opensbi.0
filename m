From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Dec 2024 11:32:45 +0530
Subject: [PATCH v2 1/2] lib: utils/fdt_cppc_rpmi: Fix compile error with LLVM
In-Reply-To: <0a1fc5683a0fbb1d55f82beac22881a1ca6cefdf.camel@126.com>
References: <20241210052326.407237-1-apatel@ventanamicro.com>
 <20241210052326.407237-2-apatel@ventanamicro.com> <0a1fc5683a0fbb1d55f82beac22881a1ca6cefdf.camel@126.com>
Message-ID: <CAAhSdy2f=kSrYpeDO5CQ=c54ZptWgY28GziHx6e_O+EheJhAKQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 11, 2024 at 3:31?PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2024-12-10?? 10:53 +0530?Anup Patel???
> > The following error is observed when compiling fdt_cppc_rpmi
> > driver using LLVM:
> >
> > lib/utils/cppc/fdt_cppc_rpmi.c:87:3: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
> >    87 |                 u64 db_val_u64 = 0;
> >
> > To fix the above issue, move the variable declaration at the
> > start of function.
> >
> > Fixes: 591a98bdd549 ("lib: utils/cppc: Add RPMI CPPC driver")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  lib/utils/cppc/fdt_cppc_rpmi.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
> > index 26e2d4f6..b6789901 100644
> > --- a/lib/utils/cppc/fdt_cppc_rpmi.c
> > +++ b/lib/utils/cppc/fdt_cppc_rpmi.c
> > @@ -59,6 +59,11 @@ static void rpmi_cppc_fc_db_trigger(struct rpmi_cppc *cppc)
> >       u8 db_val_u8 = 0;
> >       u16 db_val_u16 = 0;
> >       u32 db_val_u32 = 0;
> > +#if __riscv_xlen != 32
> > +     u64 db_val_u64 = 0;
> > +#else
> > +     u32 db_val_u32_hi = 0;
> > +#endif
> >
> >       switch (cppc->fc_db_width) {
> >       case RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_8:
> > @@ -84,14 +89,12 @@ static void rpmi_cppc_fc_db_trigger(struct rpmi_cppc *cppc)
> >               break;
> >       case RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_64:
> >  #if __riscv_xlen != 32
> > -             u64 db_val_u64 = 0;
> >               db_val_u64 = readq((void *)cppc->fc_db_addr);
> >               db_val_u64 = cppc->fc_db_setmask |
> >                               (db_val_u64 & cppc->fc_db_preservemask);
> >
> >               writeq(db_val_u64, (void *)cppc->fc_db_addr);
> >  #else
> > -             u32 db_val_u32_hi = 0;
> >               db_val_u32 = readl((void *)cppc->fc_db_addr);
> >               db_val_u32_hi = readl((void *)(cppc->fc_db_addr + 4));
> >
> > --
> > 2.43.0
> >
> >
>
> We may be able to remove db_val_u32_hi. as follows
>
> Regards,
> Xiang W
>
> diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
> index 26e2d4f6..f1f757ff 100644
> --- a/lib/utils/cppc/fdt_cppc_rpmi.c
> +++ b/lib/utils/cppc/fdt_cppc_rpmi.c
> @@ -59,6 +59,7 @@ static void rpmi_cppc_fc_db_trigger(struct rpmi_cppc *cppc)
>         u8 db_val_u8 = 0;
>         u16 db_val_u16 = 0;
>         u32 db_val_u32 = 0;
> +       u64 db_val_u64 = 0;
>
>         switch (cppc->fc_db_width) {
>         case RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_8:
> @@ -84,24 +85,20 @@ static void rpmi_cppc_fc_db_trigger(struct rpmi_cppc *cppc)
>                 break;
>         case RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_64:
>  #if __riscv_xlen != 32
> -               u64 db_val_u64 = 0;
>                 db_val_u64 = readq((void *)cppc->fc_db_addr);
>                 db_val_u64 = cppc->fc_db_setmask |
>                                 (db_val_u64 & cppc->fc_db_preservemask);
>
>                 writeq(db_val_u64, (void *)cppc->fc_db_addr);
>  #else
> -               u32 db_val_u32_hi = 0;
> -               db_val_u32 = readl((void *)cppc->fc_db_addr);
> -               db_val_u32_hi = readl((void *)(cppc->fc_db_addr + 4));
> -
> -               db_val_u32 = (u32)cppc->fc_db_setmask |
> -                               (db_val_u32 & (u32)cppc->fc_db_preservemask);
> -               db_val_u32_hi = (u32)(cppc->fc_db_setmask >> 32) |
> -                               (db_val_u32 & (u32)(cppc->fc_db_preservemask >> 32));
> +               db_val_u64 = readl((void *)(cppc->fc_db_addr + 4));
> +               db_val_u64 <<= 32;
> +               db_val_u64 |= readl((void *)cppc->fc_db_addr);
> +               db_val_u64 = cppc->fc_db_setmask |
> +                               (db_val_u64 & cppc->fc_db_preservemask);
>
> -               writel(db_val_u32, (void *)cppc->fc_db_addr);
> -               writel(db_val_u32_hi, (void *)(cppc->fc_db_addr + 4));
> +               writel(db_val_u64, (void *)cppc->fc_db_addr);
> +               writel(db_val_u64 >> 32, (void *)(cppc->fc_db_addr + 4));
>  #endif

Your suggestion looks good to me but it is more of an improvement.
Feel free to send this as a separate improvement patch.

Regards,
Anup

