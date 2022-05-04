From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 May 2022 19:05:57 -0700
Subject: [PATCH 11/11] lib: sbi_platform: Add callback to populate HART
 extensions
In-Reply-To: <20220429155151.314788-12-apatel@ventanamicro.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
 <20220429155151.314788-12-apatel@ventanamicro.com>
Message-ID: <CAOnJCUKMtkZrS73BxOEnbMZJxTx4ehKA8rBUqz-rCJ8VbQ8sLA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 29, 2022 at 8:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add platform specific extensions_init() callback which allows
> platforms to populate HART extensions for each HART. For example,
> the generic platform can populate HART extensions from HART ISA
> string described in DeviceTree.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_platform.h | 18 ++++++++++++++++++
>  lib/sbi/sbi_hart.c         | 18 ++++++++++++++----
>  2 files changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 2c777ac..87024db 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -89,6 +89,9 @@ struct sbi_platform_operations {
>          */
>         int (*misa_get_xlen)(void);
>
> +       /** Initialize (or populate) HART extensions for the platform */
> +       int (*extensions_init)(void);
> +


>         /** Initialize (or populate) domains for the platform */
>         int (*domains_init)(void);
>
> @@ -453,6 +456,21 @@ static inline int sbi_platform_misa_xlen(const struct sbi_platform *plat)
>         return -1;
>  }
>
> +/**
> + * Initialize (or populate) HART extensions for the platform
> + *
> + * @param plat pointer to struct sbi_platform
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +static inline int sbi_platform_extensions_init(
> +                                       const struct sbi_platform *plat)
> +{
> +       if (plat && sbi_platform_ops(plat)->extensions_init)
> +               return sbi_platform_ops(plat)->extensions_init();
> +       return 0;
> +}
> +



>  /**
>   * Initialize (or populate) domains for the platform
>   *
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 3fc8899..8284792 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -536,16 +536,17 @@ static int hart_pmu_get_allowed_bits(void)
>         return num_bits;
>  }
>
> -static void hart_detect_features(struct sbi_scratch *scratch)
> +static int hart_detect_features(struct sbi_scratch *scratch)
>  {
>         struct sbi_trap_info trap = {0};
>         struct hart_features *hfeatures =
>                 sbi_scratch_offset_ptr(scratch, hart_features_offset);
>         unsigned long val, oldval;
> +       int rc;
>
>         /* If hart features already detected then do nothing */
>         if (hfeatures->detected)
> -               return;
> +               return 0;
>
>         /* Clear hart features */
>         hfeatures->extensions = 0;
> @@ -680,10 +681,15 @@ __mhpm_skip:
>                                         SBI_HART_EXT_SMSTATEEN, true);
>         }
>
> +       /* Let platform populate extensions */
> +       rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr());
> +       if (rc)
> +               return rc;
> +
>         /* Mark hart feature detection done */
>         hfeatures->detected = true;
>
> -       return;
> +       return 0;
>  }
>
>  int sbi_hart_reinit(struct sbi_scratch *scratch)
> @@ -705,6 +711,8 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
>
>  int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
>  {
> +       int rc;
> +
>         if (cold_boot) {
>                 if (misa_extension('H'))
>                         sbi_hart_expected_trap = &__sbi_expected_trap_hext;
> @@ -715,7 +723,9 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
>                         return SBI_ENOMEM;
>         }
>
> -       hart_detect_features(scratch);
> +       rc = hart_detect_features(scratch);
> +       if (rc)
> +               return rc;
>
>         return sbi_hart_reinit(scratch);
>  }
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

