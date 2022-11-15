From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Nov 2022 22:06:48 +0800
Subject: [PATCH v2 4/7] lib: utils/irqchip: Add compatible string for
 Andestech NCEPLIC100
In-Reply-To: <20221111182105.614094-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221111182105.614094-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221111182105.614094-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAEUhbmVGK_QK2opxx0a3mOUi2VHqQ-OWqzp-C1BmJws51oBv3g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 12, 2022 at 2:22 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add compatible string for Andestech NCEPLIC100 found on Renesas RZ/Five SoC
> which is equipped with AX45MP AndesCore.
>
> While at it drop the comma after the sentinel as it does not make sense to
> have a comma after a sentinel, as any new elements must be added before the
> sentinel.
>
> dts example (Single-core AX45MP):
>
>     soc: soc {
>           ....
>           plic: interrupt-controller at 12c00000 {
>               compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
>               #interrupt-cells = <2>;
>               #address-cells = <0>;
>               riscv,ndev = <511>;
>               interrupt-controller;
>               reg = <0x0 0x12c00000 0 0x400000>;
>               clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
>               power-domains = <&cpg>;
>               resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
>               interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
>           };
>           ....
>     };
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> * No change
>
> DT binding [0]
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml?h=next-20221111#n56
> ---
>  lib/utils/irqchip/fdt_irqchip_plic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

