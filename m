From: Xiang W <wxjstz@126.com>
Date: Thu, 30 Sep 2021 09:57:51 +0800
Subject: [PATCH V3] Makefile: Add build time and compiler info string.
In-Reply-To: <20210929180533.275413-1-tekkamanninja@gmail.com>
References: <20210929180533.275413-1-tekkamanninja@gmail.com>
Message-ID: <b406439f3dcfb7592f700c81123395f2748e3799.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-09-30???? 02:05 +0800?tekkamanninja at gmail.com???
> From: Wei Fu <wefu@redhat.com>
> 
> When we are doing opensbi development, we want to know the build time
> and compiler info for debug purpose.
> To enable this message, please add "BUILD_INFO=y" , like:
> 
> ```
> make BUILD_INFO=y
> ```
> 
> NOTE: `BUILD_INFO=y` will violate "reproducible builds".
> So it's ONLY for development and debug purpose, and should NOT be
> used
> in a product which follows "reproducible builds".
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>
> ---
> ?Makefile?????????? | 22 ++++++++++++++++++++++
> ?README.md????????? | 23 +++++++++++++++++++++++
> ?lib/sbi/sbi_init.c |? 8 ++++++++
> ?3 files changed, 53 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 16d9dca..a794c8d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -150,6 +150,15 @@ endif
> ?# Check whether the linker supports creating PIEs
> ?OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG)
> $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null
> >/dev/null 2>&1 && echo y || echo n)
> ?
> +# Build Info:
> +# OPENSBI_BUILD_TIME_STAMP -- the compilation time stamp
> +# OPENSBI_BUILD_COMPILER_VERSION -- the compiler version info
> +BUILD_INFO ?= n
> +ifeq ($(BUILD_INFO),y)
> +OPENSBI_BUILD_TIME_STAMP=$(shell date)
> +OPENSBI_BUILD_COMPILER_VERSION=$(shell $(CC) -v 2>&1 | grep '
> version ' | sed 's/[[:space:]]*$$//')
> +endif
> +
> ?# Setup list of objects.mk files
> ?ifdef PLATFORM
> ?platform-object-mks=$(shell if [ -d $(platform_src_dir)/ ]; then
> find $(platform_src_dir) -iname "objects.mk" | sort -r; fi)
> @@ -247,6 +256,10 @@ GENFLAGS???+=??????-I$(include_dir)
> ?ifneq ($(OPENSBI_VERSION_GIT),)
> ?GENFLAGS???????+=??????-
> DOPENSBI_VERSION_GIT="\"$(OPENSBI_VERSION_GIT)\""
> ?endif
> +ifeq ($(BUILD_INFO),y)
> +GENFLAGS???????+=??????-
> DOPENSBI_BUILD_TIME_STAMP="\"$(OPENSBI_BUILD_TIME_STAMP)\""
> +GENFLAGS???????+=??????-
> DOPENSBI_BUILD_COMPILER_VERSION="\"$(OPENSBI_BUILD_COMPILER_VERSION)\
> ""
> +endif
> ?GENFLAGS???????+=??????$(libsbiutils-genflags-y)
> ?GENFLAGS???????+=??????$(platform-genflags-y)
> ?GENFLAGS???????+=??????$(firmware-genflags-y)
> @@ -398,6 +411,12 @@ $(build_dir)/%.dep: $(src_dir)/%.c
> ?$(build_dir)/%.o: $(src_dir)/%.c
> ????????$(call compile_cc,$@,$<)
> ?
> +ifeq ($(BUILD_INFO),y)
> +$(build_dir)/lib/sbi/sbi_init.o: $(libsbi_dir)/sbi_init.c FORCE
> +???????$(call compile_cc,$@,$<)
> +???????$(warning 'BUILD_INFO=y' violates 'reproducible builds', for
> DEBUG ONLY.)
> +endif
> +
> ?$(build_dir)/%.dep: $(src_dir)/%.S
> ????????$(call compile_as_dep,$@,$<)
> ?
> @@ -551,3 +570,6 @@ ifeq
> ($(install_root_dir),$(install_root_dir_default)/usr)
> ????????$(if $(V), @echo " RM??????? $(install_root_dir_default)")
> ????????$(CMD_PREFIX)rm -rf $(install_root_dir_default)
> ?endif
> +
> +.PHONY: FORCE
> +FORCE:
> diff --git a/README.md b/README.md
> index 9fdf097..022ef84 100644
> --- a/README.md
> +++ b/README.md
> @@ -254,6 +254,28 @@ to produce broken binaries with missing
> relocations; it is therefore currently
> ?recommended that this combination be avoided or *FW_PIC=n* be used
> to disable
> ?building OpenSBI as a position-independent binary.
> ?
> +Building with timestamp and compiler info
> +------------------------
> +
> +When doing development, we may want to know the build time and
> compiler info
> +for debug purpose. OpenSBI can also be built with timestamp and
> compiler info.
> +To build with those info and print it out at boot time, we can just
> simply add
> +`BUILD_INFO=y`, like:
> +```
> +make BUILD_INFO=y
> +```
> +
> +But if you have used `BUILD_INFO=y`, and want to switch back to
> `BUILD_INFO=n`,
> +you must do
> +```
> +make clean
> +```
> +before the next build.
> +
> +NOTE: Using `BUILD_INFO=y` will violate [reproducible builds]. This
> definition
> +is ONLY for development and debug purpose, and should NOT be used in
> a product
> +which follows "reproducible builds".
> +
> ?Contributing to OpenSBI
> ?-----------------------
> ?
> @@ -336,3 +358,4 @@ make I=<install_directory> install_docs
> ?[Doxygen manual]: http://www.doxygen.nl/manual/index.html
> ?[Kendryte standalone SDK]: 
> https://github.com/kendryte/kendryte-standalone-sdk
> ?[third party notices]: ThirdPartyNotices.md
> +[reproducible builds]: https://reproducible-builds.org
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index f0eb365..ef00d9f 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -48,6 +48,14 @@ static void sbi_boot_print_banner(struct
> sbi_scratch *scratch)
> ?????????????????? OPENSBI_VERSION_MINOR);
> ?#endif
> ?
> +#ifdef OPENSBI_BUILD_TIME_STAMP
> +???????sbi_printf("Build time: %s.\n", OPENSBI_BUILD_TIME_STAMP);
> +#endif
It is recommended to add a print commit id

Regards,
Xiang W
> +
> +#ifdef OPENSBI_BUILD_COMPILER_VERSION
> +???????sbi_printf("Build compiler: %s.\n",
> OPENSBI_BUILD_COMPILER_VERSION);
> +#endif
> +
> ????????sbi_printf(BANNER);
> ?}
> ?
> -- 
> 2.25.4
> 
> 



