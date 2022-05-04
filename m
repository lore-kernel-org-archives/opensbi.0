From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 May 2022 18:51:22 -0700
Subject: [PATCH 04/11] lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart
 features
In-Reply-To: <20220429155151.314788-5-apatel@ventanamicro.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
 <20220429155151.314788-5-apatel@ventanamicro.com>
Message-ID: <CAOnJCU+RTwXC8KL5xg8yktK3NbvD=Qim0g-D1Ty5iBjY3xv+kQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 29, 2022 at 8:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> If a hart implements privileged spec v1.10 (or higher) then we can
> safely assume that [m|s]counteren CSR are present and we don't need
> MCOUNTEREN and SCOUNTEREN as hart features.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_hart.h    | 18 +++++++-----------
>  lib/sbi/sbi_emulate_csr.c |  4 ++--
>  lib/sbi/sbi_hart.c        | 29 +++++------------------------
>  lib/sbi/sbi_pmu.c         |  3 ++-
>  4 files changed, 16 insertions(+), 38 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 3c37933..4665a62 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -26,24 +26,20 @@ enum sbi_hart_priv_versions {
>
>  /** Possible feature flags of a hart */
>  enum sbi_hart_features {
> -       /** Hart has S-mode counter enable */
> -       SBI_HART_HAS_SCOUNTEREN = (1 << 0),
> -       /** Hart has M-mode counter enable */
> -       SBI_HART_HAS_MCOUNTEREN = (1 << 1),
>         /** Hart has counter inhibit CSR */
> -       SBI_HART_HAS_MCOUNTINHIBIT = (1 << 2),
> +       SBI_HART_HAS_MCOUNTINHIBIT = (1 << 0),
>         /** Hart has sscofpmf extension */
> -       SBI_HART_HAS_SSCOFPMF = (1 << 3),
> +       SBI_HART_HAS_SSCOFPMF = (1 << 1),
>         /** HART has timer csr implementation in hardware */
> -       SBI_HART_HAS_TIME = (1 << 4),
> +       SBI_HART_HAS_TIME = (1 << 2),
>         /** HART has AIA local interrupt CSRs */
> -       SBI_HART_HAS_AIA = (1 << 5),
> +       SBI_HART_HAS_AIA = (1 << 3),
>         /** HART has menvcfg CSR */
> -       SBI_HART_HAS_MENVCFG = (1 << 6),
> +       SBI_HART_HAS_MENVCFG = (1 << 4),
>         /** HART has mstateen CSR **/
> -       SBI_HART_HAS_SMSTATEEN = (1 << 7),
> +       SBI_HART_HAS_SMSTATEEN = (1 << 5),
>         /** HART has SSTC extension implemented in hardware */
> -       SBI_HART_HAS_SSTC = (1 << 8),
> +       SBI_HART_HAS_SSTC = (1 << 6),
>
>         /** Last index of Hart features*/
>         SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_SSTC,
> diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
> index dbb1755..aec9d3c 100644
> --- a/lib/sbi/sbi_emulate_csr.c
> +++ b/lib/sbi/sbi_emulate_csr.c
> @@ -24,7 +24,7 @@ static bool hpm_allowed(int hpm_num, ulong prev_mode, bool virt)
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
>         if (prev_mode <= PRV_S) {
> -               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTEREN)) {
> +               if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10) {
>                         cen &= csr_read(CSR_MCOUNTEREN);
>                         if (virt)
>                                 cen &= csr_read(CSR_HCOUNTEREN);
> @@ -33,7 +33,7 @@ static bool hpm_allowed(int hpm_num, ulong prev_mode, bool virt)
>                 }
>         }
>         if (prev_mode == PRV_U) {
> -               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SCOUNTEREN))
> +               if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
>                         cen &= csr_read(CSR_SCOUNTEREN);
>                 else
>                         cen = 0;
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index ed4e631..ed8a061 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -58,7 +58,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
>
>         /* Disable user mode usage of all perf counters except default ones (CY, TM, IR) */
>         if (misa_extension('S') &&
> -           sbi_hart_has_feature(scratch, SBI_HART_HAS_SCOUNTEREN))
> +           sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
>                 csr_write(CSR_SCOUNTEREN, 7);
>

mstatus_init invokes sbi_hart_priv_version 4 times. Keep the priv
version in a local variable ?

>         /**
> @@ -66,7 +66,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
>          * Supervisor mode usage for all counters are enabled by default
>          * But counters will not run until mcountinhibit is set.
>          */
> -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTEREN))
> +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
>                 csr_write(CSR_MCOUNTEREN, -1);
>
>         /* All programmable counters will start running at runtime after S-mode request */
> @@ -402,12 +402,6 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
>                 return NULL;
>
>         switch (feature) {
> -       case SBI_HART_HAS_SCOUNTEREN:
> -               fstr = "scounteren";
> -               break;
> -       case SBI_HART_HAS_MCOUNTEREN:
> -               fstr = "mcounteren";
> -               break;
>         case SBI_HART_HAS_MCOUNTINHIBIT:
>                 fstr = "mcountinhibit";
>                 break;
> @@ -614,23 +608,10 @@ __mhpm_skip:
>  #undef __check_csr_2
>  #undef __check_csr
>
> -       /* Detect if hart supports SCOUNTEREN feature */
> -       val = csr_read_allowed(CSR_SCOUNTEREN, (unsigned long)&trap);
> -       if (!trap.cause) {
> -               hfeatures->priv_version = SBI_HART_PRIV_VER_1_10;
> -               csr_write_allowed(CSR_SCOUNTEREN, (unsigned long)&trap, val);
> -               if (!trap.cause)
> -                       hfeatures->features |= SBI_HART_HAS_SCOUNTEREN;
> -       }
> -
> -       /* Detect if hart supports MCOUNTEREN feature */
> +       /* Detect if hart supports Priv v1.10 */
>         val = csr_read_allowed(CSR_MCOUNTEREN, (unsigned long)&trap);
> -       if (!trap.cause) {
> +       if (!trap.cause)
>                 hfeatures->priv_version = SBI_HART_PRIV_VER_1_10;
> -               csr_write_allowed(CSR_MCOUNTEREN, (unsigned long)&trap, val);
> -               if (!trap.cause)
> -                       hfeatures->features |= SBI_HART_HAS_MCOUNTEREN;
> -       }
>
>         /* Detect if hart supports MCOUNTINHIBIT feature */
>         val = csr_read_allowed(CSR_MCOUNTINHIBIT, (unsigned long)&trap);
> @@ -651,7 +632,7 @@ __mhpm_skip:
>
>         /* Counter overflow/filtering is not useful without mcounter/inhibit */
>         if (hfeatures->features & SBI_HART_HAS_MCOUNTINHIBIT &&
> -           hfeatures->features & SBI_HART_HAS_MCOUNTEREN) {
> +           hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {

nit comment:
this should be SBI_HART_PRIV_VER_1_10 in this patch.
the check should be SBI_HART_PRIV_VER_1_12 when you remove
mcountinhibit (PATCH 5)

>                 /* Detect if hart supports sscofpmf */
>                 csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
>                 if (!trap.cause)
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 7ea0ca5..853229e 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -729,7 +729,8 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
>         if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
>                 csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
>
> -       csr_write(CSR_MCOUNTEREN, -1);
> +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
> +               csr_write(CSR_MCOUNTEREN, -1);
>         pmu_reset_event_map(hartid);
>  }
>
> --
> 2.34.1
>

Other than that, LGTM.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

