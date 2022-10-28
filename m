From: Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 28 Oct 2022 01:40:35 +0100
Subject: [PATCH RFC 0/7] Add support for Renesas RZ/Five SoC
Message-ID: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds initial support to RZ/Five SoC (which is equipped
with AX45MP AndesCore). Platform supports DT based probing.

Linux support is currently being upstreamed the latest patchset can be
found at [0].(DT bindings can be seen here)

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220920184904.90495-1-prabhakar.mahadev-lad.rj at bp.renesas.com/

- PLIC binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml#L57
- PLMT and PLICSW are not used by any driver in kernel hence DT bindings for it
  and is used in a similar manner as compared Andes AE350 [1]
  [1] https://github.com/andestech/linux/commits/v6.0.y_ae350-ax45mp/Documentation/devicetree/bindings
- SCIF binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/serial/renesas,scif.yaml#L79

Below are the logs for U-Boot (2022.10) and OpenSBI:
--------------------------------------------------
U-Boot SPL 2022.10-00192-g0cf0a0919b-dirty (Oct 28 2022 - 01:09:54 +0100)
Trying to boot from NOR

OpenSBI v1.1-87-gc46891e
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : smarc-rzfZ/Five
Platform Features         : medeleg
Platform HART Count       : 1
Platform IPI Device       : andes_plicsw
Platform Timer Device     : andes_plmt @ 12000000Hz
Platform Console Device   : renesas_scif
Platform HSM Device       : ---
Platform PMU Device       : ---
Platform Reboot Device    : ---
Platform Shutdown Device  : ---
Firmware Base             : 0x44000000
Firmware Size             : 152 KB
Runtime SBI Version       : 1.0

Domain0 Name              : root
Domain0 Boot HART         : 0
Domain0 HARTs             : 0*
Domain0 Region00          : 0x00000000110c0000-0x00000000110fffff (I,R)
Domain0 Region01          : 0x0000000011180000-0x00000000111bffff (I,R)
Domain0 Region02          : 0x0000000044000000-0x000000004403ffff ()
Domain0 Region03          : 0x0000000011100000-0x000000001117ffff (I,R)
Domain0 Region04          : 0x0000000013000000-0x00000000133fffff (I)
Domain0 Region05          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
Domain0 Next Address      : 0x0000000050000000
Domain0 Next Arg1         : 0x00000000500be568
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes

Boot HART ID              : 0
Boot HART Domain          : root
Boot HART Priv Version    : v1.11
Boot HART Base ISA        : rv64imafdcnx
Boot HART ISA Extensions  : none
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 8
Boot HART PMP Address Bits: 36
Boot HART MHPM Count      : 4
Boot HART MIDELEG         : 0x0000000000000222
Boot HART MEDELEG         : 0x000000000000b109


U-Boot 2022.10-00192-g0cf0a0919b-dirty (Oct 28 2022 - 01:09:54 +0100)

CPU:   rv64imafdc
Model: smarc-rzf
DRAM:  896 MiB
SW_ET0_EN: OFFCore:  30 devices, 18 uclasses, devicetree: separate
MMC:   sd at 11c00000: 0, sd at 11c10000: 1
Loading Environment from MMC... OK
In:    serial at 1004b800
Out:   serial at 1004b800
Err:   serial at 1004b800
Net:   eth0: ethernet@11c30000
Hit any key to stop autoboot:  0
=>
--------------------------------------------------

Cheers,
Prabhakar

Lad Prabhakar (7):
  lib: utils: serial: Add Renesas SCIF driver
  lib: utils: serial: Add FDT driver for Renesas SCIF
  platform: andes/ae350: Split header platform.h header file
  lib: utils/irqchip: Add compatible string for Andestech NCEPLIC100
  platform: Add Renesas RZ/Five initial support
  scripts: Add Renesas RZ/Five to platform list in the binary archive
    script
  docs: platform: Add documentation for Renesas RZ/Five SoC

 docs/platform/platform.md                  |   4 +
 docs/platform/renesas-rzfive.md            | 139 ++++++++++++++++++
 include/sbi_utils/fdt/fdt_helper.h         |   3 +
 include/sbi_utils/serial/renesas-scif.h    |  11 ++
 lib/utils/fdt/fdt_helper.c                 |  23 +++
 lib/utils/irqchip/fdt_irqchip_plic.c       |   3 +-
 lib/utils/serial/Kconfig                   |   9 ++
 lib/utils/serial/fdt_serial_renesas_scif.c |  31 ++++
 lib/utils/serial/objects.mk                |   4 +
 lib/utils/serial/renesas_scif.c            | 140 ++++++++++++++++++
 platform/andes/ae350/common-platform.h     |  94 ++++++++++++
 platform/andes/ae350/platform.h            |  82 +----------
 platform/renesas/rzfive/Kconfig            |  32 ++++
 platform/renesas/rzfive/configs/defconfig  |   0
 platform/renesas/rzfive/objects.mk         |  18 +++
 platform/renesas/rzfive/platform.c         | 161 +++++++++++++++++++++
 platform/renesas/rzfive/platform.h         |  24 +++
 scripts/create-binary-archive.sh           |   1 +
 18 files changed, 698 insertions(+), 81 deletions(-)
 create mode 100644 docs/platform/renesas-rzfive.md
 create mode 100644 include/sbi_utils/serial/renesas-scif.h
 create mode 100644 lib/utils/serial/fdt_serial_renesas_scif.c
 create mode 100644 lib/utils/serial/renesas_scif.c
 create mode 100644 platform/andes/ae350/common-platform.h
 create mode 100644 platform/renesas/rzfive/Kconfig
 create mode 100644 platform/renesas/rzfive/configs/defconfig
 create mode 100644 platform/renesas/rzfive/objects.mk
 create mode 100644 platform/renesas/rzfive/platform.c
 create mode 100644 platform/renesas/rzfive/platform.h

-- 
2.17.1


