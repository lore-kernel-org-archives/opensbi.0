From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Apr 2022 08:57:54 +0530
Subject: [PATCH 3/4] lib: sbi: Enable Zicbo[m|z] extensions in the menvcfg
 CSR
In-Reply-To: <20220329155218.118580-4-apatel@ventanamicro.com>
References: <20220329155218.118580-1-apatel@ventanamicro.com>
 <20220329155218.118580-4-apatel@ventanamicro.com>
Message-ID: <CAAhSdy1XLEH=2R1uap+HqLts_8zHr7moVGmwu-7+E2SM5h367Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 29, 2022 at 9:23 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The bits to configure/enable Zicbo[m|z] extensions in the menvcfg
> CSR are WARL. We try to enable these bits irrespective whether
> these extensions are available or not because writes to these
> bits will be ignored if these extensions are not available.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hart.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 31c8f39..d2c7aba 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -39,7 +39,7 @@ static unsigned long hart_features_offset;
>
>  static void mstatus_init(struct sbi_scratch *scratch)
>  {
> -       unsigned long mstatus_val = 0;
> +       unsigned long menvcfg_val, mstatus_val = 0;
>         int cidx;
>         unsigned int num_mhpm = sbi_hart_mhpm_count(scratch);
>         uint64_t mhpmevent_init_val = 0;
> @@ -86,6 +86,37 @@ static void mstatus_init(struct sbi_scratch *scratch)
>                 csr_write_num(CSR_MHPMEVENT3 + cidx, mhpmevent_init_val);
>  #endif
>         }
> +
> +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MENVCFG)) {
> +               menvcfg_val = csr_read(CSR_MENVCFG);
> +
> +               /*
> +                * Set menvcfg.CBZE == 1
> +                *
> +                * If Zicboz extension is not available then writes to
> +                * menvcfg.CBZE will be ignored because it is a WARL field.
> +                */
> +               menvcfg_val |= ENVCFG_CBZE;
> +
> +               /*
> +                * Set menvcfg.CBCFE == 1
> +                *
> +                * If Zicbom extension is not available then writes to
> +                * menvcfg.CBCFE will be ignored because it is a WARL field.
> +                */
> +               menvcfg_val |= ENVCFG_CBCFE;
> +
> +               /*
> +                * Set menvcfg.CBIE == 3
> +                *
> +                * If Zicbom extension is not available then writes to
> +                * menvcfg.CBIE will be ignored because it is a WARL field.
> +                */
> +               menvcfg_val |= ENVCFG_CBIE_INV << ENVCFG_CBIE_SHIFT;
> +
> +               csr_write(CSR_MENVCFG, menvcfg_val);
> +       }
> +
>         /* Disable all interrupts */
>         csr_write(CSR_MIE, 0);
>
> --
> 2.25.1
>

