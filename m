From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 09:38:19 +0530
Subject: [PATCH v5 3/5] lib: sbi_platform: expose hart_features to
 extension_init callback
In-Reply-To: <20221004164227.1381825-4-heiko@sntech.de>
References: <20221004164227.1381825-1-heiko@sntech.de> <20221004164227.1381825-4-heiko@sntech.de>
Message-ID: <CAAhSdy1F1F_tHgH2gVVJa4GgzGcxMAoU1CUAJyaNBhjkE8=6AA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 4, 2022 at 10:13 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The platform-specific extension_init callback is supposed to
> set specific things for the platform opensbi is running on.
>
> So it's also the right place to override specific hart_features
> if needed - when it's know that autodetection has provided
> wrong results for example.
>
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_platform.h | 8 +++++---
>  lib/sbi/sbi_hart.c         | 3 ++-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 87024db..722f27a 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -48,6 +48,7 @@
>  struct sbi_domain_memregion;
>  struct sbi_trap_info;
>  struct sbi_trap_regs;
> +struct sbi_hart_features;
>
>  /** Possible feature flags of a platform */
>  enum sbi_platform_features {
> @@ -90,7 +91,7 @@ struct sbi_platform_operations {
>         int (*misa_get_xlen)(void);
>
>         /** Initialize (or populate) HART extensions for the platform */
> -       int (*extensions_init)(void);
> +       int (*extensions_init)(struct sbi_hart_features *hfeatures);
>
>         /** Initialize (or populate) domains for the platform */
>         int (*domains_init)(void);
> @@ -464,10 +465,11 @@ static inline int sbi_platform_misa_xlen(const struct sbi_platform *plat)
>   * @return 0 on success and negative error code on failure
>   */
>  static inline int sbi_platform_extensions_init(
> -                                       const struct sbi_platform *plat)
> +                                       const struct sbi_platform *plat,
> +                                       struct sbi_hart_features *hfeatures)
>  {
>         if (plat && sbi_platform_ops(plat)->extensions_init)
> -               return sbi_platform_ops(plat)->extensions_init();
> +               return sbi_platform_ops(plat)->extensions_init(hfeatures);
>         return 0;
>  }
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index d0a6295..dacab1a 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -672,7 +672,8 @@ __mhpm_skip:
>         }
>
>         /* Let platform populate extensions */
> -       rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr());
> +       rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
> +                                         hfeatures);
>         if (rc)
>                 return rc;
>
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

