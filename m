From: Anup Patel <anup@brainfault.org>
Date: Tue, 25 Mar 2025 13:45:25 +0530
Subject: [PATCH 1/2] lib: sbi: hart: Detect existence of cycle and instret
 CSRs for Zicntr
In-Reply-To: <20250225154103.5229-2-ziyao@disroot.org>
References: <20250225154103.5229-1-ziyao@disroot.org> <20250225154103.5229-2-ziyao@disroot.org>
Message-ID: <CAAhSdy0LhKVEmvOHNObyDHDixCZ+GQh=hWK+g3NZVFWHBrmKnQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025 at 10:14?PM Yao Zi <ziyao@disroot.org> wrote:
>
> Zicntr extension specifies three RO CSRs, time, cycle and instret. It
> isn't precise to report Zicntr is fully supported with only time CSR
> detected.
>
> Since CSR emulating code only cares about the availablity of time CSR,
> add additional definitions to represent the existance of cycle and
> instret CSRs.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  include/sbi/sbi_hart.h |  8 ++++++--
>  lib/sbi/sbi_hart.c     | 30 ++++++++++++++++++++++--------
>  lib/sbi/sbi_timer.c    |  2 +-
>  3 files changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 4c36c77..0a740cf 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -37,8 +37,12 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_SSCOFPMF,
>         /** HART has Sstc extension */
>         SBI_HART_EXT_SSTC,
> -       /** HART has Zicntr extension (i.e. HW cycle, time & instret CSRs) */
> -       SBI_HART_EXT_ZICNTR,
> +       /** HART has HW time CSR, as specified in Zicntr extension */
> +       SBI_HART_EXT_ZICNTR_TIME,
> +       /** HART has HW cycle CSR, as specified in Zicntr extension */
> +       SBI_HART_EXT_ZICNTR_CYCLE,
> +       /** HART has HW instret CSR, as specified in Zicntr extension */
> +       SBI_HART_EXT_ZICNTR_INSTRET,

Zicntr_time, Zicntr_cycle, and Zicntr_instret are not real extension
names so let's not add pseudo extension names.

Instead, I suggest introducing "enum sbi_hart_csrs" for CSRs
detected at boot-time. We will also need "csrs" bitmap in
"struct sbi_hart_features".

The new "enum sbi_hart_csrs" can have:
SBI_HART_CSR_CYCLE,
SBI_HART_CSR_TIME,
SBI_HART_CSR_INSTRET

These bits will be set in "struct sbi_hart_features" when
corresponding CSRs are detected at boot-time.

The SBI_HART_EXT_ZICNTR is only available when all
three SBI_HART_CSR_CYCLE, SBI_HART_CSR_TIME,
and SBI_HART_CSR_INSTRET are available.

>         /** HART has Zihpm extension */
>         SBI_HART_EXT_ZIHPM,
>         /** HART has Zkr extension */
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 8e2979b..e1d630d 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -669,7 +669,9 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>         __SBI_HART_EXT_DATA(smstateen, SBI_HART_EXT_SMSTATEEN),
>         __SBI_HART_EXT_DATA(sscofpmf, SBI_HART_EXT_SSCOFPMF),
>         __SBI_HART_EXT_DATA(sstc, SBI_HART_EXT_SSTC),
> -       __SBI_HART_EXT_DATA(zicntr, SBI_HART_EXT_ZICNTR),
> +       __SBI_HART_EXT_DATA(zicntr_time, SBI_HART_EXT_ZICNTR_TIME),
> +       __SBI_HART_EXT_DATA(zicntr_cycle, SBI_HART_EXT_ZICNTR_CYCLE),
> +       __SBI_HART_EXT_DATA(zicntr_instret, SBI_HART_EXT_ZICNTR_INSTRET),
>         __SBI_HART_EXT_DATA(zihpm, SBI_HART_EXT_ZIHPM),
>         __SBI_HART_EXT_DATA(zkr, SBI_HART_EXT_ZKR),
>         __SBI_HART_EXT_DATA(smcntrpmf, SBI_HART_EXT_SMCNTRPMF),
> @@ -782,7 +784,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>         struct sbi_hart_features *hfeatures =
>                 sbi_scratch_offset_ptr(scratch, hart_features_offset);
>         unsigned long val, oldval;
> -       bool has_zicntr = false;
> +       bool has_time = false, has_cycle = false, has_instret = false;
>         int rc;
>
>         /* If hart features already detected then do nothing */
> @@ -919,7 +921,13 @@ __pmp_skip:
>                         CSR_SCOUNTOVF, SBI_HART_EXT_SSCOFPMF);
>         /* Detect if hart supports time CSR */
>         __check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
> -                       CSR_TIME, SBI_HART_EXT_ZICNTR);
> +                       CSR_TIME, SBI_HART_EXT_ZICNTR_TIME);
> +       /* Detect if hart supports cycle CSR */
> +       __check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
> +                       CSR_CYCLE, SBI_HART_EXT_ZICNTR_CYCLE);
> +       /* Detect if hart supports instret CSR */
> +       __check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
> +                       CSR_INSTRET, SBI_HART_EXT_ZICNTR_INSTRET);
>         /* Detect if hart has AIA local interrupt CSRs */
>         __check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
>                         CSR_MTOPI, SBI_HART_EXT_SMAIA);
> @@ -938,8 +946,10 @@ __pmp_skip:
>
>  #undef __check_ext_csr
>
> -       /* Save trap based detection of Zicntr */
> -       has_zicntr = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR);
> +       /* Save trap based detection of Zicntr CSRs */
> +       has_time = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR_TIME);
> +       has_cycle = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR_CYCLE);
> +       has_instret = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR_INSTRET);
>
>         /* Let platform populate extensions */
>         rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
> @@ -947,9 +957,13 @@ __pmp_skip:
>         if (rc)
>                 return rc;
>
> -       /* Zicntr should only be detected using traps */
> -       __sbi_hart_update_extension(hfeatures, SBI_HART_EXT_ZICNTR,
> -                                   has_zicntr);
> +       /* Zicntr CSRs should only be detected using traps */
> +       __sbi_hart_update_extension(hfeatures, SBI_HART_EXT_ZICNTR_TIME,
> +                                   has_time);
> +       __sbi_hart_update_extension(hfeatures, SBI_HART_EXT_ZICNTR_CYCLE,
> +                                   has_cycle);
> +       __sbi_hart_update_extension(hfeatures, SBI_HART_EXT_ZICNTR_INSTRET,
> +                                   has_instret);
>
>         /* Extensions implied by other extensions and features */
>         if (hfeatures->mhpm_mask)
> diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> index 86e0db5..b4db4ca 100644
> --- a/lib/sbi/sbi_timer.c
> +++ b/lib/sbi/sbi_timer.c
> @@ -190,7 +190,7 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
>                 if (!time_delta_off)
>                         return SBI_ENOMEM;
>
> -               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR))
> +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR_TIME))
>                         get_time_val = get_ticks;
>
>                 ret = sbi_platform_timer_init(plat);
> --
> 2.48.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

