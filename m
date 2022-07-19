From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 19 Jul 2022 11:00:48 +0200
Subject: [PATCH v2 00/14] OpenSBI Kconfig Support
In-Reply-To: <CAK9=C2VfU1ekpr5CqJd4n2-1NCVBcKrM7d3W6iGbMTX=kggPHA@mail.gmail.com>
References: <20220718145611.2211638-1-apatel@ventanamicro.com>
 <20220718184807.dac3r5bvsublyj2n@kamzik>
 <CAK9=C2VfU1ekpr5CqJd4n2-1NCVBcKrM7d3W6iGbMTX=kggPHA@mail.gmail.com>
Message-ID: <20220719090048.unokmxb3iyko57nl@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 19, 2022 at 09:25:35AM +0530, Anup Patel wrote:
> +Heinrich
> On Tue, Jul 19, 2022 at 12:18 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Mon, Jul 18, 2022 at 08:25:57PM +0530, Anup Patel wrote:
> > > In future, we will see more drivers in OpenSBI for system reset, serial port,
> > > power management, etc platform specific devices. We need platform specific
> > > compile time configuration to allow users control the size of OpenSBI generic
> > > firmware binaries by only enabling desired drivers. In other words, users
> > > should be allowed to restrict the set of RISC-V platforms on which OpenSBI
> > > generic firmwares built by them can run.
> > >
> > > To address above, we add Kconfig support for OpenSBI platforms using the
> > > kconfig-frontends project which is a standalone kconfig parser.
> > >
> > > The kconfig-frontends is available as a package/receipe on various distros
> > > (such as Debian, UBuntu, OpenSUSE, etc) and Yocto project.
> >
> > Hi Anup,
> >
> > It doesn't look like Fedora provides that package. Also, is the source
> > for the packages of those other distros maintained? If I found the
> > correct source, then it's [1], which hasn't had any attention in five
> > years, even though there have been hundreds of commits to Linux's
> > scripts/kconfig. I wonder if we shouldn't consider adopting
> > scripts/minikconf.py from the QEMU sources and sticking to the kconfig
> > language subset that parser supports?
> >
> > [1] http://ymorin.is-a-geek.org/projects/kconfig-frontends
> 
> Actually, it seems quite a few distros (particularly debian, ubuntu,
> and yocto) have already included the kconfig-frontends package so
> I wonder why Fedora did not include a package for it ?

As others on this thread pointed out, it's probably due to lack of
interest in maintaining it.

> 
> The QEMU scripts/minikconf.py is pretty compact and would be
> our next best alternative but it doesn't have menuconfig support.

IMHO, we should try to avoid requiring external dependencies. Something
like menuconfig will require something external, so we should also have
a text-only alternative built in.

Thanks,
drew

> 
> Regards,
> Anup
> 
> >
> > Thanks,
> > drew
> >
> > >
> > > To try OpenSBI Kconfig support with generic platform, here are few
> > > example commands:
> > > make PLATFORM=generic             <-- builds OpenSBI using "defconfig"
> > > make PLATFORM=generic menuconfig  <-- launches graphical interface for changes
> > >
> > > These patches can also be found in the kconfig_v2 branch at:
> > > https://github.com/avpatel/opensbi.git
> > >
> > > Changes since v1:
> > >  - Fix SPDX license specifier in new Kconfig files
> > >
> > > Anup Patel (14):
> > >   Makefile: Add initial kconfig support for each platform
> > >   Makefile: Compile lib/utils sources separately for each platform
> > >   lib: utils/serial: Use kconfig for enabling/disabling drivers
> > >   lib: utils/reset: Use kconfig for enabling/disabling drivers
> > >   lib: utils/sys: Use kconfig for enabling/disabling drivers
> > >   lib: utils/timer: Use kconfig for enabling/disabling drivers
> > >   lib: utils/ipi: Use kconfig for enabling/disabling drivers
> > >   lib: utils/irqchip: Use kconfig for enabling/disabling drivers
> > >   lib: utils/i2c: Use kconfig for enabling/disabling drivers
> > >   lib: utils/gpio: Use kconfig for enabling/disabling drivers
> > >   lib: utils/fdt: Use kconfig for enabling/disabling
> > >   platform: generic: Use kconfig for enabling/disabling overrides
> > >   platform: Remove redundant config.mk from all platforms
> > >   docs: Update documentation for kconfig support
> > >
> > >  Kconfig                                   |  23 +++++
> > >  Makefile                                  | 102 ++++++++++++++++------
> > >  README.md                                 |  25 +++++-
> > >  docs/firmware/fw_dynamic.md               |   2 +-
> > >  docs/firmware/fw_jump.md                  |   4 +-
> > >  docs/firmware/fw_payload.md               |   4 +-
> > >  docs/library_usage.md                     |   6 +-
> > >  docs/platform/platform.md                 |   4 +-
> > >  docs/platform_guide.md                    |   9 +-
> > >  firmware/Kconfig                          |   1 +
> > >  include/sbi_utils/fdt/fdt_domain.h        |   9 ++
> > >  include/sbi_utils/fdt/fdt_pmu.h           |  10 +++
> > >  include/sbi_utils/ipi/fdt_ipi.h           |   9 ++
> > >  include/sbi_utils/irqchip/fdt_irqchip.h   |  10 +++
> > >  include/sbi_utils/irqchip/imsic.h         |  10 +++
> > >  include/sbi_utils/reset/fdt_reset.h       |  12 +++
> > >  include/sbi_utils/serial/fdt_serial.h     |   8 ++
> > >  include/sbi_utils/timer/fdt_timer.h       |   9 ++
> > >  lib/utils/Kconfig                         |  25 ++++++
> > >  lib/utils/fdt/Kconfig                     |  18 ++++
> > >  lib/utils/fdt/objects.mk                  |   8 +-
> > >  lib/utils/gpio/Kconfig                    |  23 +++++
> > >  lib/utils/gpio/objects.mk                 |  10 +--
> > >  lib/utils/i2c/Kconfig                     |  23 +++++
> > >  lib/utils/i2c/objects.mk                  |  10 +--
> > >  lib/utils/ipi/Kconfig                     |  23 +++++
> > >  lib/utils/ipi/objects.mk                  |  10 +--
> > >  lib/utils/irqchip/Kconfig                 |  41 +++++++++
> > >  lib/utils/irqchip/objects.mk              |  22 ++---
> > >  lib/utils/libfdt/Kconfig                  |   5 ++
> > >  lib/utils/libfdt/objects.mk               |   4 +-
> > >  lib/utils/reset/Kconfig                   |  37 ++++++++
> > >  lib/utils/reset/objects.mk                |  28 +++---
> > >  lib/utils/serial/Kconfig                  |  73 ++++++++++++++++
> > >  lib/utils/serial/objects.mk               |  44 +++++-----
> > >  lib/utils/sys/Kconfig                     |  13 +++
> > >  lib/utils/sys/objects.mk                  |   4 +-
> > >  lib/utils/timer/Kconfig                   |  23 +++++
> > >  lib/utils/timer/objects.mk                |  10 +--
> > >  platform/andes/ae350/Kconfig              |   8 ++
> > >  platform/andes/ae350/config.mk            |  36 --------
> > >  platform/andes/ae350/configs/defconfig    |   0
> > >  platform/andes/ae350/objects.mk           |  29 ++++++
> > >  platform/fpga/ariane/Kconfig              |  10 +++
> > >  platform/fpga/ariane/config.mk            |  36 --------
> > >  platform/fpga/ariane/configs/defconfig    |   0
> > >  platform/fpga/ariane/objects.mk           |  35 ++++++++
> > >  platform/fpga/openpiton/Kconfig           |  10 +++
> > >  platform/fpga/openpiton/config.mk         |  35 --------
> > >  platform/fpga/openpiton/configs/defconfig |   0
> > >  platform/fpga/openpiton/objects.mk        |  35 ++++++++
> > >  platform/generic/Kconfig                  |  26 ++++++
> > >  platform/generic/allwinner/objects.mk     |   4 +-
> > >  platform/generic/config.mk                |  40 ---------
> > >  platform/generic/configs/defconfig        |  29 ++++++
> > >  platform/generic/objects.mk               |  33 +++++++
> > >  platform/generic/sifive/objects.mk        |   8 +-
> > >  platform/kendryte/k210/Kconfig            |  10 +++
> > >  platform/kendryte/k210/config.mk          |  19 ----
> > >  platform/kendryte/k210/configs/defconfig  |   0
> > >  platform/kendryte/k210/objects.mk         |  12 +++
> > >  platform/nuclei/ux600/Kconfig             |  10 +++
> > >  platform/nuclei/ux600/config.mk           |  30 -------
> > >  platform/nuclei/ux600/configs/defconfig   |   0
> > >  platform/nuclei/ux600/objects.mk          |  22 +++++
> > >  platform/nuclei/ux600/platform.c          |   1 -
> > >  platform/template/Kconfig                 |   9 ++
> > >  platform/template/config.mk               |  77 ----------------
> > >  platform/template/configs/defconfig       |   0
> > >  platform/template/objects.mk              |  72 +++++++++++++++
> > >  platform/template/platform.c              |   2 +-
> > >  scripts/create-binary-archive.sh          |   2 +-
> > >  72 files changed, 948 insertions(+), 403 deletions(-)
> > >  create mode 100644 Kconfig
> > >  create mode 100644 firmware/Kconfig
> > >  create mode 100644 lib/utils/Kconfig
> > >  create mode 100644 lib/utils/fdt/Kconfig
> > >  create mode 100644 lib/utils/gpio/Kconfig
> > >  create mode 100644 lib/utils/i2c/Kconfig
> > >  create mode 100644 lib/utils/ipi/Kconfig
> > >  create mode 100644 lib/utils/irqchip/Kconfig
> > >  create mode 100644 lib/utils/libfdt/Kconfig
> > >  create mode 100644 lib/utils/reset/Kconfig
> > >  create mode 100644 lib/utils/serial/Kconfig
> > >  create mode 100644 lib/utils/sys/Kconfig
> > >  create mode 100644 lib/utils/timer/Kconfig
> > >  create mode 100644 platform/andes/ae350/Kconfig
> > >  delete mode 100644 platform/andes/ae350/config.mk
> > >  create mode 100644 platform/andes/ae350/configs/defconfig
> > >  create mode 100644 platform/fpga/ariane/Kconfig
> > >  delete mode 100644 platform/fpga/ariane/config.mk
> > >  create mode 100644 platform/fpga/ariane/configs/defconfig
> > >  create mode 100644 platform/fpga/openpiton/Kconfig
> > >  delete mode 100644 platform/fpga/openpiton/config.mk
> > >  create mode 100644 platform/fpga/openpiton/configs/defconfig
> > >  create mode 100644 platform/generic/Kconfig
> > >  delete mode 100644 platform/generic/config.mk
> > >  create mode 100644 platform/generic/configs/defconfig
> > >  create mode 100644 platform/kendryte/k210/Kconfig
> > >  delete mode 100644 platform/kendryte/k210/config.mk
> > >  create mode 100644 platform/kendryte/k210/configs/defconfig
> > >  create mode 100644 platform/nuclei/ux600/Kconfig
> > >  delete mode 100644 platform/nuclei/ux600/config.mk
> > >  create mode 100644 platform/nuclei/ux600/configs/defconfig
> > >  create mode 100644 platform/template/Kconfig
> > >  delete mode 100644 platform/template/config.mk
> > >  create mode 100644 platform/template/configs/defconfig
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi

