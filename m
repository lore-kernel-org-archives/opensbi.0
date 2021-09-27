From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Sep 2021 11:28:14 +0800
Subject: [PATCH] Makefile: Add build time and compiler info string.
In-Reply-To: <20210923155520.1208341-1-wefu@redhat.com>
References: <20210923155520.1208341-1-wefu@redhat.com>
Message-ID: <CAEUhbmUrpyy9WaxWQ2-W0o2hapew+32a4oT0CyZuPRQ4ixjD2Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 23, 2021 at 11:59 PM <wefu@redhat.com> wrote:
>
> From: Wei Fu <wefu@redhat.com>
>

nits: please remove the ending period in the commit title

> When we are doing opensbi development, we want to know the build time
> and compiler info for debug purpose.
> To enable this message, please add "BUILD_INFO=y" , like:
>
> ```
> make BUILD_INFO=y
> ```
>
> NOTE: `BUILD_INFO=y` will violate "reproducible builds".
> So it's ONLY for development and debug purpose, and should NEVER be used
> in a real product.
>
> Signed-off-by: Wei Fu <wefu@redhat.com>
> ---
>  Makefile           | 21 ++++++++++++++++++++-
>  README.md          | 16 ++++++++++++++++
>  lib/sbi/sbi_init.c |  4 ++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 16d9dca..c678a1e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -6,7 +6,7 @@
>  # Authors:
>  #   Anup Patel <anup.patel@wdc.com>
>  #
> -
> +BUILD_INFO ?= n
>  # Select Make Options:
>  # o  Do not use make's built-in rules
>  # o  Do not print "Entering directory ...";
> @@ -150,6 +150,11 @@ endif
>  # Check whether the linker supports creating PIEs
>  OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
>
> +ifeq ($(BUILD_INFO),y)
> +OPENSBI_BUILD_TS=$(shell date)
> +OPENSBI_COMPILER_VERSION_TEXT=$(shell $(CC) -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$$//')
> +endif
> +
>  # Setup list of objects.mk files
>  ifdef PLATFORM
>  platform-object-mks=$(shell if [ -d $(platform_src_dir)/ ]; then find $(platform_src_dir) -iname "objects.mk" | sort -r; fi)
> @@ -247,6 +252,11 @@ GENFLAGS   +=      -I$(include_dir)
>  ifneq ($(OPENSBI_VERSION_GIT),)
>  GENFLAGS       +=      -DOPENSBI_VERSION_GIT="\"$(OPENSBI_VERSION_GIT)\""
>  endif
> +ifeq ($(BUILD_INFO),y)
> +GENFLAGS       +=      -DBUILD_INFO
> +GENFLAGS       +=      -DOPENSBI_BUILD_TS="\"$(OPENSBI_BUILD_TS)\""
> +GENFLAGS       +=      -DOPENSBI_COMPILER_VERSION_TEXT="\"$(OPENSBI_COMPILER_VERSION_TEXT)\""
> +endif
>  GENFLAGS       +=      $(libsbiutils-genflags-y)
>  GENFLAGS       +=      $(platform-genflags-y)
>  GENFLAGS       +=      $(firmware-genflags-y)
> @@ -398,6 +408,12 @@ $(build_dir)/%.dep: $(src_dir)/%.c
>  $(build_dir)/%.o: $(src_dir)/%.c
>         $(call compile_cc,$@,$<)
>
> +ifeq ($(BUILD_INFO),y)
> +$(build_dir)/lib/sbi/sbi_init.o: $(libsbi_dir)/sbi_init.c FORCE
> +       $(call compile_cc,$@,$<)
> +       $(warning 'BUILD_INFO=y' violates 'reproducible builds', for DEBUG ONLY.)
> +endif
> +
>  $(build_dir)/%.dep: $(src_dir)/%.S
>         $(call compile_as_dep,$@,$<)
>
> @@ -551,3 +567,6 @@ ifeq ($(install_root_dir),$(install_root_dir_default)/usr)
>         $(if $(V), @echo " RM        $(install_root_dir_default)")
>         $(CMD_PREFIX)rm -rf $(install_root_dir_default)
>  endif
> +
> +.PHONY: FORCE
> +FORCE:
> diff --git a/README.md b/README.md
> index 9fdf097..68a4902 100644
> --- a/README.md
> +++ b/README.md
> @@ -254,6 +254,21 @@ to produce broken binaries with missing relocations; it is therefore currently
>  recommended that this combination be avoided or *FW_PIC=n* be used to disable
>  building OpenSBI as a position-independent binary.
>
> +Building with timestamp and compiler info
> +------------------------

The length of --- has to match the one of the section title

> +
> +When doing development, we may want to know the build time and compiler info
> +for debug purpose. OpenSBI can also be built with timestamp and compiler info.
> +To build with those info and print it out at boot time, we can just simply add
> +`BUILD_INFO=y`, like:
> +```
> +make BUILD_INFO=y
> +```
> +
> +NOTE: Using `BUILD_INFO=y` will violate [reproducible builds]. This definition
> +is ONLY for development and debug purpose. It should NEVER be used in a real
> +product.
> +
>  Contributing to OpenSBI
>  -----------------------
>
> @@ -336,3 +351,4 @@ make I=<install_directory> install_docs
>  [Doxygen manual]: http://www.doxygen.nl/manual/index.html
>  [Kendryte standalone SDK]: https://github.com/kendryte/kendryte-standalone-sdk
>  [third party notices]: ThirdPartyNotices.md
> +[reproducible builds]: https://reproducible-builds.org
> \ No newline at end of file

Please avoid "No newline at end of file"

> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 6ef8742..7311c13 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -48,6 +48,10 @@ static void sbi_boot_print_banner(struct sbi_scratch *scratch)
>                    OPENSBI_VERSION_MINOR);
>  #endif
>
> +#ifdef BUILD_INFO
> +       sbi_printf("Build time: %s.\n", OPENSBI_BUILD_TS);

please drop the ending period

> +       sbi_printf("Compiler: %s.\n", OPENSBI_COMPILER_VERSION_TEXT);

ditto

> +#endif
>         sbi_printf(BANNER);
>  }
>

Regards,
Bin

