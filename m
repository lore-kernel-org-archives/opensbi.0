From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Aug 2024 10:53:55 +0530
Subject: [PATCH] platform: generic: Fix fw_platform_coldboot_harts_init() function
In-Reply-To: <20240825040305.3947940-1-apatel@ventanamicro.com>
References: <20240825040305.3947940-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy2vRNLAW6kbkHwW7HVrxQ3tFpYzw886__A1mQ6Ov70frg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 25, 2024 at 9:33?AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> It is possible that the OpenSBI config DT node is present but
> the "cold-boot-harts" DT property is not present. In this case,
> the fw_platform_coldboot_harts_init() will do nothing which
> in-turn causes OpenSBI firmware hang at boot time.
>
> To address the above issue, fallback to the default approach
> when the "cold-boot-harts" DT property is not present.
>
> Fixes: 67ce5a763cfb ("platform: generic: Add support for specify coldboot harts in DT")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

This is a critical fix hence applying immediately.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/platform.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 8a0ace83..d1fa84bd 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -102,26 +102,26 @@ static void fw_platform_coldboot_harts_init(const void *fdt)
>                 goto default_config;
>
>         val = fdt_getprop(fdt, config_offset, "cold-boot-harts", &len);
> -       len = len / sizeof(u32);
> -       if (val && len) {
> -               for (int i = 0; i < len; i++) {
> -                       cpu_offset = fdt_node_offset_by_phandle(fdt,
> -                                                       fdt32_to_cpu(val[i]));
> -                       if (cpu_offset < 0)
> -                               goto default_config;
> +       if (!val || !len)
> +               goto default_config;
>
> -                       err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
> -                       if (err)
> -                               goto default_config;
> +       len = len / sizeof(u32);
> +       for (int i = 0; i < len; i++) {
> +               cpu_offset = fdt_node_offset_by_phandle(fdt,
> +                                               fdt32_to_cpu(val[i]));
> +               if (cpu_offset < 0)
> +                       goto default_config;
>
> -                       if (!fdt_node_is_enabled(fdt, cpu_offset))
> -                               continue;
> +               err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
> +               if (err)
> +                       goto default_config;
>
> -                       for (int i = 0; i < platform.hart_count; i++) {
> -                               if (val32 == generic_hart_index2id[i])
> -                                       bitmap_set(generic_coldboot_harts, i, 1);
> -                       }
> +               if (!fdt_node_is_enabled(fdt, cpu_offset))
> +                       continue;
>
> +               for (int i = 0; i < platform.hart_count; i++) {
> +                       if (val32 == generic_hart_index2id[i])
> +                               bitmap_set(generic_coldboot_harts, i, 1);
>                 }
>         }
>
> --
> 2.34.1
>

