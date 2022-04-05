From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Apr 2022 09:01:02 +0530
Subject: [RFC PATCH v1 2/3] lib: sbi: Detect Smstateen CSRs at boot-time
In-Reply-To: <20220321051528.20143-3-mchitale@ventanamicro.com>
References: <20220321051528.20143-1-mchitale@ventanamicro.com>
 <20220321051528.20143-3-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy28=WTbnwpFitpYEnzgEWnkzTuTNf_gACw2Dk15Z0gnOA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 10:45 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Extend HART feature detection to discover Smstateen CSRs at boot-time
> and configure mstateen envcfg bit depending on availability of
> menvcfg CSR.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Please rebase this patch upon the latest OpenSBI master.

Regards,
Anup

> ---
>  include/sbi/sbi_hart.h |  4 +++-
>  lib/sbi/sbi_hart.c     | 20 +++++++++++++++++++-
>  2 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 93be7ed..b5345f4 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -30,9 +30,11 @@ enum sbi_hart_features {
>         SBI_HART_HAS_MENVCFG = (1 << 6),
>         /** HART has SSTC extension implemented in hardware */
>         SBI_HART_HAS_SSTC = (1 << 7),
> +       /** HART has mstateen CSR **/
> +       SBI_HART_HAS_SMSTATEEN = (1 << 8),
>
>         /** Last index of Hart features*/
> -       SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_SSTC,
> +       SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_SMSTATEEN,
>  };
>
>  struct sbi_scratch;
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 8c9cad2..9d0c435 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -44,6 +44,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
>         unsigned int num_mhpm = sbi_hart_mhpm_count(scratch);
>         uint64_t mhpmevent_init_val = 0;
>         unsigned long menvcfg_val = 0;
> +       unsigned long mstateen_val = 0;
>
>         /* Enable FPU */
>         if (misa_extension('D') || misa_extension('F'))
> @@ -72,6 +73,16 @@ static void mstatus_init(struct sbi_scratch *scratch)
>  #endif
>         }
>
> +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SMSTATEEN)) {
> +               mstateen_val = csr_read(CSR_MSTATEEN0);
> +               mstateen_val |= (1UL << SMSTATEEN_STATEN);
> +               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MENVCFG))
> +                       mstateen_val |= (1UL << SMSTATEEN0_HSENVCFG);
> +               else
> +                       mstateen_val &= ~(1UL << SMSTATEEN0_HSENVCFG);
> +               csr_write(CSR_MSTATEEN0, mstateen_val);
> +       }
> +
>         /* Disable user mode usage of all perf counters except default ones (CY, TM, IR) */
>         if (misa_extension('S') &&
>             sbi_hart_has_feature(scratch, SBI_HART_HAS_SCOUNTEREN))
> @@ -324,6 +335,9 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
>         case SBI_HART_HAS_SSTC:
>                 fstr = "sstc";
>                 break;
> +       case SBI_HART_HAS_SMSTATEEN:
> +               fstr = "smstateen";
> +               break;
>         default:
>                 break;
>         }
> @@ -552,7 +566,6 @@ __mhpm_skip:
>         csr_read_allowed(CSR_MENVCFG, (unsigned long)&trap);
>         if (!trap.cause)
>                 hfeatures->features |= SBI_HART_HAS_MENVCFG;
> -
>         /**
>          * Detect if hart supports stimecmp CSR(Sstc extension) and menvcfg is
>          * implemented.
> @@ -561,6 +574,11 @@ __mhpm_skip:
>         if (!trap.cause && sbi_hart_has_feature(scratch, SBI_HART_HAS_MENVCFG))
>                 hfeatures->features |= SBI_HART_HAS_SSTC;
>
> +       /* Detect if hart supports mstateen CSRs */
> +       val = csr_read_allowed(CSR_MSTATEEN0, (unsigned long)&trap);
> +       if (!trap.cause)
> +               hfeatures->features |= SBI_HART_HAS_SMSTATEEN;
> +
>         /* Detect if hart has AIA local interrupt CSRs */
>         csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
>         if (trap.cause)
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

