From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Jul 2022 20:14:21 +0530
Subject: [PATCH 01/14] Makefile: Add initial kconfig support for each platform
In-Reply-To: <86B07F7B-2C14-4AFE-AC3D-934DE6F22F5B@jrtc27.com>
References: <20220718124210.2177576-1-apatel@ventanamicro.com>
 <20220718124210.2177576-2-apatel@ventanamicro.com> <86B07F7B-2C14-4AFE-AC3D-934DE6F22F5B@jrtc27.com>
Message-ID: <CAK9=C2U3DkDKbKR0mSerBCv1gUsHUSQqYdjhe3H3qCofzTrccA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 18, 2022 at 7:21 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 18 Jul 2022, at 13:41, Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We extend the top-level makefile to allow kconfig based configuration
> > for each platform where each platform has it's own set of configs with
> > "defconfig" being the default config.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> > Kconfig                                   | 23 ++++++++++
> > Makefile                                  | 54 +++++++++++++++++++++--
> > firmware/Kconfig                          |  1 +
> > lib/utils/Kconfig                         |  1 +
> > platform/andes/ae350/Kconfig              |  5 +++
> > platform/andes/ae350/configs/defconfig    |  0
> > platform/fpga/ariane/Kconfig              |  5 +++
> > platform/fpga/ariane/configs/defconfig    |  0
> > platform/fpga/openpiton/Kconfig           |  5 +++
> > platform/fpga/openpiton/configs/defconfig |  0
> > platform/generic/Kconfig                  |  5 +++
> > platform/generic/configs/defconfig        |  0
> > platform/kendryte/k210/Kconfig            |  5 +++
> > platform/kendryte/k210/configs/defconfig  |  0
> > platform/nuclei/ux600/Kconfig             |  5 +++
> > platform/nuclei/ux600/configs/defconfig   |  0
> > platform/template/Kconfig                 |  5 +++
> > platform/template/configs/defconfig       |  0
> > 18 files changed, 111 insertions(+), 3 deletions(-)
> > create mode 100644 Kconfig
> > create mode 100644 firmware/Kconfig
> > create mode 100644 lib/utils/Kconfig
> > create mode 100644 platform/andes/ae350/Kconfig
> > create mode 100644 platform/andes/ae350/configs/defconfig
> > create mode 100644 platform/fpga/ariane/Kconfig
> > create mode 100644 platform/fpga/ariane/configs/defconfig
> > create mode 100644 platform/fpga/openpiton/Kconfig
> > create mode 100644 platform/fpga/openpiton/configs/defconfig
> > create mode 100644 platform/generic/Kconfig
> > create mode 100644 platform/generic/configs/defconfig
> > create mode 100644 platform/kendryte/k210/Kconfig
> > create mode 100644 platform/kendryte/k210/configs/defconfig
> > create mode 100644 platform/nuclei/ux600/Kconfig
> > create mode 100644 platform/nuclei/ux600/configs/defconfig
> > create mode 100644 platform/template/Kconfig
> > create mode 100644 platform/template/configs/defconfig
> >
> > diff --git a/Kconfig b/Kconfig
> > new file mode 100644
> > index 0000000..b8615d2
> > --- /dev/null
> > +++ b/Kconfig
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0
>
> GPL in OpenSBI? I suspect you blindly copied this boilerplate from
> Linux (and repeated it everywhere)?..

Aargh !!! This was totally unintentional.

Thanks for catching. I will quickly send a v2.

Regards,
Anup

>
> Jess
>
> > +mainmenu "OpenSBI $OPENSBI_PLATFORM Configuration"
> > +
> > +config OPENSBI_SRC_DIR
> > +     string
> > +     option env="OPENSBI_SRC_DIR"
> > +
> > +config OPENSBI_PLATFORM
> > +     string
> > +     option env="OPENSBI_PLATFORM"
> > +
> > +config OPENSBI_PLATFORM_SRC_DIR
> > +     string
> > +     option env="OPENSBI_PLATFORM_SRC_DIR"
> > +
> > +menu "Platform Options"
> > +source "$OPENSBI_PLATFORM_SRC_DIR/Kconfig"
> > +endmenu
> > +
> > +source "$OPENSBI_SRC_DIR/lib/utils/Kconfig"
> > +
> > +source "$OPENSBI_SRC_DIR/firmware/Kconfig"
> > diff --git a/Makefile b/Makefile
> > index f619ef7..46c7c1c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -52,6 +52,9 @@ ifdef PLATFORM_DIR
> > else
> >  platform_parent_dir=$(src_dir)/platform
> > endif
> > +ifndef PLATFORM_DEFCONFIG
> > +PLATFORM_DEFCONFIG=defconfig
> > +endif
> >
> > # Check if verbosity is ON for build process
> > CMD_PREFIX_DEFAULT := @
> > @@ -70,6 +73,19 @@ export libsbi_dir=$(CURDIR)/lib/sbi
> > export libsbiutils_dir=$(CURDIR)/lib/utils
> > export firmware_dir=$(CURDIR)/firmware
> >
> > +# Setup variables for kconfig-frontends
> > +ifdef PLATFORM
> > +export KCONFIG_CONFIG=$(platform_build_dir)/.config
> > +export KCONFIG_AUTOCONFIG=$(platform_build_dir)/auto.conf
> > +export KCONFIG_TRISTATE=$(platform_build_dir)/tristate.conf
> > +export KCONFIG_AUTOHEADER=$(platform_build_dir)/autoconf.h
> > +export KCONFIG_AUTOCONF_CMD=$(platform_build_dir)/include/config/auto.conf.cmd
> > +# Additional exports for include paths in Kconfig files
> > +export OPENSBI_SRC_DIR=$(src_dir)
> > +export OPENSBI_PLATFORM=$(PLATFORM)
> > +export OPENSBI_PLATFORM_SRC_DIR=$(platform_src_dir)
> > +endif
> > +
> > # Find library version
> > OPENSBI_VERSION_MAJOR=`grep "define OPENSBI_VERSION_MAJOR" $(include_dir)/sbi/sbi_version.h | sed 's/.*MAJOR.*\([0-9][0-9]*\)/\1/'`
> > OPENSBI_VERSION_MINOR=`grep "define OPENSBI_VERSION_MINOR" $(include_dir)/sbi/sbi_version.h | sed 's/.*MINOR.*\([0-9][0-9]*\)/\1/'`
> > @@ -183,8 +199,34 @@ libsbi-object-mks=$(shell if [ -d $(libsbi_dir) ]; then find $(libsbi_dir) -inam
> > libsbiutils-object-mks=$(shell if [ -d $(libsbiutils_dir) ]; then find $(libsbiutils_dir) -iname "objects.mk" | sort -r; fi)
> > firmware-object-mks=$(shell if [ -d $(firmware_dir) ]; then find $(firmware_dir) -iname "objects.mk" | sort -r; fi)
> >
> > -# Include platform specifig config.mk
> > +# The "make all" rule should always be first rule
> > +.PHONY: all
> > +all:
> > +
> > +# Include platform specific .config and config.mk
> > ifdef PLATFORM
> > +.PHONY: menuconfig
> > +menuconfig: $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
> > +     $(CMD_PREFIX)mkdir -p `dirname $(KCONFIG_CONFIG)`
> > +     $(CMD_PREFIX)mkdir -p `dirname $(KCONFIG_AUTOCONF_CMD)`
> > +     $(CMD_PREFIX)kconfig-mconf $(src_dir)/Kconfig
> > +     $(CMD_PREFIX)cd $(platform_build_dir) && kconfig-conf --silentoldconfig $(src_dir)/Kconfig
> > +
> > +.PHONY: savedefconfig
> > +savedefconfig: $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
> > +     $(CMD_PREFIX)mkdir -p `dirname $(KCONFIG_CONFIG)`
> > +     $(CMD_PREFIX)mkdir -p `dirname $(KCONFIG_AUTOCONF_CMD)`
> > +     $(CMD_PREFIX)kconfig-conf --savedefconfig `dirname $(KCONFIG_CONFIG)`/defconfig $(src_dir)/Kconfig
> > +
> > +$(KCONFIG_CONFIG): $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG) $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
> > +     $(CMD_PREFIX)mkdir -p `dirname $(KCONFIG_CONFIG)`
> > +     $(CMD_PREFIX)mkdir -p `dirname $(KCONFIG_AUTOCONF_CMD)`
> > +     $(CMD_PREFIX)cp -f $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG) $(KCONFIG_CONFIG)
> > +     $(CMD_PREFIX)cd $(platform_build_dir) && kconfig-conf --silentoldconfig --olddefconfig $(src_dir)/Kconfig
> > +$(KCONFIG_AUTOCONF_CMD): $(KCONFIG_CONFIG)
> > +include $(KCONFIG_CONFIG)
> > +include $(KCONFIG_AUTOCONF_CMD)
> > +
> > include $(platform_src_dir)/config.mk
> > endif
> >
> > @@ -280,6 +322,9 @@ ifeq ($(BUILD_INFO),y)
> > GENFLAGS      +=      -DOPENSBI_BUILD_TIME_STAMP="\"$(OPENSBI_BUILD_TIME_STAMP)\""
> > GENFLAGS      +=      -DOPENSBI_BUILD_COMPILER_VERSION="\"$(OPENSBI_BUILD_COMPILER_VERSION)\""
> > endif
> > +ifdef PLATFORM
> > +GENFLAGS     +=      -include $(KCONFIG_AUTOHEADER)
> > +endif
> > GENFLAGS      +=      $(libsbiutils-genflags-y)
> > GENFLAGS      +=      $(platform-genflags-y)
> > GENFLAGS      +=      $(firmware-genflags-y)
> > @@ -419,7 +464,7 @@ targets-y += $(platform_build_dir)/lib/libplatsbi.a
> > endif
> > targets-y += $(firmware-bins-path-y)
> >
> > -# Default rule "make" should always be first rule
> > +# The default "make all" rule
> > .PHONY: all
> > all: $(targets-y)
> >
> > @@ -456,7 +501,7 @@ $(build_dir)/%.o: $(src_dir)/%.S
> >       $(call compile_as,$@,$<)
> >
> > $(build_dir)/%.dep: $(src_dir)/%.carray
> > -     $(call compile_gen_dep,$@,.c,$<)
> > +     $(call compile_gen_dep,$@,.c,$< $(KCONFIG_CONFIG))
> >       $(call compile_gen_dep,$@,.o,$(@:.dep=.c))
> >
> > $(build_dir)/%.c: $(src_dir)/%.carray
> > @@ -523,6 +568,9 @@ docs: $(build_dir)/docs/latex/refman.pdf
> > # They should not be included for any "xxxconfig" or "xxxclean" rule
> > all-deps-1 = $(if $(findstring config,$(MAKECMDGOALS)),,$(deps-y))
> > all-deps-2 = $(if $(findstring clean,$(MAKECMDGOALS)),,$(all-deps-1))
> > +ifdef PLATFORM
> > +$(all-deps-2): | $(KCONFIG_CONFIG)
> > +endif
> > -include $(all-deps-2)
> >
> > # Include external dependency of firmwares after default Makefile rules
> > diff --git a/firmware/Kconfig b/firmware/Kconfig
> > new file mode 100644
> > index 0000000..f66554c
> > --- /dev/null
> > +++ b/firmware/Kconfig
> > @@ -0,0 +1 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
> > new file mode 100644
> > index 0000000..f66554c
> > --- /dev/null
> > +++ b/lib/utils/Kconfig
> > @@ -0,0 +1 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
> > new file mode 100644
> > index 0000000..349c1d3
> > --- /dev/null
> > +++ b/platform/andes/ae350/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config PLATFORM_ANDES_AE350
> > +     bool
> > +     default y
> > diff --git a/platform/andes/ae350/configs/defconfig b/platform/andes/ae350/configs/defconfig
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/platform/fpga/ariane/Kconfig b/platform/fpga/ariane/Kconfig
> > new file mode 100644
> > index 0000000..26f9beb
> > --- /dev/null
> > +++ b/platform/fpga/ariane/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config PLATFORM_ARIANE_FPGA
> > +     bool
> > +     default y
> > diff --git a/platform/fpga/ariane/configs/defconfig b/platform/fpga/ariane/configs/defconfig
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/platform/fpga/openpiton/Kconfig b/platform/fpga/openpiton/Kconfig
> > new file mode 100644
> > index 0000000..8bfa85a
> > --- /dev/null
> > +++ b/platform/fpga/openpiton/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config PLATFORM_OPENPITON_FPGA
> > +     bool
> > +     default y
> > diff --git a/platform/fpga/openpiton/configs/defconfig b/platform/fpga/openpiton/configs/defconfig
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> > new file mode 100644
> > index 0000000..a811a05
> > --- /dev/null
> > +++ b/platform/generic/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config PLATFORM_GENERIC
> > +     bool
> > +     default y
> > diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/platform/kendryte/k210/Kconfig b/platform/kendryte/k210/Kconfig
> > new file mode 100644
> > index 0000000..726423a
> > --- /dev/null
> > +++ b/platform/kendryte/k210/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config PLATFORM_KENDRYTE_K210
> > +     bool
> > +     default y
> > diff --git a/platform/kendryte/k210/configs/defconfig b/platform/kendryte/k210/configs/defconfig
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/platform/nuclei/ux600/Kconfig b/platform/nuclei/ux600/Kconfig
> > new file mode 100644
> > index 0000000..bb8410f
> > --- /dev/null
> > +++ b/platform/nuclei/ux600/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config PLATFORM_NUCLEI_UX600
> > +     bool
> > +     default y
> > diff --git a/platform/nuclei/ux600/configs/defconfig b/platform/nuclei/ux600/configs/defconfig
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/platform/template/Kconfig b/platform/template/Kconfig
> > new file mode 100644
> > index 0000000..bd95ea0
> > --- /dev/null
> > +++ b/platform/template/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config PLATFORM_TEMPLATE
> > +     bool
> > +     default y
> > diff --git a/platform/template/configs/defconfig b/platform/template/configs/defconfig
> > new file mode 100644
> > index 0000000..e69de29
> > --
> > 2.34.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>

