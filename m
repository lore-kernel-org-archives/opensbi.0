From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 9 Jan 2023 00:02:16 -0800
Subject: [PATCH v3] dt-bindings: riscv: add SBI PMU event mappings
In-Reply-To: <Y7s2+McYXLeEMNck@spud>
References: <20230102165551.1564960-1-conor@kernel.org> <20230103092816.w6hknvd4caeahdo4@orel>
 <Y7s2+McYXLeEMNck@spud>
Message-ID: <CAHBxVyHUPPakb3djAuJMkRjXOew9+PC6nARv+RT-GrMWPdCRGw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 8, 2023 at 1:34 PM Conor Dooley <conor@kernel.org> wrote:
>
> Drew, Atish,
>
> Mainly just a question about the OpenSBI doc at the end. Gonna fix up
> the rest of the wording and resend in a few.
>
> On Tue, Jan 03, 2023 at 10:28:16AM +0100, Andrew Jones wrote:
> > On Mon, Jan 02, 2023 at 04:55:51PM +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > The SBI PMU extension requires a firmware to be aware of the event to
> > > counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> > > DeviceTree to describe the PMU mappings. This binding is currently
> > > described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> > > since v7.2.0.
> > >
> > > Import the binding for use while validating dtb dumps from QEMU and
> > > upcoming hardware (eg JH7110 SoC) that will make use of the event
> > > mapping.
> > >
> > > Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> > > Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc # Performance Monitoring Unit Extension
> > > Co-developed-by: Atish Patra <atishp@rivosinc.com>
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> > > +  riscv,event-to-mhpmevent:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    description:
> > > +      Represents an ONE-to-ONE mapping between a PMU event and the event
> > > +      selector value that platform expects to be written to the MHPMEVENTx CSR
> >                             ^ the
>
> I think this one is arguable, it makes sense both ways IMO. I don't care
> since it's not my prose though ;)
>
> > > +      for that event.
> > > +      The mapping is encoded in an matrix format where each element represents
> > > +      an event.
> > > +      This property shouldn't encode any raw hardware event.
> > > +    items:
> > > +      items:
> > > +        - description: event_idx, a 20-bit wide encoding of the event type and
> > > +            code. Refer to the SBI specification for a complete description of
> > > +            the event types and codes.
> > > +        - description: upper 32 bits of the event selector value for MHPMEVENTx
> > > +        - description: lower 32 bits of the event selector value for MHPMEVENTx
> >
> > > +     * codes, U74 uses a bitfield for events encoding, so several U74 events
> > > +     * can be bound to single perf id.
> >                                 ^ a   ID
> >
> > > +     * See SBI PMU hardware id's in OpenSBI's include/sbi/sbi_ecall_interface.h
> >
> > IDs
>
> Most of this stuff comes directly from the doc in OpenSBI that I
> copy-pasted. Atish, what do you wanna do once the binding is upstream
> about the original doc?
>

I will fixup the doc based on the final version of the binding once it
is upstream.

> Thanks,
> Conor.
>

