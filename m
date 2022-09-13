From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Sep 2022 16:40:56 +0530
Subject: [PATCH 1/2] lib: sbi_trap: Add helper to get GVA in sbi_trap_regs
In-Reply-To: <OSZP286MB1435D1AC5E6B71A83041BE1DC67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
References: <OSZP286MB1435E0C79F99B144BC99F8F2C67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
 <OSZP286MB1435D1AC5E6B71A83041BE1DC67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy2iL=w7hc1rP+zyFDm9Xf6HzTuNTjdBBOod4EexAmc0wQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 2, 2022 at 9:20 PM Vivian Wang <dramforever@live.com> wrote:
>
> The GVA bit is in mstatus on RV64, and in mstatush in RV32. Refactor
> code handling this in sbi_trap_handler into a helper function to extract
> GVA from sbi_trap_regs, so that future code accessing GVA can be
> XLEN-agnostic.
>
> Signed-off-by: Vivian Wang <dramforever@live.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_trap.h | 18 ++++++++++++++++++
>  lib/sbi/sbi_trap.c     | 14 +-------------
>  2 files changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
> index fe3640a..a562b95 100644
> --- a/include/sbi/sbi_trap.h
> +++ b/include/sbi/sbi_trap.h
> @@ -10,6 +10,8 @@
>  #ifndef __SBI_TRAP_H__
>  #define __SBI_TRAP_H__
>
> +#include <sbi/riscv_encoding.h>
> +
>  /* clang-format off */
>
>  /** Index of zero member in sbi_trap_regs */
> @@ -206,6 +208,22 @@ struct sbi_trap_info {
>         unsigned long gva;
>  };
>
> +static inline unsigned long sbi_regs_gva(const struct sbi_trap_regs *regs)
> +{
> +       /*
> +        * If the hypervisor extension is not implemented, mstatus[h].GVA is a
> +        * WPRI field, which is guaranteed to read as zero. In addition, in this
> +        * case we don't read mstatush and instead pretend it is zero, which
> +        * handles privileged spec version < 1.12.
> +        */
> +
> +#if __riscv_xlen == 32
> +       return (regs->mstatusH & MSTATUSH_GVA) ? 1 : 0;
> +#else
> +       return (regs->mstatus & MSTATUS_GVA) ? 1 : 0;
> +#endif
> +}
> +
>  int sbi_trap_redirect(struct sbi_trap_regs *regs,
>                       struct sbi_trap_info *trap);
>
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index 4c1339e..c875c90 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -316,19 +316,7 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>                 trap.tval = mtval;
>                 trap.tval2 = mtval2;
>                 trap.tinst = mtinst;
> -
> -               /*
> -                * If the hypervisor extension is not implemented,
> -                * mstatus[h].GVA is a WPRI field, which is guaranteed to read
> -                * as zero. In addition, in this case we don't read mstatush and
> -                * instead pretend it is zero, which handles privileged spec
> -                * version < 1.12.
> -                */
> -#if __riscv_xlen == 32
> -               trap.gva = (regs->mstatusH & MSTATUSH_GVA) ? 1 : 0;
> -#else
> -               trap.gva = (regs->mstatus & MSTATUS_GVA) ? 1 : 0;
> -#endif
> +               trap.gva   = sbi_regs_gva(regs);
>
>                 rc = sbi_trap_redirect(regs, &trap);
>                 break;
> --
> 2.37.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

