From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Oct 2021 16:57:12 +0530
Subject: [PATCH 1/1] dt-bindings: T-HEAD CLINT
In-Reply-To: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy22y3gWM0Y9x7m84CdmtHKo7VsDC4+ZDY7+mhkJ9HcYyA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 20, 2021 at 3:06 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
> not support 64bit mmio access to the MTIMER device.
>
> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
> restriction and the "sifive,cling0" compatible string. An OpenSBI
> patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
> is generally used in the devicetree schema for such a condition.
>
> As the design is not SiFive based it is preferable to apply a compatible
> string identifying T-HEAD instead.
>
> Add a new yaml file describing the T-HEAD CLINT.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> @Palmer, @Anup
> I copied you as maintainers from sifive,clint.yaml. Please, indicate if
> this should be changed.
>
> For the prior discussion see:
> https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt at canonical.com/
> https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt at canonical.com/
>
> A release candidate of the ACLINT specification is available at
> https://github.com/riscv/riscv-aclint/releases

T-HEAD supporting only 32bit accesses to MTIME and MTIMECMP
registers are totally allowed. The RISC-V privileged specification does
not enforce RV64 platforms to support 64bit accesses to MTIME and
MTIMECMP registers. Also, the ACLINT specification only states
that MTIME and MTIMECMP registers are 64-bit wide but it does
not enforce platforms to support 64-bit accesses.

Here are some discussions from tech-aia mailing list:
https://lists.riscv.org/g/tech-aia/message/115
https://lists.riscv.org/g/tech-aia/message/119
https://lists.riscv.org/g/tech-aia/message/120

In other words, the T-HEAD CLINT (MTIMER+MSWI) is compliant
with the RISC-V ACLINT specification.

I think we should add implementation specific compatible strings
for Allwinner D1 in the ACLINT MTIMER and ACLINT MSWI
DT bindings.

How about including the following two compatible strings in
ACLINT DT bindings ?
allwinner,sun20i-d1-aclint-mtimer
allwinner,sun20i-d1-aclint-mswi

Regards,
Anup

> ---
>  .../bindings/timer/thead,clint.yaml           | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/thead,clint.yaml
>
> diff --git a/Documentation/devicetree/bindings/timer/thead,clint.yaml b/Documentation/devicetree/bindings/timer/thead,clint.yaml
> new file mode 100644
> index 000000000000..02463fb2043a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/thead,clint.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/thead,clint.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Core Local Interruptor
> +
> +maintainers:
> +  - Palmer Dabbelt <palmer@dabbelt.com>
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  T-HEAD (and other RISC-V) SOCs include an implementation of the T-HEAD
> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
> +  interrupts. It directly connects to the timer and inter-processor interrupt
> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
> +  interrupt controller is the parent interrupt controller for CLINT device.
> +  The clock frequency of the CLINT is specified via "timebase-frequency" DT
> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const:
> +          - allwinner,sun20i-d1-clint
> +      - const:
> +          - thead,clint0
> +
> +    description:
> +      Should be "<vendor>,<chip>-clint" and "thead,clint<version>" for
> +      the T-HEAD derived CLINTs.
> +      Supported compatible strings are -
> +      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC
> +      and "thead,clint0" for the T-HEAD IP block with no chip
> +      integration tweaks.
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    timer at 2000000 {
> +      compatible = "allwinner,sun20i-d1-clint", "thead,clint0";
> +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> +                             &cpu2intc 3 &cpu2intc 7
> +                             &cpu3intc 3 &cpu3intc 7
> +                             &cpu4intc 3 &cpu4intc 7>;
> +       reg = <0x2000000 0x10000>;
> +    };
> +...
> --
> 2.32.0
>

