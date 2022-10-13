From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 09:35:47 +0530
Subject: [PATCH v5 2/5] lib: sbi_hart: move hart_features struct to a
 public location
In-Reply-To: <20221004164227.1381825-3-heiko@sntech.de>
References: <20221004164227.1381825-1-heiko@sntech.de> <20221004164227.1381825-3-heiko@sntech.de>
Message-ID: <CAAhSdy1A5iGg++eAJQ_xW1nFB3A0y5W4REAei2dbBDJyujU52A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 4, 2022 at 10:13 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Platforms may need to override auto-detected hart features
> in their override functions. So move the hart_features
> struct to the sbi_hart.h header allowing us to pass it over
> to platform-handlers.
>
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_hart.h | 11 +++++++++++
>  lib/sbi/sbi_hart.c     | 36 +++++++++++++-----------------------
>  2 files changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 0032364..95b40e7 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -41,6 +41,17 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_MAX,
>  };
>
> +struct sbi_hart_features {
> +       bool detected;
> +       int priv_version;
> +       unsigned long extensions;
> +       unsigned int pmp_count;
> +       unsigned int pmp_addr_bits;
> +       unsigned long pmp_gran;
> +       unsigned int mhpm_count;
> +       unsigned int mhpm_bits;
> +};
> +
>  struct sbi_scratch;
>
>  int sbi_hart_reinit(struct sbi_scratch *scratch);
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 447f99e..d0a6295 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -28,16 +28,6 @@ extern void __sbi_expected_trap_hext(void);
>
>  void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
>
> -struct hart_features {
> -       bool detected;
> -       int priv_version;
> -       unsigned long extensions;
> -       unsigned int pmp_count;
> -       unsigned int pmp_addr_bits;
> -       unsigned long pmp_gran;
> -       unsigned int mhpm_count;
> -       unsigned int mhpm_bits;
> -};
>  static unsigned long hart_features_offset;
>
>  static void mstatus_init(struct sbi_scratch *scratch)
> @@ -254,7 +244,7 @@ void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
>
>  unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch)
>  {
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
>         return hfeatures->mhpm_count;
> @@ -262,7 +252,7 @@ unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch)
>
>  unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
>  {
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
>         return hfeatures->pmp_count;
> @@ -270,7 +260,7 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
>
>  unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch)
>  {
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
>         return hfeatures->pmp_gran;
> @@ -278,7 +268,7 @@ unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch)
>
>  unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch)
>  {
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
>         return hfeatures->pmp_addr_bits;
> @@ -286,7 +276,7 @@ unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch)
>
>  unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
>  {
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
>         return hfeatures->mhpm_bits;
> @@ -336,7 +326,7 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>
>  int sbi_hart_priv_version(struct sbi_scratch *scratch)
>  {
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
>         return hfeatures->priv_version;
> @@ -346,7 +336,7 @@ void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
>                                    char *version_str, int nvstr)
>  {
>         char *temp;
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
>         switch (hfeatures->priv_version) {
> @@ -368,7 +358,7 @@ void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
>  }
>
>  static inline void __sbi_hart_update_extension(
> -                                       struct hart_features *hfeatures,
> +                                       struct sbi_hart_features *hfeatures,
>                                         enum sbi_hart_extensions ext,
>                                         bool enable)
>  {
> @@ -389,7 +379,7 @@ void sbi_hart_update_extension(struct sbi_scratch *scratch,
>                                enum sbi_hart_extensions ext,
>                                bool enable)
>  {
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
>         __sbi_hart_update_extension(hfeatures, ext, enable);
> @@ -405,7 +395,7 @@ void sbi_hart_update_extension(struct sbi_scratch *scratch,
>  bool sbi_hart_has_extension(struct sbi_scratch *scratch,
>                             enum sbi_hart_extensions ext)
>  {
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
>         if (hfeatures->extensions & BIT(ext))
> @@ -453,7 +443,7 @@ static inline char *sbi_hart_extension_id2string(int ext)
>  void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
>                                  char *extensions_str, int nestr)
>  {
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>         int offset = 0, ext = 0;
>         char *temp;
> @@ -539,7 +529,7 @@ static int hart_pmu_get_allowed_bits(void)
>  static int hart_detect_features(struct sbi_scratch *scratch)
>  {
>         struct sbi_trap_info trap = {0};
> -       struct hart_features *hfeatures =
> +       struct sbi_hart_features *hfeatures =
>                 sbi_scratch_offset_ptr(scratch, hart_features_offset);
>         unsigned long val, oldval;
>         int rc;
> @@ -718,7 +708,7 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
>                         sbi_hart_expected_trap = &__sbi_expected_trap_hext;
>
>                 hart_features_offset = sbi_scratch_alloc_offset(
> -                                               sizeof(struct hart_features));
> +                                       sizeof(struct sbi_hart_features));
>                 if (!hart_features_offset)
>                         return SBI_ENOMEM;
>         }
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

