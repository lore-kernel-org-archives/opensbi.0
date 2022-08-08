From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Aug 2022 09:12:40 +0530
Subject: [PATCH v7 00/17] OpenSBI Kconfig Support
In-Reply-To: <CAOnJCUKVugfe0nGcGxjqz0D1hMX++sJnT3eOixNFz5ym2t71MQ@mail.gmail.com>
References: <20220804143106.64599-1-apatel@ventanamicro.com>
 <CAOnJCU+V+7SSv31qcY3y-OBvKJX7040NOwhC4opUWx1YEEZxkw@mail.gmail.com> <CAOnJCUKVugfe0nGcGxjqz0D1hMX++sJnT3eOixNFz5ym2t71MQ@mail.gmail.com>
Message-ID: <CAAhSdy06rrZgaNWcSRXanj2SW8rGoxHLQ34AQ1LjLXK2NST7gg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 6, 2022 at 2:39 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Aug 5, 2022 at 1:47 PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Thu, Aug 4, 2022 at 7:31 AM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > In future, we will see more drivers in OpenSBI for system reset, serial port,
> > > power management, etc platform specific devices. We need platform specific
> > > compile time configuration to allow users control the size of OpenSBI generic
> > > firmware binaries by only enabling desired drivers. In other words, users
> > > should be allowed to restrict the set of RISC-V platforms on which OpenSBI
> > > generic firmwares built by them can run.
> > >
> > > To address above, we add Kconfig support for OpenSBI platforms using the
> > > Kconfiglib project which is a standalone kconfig parser.
> > >
> > > To try OpenSBI Kconfig support with generic platform, here are few
> > > example commands:
> > > make PLATFORM=generic             <-- builds OpenSBI using "defconfig"
> > > make PLATFORM=generic menuconfig  <-- launches graphical interface for changes
> > >
> > > These patches can also be found in the kconfig_v7 branch at:
> > > https://github.com/avpatel/opensbi.git
> > >
> > > Changes since v6:
> > >  - Added comments in platform/template/Kconfig for PATCH2
> > >  - Addressed Drew's comments in PATCH16
> > >
> > > Changes since v5:
> > >  - Updated kconfig symbol description in PATCH14
> > >  - Included a typo fix for docs/platform/platform.md in PATCH16
> > >  - Added separate PATCH17 for typo fix in top-level makefile
> > >
> > > Changes since v4:
> > >  - Added separate PATCH14 to allow user change generic platform
> > >    version and default name.
> > >  - Fixed libfdt compiler error using LLVM in PATCH12
> > >
> > > Changes since v3:
> > >  - Strip down the Kconfiglib sources added by PATCH1
> > >  - Removed extra "." in the top-level Makefile updated by PATCH2
> > >
> > > Changes since v2:
> > >  - Use $(FOO) instead of $FOO to access FOO environment variable in
> > >    Kconfig files.
> > >  - Added a new PATCH1 to include Kconfiglib v14.1.0 sources under
> > >    the scripts directory of OpenSBI.
> > >
> > > Changes since v1:
> > >  - Fix SPDX license specifier in new Kconfig files
> > >
> > > Anup Patel (17):
> > >   scripts: Add Kconfiglib v14.1.0 under scripts directory
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
> > >   platform: generic: Use kconfig to set platform version and default
> > >     name
> > >   platform: Remove redundant config.mk from all platforms
> > >   docs: Update documentation for kconfig support
> > >   Makefile: Fix typo related to object.mk
> > >
> > >  Kconfig                                   |   23 +
> > >  Makefile                                  |  107 +-
> > >  README.md                                 |   25 +-
> > >  docs/firmware/fw_dynamic.md               |    2 +-
> > >  docs/firmware/fw_jump.md                  |    4 +-
> > >  docs/firmware/fw_payload.md               |    4 +-
> > >  docs/library_usage.md                     |    6 +-
> > >  docs/platform/platform.md                 |    6 +-
> > >  docs/platform_guide.md                    |    9 +-
> > >  firmware/Kconfig                          |    1 +
> > >  include/sbi_utils/fdt/fdt_domain.h        |    9 +
> > >  include/sbi_utils/fdt/fdt_pmu.h           |   10 +
> > >  include/sbi_utils/ipi/fdt_ipi.h           |    9 +
> > >  include/sbi_utils/irqchip/fdt_irqchip.h   |   10 +
> > >  include/sbi_utils/irqchip/imsic.h         |   10 +
> > >  include/sbi_utils/reset/fdt_reset.h       |   12 +
> > >  include/sbi_utils/serial/fdt_serial.h     |    8 +
> > >  include/sbi_utils/timer/fdt_timer.h       |    9 +
> > >  lib/utils/Kconfig                         |   25 +
> > >  lib/utils/fdt/Kconfig                     |   18 +
> > >  lib/utils/fdt/objects.mk                  |    8 +-
> > >  lib/utils/gpio/Kconfig                    |   23 +
> > >  lib/utils/gpio/objects.mk                 |   10 +-
> > >  lib/utils/i2c/Kconfig                     |   23 +
> > >  lib/utils/i2c/objects.mk                  |   10 +-
> > >  lib/utils/ipi/Kconfig                     |   23 +
> > >  lib/utils/ipi/objects.mk                  |   10 +-
> > >  lib/utils/irqchip/Kconfig                 |   41 +
> > >  lib/utils/irqchip/objects.mk              |   22 +-
> > >  lib/utils/libfdt/Kconfig                  |    5 +
> > >  lib/utils/libfdt/objects.mk               |    2 +-
> > >  lib/utils/reset/Kconfig                   |   37 +
> > >  lib/utils/reset/objects.mk                |   28 +-
> > >  lib/utils/serial/Kconfig                  |   73 +
> > >  lib/utils/serial/objects.mk               |   44 +-
> > >  lib/utils/sys/Kconfig                     |   13 +
> > >  lib/utils/sys/objects.mk                  |    4 +-
> > >  lib/utils/timer/Kconfig                   |   23 +
> > >  lib/utils/timer/objects.mk                |   10 +-
> > >  platform/andes/ae350/Kconfig              |    8 +
> > >  platform/andes/ae350/config.mk            |   36 -
> > >  platform/andes/ae350/configs/defconfig    |    0
> > >  platform/andes/ae350/objects.mk           |   29 +
> > >  platform/fpga/ariane/Kconfig              |   10 +
> > >  platform/fpga/ariane/config.mk            |   36 -
> > >  platform/fpga/ariane/configs/defconfig    |    0
> > >  platform/fpga/ariane/objects.mk           |   35 +
> > >  platform/fpga/openpiton/Kconfig           |   10 +
> > >  platform/fpga/openpiton/config.mk         |   35 -
> > >  platform/fpga/openpiton/configs/defconfig |    0
> > >  platform/fpga/openpiton/objects.mk        |   35 +
> > >  platform/generic/Kconfig                  |   40 +
> > >  platform/generic/allwinner/objects.mk     |    4 +-
> > >  platform/generic/config.mk                |   40 -
> > >  platform/generic/configs/defconfig        |   29 +
> > >  platform/generic/objects.mk               |   33 +
> > >  platform/generic/platform.c               |    6 +-
> > >  platform/generic/sifive/objects.mk        |    8 +-
> > >  platform/kendryte/k210/Kconfig            |   10 +
> > >  platform/kendryte/k210/config.mk          |   19 -
> > >  platform/kendryte/k210/configs/defconfig  |    0
> > >  platform/kendryte/k210/objects.mk         |   12 +
> > >  platform/nuclei/ux600/Kconfig             |   10 +
> > >  platform/nuclei/ux600/config.mk           |   30 -
> > >  platform/nuclei/ux600/configs/defconfig   |    0
> > >  platform/nuclei/ux600/objects.mk          |   22 +
> > >  platform/nuclei/ux600/platform.c          |    1 -
> > >  platform/template/Kconfig                 |   16 +
> > >  platform/template/config.mk               |   77 -
> > >  platform/template/configs/defconfig       |    0
> > >  platform/template/objects.mk              |   72 +
> > >  platform/template/platform.c              |    2 +-
> > >  scripts/Kconfiglib/LICENSE.txt            |    5 +
> > >  scripts/Kconfiglib/allnoconfig.py         |   45 +
> > >  scripts/Kconfiglib/allyesconfig.py        |   56 +
> > >  scripts/Kconfiglib/defconfig.py           |   43 +
> > >  scripts/Kconfiglib/genconfig.py           |  154 +
> > >  scripts/Kconfiglib/kconfiglib.py          | 7160 +++++++++++++++++++++
> > >  scripts/Kconfiglib/menuconfig.py          | 3278 ++++++++++
> > >  scripts/Kconfiglib/oldconfig.py           |  246 +
> > >  scripts/Kconfiglib/olddefconfig.py        |   28 +
> > >  scripts/Kconfiglib/savedefconfig.py       |   49 +
> > >  scripts/Kconfiglib/setconfig.py           |   92 +
> > >  scripts/create-binary-archive.sh          |    2 +-
> > >  84 files changed, 12133 insertions(+), 406 deletions(-)
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
> > >  create mode 100644 scripts/Kconfiglib/LICENSE.txt
> > >  create mode 100755 scripts/Kconfiglib/allnoconfig.py
> > >  create mode 100755 scripts/Kconfiglib/allyesconfig.py
> > >  create mode 100755 scripts/Kconfiglib/defconfig.py
> > >  create mode 100755 scripts/Kconfiglib/genconfig.py
> > >  create mode 100644 scripts/Kconfiglib/kconfiglib.py
> > >  create mode 100755 scripts/Kconfiglib/menuconfig.py
> > >  create mode 100755 scripts/Kconfiglib/oldconfig.py
> > >  create mode 100755 scripts/Kconfiglib/olddefconfig.py
> > >  create mode 100755 scripts/Kconfiglib/savedefconfig.py
> > >  create mode 100755 scripts/Kconfiglib/setconfig.py
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > For the entire series:
> >
> > Acked-by: Atish Patra <atishp@rivosinc.com>
> > Tested-by: Atish Patra <atishp@rivosinc.com>
> >
>
> I guess I spoke too soon. I got this error with parallel builds
>
> ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- make
> PLATFORM=generic -j$(nproc)
>
> non-parallel builds work fine.

Thanks for catching. There was an issue with .dep file generation
being parallized with .config generation. I have fixed it in v8.

I will quickly send v8 and also merge the same.

Thanks,
Anup

>
> > --
> > Regards,
> > Atish
>
>
>
> --
> Regards,
> Atish

