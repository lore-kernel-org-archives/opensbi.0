From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Feb 2024 21:53:50 +0530
Subject: [PATCH v2] lib:platform: Add support for specify coldboot harts
 in DT for generic.
In-Reply-To: <tencent_C591656EA4C816895747ACD9C6B0E22B3608@qq.com>
References: <tencent_C591656EA4C816895747ACD9C6B0E22B3608@qq.com>
Message-ID: <CAAhSdy3vxauaBogFVPa18XHSb69c+Ay5TmC9huiNWe8H0uhdQw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 30, 2024 at 5:09?PM Cheng Yang <yangcheng.work@foxmail.com> wrote:
>
> Added support for the generic platform to specify the set of coldboot
> hart in DT. If not specified in DT, all harts are allowed to coldboot
> as before.
>
> The functions related to sbi_hartmask are not available before coldboot,
> so I used bitmap, and added a new bitmap_test() function to test whether
> a certain bit of the bitmap is set.
>
> Signed-off-by: Cheng Yang <yangcheng.work@foxmail.com>
> ---
> Changes v1 -> v2:
>   - Remove brackets.
>
>  include/sbi/sbi_bitmap.h    |  5 +++
>  lib/utils/fdt/fdt_fixup.c   | 17 ++++++++++
>  platform/generic/platform.c | 65 ++++++++++++++++++++++++++++++++++++-
>  3 files changed, 86 insertions(+), 1 deletion(-)

Overall, this looks good.

I suggest expanding this series with following patches:
1) Patch2 to add docs/opensbi_config.md which describes the
    "/chosen/opensbi-config" DT node and properties
2) Patch3 to update generic_domains_init() so that
    "system-suspend-test" is parsed from "/chosen/opensbi-config"
     DT node.
3) Patch4 to move documentation of "system-suspend-test"
   from docs/domain_support.md to docs/opensbi_config.md

Regards,
Anup

>
> diff --git a/include/sbi/sbi_bitmap.h b/include/sbi/sbi_bitmap.h
> index 4f0ebb6..354476c 100644
> --- a/include/sbi/sbi_bitmap.h
> +++ b/include/sbi/sbi_bitmap.h
> @@ -62,6 +62,11 @@ static inline void bitmap_zero(unsigned long *dst, int nbits)
>         }
>  }
>
> +static inline int bitmap_test(unsigned long *bmap, int bit)
> +{
> +       return __test_bit(bit, bmap);
> +}
> +
>  static inline void bitmap_zero_except(unsigned long *dst,
>                                       int exception, int nbits)
>  {
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index 5fc7673..55e6987 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -385,6 +385,21 @@ int fdt_reserved_memory_fixup(void *fdt)
>         return 0;
>  }
>
> +void fdt_config_fixup(void *fdt) {
> +       int chosen_offset, config_offset;
> +
> +       chosen_offset = fdt_path_offset(fdt, "/chosen");
> +       if (chosen_offset < 0)
> +               return;
> +
> +
> +       config_offset = fdt_node_offset_by_compatible(fdt, chosen_offset, "opensbi,config");
> +       if (chosen_offset < 0)
> +               return;
> +
> +       fdt_nop_node(fdt, config_offset);
> +}
> +
>  void fdt_fixups(void *fdt)
>  {
>         fdt_aplic_fixup(fdt);
> @@ -398,4 +413,6 @@ void fdt_fixups(void *fdt)
>  #ifndef CONFIG_FDT_FIXUPS_PRESERVE_PMU_NODE
>         fdt_pmu_fixup(fdt);
>  #endif
> +
> +       fdt_config_fixup(fdt);
>  }
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index bfd7d31..5f76193 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -73,6 +73,61 @@ extern struct sbi_platform platform;
>  static bool platform_has_mlevel_imsic = false;
>  static u32 generic_hart_index2id[SBI_HARTMASK_MAX_BITS] = { 0 };
>
> +DECLARE_BITMAP(generic_coldboot_harts, SBI_HARTMASK_MAX_BITS);
> +
> +/*
> + * The fw_platform_coldboot_init() function is called by fw_platform_init()
> + * function to initialize the cold boot harts allowed by the generic platform
> + * according to the DT property "cold-boot-harts" in "/chosen/opensbi-config"
> + * DT node. If there is no "cold-boot-harts" in DT, all harts will be allowed.
> + */
> +static void fw_platform_coldboot_init(void *fdt)
> +{
> +       int chosen_offset, config_offset, cpu_offset, len, err;
> +       u32 val32;
> +       const u32 *val;
> +
> +       bitmap_zero(generic_coldboot_harts, SBI_HARTMASK_MAX_BITS);
> +
> +       chosen_offset = fdt_path_offset(fdt, "/chosen");
> +       if (chosen_offset < 0)
> +               goto default_config;
> +
> +       config_offset = fdt_node_offset_by_compatible(fdt, chosen_offset, "opensbi,config");
> +       if (config_offset < 0)
> +               goto default_config;
> +
> +       val = fdt_getprop(fdt, config_offset, "cold-boot-harts", &len);
> +       len = len / sizeof(u32);
> +       if (val && len) {
> +               for (int i = 0; i < len; i++) {
> +                       cpu_offset = fdt_node_offset_by_phandle(fdt,
> +                                                       fdt32_to_cpu(val[i]));
> +                       if (cpu_offset < 0)
> +                               goto default_config;
> +
> +                       err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
> +                       if (err)
> +                               goto default_config;
> +
> +                       if (!fdt_node_is_enabled(fdt, cpu_offset))
> +                               continue;
> +
> +                       for (int i = 0; i < platform.hart_count; i++) {
> +                               if (val32 == generic_hart_index2id[i])
> +                                       bitmap_set(generic_coldboot_harts, i, 1);
> +                       }
> +
> +               }
> +       }
> +
> +       return;
> +
> +default_config:
> +       bitmap_fill(generic_coldboot_harts, SBI_HARTMASK_MAX_BITS);
> +       return;
> +}
> +
>  /*
>   * The fw_platform_init() function is called very early on the boot HART
>   * OpenSBI reference firmwares so that platform specific code get chance
> @@ -133,6 +188,8 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
>         platform.heap_size = fw_platform_calculate_heap_size(hart_count);
>         platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
>
> +       fw_platform_coldboot_init(fdt);
> +
>         /* Return original FDT pointer */
>         return arg1;
>
> @@ -146,7 +203,13 @@ static bool generic_cold_boot_allowed(u32 hartid)
>         if (generic_plat && generic_plat->cold_boot_allowed)
>                 return generic_plat->cold_boot_allowed(
>                                                 hartid, generic_plat_match);
> -       return true;
> +
> +       for (int i = 0; i < platform.hart_count; i++) {
> +               if (hartid == generic_hart_index2id[i])
> +                       return bitmap_test(generic_coldboot_harts, i);
> +       }
> +
> +       return false;
>  }
>
>  static int generic_nascent_init(void)
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

