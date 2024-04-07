From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Apr 2024 20:22:49 +0530
Subject: [PATCH 1/2] Makefile: Respect manual changes to .config
In-Reply-To: <20240318205002.366134-1-samuel.holland@sifive.com>
References: <20240318205002.366134-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy2wTk52AOhauZj8+t6J4Jfm0EnsY6-nATX6Sderkkkr=A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 19, 2024 at 2:20?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> The .config file may be manually edited or copied from another location.
> Since genconfig.py is responsible for generating auto.conf (the Makefile
> fragment) and autoconf.h (the C header) from .config, it must be run any
> time .config changes, not just when running menuconfig.
>
> Fixes: 662e631ccef2 ("Makefile: Add initial kconfig support for each platform")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  Makefile | 43 ++++++++++++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 680c19a4..c3d45460 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -79,6 +79,7 @@ export PYTHONDONTWRITEBYTECODE=1
>  export KCONFIG_DIR=$(platform_build_dir)/kconfig
>  export KCONFIG_AUTOLIST=$(KCONFIG_DIR)/auto.list
>  export KCONFIG_AUTOHEADER=$(KCONFIG_DIR)/autoconf.h
> +export KCONFIG_AUTOCONFIG=$(KCONFIG_DIR)/auto.conf
>  export KCONFIG_AUTOCMD=$(KCONFIG_DIR)/auto.conf.cmd
>  export KCONFIG_CONFIG=$(KCONFIG_DIR)/.config
>  # Additional exports for include paths in Kconfig files
> @@ -216,7 +217,6 @@ ifdef PLATFORM
>  menuconfig: $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
>         $(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
>         $(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/menuconfig.py $(src_dir)/Kconfig
> -       $(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/genconfig.py --header-path $(KCONFIG_AUTOHEADER) --sync-deps $(KCONFIG_DIR) --file-list $(KCONFIG_AUTOLIST) $(src_dir)/Kconfig
>
>  .PHONY: savedefconfig
>  savedefconfig: $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
> @@ -226,14 +226,19 @@ savedefconfig: $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
>  $(KCONFIG_CONFIG): $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG) $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
>         $(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
>         $(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/defconfig.py --kconfig $(src_dir)/Kconfig $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG)
> +
> +$(KCONFIG_AUTOCONFIG): $(KCONFIG_CONFIG)
>         $(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/genconfig.py --header-path $(KCONFIG_AUTOHEADER) --sync-deps $(KCONFIG_DIR) --file-list $(KCONFIG_AUTOLIST) $(src_dir)/Kconfig
>
> -$(KCONFIG_AUTOCMD): $(KCONFIG_CONFIG)
> -       $(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
> +$(KCONFIG_AUTOHEADER): $(KCONFIG_AUTOCONFIG);
> +
> +$(KCONFIG_AUTOLIST): $(KCONFIG_AUTOCONFIG);
> +
> +$(KCONFIG_AUTOCMD): $(KCONFIG_AUTOLIST)
>         $(CMD_PREFIX)printf "%s: " $(KCONFIG_CONFIG) > $(KCONFIG_AUTOCMD)
>         $(CMD_PREFIX)cat $(KCONFIG_AUTOLIST) | tr '\n' ' ' >> $(KCONFIG_AUTOCMD)
>
> -include $(KCONFIG_CONFIG)
> +include $(KCONFIG_AUTOCONFIG)
>  include $(KCONFIG_AUTOCMD)
>  endif
>
> @@ -504,14 +509,14 @@ $(build_dir)/lib/libsbi.a: $(libsbi-objs-path-y)
>  $(platform_build_dir)/lib/libplatsbi.a: $(libsbi-objs-path-y) $(libsbiutils-objs-path-y) $(platform-objs-path-y)
>         $(call compile_ar,$@,$^)
>
> -$(build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_CONFIG)
> -       $(call compile_gen_dep,$@,.c,$< $(KCONFIG_CONFIG))
> +$(build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_AUTOHEADER)
> +       $(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
>         $(call compile_gen_dep,$@,.o,$(@:.dep=.c))
>
>  $(build_dir)/%.c: $(src_dir)/%.carray
>         $(call compile_carray,$@,$<)
>
> -$(build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_CONFIG)
> +$(build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_AUTOHEADER)
>         $(call compile_cc_dep,$@,$<)
>
>  $(build_dir)/%.o: $(src_dir)/%.c
> @@ -525,24 +530,24 @@ $(build_dir)/lib/sbi/sbi_init.o: $(libsbi_dir)/sbi_init.c FORCE
>         $(call compile_cc,$@,$<)
>  endif
>
> -$(build_dir)/%.dep: $(src_dir)/%.S $(KCONFIG_CONFIG)
> +$(build_dir)/%.dep: $(src_dir)/%.S $(KCONFIG_AUTOHEADER)
>         $(call compile_as_dep,$@,$<)
>
>  $(build_dir)/%.o: $(src_dir)/%.S
>         $(call compile_as,$@,$<)
>
>  # Rules for platform sources
> -$(platform_build_dir)/%.dep: $(platform_src_dir)/%.carray $(KCONFIG_CONFIG)
> -       $(call compile_gen_dep,$@,.c,$< $(KCONFIG_CONFIG))
> +$(platform_build_dir)/%.dep: $(platform_src_dir)/%.carray $(KCONFIG_AUTOHEADER)
> +       $(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
>         $(call compile_gen_dep,$@,.o,$(@:.dep=.c))
>
>  $(platform_build_dir)/%.c: $(platform_src_dir)/%.carray
>         $(call compile_carray,$@,$<)
>
> -$(platform_build_dir)/%.dep: $(platform_src_dir)/%.c $(KCONFIG_CONFIG)
> +$(platform_build_dir)/%.dep: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
>         $(call compile_cc_dep,$@,$<)
>
> -$(platform_build_dir)/%.o: $(platform_src_dir)/%.c $(KCONFIG_CONFIG)
> +$(platform_build_dir)/%.o: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
>         $(call compile_cc,$@,$<)
>
>  $(platform_build_dir)/%.dep: $(platform_src_dir)/%.S
> @@ -551,8 +556,8 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.S
>  $(platform_build_dir)/%.o: $(platform_src_dir)/%.S
>         $(call compile_as,$@,$<)
>
> -$(platform_build_dir)/%.dep: $(platform_src_dir)/%.dts $(KCONFIG_CONFIG)
> -       $(call compile_gen_dep,$@,.dtb,$< $(KCONFIG_CONFIG))
> +$(platform_build_dir)/%.dep: $(platform_src_dir)/%.dts $(KCONFIG_AUTOHEADER)
> +       $(call compile_gen_dep,$@,.dtb,$< $(KCONFIG_AUTOHEADER))
>         $(call compile_gen_dep,$@,.c,$(@:.dep=.dtb))
>         $(call compile_gen_dep,$@,.o,$(@:.dep=.c))
>
> @@ -569,26 +574,26 @@ $(platform_build_dir)/%.bin: $(platform_build_dir)/%.elf
>  $(platform_build_dir)/%.elf: $(platform_build_dir)/%.o $(platform_build_dir)/%.elf.ld $(platform_build_dir)/lib/libplatsbi.a
>         $(call compile_elf,$@,$@.ld,$< $(platform_build_dir)/lib/libplatsbi.a)
>
> -$(platform_build_dir)/%.dep: $(src_dir)/%.ldS $(KCONFIG_CONFIG)
> +$(platform_build_dir)/%.dep: $(src_dir)/%.ldS $(KCONFIG_AUTOHEADER)
>         $(call compile_cpp_dep,$@,.ld,$<)
>
>  $(platform_build_dir)/%.ld: $(src_dir)/%.ldS
>         $(call compile_cpp,$@,$<)
>
> -$(platform_build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_CONFIG)
> -       $(call compile_gen_dep,$@,.c,$< $(KCONFIG_CONFIG))
> +$(platform_build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_AUTOHEADER)
> +       $(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
>         $(call compile_gen_dep,$@,.o,$(@:.dep=.c))
>
>  $(platform_build_dir)/%.c: $(src_dir)/%.carray
>         $(call compile_carray,$@,$<)
>
> -$(platform_build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_CONFIG)
> +$(platform_build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_AUTOHEADER)
>         $(call compile_cc_dep,$@,$<)
>
>  $(platform_build_dir)/%.o: $(src_dir)/%.c
>         $(call compile_cc,$@,$<)
>
> -$(platform_build_dir)/%.dep: $(src_dir)/%.S $(KCONFIG_CONFIG)
> +$(platform_build_dir)/%.dep: $(src_dir)/%.S $(KCONFIG_AUTOHEADER)
>         $(call compile_as_dep,$@,$<)
>
>  $(platform_build_dir)/%.o: $(src_dir)/%.S
> --
> 2.43.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

