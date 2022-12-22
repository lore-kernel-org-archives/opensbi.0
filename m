From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 22 Dec 2022 12:39:31 -0800
Subject: [PATCH v1] dt-bindings: riscv: add SBI PMU event mappings
In-Reply-To: <Y6S7ENNXQe42ymTz@spud>
References: <20221221141548.274408-1-conor@kernel.org> <20221222180627.GA1748427-robh@kernel.org>
 <Y6SuyiYC/oLB2VzL@spud> <CAHBxVyEZJeH6H00Jdcm2_=z-D2kYxVTgagYhmLoyJ2CPqcFbgg@mail.gmail.com>
 <Y6S7ENNXQe42ymTz@spud>
Message-ID: <CAHBxVyHn7NEYCJTCJYU3Pu4=t7TGssog3ywaxfd1TFXXF9f9+Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 12:16 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Dec 22, 2022 at 11:55:29AM -0800, Atish Kumar Patra wrote:
> > On Thu, Dec 22, 2022 at 11:24 AM Conor Dooley <conor@kernel.org> wrote:
> > > On Thu, Dec 22, 2022 at 12:06:27PM -0600, Rob Herring wrote:
> > > > On Wed, Dec 21, 2022 at 02:15:49PM +0000, Conor Dooley wrote:
> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > >
> > > > > The SBI PMU extension requires a firmware to be aware of the event to
> > > > > counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> > > > > DeviceTree to describe the PMU mappings. This binding is currently
> > > > > described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> > > > > since v7.2.0.
> > > > >
> > > > > Import the binding for use while validating dtb dumps from QEMU and
> > > > > upcoming hardware (eg JH7110 SoC) that will make use of the event
> > > > > mapping.
> > > > >
> > > > > Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> > > > > Co-developed-by: Atish Patra <atishp@rivosinc.com>
> > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > +description: |
> > > > > +  SBI PMU extension supports allow supervisor software to configure, start &
> > > > > +  stop any performance counter at anytime. Thus, a user can leverage full
> > > > > +  capability of performance analysis tools such as perf if the SBI PMU
> > > > > +  extension is enabled. The OpenSBI implementation makes the following
> > > > > +  assumptions about the hardware platform:
> > > > > +    MCOUNTINHIBIT CSR must be implemented in the hardware. Otherwise, the SBI
> > > > > +    PMU extension will not be enabled.
> > > > > +
> >
> > This is no longer true since OpenSBI commit b28f070. We should remove
> > this from OpenSBI docs as well.
>
> Since you know the detail of it, I volunteer you for that one ;)
>

Done.

> > > > > +    The platform must provide information about PMU event to counter mapping
> > > > > +    via device tree or platform specific hooks. Otherwise, the SBI PMU
> > > > > +    extension will not be enabled.
> > > > > +
> > > > > +    The platforms should provide information about the PMU event selector
> > > > > +    values that should be encoded in the expected value of MHPMEVENTx while
> > > > > +    configuring MHPMCOUNTERx for that specific event. This can be done via a
> > > > > +    device tree or platform specific hooks. The exact value to be written to
> > > > > +    the MHPMEVENTx is completely dependent on the platform. The generic
> > > > > +    platform writes the zero-extended event_idx as the expected value for
> > > > > +    hardware cache/generic events as suggested by the SBI specification.
> > > > > +
> >
> > But the larger question is these are OpenSBI implementation specific
> > assumptions. Should it be included in
> > the DT binding?
>
> Probably not. I'll drop it for v2.
>
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: riscv,pmu
> > > > > +
> > > > > +  riscv,event-to-mhpmevent:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > > > +    description:
> > > > > +      Represents an ONE-to-ONE mapping between a PMU event and the event
> > > > > +      selector value that platform expects to be written to the MHPMEVENTx CSR
> > > > > +      for that event.
> > > > > +      The mapping is encoded in an array format where each row represents an
> > > >
> > > > s/array/matrix/
> > > >
> > > > > +      event. The first element represents the event idx while the second &
> > > > > +      third elements represent the event selector value that should be encoded
> > > > > +      in the expected value to be written in MHPMEVENTx.
> > > > > +      This property shouldn't encode any raw hardware event.
> > > > > +    minItems: 1
> > > > > +    maxItems: 255
> > >
> > > I copied these 255s from dt-schema somewhere as a sane max.
> > > Atish, is there a cap here or should we allow as many as someone likes?
> > > The md binding doesn't mention any limits - is it in the SBI spec?
> > > The strongest wording I saw there was "limited" & event idx is 20 bits
> > > wide as per the spec [0]. Does that make 2^20 the hard limit here?
> > >
> >
> > This is for hardware & cache events. The total number of events
> > defined there are 52 (10 HW + 42 Cache) events.
> > So 255 is a sane max that provides enough room for expansion in future
> > if required.
>
> WFM.
>
> > > > > +  riscv,raw-event-to-mhpmcounters:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > > > +    description:
> > > > > +      Represents an ONE-to-MANY or MANY-to-MANY mapping between the rawevent(s)
> > > > > +      and all the MHPMCOUNTERx in a bitmap format that can be used to monitor
> > > > > +      that raw event.
> > > > > +      The encoding of the raw events are platform specific. The information is
> > > > > +      encoded in an array format where each row represents the specific raw
> > > > > +      event(s). The first element is a 64-bit match value where the invariant
> > > > > +      bits of range of events are set. The second element is a 64-bit mask that
> > > > > +      will have all the variant bits of the range of events cleared. All other
> > > > > +      bits should be set in the mask. The third element is a 32-bit value to
> > > > > +      represent bitmap of all MHPMCOUNTERx that can monitor these set of
> > > > > +      event(s). If a platform directly encodes each raw PMU event as a unique
> > > > > +      ID, the value of select_mask must be 0xffffffff_ffffffff.
> > > > > +    minItems: 1
> > > > > +    maxItems: 255
> > > > > +    items:
> > > > > +      $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +      maxItems: 5
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > >
> > > > I assume at least one of the other properties must be present?
> > >
> > > Atish: (and +CC the OpenSBI list)
> > > Which properties are actually needed here? Or are any? The md binding
> > > in the OpenSBI sources doesn't seem to require anything other than the
> > > compatible?
> > >
> >
> > That's true. Opensbi allows the platform to define functions
> > to provide the mapping. Now that's an OpenSBI implementation thing.
> > Other implementations may choose to use it differently.
>
> In the case where the platform can define functions, the "bare" node
> with just the compatible is still required though in that case, right?
>

Yup.

> Thanks,
> Conor.
>

