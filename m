From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 10:19:29 +0530
Subject: [RFC PATCH 4/9] lib: sbi: Delegate PMU counter overflow interrupt
 to S mode
In-Reply-To: <20210909204031.1239254-5-atish.patra@wdc.com>
References: <20210909204031.1239254-1-atish.patra@wdc.com>
 <20210909204031.1239254-5-atish.patra@wdc.com>
Message-ID: <CAAhSdy2hjy2WYX=x+kZXz0-Poy1CQNS77Yy=mNuwneAnmtOwUQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 2:10 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> We don't handle PMU counters for now. Delete the overflow counter to
> S-mode always.

I think you meant "...OpenSBI does not use PMU counters for now...".

>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  include/sbi/riscv_encoding.h | 2 ++
>  lib/sbi/sbi_hart.c           | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index f01c6cf0264d..c2cf0f4d69f4 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -86,6 +86,7 @@
>  #define IRQ_VS_EXT                     10
>  #define IRQ_M_EXT                      11
>  #define IRQ_S_GEXT                     12
> +#define IRQ_PMU_OVF                    13
>
>  #define MIP_SSIP                       (_UL(1) << IRQ_S_SOFT)
>  #define MIP_VSSIP                      (_UL(1) << IRQ_VS_SOFT)
> @@ -97,6 +98,7 @@
>  #define MIP_VSEIP                      (_UL(1) << IRQ_VS_EXT)
>  #define MIP_MEIP                       (_UL(1) << IRQ_M_EXT)
>  #define MIP_SGEIP                      (_UL(1) << IRQ_S_GEXT)
> +#define MIP_LCOFIP                     (_UL(1) << IRQ_PMU_OVF)
>
>  #define SIP_SSIP                       MIP_SSIP
>  #define SIP_STIP                       MIP_STIP
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 44b8dfd1b551..6076bea2470d 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -115,6 +115,9 @@ static int delegate_traps(struct sbi_scratch *scratch)
>
>         /* Send M-mode interrupts and most exceptions to S-mode */
>         interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
> +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOF))
> +               interrupts |= MIP_LCOFIP;
> +
>         exceptions = (1U << CAUSE_MISALIGNED_FETCH) | (1U << CAUSE_BREAKPOINT) |
>                      (1U << CAUSE_USER_ECALL);
>         if (sbi_platform_has_mfaults_delegation(plat))
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

