From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Feb 2023 16:56:16 +0530
Subject: [PATCH] Makefile: Add missing .dep files for fw_*.elf.ld
In-Reply-To: <20230201164916.19908-1-jrtc27@jrtc27.com>
References: <20230201164916.19908-1-jrtc27@jrtc27.com>
Message-ID: <CAAhSdy199zb=8wAhQGigF6xNbpmezv7jaY5CGf8mHV7Okso9Ng@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 1, 2023 at 10:19 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> Since we don't currently create these, changes to fw_base.ldS do not
> cause the preprocessed fw_*.elf.ld files to be rebuilt, and thus
> incremental builds can end up failing with missing symbols if crossing
> the recent commits that introduced _fw_rw_offset and then replaced it
> with _fw_rw_start.
>
> Reported-by: Ben Dooks <ben.dooks@sifive.com>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  Makefile | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index b742d6d..b20404f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -254,6 +254,7 @@ deps-y=$(platform-objs-path-y:.o=.dep)
>  deps-y+=$(libsbi-objs-path-y:.o=.dep)
>  deps-y+=$(libsbiutils-objs-path-y:.o=.dep)
>  deps-y+=$(firmware-objs-path-y:.o=.dep)
> +deps-y+=$(firmware-elfs-path-y:=.dep)
>
>  # Setup platform ABI, ISA and Code Model
>  ifndef PLATFORM_RISCV_ABI
> @@ -413,6 +414,11 @@ inst_file_list = $(CMD_PREFIX)if [ ! -z "$(4)" ]; then \
>  inst_header_dir =  $(CMD_PREFIX)mkdir -p $(1); \
>              echo " INSTALL   $(subst $(install_root_dir)/,,$(1))"; \
>              cp -rf $(2) $(1)
> +compile_cpp_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
> +            echo " CPP-DEP   $(subst $(build_dir)/,,$(1))"; \
> +            printf %s `dirname $(1)`/  > $(1) && \
> +            $(CC) $(CPPFLAGS) -x c -MM $(3) \
> +              -MT `basename $(1:.dep=$(2))` >> $(1) || rm -f $(1)
>  compile_cpp = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>              echo " CPP       $(subst $(build_dir)/,,$(1))"; \
>              $(CPP) $(CPPFLAGS) -x c $(2) | grep -v "\#" > $(1)
> @@ -543,6 +549,9 @@ $(platform_build_dir)/%.bin: $(platform_build_dir)/%.elf
>  $(platform_build_dir)/%.elf: $(platform_build_dir)/%.o $(platform_build_dir)/%.elf.ld $(platform_build_dir)/lib/libplatsbi.a
>         $(call compile_elf,$@,$@.ld,$< $(platform_build_dir)/lib/libplatsbi.a)
>
> +$(platform_build_dir)/%.dep: $(src_dir)/%.ldS $(KCONFIG_CONFIG)
> +       $(call compile_cpp_dep,$@,.ld,$<)
> +
>  $(platform_build_dir)/%.ld: $(src_dir)/%.ldS
>         $(call compile_cpp,$@,$<)
>
> --
> 2.37.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

