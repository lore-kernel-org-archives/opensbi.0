From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Nov 2024 17:58:13 +0530
Subject: [PATCH v3 2/2] platform: introduce DT-based configurable heap size
In-Reply-To: <20241111022737.336991-3-inochiama@gmail.com>
References: <20241111022737.336991-1-inochiama@gmail.com> <20241111022737.336991-3-inochiama@gmail.com>
Message-ID: <CAAhSdy0Fb4bmikA9dxeaZk8L1eFG5kZzxroxMZGpvD1bDNT+3Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 11, 2024 at 7:58?AM Inochi Amaoto <inochiama@gmail.com> wrote:
>
> The default heap size will work for most platforms, but for some
> special platforms, the heap is too small to hold all the information
> or is too big so that it take too much ram. Introduce configurable
> heap should solve this problem and make all generic platforms happy.
>
> Add DT-based heap-size for the generic platform.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  docs/opensbi_config.md      |  4 ++++
>  platform/generic/platform.c | 28 +++++++++++++++++++++++++---
>  2 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/docs/opensbi_config.md b/docs/opensbi_config.md
> index 1b710f1..104d82c 100644
> --- a/docs/opensbi_config.md
> +++ b/docs/opensbi_config.md
> @@ -23,6 +23,9 @@ The DT properties of a domain configuration DT node are as follows:
>    set of harts is permitted to perform a cold boot. Otherwise, all
>    harts are allowed to cold boot.
>
> +* **heap-size** (Optional) - When present, the specified value is used
> +  as the size of the heap in bytes.
> +
>  * **system-suspend-test** (Optional) - When present, enable a system
>    suspend test implementation which simply waits five seconds and issues a WFI.
>
> @@ -36,6 +39,7 @@ The OpenSBI Configuration Node will be deleted at the end of cold boot
>          opensbi-config {
>              compatible = "opensbi,config";
>              cold-boot-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
> +            heap-size = <0x400000>;
>              system-suspend-test;
>          };
>      };
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 921c494..a22db49 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -69,6 +69,28 @@ static u32 fw_platform_calculate_heap_size(u32 hart_count)
>         return BIT_ALIGN(heap_size, HEAP_BASE_ALIGN);
>  }
>
> +static u32 fw_platform_get_heap_size(const void *fdt, u32 hart_count)
> +{
> +       int chosen_offset, config_offset, len;
> +       const fdt32_t *val;
> +
> +       /* Get the heap size from device tree */
> +       chosen_offset = fdt_path_offset(fdt, "/chosen");
> +       if (chosen_offset < 0)
> +               goto default_config;
> +
> +       config_offset = fdt_node_offset_by_compatible(fdt, chosen_offset, "opensbi,config");
> +       if (config_offset < 0)
> +               goto default_config;
> +
> +       val = (fdt32_t *)fdt_getprop(fdt, config_offset, "heap-size", &len);
> +       if (len > 0 && val)
> +               return BIT_ALIGN(fdt32_to_cpu(*val), HEAP_BASE_ALIGN);
> +
> +default_config:
> +       return fw_platform_calculate_heap_size(hart_count);
> +}
> +
>  extern struct sbi_platform platform;
>  static bool platform_has_mlevel_imsic = false;
>  static u32 generic_hart_index2id[SBI_HARTMASK_MAX_BITS] = { 0 };
> @@ -76,9 +98,9 @@ static u32 generic_hart_index2id[SBI_HARTMASK_MAX_BITS] = { 0 };
>  static DECLARE_BITMAP(generic_coldboot_harts, SBI_HARTMASK_MAX_BITS);
>
>  /*
> - * The fw_platform_coldboot_harts_init() function is called by fw_platform_init()
> + * The fw_platform_coldboot_harts_init() function is called by fw_platform_init()
>   * function to initialize the cold boot harts allowed by the generic platform
> - * according to the DT property "cold-boot-harts" in "/chosen/opensbi-config"
> + * according to the DT property "cold-boot-harts" in "/chosen/opensbi-config"
>   * DT node. If there is no "cold-boot-harts" in DT, all harts will be allowed.
>   */
>  static void fw_platform_coldboot_harts_init(const void *fdt)
> @@ -185,7 +207,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
>         }
>
>         platform.hart_count = hart_count;
> -       platform.heap_size = fw_platform_calculate_heap_size(hart_count);
> +       platform.heap_size = fw_platform_get_heap_size(fdt, hart_count);
>         platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
>
>         fw_platform_coldboot_harts_init(fdt);
> --
> 2.47.0
>

