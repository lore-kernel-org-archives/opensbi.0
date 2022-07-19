From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Jul 2022 18:48:22 +0530
Subject: [PATCH v3 00/15] OpenSBI Kconfig Support
Message-ID: <20220719131837.2389630-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In future, we will see more drivers in OpenSBI for system reset, serial port,
power management, etc platform specific devices. We need platform specific
compile time configuration to allow users control the size of OpenSBI generic
firmware binaries by only enabling desired drivers. In other words, users
should be allowed to restrict the set of RISC-V platforms on which OpenSBI
generic firmwares built by them can run.

To address above, we add Kconfig support for OpenSBI platforms using the
Kconfiglib project which is a standalone kconfig parser.

To try OpenSBI Kconfig support with generic platform, here are few
example commands:
make PLATFORM=generic             <-- builds OpenSBI using "defconfig"
make PLATFORM=generic menuconfig  <-- launches graphical interface for changes

These patches can also be found in the kconfig_v3 branch at:
https://github.com/avpatel/opensbi.git

Changes since v2:
 - Use $(FOO) instead of $FOO to access FOO environment variable in
   Kconfig files.
 - Added a new PATCH1 to include Kconfiglib v14.1.0 sources under
   the scripts directory of OpenSBI.

Changes since v1:
 - Fix SPDX license specifier in new Kconfig files

Anup Patel (15):
  scripts: Add Kconfiglib v14.1.0 under scripts directory
  Makefile: Add initial kconfig support for each platform
  Makefile: Compile lib/utils sources separately for each platform
  lib: utils/serial: Use kconfig for enabling/disabling drivers
  lib: utils/reset: Use kconfig for enabling/disabling drivers
  lib: utils/sys: Use kconfig for enabling/disabling drivers
  lib: utils/timer: Use kconfig for enabling/disabling drivers
  lib: utils/ipi: Use kconfig for enabling/disabling drivers
  lib: utils/irqchip: Use kconfig for enabling/disabling drivers
  lib: utils/i2c: Use kconfig for enabling/disabling drivers
  lib: utils/gpio: Use kconfig for enabling/disabling drivers
  lib: utils/fdt: Use kconfig for enabling/disabling
  platform: generic: Use kconfig for enabling/disabling overrides
  platform: Remove redundant config.mk from all platforms
  docs: Update documentation for kconfig support

 Kconfig                                       |   23 +
 Makefile                                      |  104 +-
 README.md                                     |   25 +-
 docs/firmware/fw_dynamic.md                   |    2 +-
 docs/firmware/fw_jump.md                      |    4 +-
 docs/firmware/fw_payload.md                   |    4 +-
 docs/library_usage.md                         |    6 +-
 docs/platform/platform.md                     |    4 +-
 docs/platform_guide.md                        |    9 +-
 firmware/Kconfig                              |    1 +
 include/sbi_utils/fdt/fdt_domain.h            |    9 +
 include/sbi_utils/fdt/fdt_pmu.h               |   10 +
 include/sbi_utils/ipi/fdt_ipi.h               |    9 +
 include/sbi_utils/irqchip/fdt_irqchip.h       |   10 +
 include/sbi_utils/irqchip/imsic.h             |   10 +
 include/sbi_utils/reset/fdt_reset.h           |   12 +
 include/sbi_utils/serial/fdt_serial.h         |    8 +
 include/sbi_utils/timer/fdt_timer.h           |    9 +
 lib/utils/Kconfig                             |   25 +
 lib/utils/fdt/Kconfig                         |   18 +
 lib/utils/fdt/objects.mk                      |    8 +-
 lib/utils/gpio/Kconfig                        |   23 +
 lib/utils/gpio/objects.mk                     |   10 +-
 lib/utils/i2c/Kconfig                         |   23 +
 lib/utils/i2c/objects.mk                      |   10 +-
 lib/utils/ipi/Kconfig                         |   23 +
 lib/utils/ipi/objects.mk                      |   10 +-
 lib/utils/irqchip/Kconfig                     |   41 +
 lib/utils/irqchip/objects.mk                  |   22 +-
 lib/utils/libfdt/Kconfig                      |    5 +
 lib/utils/libfdt/objects.mk                   |    4 +-
 lib/utils/reset/Kconfig                       |   37 +
 lib/utils/reset/objects.mk                    |   28 +-
 lib/utils/serial/Kconfig                      |   73 +
 lib/utils/serial/objects.mk                   |   44 +-
 lib/utils/sys/Kconfig                         |   13 +
 lib/utils/sys/objects.mk                      |    4 +-
 lib/utils/timer/Kconfig                       |   23 +
 lib/utils/timer/objects.mk                    |   10 +-
 platform/andes/ae350/Kconfig                  |    8 +
 platform/andes/ae350/config.mk                |   36 -
 platform/andes/ae350/configs/defconfig        |    0
 platform/andes/ae350/objects.mk               |   29 +
 platform/fpga/ariane/Kconfig                  |   10 +
 platform/fpga/ariane/config.mk                |   36 -
 platform/fpga/ariane/configs/defconfig        |    0
 platform/fpga/ariane/objects.mk               |   35 +
 platform/fpga/openpiton/Kconfig               |   10 +
 platform/fpga/openpiton/config.mk             |   35 -
 platform/fpga/openpiton/configs/defconfig     |    0
 platform/fpga/openpiton/objects.mk            |   35 +
 platform/generic/Kconfig                      |   26 +
 platform/generic/allwinner/objects.mk         |    4 +-
 platform/generic/config.mk                    |   40 -
 platform/generic/configs/defconfig            |   29 +
 platform/generic/objects.mk                   |   33 +
 platform/generic/sifive/objects.mk            |    8 +-
 platform/kendryte/k210/Kconfig                |   10 +
 platform/kendryte/k210/config.mk              |   19 -
 platform/kendryte/k210/configs/defconfig      |    0
 platform/kendryte/k210/objects.mk             |   12 +
 platform/nuclei/ux600/Kconfig                 |   10 +
 platform/nuclei/ux600/config.mk               |   30 -
 platform/nuclei/ux600/configs/defconfig       |    0
 platform/nuclei/ux600/objects.mk              |   22 +
 platform/nuclei/ux600/platform.c              |    1 -
 platform/template/Kconfig                     |    9 +
 platform/template/config.mk                   |   77 -
 platform/template/configs/defconfig           |    0
 platform/template/objects.mk                  |   72 +
 platform/template/platform.c                  |    2 +-
 scripts/Kconfiglib/LICENSE.txt                |    5 +
 scripts/Kconfiglib/MANIFEST.in                |    2 +
 scripts/Kconfiglib/README.rst                 |  841 ++
 scripts/Kconfiglib/alldefconfig.py            |   27 +
 scripts/Kconfiglib/allmodconfig.py            |   46 +
 scripts/Kconfiglib/allnoconfig.py             |   45 +
 scripts/Kconfiglib/allyesconfig.py            |   56 +
 scripts/Kconfiglib/defconfig.py               |   43 +
 scripts/Kconfiglib/examples/Kmenuconfig       |  102 +
 .../Kconfiglib/examples/allnoconfig_walk.py   |   66 +
 .../examples/defconfig_oldconfig.py           |   39 +
 scripts/Kconfiglib/examples/dumpvars.py       |   15 +
 scripts/Kconfiglib/examples/eval_expr.py      |   24 +
 scripts/Kconfiglib/examples/find_symbol.py    |  112 +
 scripts/Kconfiglib/examples/help_grep.py      |   64 +
 scripts/Kconfiglib/examples/kconfiglib.py     |    1 +
 scripts/Kconfiglib/examples/list_undefined.py |  156 +
 .../Kconfiglib/examples/menuconfig_example.py |  341 +
 scripts/Kconfiglib/examples/merge_config.py   |  121 +
 .../Kconfiglib/examples/print_config_tree.py  |  199 +
 scripts/Kconfiglib/examples/print_sym_info.py |   54 +
 scripts/Kconfiglib/examples/print_tree.py     |   75 +
 scripts/Kconfiglib/genconfig.py               |  154 +
 scripts/Kconfiglib/guiconfig.py               | 2324 ++++++
 scripts/Kconfiglib/kconfiglib.py              | 7160 +++++++++++++++++
 scripts/Kconfiglib/listnewconfig.py           |   76 +
 scripts/Kconfiglib/makefile.patch             |   48 +
 scripts/Kconfiglib/menuconfig.py              | 3278 ++++++++
 scripts/Kconfiglib/oldconfig.py               |  246 +
 scripts/Kconfiglib/olddefconfig.py            |   28 +
 scripts/Kconfiglib/savedefconfig.py           |   49 +
 scripts/Kconfiglib/setconfig.py               |   92 +
 scripts/Kconfiglib/setup.cfg                  |    7 +
 scripts/Kconfiglib/setup.py                   |   96 +
 scripts/Kconfiglib/tests/Kappend              |   12 +
 scripts/Kconfiglib/tests/Kassignable          |  230 +
 scripts/Kconfiglib/tests/Kchoice              |  198 +
 scripts/Kconfiglib/tests/Kdefconfig_existent  |    8 +
 .../tests/Kdefconfig_existent_but_n           |   10 +
 .../Kconfiglib/tests/Kdefconfig_nonexistent   |    5 +
 scripts/Kconfiglib/tests/Kdefconfig_srctree   |    5 +
 scripts/Kconfiglib/tests/Kdepcopy             |  173 +
 scripts/Kconfiglib/tests/Kdeploop0            |    3 +
 scripts/Kconfiglib/tests/Kdeploop1            |    3 +
 scripts/Kconfiglib/tests/Kdeploop10           |   48 +
 scripts/Kconfiglib/tests/Kdeploop2            |    3 +
 scripts/Kconfiglib/tests/Kdeploop3            |    3 +
 scripts/Kconfiglib/tests/Kdeploop4            |    7 +
 scripts/Kconfiglib/tests/Kdeploop5            |    7 +
 scripts/Kconfiglib/tests/Kdeploop6            |    6 +
 scripts/Kconfiglib/tests/Kdeploop7            |   11 +
 scripts/Kconfiglib/tests/Kdeploop8            |    8 +
 scripts/Kconfiglib/tests/Kdeploop9            |    7 +
 scripts/Kconfiglib/tests/Kdirdep              |   30 +
 scripts/Kconfiglib/tests/Kescape              |    3 +
 scripts/Kconfiglib/tests/Keval                |   34 +
 scripts/Kconfiglib/tests/Kexpr_items          |   11 +
 scripts/Kconfiglib/tests/Kheader              |    5 +
 scripts/Kconfiglib/tests/Khelp                |   50 +
 scripts/Kconfiglib/tests/Kifremoval           |   99 +
 scripts/Kconfiglib/tests/Kimply               |  145 +
 scripts/Kconfiglib/tests/Kinclude_path        |   12 +
 .../Kconfiglib/tests/Kinclude_path_sourced_1  |   12 +
 .../Kconfiglib/tests/Kinclude_path_sourced_2  |   11 +
 scripts/Kconfiglib/tests/Kitemlists           |   36 +
 scripts/Kconfiglib/tests/Klocation            |   78 +
 scripts/Kconfiglib/tests/Klocation_sourced    |   26 +
 scripts/Kconfiglib/tests/Kmainmenu            |    5 +
 scripts/Kconfiglib/tests/Kmenuconfig          |   37 +
 scripts/Kconfiglib/tests/Kmisc                |   82 +
 scripts/Kconfiglib/tests/Kmissingrsource      |    1 +
 scripts/Kconfiglib/tests/Kmissingsource       |    1 +
 scripts/Kconfiglib/tests/Korder               |   35 +
 scripts/Kconfiglib/tests/Kpreprocess          |  151 +
 scripts/Kconfiglib/tests/Krange               |  133 +
 scripts/Kconfiglib/tests/Krecursive1          |    1 +
 scripts/Kconfiglib/tests/Krecursive2          |    1 +
 scripts/Kconfiglib/tests/Kreferenced          |   63 +
 scripts/Kconfiglib/tests/Krelation            |   36 +
 scripts/Kconfiglib/tests/Krepr                |   64 +
 scripts/Kconfiglib/tests/Kstr                 |  293 +
 scripts/Kconfiglib/tests/Kundef               |   23 +
 scripts/Kconfiglib/tests/Kuserfunctions       |   14 +
 scripts/Kconfiglib/tests/Kvisibility          |  342 +
 scripts/Kconfiglib/tests/config_indented      |    3 +
 scripts/Kconfiglib/tests/config_set_bool      |    1 +
 scripts/Kconfiglib/tests/config_set_string    |    1 +
 scripts/Kconfiglib/tests/defconfig_1          |    0
 scripts/Kconfiglib/tests/defconfig_2          |    0
 scripts/Kconfiglib/tests/empty                |    0
 scripts/Kconfiglib/tests/kconfigfunctions.py  |   22 +
 scripts/Kconfiglib/tests/reltest              |   51 +
 .../Kconfiglib/tests/sub/Kconfig_symlink_2    |    1 +
 .../Kconfiglib/tests/sub/Kconfig_symlink_3    |    2 +
 .../Kconfiglib/tests/sub/Klocation_grsourced1 |    1 +
 .../Kconfiglib/tests/sub/Klocation_grsourced2 |    1 +
 .../Kconfiglib/tests/sub/Klocation_gsourced1  |    1 +
 .../Kconfiglib/tests/sub/Klocation_gsourced2  |    1 +
 .../Kconfiglib/tests/sub/Klocation_rsourced   |    2 +
 scripts/Kconfiglib/tests/sub/defconfig_in_sub |    0
 .../tests/sub/sub/Kconfig_symlink_1           |    2 +
 scripts/Kconfiglib/tests/symlink              |    1 +
 scripts/Kconfiglib/testsuite.py               | 3203 ++++++++
 scripts/create-binary-archive.sh              |    2 +-
 175 files changed, 22816 insertions(+), 403 deletions(-)
 create mode 100644 Kconfig
 create mode 100644 firmware/Kconfig
 create mode 100644 lib/utils/Kconfig
 create mode 100644 lib/utils/fdt/Kconfig
 create mode 100644 lib/utils/gpio/Kconfig
 create mode 100644 lib/utils/i2c/Kconfig
 create mode 100644 lib/utils/ipi/Kconfig
 create mode 100644 lib/utils/irqchip/Kconfig
 create mode 100644 lib/utils/libfdt/Kconfig
 create mode 100644 lib/utils/reset/Kconfig
 create mode 100644 lib/utils/serial/Kconfig
 create mode 100644 lib/utils/sys/Kconfig
 create mode 100644 lib/utils/timer/Kconfig
 create mode 100644 platform/andes/ae350/Kconfig
 delete mode 100644 platform/andes/ae350/config.mk
 create mode 100644 platform/andes/ae350/configs/defconfig
 create mode 100644 platform/fpga/ariane/Kconfig
 delete mode 100644 platform/fpga/ariane/config.mk
 create mode 100644 platform/fpga/ariane/configs/defconfig
 create mode 100644 platform/fpga/openpiton/Kconfig
 delete mode 100644 platform/fpga/openpiton/config.mk
 create mode 100644 platform/fpga/openpiton/configs/defconfig
 create mode 100644 platform/generic/Kconfig
 delete mode 100644 platform/generic/config.mk
 create mode 100644 platform/generic/configs/defconfig
 create mode 100644 platform/kendryte/k210/Kconfig
 delete mode 100644 platform/kendryte/k210/config.mk
 create mode 100644 platform/kendryte/k210/configs/defconfig
 create mode 100644 platform/nuclei/ux600/Kconfig
 delete mode 100644 platform/nuclei/ux600/config.mk
 create mode 100644 platform/nuclei/ux600/configs/defconfig
 create mode 100644 platform/template/Kconfig
 delete mode 100644 platform/template/config.mk
 create mode 100644 platform/template/configs/defconfig
 create mode 100644 scripts/Kconfiglib/LICENSE.txt
 create mode 100644 scripts/Kconfiglib/MANIFEST.in
 create mode 100644 scripts/Kconfiglib/README.rst
 create mode 100755 scripts/Kconfiglib/alldefconfig.py
 create mode 100755 scripts/Kconfiglib/allmodconfig.py
 create mode 100755 scripts/Kconfiglib/allnoconfig.py
 create mode 100755 scripts/Kconfiglib/allyesconfig.py
 create mode 100755 scripts/Kconfiglib/defconfig.py
 create mode 100644 scripts/Kconfiglib/examples/Kmenuconfig
 create mode 100644 scripts/Kconfiglib/examples/allnoconfig_walk.py
 create mode 100644 scripts/Kconfiglib/examples/defconfig_oldconfig.py
 create mode 100644 scripts/Kconfiglib/examples/dumpvars.py
 create mode 100644 scripts/Kconfiglib/examples/eval_expr.py
 create mode 100644 scripts/Kconfiglib/examples/find_symbol.py
 create mode 100644 scripts/Kconfiglib/examples/help_grep.py
 create mode 120000 scripts/Kconfiglib/examples/kconfiglib.py
 create mode 100644 scripts/Kconfiglib/examples/list_undefined.py
 create mode 100755 scripts/Kconfiglib/examples/menuconfig_example.py
 create mode 100755 scripts/Kconfiglib/examples/merge_config.py
 create mode 100644 scripts/Kconfiglib/examples/print_config_tree.py
 create mode 100644 scripts/Kconfiglib/examples/print_sym_info.py
 create mode 100644 scripts/Kconfiglib/examples/print_tree.py
 create mode 100755 scripts/Kconfiglib/genconfig.py
 create mode 100755 scripts/Kconfiglib/guiconfig.py
 create mode 100644 scripts/Kconfiglib/kconfiglib.py
 create mode 100755 scripts/Kconfiglib/listnewconfig.py
 create mode 100644 scripts/Kconfiglib/makefile.patch
 create mode 100755 scripts/Kconfiglib/menuconfig.py
 create mode 100755 scripts/Kconfiglib/oldconfig.py
 create mode 100755 scripts/Kconfiglib/olddefconfig.py
 create mode 100755 scripts/Kconfiglib/savedefconfig.py
 create mode 100755 scripts/Kconfiglib/setconfig.py
 create mode 100644 scripts/Kconfiglib/setup.cfg
 create mode 100644 scripts/Kconfiglib/setup.py
 create mode 100644 scripts/Kconfiglib/tests/Kappend
 create mode 100644 scripts/Kconfiglib/tests/Kassignable
 create mode 100644 scripts/Kconfiglib/tests/Kchoice
 create mode 100644 scripts/Kconfiglib/tests/Kdefconfig_existent
 create mode 100644 scripts/Kconfiglib/tests/Kdefconfig_existent_but_n
 create mode 100644 scripts/Kconfiglib/tests/Kdefconfig_nonexistent
 create mode 100644 scripts/Kconfiglib/tests/Kdefconfig_srctree
 create mode 100644 scripts/Kconfiglib/tests/Kdepcopy
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop0
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop1
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop10
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop2
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop3
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop4
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop5
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop6
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop7
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop8
 create mode 100644 scripts/Kconfiglib/tests/Kdeploop9
 create mode 100644 scripts/Kconfiglib/tests/Kdirdep
 create mode 100644 scripts/Kconfiglib/tests/Kescape
 create mode 100644 scripts/Kconfiglib/tests/Keval
 create mode 100644 scripts/Kconfiglib/tests/Kexpr_items
 create mode 100644 scripts/Kconfiglib/tests/Kheader
 create mode 100644 scripts/Kconfiglib/tests/Khelp
 create mode 100644 scripts/Kconfiglib/tests/Kifremoval
 create mode 100644 scripts/Kconfiglib/tests/Kimply
 create mode 100644 scripts/Kconfiglib/tests/Kinclude_path
 create mode 100644 scripts/Kconfiglib/tests/Kinclude_path_sourced_1
 create mode 100644 scripts/Kconfiglib/tests/Kinclude_path_sourced_2
 create mode 100644 scripts/Kconfiglib/tests/Kitemlists
 create mode 100644 scripts/Kconfiglib/tests/Klocation
 create mode 100644 scripts/Kconfiglib/tests/Klocation_sourced
 create mode 100644 scripts/Kconfiglib/tests/Kmainmenu
 create mode 100644 scripts/Kconfiglib/tests/Kmenuconfig
 create mode 100644 scripts/Kconfiglib/tests/Kmisc
 create mode 100644 scripts/Kconfiglib/tests/Kmissingrsource
 create mode 100644 scripts/Kconfiglib/tests/Kmissingsource
 create mode 100644 scripts/Kconfiglib/tests/Korder
 create mode 100644 scripts/Kconfiglib/tests/Kpreprocess
 create mode 100644 scripts/Kconfiglib/tests/Krange
 create mode 100644 scripts/Kconfiglib/tests/Krecursive1
 create mode 100644 scripts/Kconfiglib/tests/Krecursive2
 create mode 100644 scripts/Kconfiglib/tests/Kreferenced
 create mode 100644 scripts/Kconfiglib/tests/Krelation
 create mode 100644 scripts/Kconfiglib/tests/Krepr
 create mode 100644 scripts/Kconfiglib/tests/Kstr
 create mode 100644 scripts/Kconfiglib/tests/Kundef
 create mode 100644 scripts/Kconfiglib/tests/Kuserfunctions
 create mode 100644 scripts/Kconfiglib/tests/Kvisibility
 create mode 100644 scripts/Kconfiglib/tests/config_indented
 create mode 100644 scripts/Kconfiglib/tests/config_set_bool
 create mode 100644 scripts/Kconfiglib/tests/config_set_string
 create mode 100644 scripts/Kconfiglib/tests/defconfig_1
 create mode 100644 scripts/Kconfiglib/tests/defconfig_2
 create mode 100644 scripts/Kconfiglib/tests/empty
 create mode 100644 scripts/Kconfiglib/tests/kconfigfunctions.py
 create mode 100755 scripts/Kconfiglib/tests/reltest
 create mode 100644 scripts/Kconfiglib/tests/sub/Kconfig_symlink_2
 create mode 100644 scripts/Kconfiglib/tests/sub/Kconfig_symlink_3
 create mode 100644 scripts/Kconfiglib/tests/sub/Klocation_grsourced1
 create mode 100644 scripts/Kconfiglib/tests/sub/Klocation_grsourced2
 create mode 100644 scripts/Kconfiglib/tests/sub/Klocation_gsourced1
 create mode 100644 scripts/Kconfiglib/tests/sub/Klocation_gsourced2
 create mode 100644 scripts/Kconfiglib/tests/sub/Klocation_rsourced
 create mode 100644 scripts/Kconfiglib/tests/sub/defconfig_in_sub
 create mode 100644 scripts/Kconfiglib/tests/sub/sub/Kconfig_symlink_1
 create mode 120000 scripts/Kconfiglib/tests/symlink
 create mode 100644 scripts/Kconfiglib/testsuite.py

-- 
2.34.1


