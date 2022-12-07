From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Wed,  7 Dec 2022 16:32:28 +0000
Subject: [PATCH v4 0/5]  Add support for Renesas RZ/Five SoC
Message-ID: <20221207163233.10656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

This patch series adds initial support to RZ/Five (R9A07G043F) SoC (which
is equipped with AX45MP AndesCore). Platform supports DT based probing.

Linux support is currently being upstreamed the latest patchset can be
found at [0](currently in linux-next, DT bindings can be seen here)

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221028165921.94487-1-prabhakar.mahadev-lad.rj at bp.renesas.com/

- PLIC binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml#L57
- PLMT and PLICSW are not used by any driver in kernel hence DT bindings for it
  and is used in a similar manner as compared Andes AE350 [1]
  [1] https://github.com/andestech/linux/commits/v6.0.y_ae350-ax45mp/Documentation/devicetree/bindings
- SCIF binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/serial/renesas,scif.yaml#L79

Note:
- The PMA implementation is still in discussion [1] once its decided
corresponding patch to OpenSBI will be added to reserve the memory nodes
and vendor specific SBI EXT.
- U-boot from BSP release wont work with these patches, it requires additional
  patches (happy to share the u-boot branch if anyone wants to test this patchset)
- Patches apply on top of [2]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221124172207.153718-8-prabhakar.mahadev-lad.rj at bp.renesas.com/
[2] https://patchwork.ozlabs.org/project/opensbi/cover/20221128083046.6799-1-peterlin at andestech.com/

v3->v4
* Included RB tags
* Updated doc
* Sorted compatible string list
* Fixed minor issues related to scif driver

v2->v3
* Switched to generic platform
* Dropped all vendor specific SBI EXT
* Fixed review comments pointed by Bin for SCIF driver
* Updated doc

RFC->v2
* Fixed comments pointed by Xiang W
* Included RB tag from Yu Chien Peter Lin for patch #3

RFC: https://patchwork.ozlabs.org/project/opensbi/cover/20221028004042.135549-1-prabhakar.mahadev-lad.rj at bp.renesas.com/

Below are the logs for U-Boot (2022.10), OpenSBI and Linux:
-----------------------------------------------------------
U-Boot SPL 2022.10-00195-g1403538afc (Dec 07 2022 - 10:00:01 +0000)
Trying to boot from NOR

OpenSBI v1.1-112-g5066f28
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : Renesas SMARC EVK based on r9a07g043f01
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
Firmware Size             : 212 KB
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
Domain0 Next Arg1         : 0x00000000500be0c0
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


U-Boot 2022.10-00195-g1403538afc (Dec 07 2022 - 10:00:01 +0000)

CPU:   rv64imafdc
Model: Renesas SMARC EVK based on r9a07g043f01
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
-----------------------------------------------------------------------------------

Cheers,
Prabhakar

Lad Prabhakar (5):
  lib: utils: serial: Add Renesas SCIF driver
  lib: utils: serial: Add FDT driver for Renesas SCIF
  lib: utils/irqchip: Add compatible string for Andestech NCEPLIC100
  platform: generic: Add Renesas RZ/Five initial support
  docs: platform: Add documentation for Renesas RZ/Five SoC

 docs/platform/platform.md                  |   5 +
 docs/platform/renesas-rzfive.md            | 160 +++++++++++++++++++++
 include/sbi_utils/fdt/fdt_helper.h         |   3 +
 include/sbi_utils/serial/renesas-scif.h    |  11 ++
 lib/utils/fdt/fdt_helper.c                 |  11 ++
 lib/utils/irqchip/fdt_irqchip_plic.c       |   3 +-
 lib/utils/serial/Kconfig                   |   9 ++
 lib/utils/serial/fdt_serial_renesas_scif.c |  31 ++++
 lib/utils/serial/objects.mk                |   4 +
 lib/utils/serial/renesas_scif.c            | 116 +++++++++++++++
 platform/generic/Kconfig                   |   4 +
 platform/generic/configs/defconfig         |   2 +
 platform/generic/renesas/rzfive/objects.mk |   8 ++
 platform/generic/renesas/rzfive/rzfive.c   |  17 +++
 14 files changed, 383 insertions(+), 1 deletion(-)
 create mode 100644 docs/platform/renesas-rzfive.md
 create mode 100644 include/sbi_utils/serial/renesas-scif.h
 create mode 100644 lib/utils/serial/fdt_serial_renesas_scif.c
 create mode 100644 lib/utils/serial/renesas_scif.c
 create mode 100644 platform/generic/renesas/rzfive/objects.mk
 create mode 100644 platform/generic/renesas/rzfive/rzfive.c

-- 
2.17.1


