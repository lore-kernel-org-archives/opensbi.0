From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Apr 2022 13:11:51 +0530
Subject: [v2 PATCH] lib: sbi: Implement Sstc extension
In-Reply-To: <20220426062922.218056-1-atishp@rivosinc.com>
References: <20220426062922.218056-1-atishp@rivosinc.com>
Message-ID: <CAAhSdy12RyUg_1mfPQfnSW=h4BMqH599KOSOE3V+Q_niHOjWuw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 26, 2022 at 11:59 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Recently, Sstc extension was ratified. It defines stimecmp which allows
> the supervisor mode to directly update the timecmp value without the
> need of the SBI call. The hardware also can inject the S-mode timer
> interrupt direclty to the supervisor without going through the M-mode.
> To maintain backward compatibility with the older software, SBI call
> now uses stimecmp directly if the hardware supports.
>
> Implement the Sstc extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

For now, we will live with the problem of SBI timer call clobering the
stimecmp CSR because both RISC-V Sstc and RISC-V SBI v1.0
are ratified.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Changes from v1->v2:
> 1. Rebased on top upstream head (9cd95e13bba9)
> ---
>  include/sbi/riscv_encoding.h |  4 ++++
>  include/sbi/sbi_hart.h       |  4 +++-
>  lib/sbi/sbi_hart.c           | 28 ++++++++++++++++++++++++++++
>  lib/sbi/sbi_timer.c          | 25 ++++++++++++++++++++++---
>  4 files changed, 57 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index a9772a67599c..7cfbaced55d2 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -324,6 +324,10 @@
>  #define CSR_STVAL                      0x143
>  #define CSR_SIP                                0x144
>
> +/* Sstc extension */
> +#define CSR_STIMECMP                   0x14D
> +#define CSR_STIMECMPH                  0x15D
> +
>  /* Supervisor Protection and Translation */
>  #define CSR_SATP                       0x180
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index be3ad9fac0df..1d093742a7e3 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -30,9 +30,11 @@ enum sbi_hart_features {
>         SBI_HART_HAS_MENVCFG = (1 << 6),
>         /** HART has mstateen CSR **/
>         SBI_HART_HAS_SMSTATEEN = (1 << 7),
> +       /** HART has SSTC extension implemented in hardware */
> +       SBI_HART_HAS_SSTC = (1 << 8),
>
>         /** Last index of Hart features*/
> -       SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_SMSTATEEN,
> +       SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_SSTC,
>  };
>
>  struct sbi_scratch;
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 891fa18342b7..a50b6e4b3457 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -147,6 +147,22 @@ static void mstatus_init(struct sbi_scratch *scratch)
>                 menvcfg_val |= ENVCFG_PBMTE;
>  #endif
>
> +               /*
> +                * The spec doesn't explicitly describe the reset value of menvcfg.
> +                * Enable access to stimecmp if sstc extension is present in the
> +                * hardware.
> +                */
> +               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSTC)) {
> +#if __riscv_xlen == 32
> +                       unsigned long menvcfgh_val;
> +                       menvcfgh_val = csr_read(CSR_MENVCFGH);
> +                       menvcfgh_val |= ENVCFGH_STCE;
> +                       csr_write(CSR_MENVCFGH, menvcfgh_val);
> +#else
> +                       menvcfg_val |= ENVCFG_STCE;
> +#endif
> +               }
> +
>                 csr_write(CSR_MENVCFG, menvcfg_val);
>         }
>
> @@ -367,6 +383,8 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
>                 break;
>         case SBI_HART_HAS_AIA:
>                 fstr = "aia";
> +       case SBI_HART_HAS_SSTC:
> +               fstr = "sstc";
>                 break;
>         case SBI_HART_HAS_MENVCFG:
>                 fstr = "menvcfg";
> @@ -610,6 +628,16 @@ __aia_skip:
>         if (!trap.cause)
>                 hfeatures->features |= SBI_HART_HAS_MENVCFG;
>
> +       /**
> +        * Detect if hart supports stimecmp CSR(Sstc extension) and menvcfg is
> +        * implemented.
> +        */
> +       if (hfeatures->features & SBI_HART_HAS_MENVCFG) {
> +               csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
> +               if (!trap.cause)
> +                       hfeatures->features |= SBI_HART_HAS_SSTC;
> +       }
> +
>         /* Detect if hart supports mstateen CSRs */
>         val = csr_read_allowed(CSR_MSTATEEN0, (unsigned long)&trap);
>         if (!trap.cause)
> diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> index acdba922b1e9..bf0f375a106f 100644
> --- a/lib/sbi/sbi_timer.c
> +++ b/lib/sbi/sbi_timer.c
> @@ -124,16 +124,35 @@ void sbi_timer_set_delta_upper(ulong delta_upper)
>  void sbi_timer_event_start(u64 next_event)
>  {
>         sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SET_TIMER);
> -       if (timer_dev && timer_dev->timer_event_start)
> +
> +       /**
> +        * Update the stimecmp directly if available. This allows
> +        * the older software to leverage sstc extension on newer hardware.
> +        */
> +       if (sbi_hart_has_feature(sbi_scratch_thishart_ptr(), SBI_HART_HAS_SSTC)) {
> +#if __riscv_xlen == 32
> +               csr_write(CSR_STIMECMP, next_event & 0xFFFFFFFF);
> +               csr_write(CSR_STIMECMPH, next_event >> 32);
> +#else
> +               csr_write(CSR_STIMECMP, next_event);
> +#endif
> +       } else if (timer_dev && timer_dev->timer_event_start) {
>                 timer_dev->timer_event_start(next_event);
> -       csr_clear(CSR_MIP, MIP_STIP);
> +               csr_clear(CSR_MIP, MIP_STIP);
> +       }
>         csr_set(CSR_MIE, MIP_MTIP);
>  }
>
>  void sbi_timer_process(void)
>  {
>         csr_clear(CSR_MIE, MIP_MTIP);
> -       csr_set(CSR_MIP, MIP_STIP);
> +       /*
> +        * If sstc extension is available, supervisor can receive the timer
> +        * directly without M-mode come in between. This function should
> +        * only invoked if M-mode programs the timer for its own purpose.
> +        */
> +       if (!sbi_hart_has_feature(sbi_scratch_thishart_ptr(), SBI_HART_HAS_SSTC))
> +               csr_set(CSR_MIP, MIP_STIP);
>  }
>
>  const struct sbi_timer_device *sbi_timer_get_device(void)
> --
> 2.25.1
>

