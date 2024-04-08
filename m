From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Apr 2024 10:14:32 +0530
Subject: [PATCH 2/2] Makefile: Remove unnecessary dependencies
In-Reply-To: <20240318205002.366134-2-samuel.holland@sifive.com>
References: <20240318205002.366134-1-samuel.holland@sifive.com> <20240318205002.366134-2-samuel.holland@sifive.com>
Message-ID: <CAAhSdy0JjHvErGbt6fmsutiLqPAH_bcRF56+xsrkzhKf-5sdmw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 19, 2024 at 2:20?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> The rule included from auto.conf.cmd adds a dependency on every Kconfig
> file, so these two Kconfig files do not need to be specified again here.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index c3d45460..c033932f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -223,7 +223,7 @@ savedefconfig: $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
>         $(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
>         $(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/savedefconfig.py --kconfig $(src_dir)/Kconfig --out $(KCONFIG_DIR)/defconfig
>
> -$(KCONFIG_CONFIG): $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG) $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
> +$(KCONFIG_CONFIG): $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG)
>         $(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
>         $(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/defconfig.py --kconfig $(src_dir)/Kconfig $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG)
>
> --
> 2.43.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

