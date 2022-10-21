From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 20 Oct 2022 23:01:37 -0700
Subject: [PATCH v4 08/14] lib: utils/timer: Add Andes fdt timer support
In-Reply-To: <CAAhSdy2diaow70xY-f9Kd2sMGapetcJrrSzZqvpno+29AsiXHw@mail.gmail.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
 <20221014003252.17765-9-peterlin@andestech.com> <43cddb0a-934c-a020-f7d4-dcc5ef0401f3@sholland.org>
 <CAAhSdy2diaow70xY-f9Kd2sMGapetcJrrSzZqvpno+29AsiXHw@mail.gmail.com>
Message-ID: <CAOnJCUK0wm3igL1F0wq1M1YwJjCVs82fJG0Wh8ZmzePxS9qywQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 20, 2022 at 10:12 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Oct 17, 2022 at 12:45 AM Samuel Holland <samuel@sholland.org> wrote:
> >
> > On 10/13/22 19:32, Yu Chien Peter Lin wrote:
> > > Since we can get the PLMT base address and timer frequency from
> > > device tree, move plmt timer device to fdt timer framework.
> > >
> > > dts example (Quad-core AX45MP):
> > >
> > >   cpus {
> > >       ...
> > >       timebase-frequency = <0x3938700>;
> > >       ...
> > >   }
> > >   soc {
> > >       ...
> > >       plmt0 at e6000000 {
> > >           compatible = "andestech,plmt0";
> > >           reg = <0x00 0xe6000000 0x00 0x100000>;
> > >           interrupts-extended = <&cpu0_intc 0x07
> > >                                  &cpu1_intc 0x07
> > >                                  &cpu2_intc 0x07
> > >                                  &cpu3_intc 0x07>;
> > >       };
> > >       ...
> > >   }
> >
> > Where is the binding for this compatible string? I do not see anything
> > either upstream or downstream:
> >
> > https://lore.kernel.org/linux-devicetree/?q=andestech%2Cplmt0
> > https://github.com/andestech/linux/commits/RISCV-Linux-5.4-ast-v5_1_0-branch/Documentation/devicetree/bindings
> >
> > We really shouldn't be accepting any devicetree compatible unless a YAML
> > binding for it exists, ideally one acked by the DT schema maintainers.
> >
>
> Ideally, we should only accept patches for which DT bindings
> have been accepted in kernel but at the moment we are not
> strict about this as long as:
> 1) It does not affect other platforms
> 2) The platform/SoC vendor are willing to keep things up-to-date
>     whenever DT bindings are merged in kernel
>
> I am still not sure about from which OpenSBI release we should
> change our patch acceptance policy and mandate DT bindings to
> be present in the kernel.
>

That should be the policy for drivers present in the kernel. However,
there may be some other driver
that only operates in M-mode and may not need to be present in the kernel.

The SBI PMU extension also falls into this category. The DT bindings
have to be maintained in the OpenSBI
as the kernel driver doesn't need to be aware of PMU DT bindings.

> Regards,
> Anup
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

