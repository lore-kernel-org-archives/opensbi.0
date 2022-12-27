From: Samuel Holland <samuel@sholland.org>
Date: Tue, 27 Dec 2022 14:05:01 -0600
Subject: [PATCH v2] dt-bindings: riscv: add SBI PMU event mappings
In-Reply-To: <20221227194056.3891216-1-conor@kernel.org>
References: <20221227194056.3891216-1-conor@kernel.org>
Message-ID: <8bbe4e7b-ae35-ab68-bb0b-72c201ea1256@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Conor,

On 12/27/22 13:40, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The SBI PMU extension requires a firmware to be aware of the event to
> counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> DeviceTree to describe the PMU mappings. This binding is currently
> described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> since v7.2.0.
> 
> Import the binding for use while validating dtb dumps from QEMU and
> upcoming hardware (eg JH7110 SoC) that will make use of the event
> mapping.
> 
> Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc # Performance Monitoring Unit Extension
> Co-developed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - use the schema mechanism for dependancies between properties
> - +CC perf maintainers...
> - move the matrix element descriptions into regular item descriptions
>   rather than doing so freeform in the property description
> - drop some description text that no longer applies since changes were
>   made to the SBI spec
> - drop mention of the "generic platform" which is OpenSBI specific
> - drop the min/max items from the matrices, they don't appear to be
>   needed?
> ---
>  .../devicetree/bindings/perf/riscv,pmu.yaml   | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> new file mode 100644
> index 000000000000..b50b69ed4599
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/riscv,pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V SBI PMU events
> +
> +maintainers:
> +  - Atish Patra <atishp@rivosinc.com>
> +
> +description: |
> +  SBI PMU extension supports allow supervisor software to configure, start &
> +  stop any performance counter at anytime. Thus, a user can leverage full
> +  capability of performance analysis tools such as perf if the SBI PMU
> +  extension is enabled. The OpenSBI implementation makes the following
> +  assumptions about the hardware platform:
> +
> +    The platform must provide information about PMU event to counter mapping
> +    via device tree or platform specific hooks. Otherwise, the SBI PMU
> +    extension will not be enabled.
> +
> +    The platforms should provide information about the PMU event selector
> +    values that should be encoded in the expected value of MHPMEVENTx while
> +    configuring MHPMCOUNTERx for that specific event. This can be done via a
> +    device tree or platform specific hooks. The exact value to be written to
> +    the MHPMEVENTx is completely dependent on the platform.
> +
> +    For information on the SBI spec see:
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
> +
> +properties:
> +  compatible:
> +    const: riscv,pmu
> +
> +  riscv,event-to-mhpmevent:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description:
> +      Represents an ONE-to-ONE mapping between a PMU event and the event
> +      selector value that platform expects to be written to the MHPMEVENTx CSR
> +      for that event.
> +      The mapping is encoded in an matrix format where each element represents
> +      an event.
> +      This property shouldn't encode any raw hardware event.
> +    items:
> +      - description: event idx

It might be good to clarify that this refers specifically to "event_idx"
from the SBI specification.

> +      - description: upper 32 bits of the event selector value for MHPMEVENTx
> +      - description: lower 32 bits of the event selector value for MHPMEVENTx

Since you are describing the the columns of the matrix here, I believe
these entries need to go under two levels of "items:". The same applies
for the other properties.

> +
> +  riscv,event-to-mhpmcounters:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description:
> +      Represents a MANY-to-MANY mapping between a range of events and all the
> +      MHPMCOUNTERx in a bitmap format that can be used to monitor these range
> +      of events. The information is encoded in an matrix format where each
> +      element represents a certain range of events and corresponding counters.
> +      This property shouldn't encode any raw event.
> +    items:
> +      - description: upper 32 bits of the pmu event id
> +      - description: lower 32 bits of the pmu event id

These two cells represent the start and end of a range of 32-bit values
(again the "event_idx" from the SBI specification), not 32-bit
components of a 64-bit value.

Regards,
Samuel

> +      - description: bitmap of MHPMCOUNTERx for this event
> +
> +  riscv,raw-event-to-mhpmcounters:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description:
> +      Represents an ONE-to-MANY or MANY-to-MANY mapping between the rawevent(s)
> +      and all the MHPMCOUNTERx in a bitmap format that can be used to monitor
> +      that raw event.
> +      The encoding of the raw events are platform specific. The information is
> +      encoded in a matrix format where each element represents the specific raw
> +      event(s).
> +      If a platform directly encodes each raw PMU event as a unique ID, the
> +      value of variant must be 0xffffffff_ffffffff.
> +    items:
> +      - description:
> +          upper 32 invariant bits for the range of events
> +      - description:
> +          lower 32 invariant bits for the range of events
> +      - description:
> +          upper 32 bits of the variant bit mask for the range of events
> +      - description:
> +          lower 32 bits of the variant bit mask for the range of events
> +      - description:
> +          bitmap of all MHPMCOUNTERx that can monitor the range of events
> +
> +dependencies:
> +  "riscv,event-to-mhpmevent": [ "riscv,event-to-mhpmcounters" ]
> +  "riscv,event-to-mhpmcounters": [ "riscv,event-to-mhpmevent" ]
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmu {
> +        compatible = "riscv,pmu";
> +        riscv,event-to-mhpmevent = <0x0000B 0x0000 0x0001>;
> +        riscv,event-to-mhpmcounters = <0x00001 0x00001 0x00000001>,
> +                                      <0x00002 0x00002 0x00000004>,
> +                                      <0x00003 0x0000A 0x00000ff8>,
> +                                      <0x10000 0x10033 0x000ff000>;
> +        riscv,raw-event-to-mhpmcounters =
> +            /* For event ID 0x0002 */
> +            <0x0000 0x0002 0xffffffff 0xffffffff 0x00000f8>,
> +            /* For event ID 0-4 */
> +            <0x0 0x0 0xffffffff 0xfffffff0 0x00000ff0>,
> +            /* For event ID 0xffffffff0000000f - 0xffffffff000000ff */
> +            <0xffffffff 0x0 0xffffffff 0xffffff0f 0x00000ff0>;
> +    };
> +
> +  - |
> +    /*
> +     * For HiFive Unmatched board the encodings can be found here
> +     * https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf
> +     * This example also binds standard SBI PMU hardware id's to U74 PMU event
> +     * codes, U74 uses a bitfield for events encoding, so several U74 events
> +     * can be bound to single perf id.
> +     * See SBI PMU hardware id's in OpenSBI's include/sbi/sbi_ecall_interface.h
> +     */
> +    pmu {
> +          compatible = "riscv,pmu";
> +          riscv,event-to-mhpmevent =
> +              /* SBI_PMU_HW_CACHE_REFERENCES -> Instruction or Data cache/ITIM busy */
> +              <0x00003 0x00000000 0x1801>,
> +              /* SBI_PMU_HW_CACHE_MISSES -> Instruction or Data cache miss or MMIO access */
> +              <0x00004 0x00000000 0x0302>,
> +              /* SBI_PMU_HW_BRANCH_INSTRUCTIONS -> Conditional branch retired */
> +              <0x00005 0x00000000 0x4000>,
> +              /* SBI_PMU_HW_BRANCH_MISSES -> Branch or jump misprediction */
> +              <0x00006 0x00000000 0x6001>,
> +              /* L1D_READ_MISS -> Data cache miss or MMIO access */
> +              <0x10001 0x00000000 0x0202>,
> +              /* L1D_WRITE_ACCESS -> Data cache write-back */
> +              <0x10002 0x00000000 0x0402>,
> +              /* L1I_READ_ACCESS -> Instruction cache miss */
> +              <0x10009 0x00000000 0x0102>,
> +              /* LL_READ_MISS -> UTLB miss */
> +              <0x10011 0x00000000 0x2002>,
> +              /* DTLB_READ_MISS -> Data TLB miss */
> +              <0x10019 0x00000000 0x1002>,
> +              /* ITLB_READ_MISS-> Instruction TLB miss */
> +              <0x10021 0x00000000 0x0802>;
> +          riscv,event-to-mhpmcounters = <0x00003 0x00006 0x18>,
> +                                        <0x10001 0x10002 0x18>,
> +                                        <0x10009 0x10009 0x18>,
> +                                        <0x10011 0x10011 0x18>,
> +                                        <0x10019 0x10019 0x18>,
> +                                        <0x10021 0x10021 0x18>;
> +          riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0x18>,
> +                                            <0x0 0x1 0xffffffff 0xfff800ff 0x18>,
> +                                            <0x0 0x2 0xffffffff 0xffffe0ff 0x18>;
> +    };


