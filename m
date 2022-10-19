From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 19 Oct 2022 21:23:26 +0000
Subject: [PATCH v4 08/14] lib: utils/timer: Add Andes fdt timer support
In-Reply-To: <43cddb0a-934c-a020-f7d4-dcc5ef0401f3@sholland.org>
References: <20221014003252.17765-1-peterlin@andestech.com>
 <20221014003252.17765-9-peterlin@andestech.com>
 <43cddb0a-934c-a020-f7d4-dcc5ef0401f3@sholland.org>
Message-ID: <Y1BqzqFKA0B9v4BQ@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 16, 2022 at 02:15:42PM -0500, Samuel Holland wrote:
> On 10/13/22 19:32, Yu Chien Peter Lin wrote:
> > Since we can get the PLMT base address and timer frequency from
> > device tree, move plmt timer device to fdt timer framework.
> > 
> > dts example (Quad-core AX45MP):
> > 
> >   cpus {
> >       ...
> >       timebase-frequency = <0x3938700>;
> >       ...
> >   }
> >   soc {
> >       ...
> >       plmt0 at e6000000 {
> >           compatible = "andestech,plmt0";
> >           reg = <0x00 0xe6000000 0x00 0x100000>;
> >           interrupts-extended = <&cpu0_intc 0x07
> >                                  &cpu1_intc 0x07
> >                                  &cpu2_intc 0x07
> >                                  &cpu3_intc 0x07>;
> >       };
> >       ...
> >   }
> 
> Where is the binding for this compatible string? I do not see anything
> either upstream or downstream:
> 
> https://lore.kernel.org/linux-devicetree/?q=andestech%2Cplmt0
> https://github.com/andestech/linux/commits/RISCV-Linux-5.4-ast-v5_1_0-branch/Documentation/devicetree/bindings
> 
> We really shouldn't be accepting any devicetree compatible unless a YAML
> binding for it exists, ideally one acked by the DT schema maintainers.
> 
> Regards,
> Samuel
> 

Hi Samuel,

Thanks for pointing this out!
As PLMT and PLICSW are not used by any driver in kernel, I think it's
better to maintain within our own repository. Here is the branch [1]
we've updated the schemas for these fdt drivers.
If this works for you, we'll send PATCH v5 to fix dt binding check
violation.

[1] https://github.com/andestech/linux/commits/v6.0.y_ae350-ax45mp/Documentation/devicetree/bindings

