From: Conor Dooley <conor@kernel.org>
Date: Tue, 27 Dec 2022 20:17:59 +0000
Subject: [PATCH v2] dt-bindings: riscv: add SBI PMU event mappings
In-Reply-To: <8bbe4e7b-ae35-ab68-bb0b-72c201ea1256@sholland.org>
References: <20221227194056.3891216-1-conor@kernel.org>
 <8bbe4e7b-ae35-ab68-bb0b-72c201ea1256@sholland.org>
Message-ID: <Y6tS959TaY2EBAdn@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 27, 2022 at 02:05:01PM -0600, Samuel Holland wrote:
> Hi Conor,
> 
> On 12/27/22 13:40, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > The SBI PMU extension requires a firmware to be aware of the event to
> > counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> > DeviceTree to describe the PMU mappings. This binding is currently
> > described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> > since v7.2.0.
> > 
> > Import the binding for use while validating dtb dumps from QEMU and
> > upcoming hardware (eg JH7110 SoC) that will make use of the event
> > mapping.
> > 
> > Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> > Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc # Performance Monitoring Unit Extension
> > Co-developed-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Changes in v2:
> > - use the schema mechanism for dependancies between properties
> > - +CC perf maintainers...
> > - move the matrix element descriptions into regular item descriptions
> >   rather than doing so freeform in the property description
> > - drop some description text that no longer applies since changes were
> >   made to the SBI spec
> > - drop mention of the "generic platform" which is OpenSBI specific
> > - drop the min/max items from the matrices, they don't appear to be
> >   needed?

> > +  riscv,event-to-mhpmevent:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description:
> > +      Represents an ONE-to-ONE mapping between a PMU event and the event
> > +      selector value that platform expects to be written to the MHPMEVENTx CSR
> > +      for that event.
> > +      The mapping is encoded in an matrix format where each element represents
> > +      an event.
> > +      This property shouldn't encode any raw hardware event.
> > +    items:
> > +      - description: event idx
> 
> It might be good to clarify that this refers specifically to "event_idx"
> from the SBI specification.
> 
> > +      - description: upper 32 bits of the event selector value for MHPMEVENTx
> > +      - description: lower 32 bits of the event selector value for MHPMEVENTx
> 
> Since you are describing the the columns of the matrix here, I believe
> these entries need to go under two levels of "items:". The same applies
> for the other properties.
> 
> > +
> > +  riscv,event-to-mhpmcounters:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description:
> > +      Represents a MANY-to-MANY mapping between a range of events and all the
> > +      MHPMCOUNTERx in a bitmap format that can be used to monitor these range
> > +      of events. The information is encoded in an matrix format where each
> > +      element represents a certain range of events and corresponding counters.
> > +      This property shouldn't encode any raw event.
> > +    items:
> > +      - description: upper 32 bits of the pmu event id
> > +      - description: lower 32 bits of the pmu event id
> 
> These two cells represent the start and end of a range of 32-bit values
> (again the "event_idx" from the SBI specification), not 32-bit
> components of a 64-bit value.

I think this one is me struggling to understand the markdown description
of the binding. Thanks for explaining!

I'll sort the lot out for v3 in a few days.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20221227/5354174a/attachment-0001.sig>
