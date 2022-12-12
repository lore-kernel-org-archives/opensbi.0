From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Dec 2022 18:58:53 +0530
Subject: [PATCH v5 0/5] Add support for Renesas RZ/Five SoC
In-Reply-To: <20221210103011.7814-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221210103011.7814-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAAhSdy2ANrHhbq4AYNVdcuSo8AL3UbH5Ej8S-MZanJNksYUH+w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 10, 2022 at 4:00 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series adds initial support to RZ/Five (R9A07G043F) SoC (which
> is equipped with AX45MP AndesCore). Platform supports DT based probing.
>
> Linux support is currently being upstreamed the latest patchset can be
> found at [0](currently in linux-next, DT bindings can be seen here)
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221028165921.94487-1-prabhakar.mahadev-lad.rj at bp.renesas.com/
>
> - PLIC binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml#L57
> - PLMT and PLICSW are not used by any driver in kernel hence DT bindings for it
>   and is used in a similar manner as compared Andes AE350 [1]
>   [1] https://github.com/andestech/linux/commits/v6.0.y_ae350-ax45mp/Documentation/devicetree/bindings
> - SCIF binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/serial/renesas,scif.yaml#L79
>
> Note:
> - The PMA implementation is still in discussion [1] once its decided
> corresponding patch to OpenSBI will be added to reserve the memory nodes
> and vendor specific SBI EXT.
> - U-boot from BSP release wont work with these patches, it requires additional
>   patches (happy to share the u-boot branch if anyone wants to test this patchset)
> - Patches apply on top of [2]
>
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221124172207.153718-8-prabhakar.mahadev-lad.rj at bp.renesas.com/
> [2] https://patchwork.ozlabs.org/project/opensbi/cover/20221128083046.6799-1-peterlin at andestech.com/
>
> v4->v5
> * Included RB tag from Anup for patch 5/5
> * Updated generic.md to include RZ/Five SoC
>
> v3->v4
> * Included RB tags
> * Updated doc
> * Sorted compatible string list
> * Fixed minor issues related to scif driver
>
> v2->v3
> * Switched to generic platform
> * Dropped all vendor specific SBI EXT
> * Fixed review comments pointed by Bin for SCIF driver
> * Updated doc
>
> RFC->v2
> * Fixed comments pointed by Xiang W
> * Included RB tag from Yu Chien Peter Lin for patch #3
>
> RFC: https://patchwork.ozlabs.org/project/opensbi/cover/20221028004042.135549-1-prabhakar.mahadev-lad.rj at bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (5):
>   lib: utils: serial: Add Renesas SCIF driver
>   lib: utils: serial: Add FDT driver for Renesas SCIF
>   lib: utils/irqchip: Add compatible string for Andestech NCEPLIC100
>   platform: generic: Add Renesas RZ/Five initial support
>   docs: platform: Add documentation for Renesas RZ/Five SoC

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  docs/platform/generic.md                   |   2 +
>  docs/platform/platform.md                  |   5 +
>  docs/platform/renesas-rzfive.md            | 160 +++++++++++++++++++++
>  include/sbi_utils/fdt/fdt_helper.h         |   3 +
>  include/sbi_utils/serial/renesas-scif.h    |  11 ++
>  lib/utils/fdt/fdt_helper.c                 |  11 ++
>  lib/utils/irqchip/fdt_irqchip_plic.c       |   3 +-
>  lib/utils/serial/Kconfig                   |   9 ++
>  lib/utils/serial/fdt_serial_renesas_scif.c |  31 ++++
>  lib/utils/serial/objects.mk                |   4 +
>  lib/utils/serial/renesas_scif.c            | 116 +++++++++++++++
>  platform/generic/Kconfig                   |   4 +
>  platform/generic/configs/defconfig         |   2 +
>  platform/generic/renesas/rzfive/objects.mk |   8 ++
>  platform/generic/renesas/rzfive/rzfive.c   |  17 +++
>  15 files changed, 385 insertions(+), 1 deletion(-)
>  create mode 100644 docs/platform/renesas-rzfive.md
>  create mode 100644 include/sbi_utils/serial/renesas-scif.h
>  create mode 100644 lib/utils/serial/fdt_serial_renesas_scif.c
>  create mode 100644 lib/utils/serial/renesas_scif.c
>  create mode 100644 platform/generic/renesas/rzfive/objects.mk
>  create mode 100644 platform/generic/renesas/rzfive/rzfive.c
>
> --
> 2.17.1
>

