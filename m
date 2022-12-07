From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Wed,  7 Dec 2022 16:32:31 +0000
Subject: [PATCH v4 3/5] lib: utils/irqchip: Add compatible string for Andestech NCEPLIC100
In-Reply-To: <20221207163233.10656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221207163233.10656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <20221207163233.10656-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add compatible string for Andestech NCEPLIC100 found on Renesas RZ/Five SoC
which is equipped with AX45MP AndesCore.

While at it drop the comma after the sentinel as it does not make sense to
have a comma after a sentinel, as any new elements must be added before the
sentinel.

dts example (Single-core AX45MP):

    soc: soc {
          ....
          plic: interrupt-controller at 12c00000 {
              compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
              #interrupt-cells = <2>;
              #address-cells = <0>;
              riscv,ndev = <511>;
              interrupt-controller;
              reg = <0x0 0x12c00000 0 0x400000>;
              clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
              power-domains = <&cpg>;
              resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
              interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
          };
          ....
    };

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
v3->v4
* Sorted compatible string list

v2->v3
* Included RB tags

RFC->v2
* No change

DT binding [0]
[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml?h=next-20221111#n56
---
 lib/utils/irqchip/fdt_irqchip_plic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index a6e185c..c0242ac 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -159,11 +159,12 @@ void thead_plic_restore(void)
 }
 
 static const struct fdt_match irqchip_plic_match[] = {
+	{ .compatible = "andestech,nceplic100" },
 	{ .compatible = "riscv,plic0" },
 	{ .compatible = "sifive,plic-1.0.0" },
 	{ .compatible = "thead,c900-plic",
 	  .data = thead_plic_plat_init },
-	{ },
+	{ /* sentinel */ }
 };
 
 struct fdt_irqchip fdt_irqchip_plic = {
-- 
2.17.1


