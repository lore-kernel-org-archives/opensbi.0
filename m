From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 May 2022 18:56:19 -0700
Subject: [PATCH 05/11] lib: sbi: Remove MCOUNTINHIBT hart feature
In-Reply-To: <20220429155151.314788-6-apatel@ventanamicro.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
 <20220429155151.314788-6-apatel@ventanamicro.com>
Message-ID: <CAOnJCU+S8CmhX_EyOKUCg=XvJFjOLJWpVFoo++hc8ESFsu-74A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 29, 2022 at 8:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> If a hart implements privileged spec v1.11 (or higher) then we can
> safely assume that mcountinhibit CSR is present and we don't need
> MCOUNTINHIBT as a hart feature.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_hart.h | 14 ++++++--------
>  lib/sbi/sbi_hart.c     | 23 ++++++++---------------
>  lib/sbi/sbi_pmu.c      | 10 +++++-----
>  3 files changed, 19 insertions(+), 28 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 4665a62..bc6b766 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -26,20 +26,18 @@ enum sbi_hart_priv_versions {
>
>  /** Possible feature flags of a hart */
>  enum sbi_hart_features {
> -       /** Hart has counter inhibit CSR */
> -       SBI_HART_HAS_MCOUNTINHIBIT = (1 << 0),
>         /** Hart has sscofpmf extension */
> -       SBI_HART_HAS_SSCOFPMF = (1 << 1),
> +       SBI_HART_HAS_SSCOFPMF = (1 << 0),
>         /** HART has timer csr implementation in hardware */
> -       SBI_HART_HAS_TIME = (1 << 2),
> +       SBI_HART_HAS_TIME = (1 << 1),
>         /** HART has AIA local interrupt CSRs */
> -       SBI_HART_HAS_AIA = (1 << 3),
> +       SBI_HART_HAS_AIA = (1 << 2),
>         /** HART has menvcfg CSR */
> -       SBI_HART_HAS_MENVCFG = (1 << 4),
> +       SBI_HART_HAS_MENVCFG = (1 << 3),
>         /** HART has mstateen CSR **/
> -       SBI_HART_HAS_SMSTATEEN = (1 << 5),
> +       SBI_HART_HAS_SMSTATEEN = (1 << 4),
>         /** HART has SSTC extension implemented in hardware */
> -       SBI_HART_HAS_SSTC = (1 << 6),
> +       SBI_HART_HAS_SSTC = (1 << 5),
>
>         /** Last index of Hart features*/
>         SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_SSTC,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index ed8a061..0fe88cb 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -70,7 +70,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
>                 csr_write(CSR_MCOUNTEREN, -1);
>
>         /* All programmable counters will start running at runtime after S-mode request */
> -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
>                 csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
>
>         /**
> @@ -402,9 +402,6 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
>                 return NULL;
>
>         switch (feature) {
> -       case SBI_HART_HAS_MCOUNTINHIBIT:
> -               fstr = "mcountinhibit";
> -               break;
>         case SBI_HART_HAS_SSCOFPMF:
>                 fstr = "sscofpmf";
>                 break;
> @@ -613,26 +610,22 @@ __mhpm_skip:
>         if (!trap.cause)
>                 hfeatures->priv_version = SBI_HART_PRIV_VER_1_10;
>
> -       /* Detect if hart supports MCOUNTINHIBIT feature */
> +       /* Detect if hart supports Priv v1.11 */
>         val = csr_read_allowed(CSR_MCOUNTINHIBIT, (unsigned long)&trap);
> -       if (!trap.cause) {
> -               csr_write_allowed(CSR_MCOUNTINHIBIT, (unsigned long)&trap, val);
> -               if (!trap.cause) {
> -                       hfeatures->priv_version = SBI_HART_PRIV_VER_1_11;
> -                       hfeatures->features |= SBI_HART_HAS_MCOUNTINHIBIT;
> -               }
> -       }
> +       if (!trap.cause &&
> +           (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_10))
> +               hfeatures->priv_version = SBI_HART_PRIV_VER_1_11;
>
>         /* Detect if hart has menvcfg CSR */
>         csr_read_allowed(CSR_MENVCFG, (unsigned long)&trap);
> -       if (!trap.cause) {
> +       if (!trap.cause &&
> +           (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11)) {
>                 hfeatures->priv_version = SBI_HART_PRIV_VER_1_12;
>                 hfeatures->features |= SBI_HART_HAS_MENVCFG;
>         }
>
>         /* Counter overflow/filtering is not useful without mcounter/inhibit */
> -       if (hfeatures->features & SBI_HART_HAS_MCOUNTINHIBIT &&
> -           hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> +       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
>                 /* Detect if hart supports sscofpmf */
>                 csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
>                 if (!trap.cause)
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 853229e..386bf4d 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -300,7 +300,7 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
>         if (cidx > num_hw_ctrs || cidx == 1)
>                 return SBI_EINVAL;
>
> -       if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> +       if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
>                 goto skip_inhibit_update;
>
>         /*
> @@ -372,7 +372,7 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>         unsigned long mctr_inhbt;
>
> -       if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> +       if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
>                 return 0;
>
>         mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
> @@ -524,7 +524,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>             !sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
>                 return fixed_ctr;
>
> -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
>                 mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
>         for (i = 0; i < num_hw_events; i++) {
>                 temp = &hw_event_map[i];
> @@ -551,7 +551,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>                         if (active_events[hartid][cbase] != SBI_PMU_EVENT_IDX_INVALID)
>                                 continue;
>                         /* If mcountinhibit is supported, the bit must be enabled */
> -                       if ((sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT)) &&
> +                       if ((sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11) &&
>                             !__test_bit(cbase, &mctr_inhbt))
>                                 continue;
>                         /* We found a valid counter that is not started yet */
> @@ -726,7 +726,7 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
>  {
>         u32 hartid = current_hartid();
>
> -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
>                 csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
>
>         if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

