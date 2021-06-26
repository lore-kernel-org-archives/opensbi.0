From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sat, 26 Jun 2021 02:56:23 +0100
Subject: [PATCH v3 01/15] docs: Add device tree bindings for SBI PMU
 extension
In-Reply-To: <942A9654-CE8D-4780-8D26-70FF9A9D6977@jrtc27.com>
References: <20210626005721.3600114-1-atish.patra@wdc.com>
 <20210626005721.3600114-2-atish.patra@wdc.com>
 <A08D8045-12C6-489C-87C9-EF76B29598B0@jrtc27.com>
 <CAOnJCUL3ockmTxXsU-ms0BW-B-BcNca_hq9WphNMYRHkaXpaew@mail.gmail.com>
 <AA18A1BF-7BF6-4A15-B527-273FAB14F56F@jrtc27.com>
 <1832B72B-B990-48FE-BFE2-A04AFF62CAE2@jrtc27.com>
 <942A9654-CE8D-4780-8D26-70FF9A9D6977@jrtc27.com>
Message-ID: <AC5F4554-73F9-487C-AE2E-79312C55F79D@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 26 Jun 2021, at 02:50, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> On 26 Jun 2021, at 02:45, Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> On 26 Jun 2021, at 02:44, Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>> 
>>> On 26 Jun 2021, at 02:39, Atish Patra <atishp@atishpatra.org> wrote:
>>>> 
>>>> On Fri, Jun 25, 2021 at 6:01 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>>> 
>>>>> On 26 Jun 2021, at 01:57, Atish Patra <atish.patra@wdc.com> wrote:
>>>>>> 
>>>>>> SBI PMU extension requires a firmware to be aware of the event to
>>>>>> counter/mhpmevent mappings supported by the hardware. One approach
>>>>>> is to encode that information in the device tree.
>>>>>> 
>>>>>> Define a device tree binding that allows a hardware to describe
>>>>>> all the PMU mappings required in concise format.
>>>>>> 
>>>>>> Reviewed-by: Anup Patel <anup.patel@wdc.com>
>>>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>>>> ---
>>>>>> docs/pmu_support.md | 83 +++++++++++++++++++++++++++++++++++++++++++++
>>>>>> 1 file changed, 83 insertions(+)
>>>>>> create mode 100644 docs/pmu_support.md
>>>>>> 
>>>>>> diff --git a/docs/pmu_support.md b/docs/pmu_support.md
>>>>>> new file mode 100644
>>>>>> index 000000000000..8535a1dccbeb
>>>>>> --- /dev/null
>>>>>> +++ b/docs/pmu_support.md
>>>>>> @@ -0,0 +1,83 @@
>>>>>> +OpenSBI SBI PMU extension support
>>>>>> +==================================
>>>>>> +SBI PMU extension supports allow supervisor software to configure/start/stop
>>>>>> +any performance counter at anytime. Thus, an user can leverage full
>>>>>> +capability of performance analysis tools such as perf if SBI PMU extension is
>>>>>> +enabled. The OpenSBI implementation makes the following assumptions about the
>>>>>> +hardware platform.
>>>>>> +
>>>>>> + * MCOUNTINHIBIT CSR must be implemented in the hardware. Otherwise, SBI PMU
>>>>>> +extension will not be enabled.
>>>>>> +
>>>>>> + * The platform must provide information about PMU event to counter mapping
>>>>>> +via device tree or platform specific hooks. Otherwise, SBI PMU extension will
>>>>>> +not be enabled.
>>>>>> +
>>>>>> + * The platforms should provide information about the PMU event selector values
>>>>>> +that should be encoded in the expected value of MHPMEVENTx while configuring
>>>>>> +MHPMCOUNTERx for that specific event. This can be done via a device tree or
>>>>>> +platform specific hooks. The exact value to be written to he MHPMEVENTx is
>>>>>> +completely platform specific. Generic platform writes a default value <xyz> to
>>>>>> +the MHPMEVENTx CSR where <xyz> is formatted as described below.
>>>>>> +```
>>>>>> +     xyz[0:19]    : event_idx
>>>>>> +        xyz[20:XLEN] : event_data[0:(XLEN-20)]
>>>>>> +
>>>>>> +```
>>>>>> +
>>>>>> +SBI PMU Device Tree Bindings
>>>>>> +----------------------------
>>>>>> +
>>>>>> +Platforms may choose to describe PMU event selector and event to counter mapping
>>>>>> +values via device tree. The following sections describes the PMU DT node
>>>>>> +bindings in details.
>>>>>> +
>>>>>> +* **compatible** (Mandatory) - The compatible string of SBI PMU device tree node.
>>>>>> +This DT property must have the value **riscv,pmu**.
>>>>>> +
>>>>>> +* **opensbi,event-to-mhpmevent**(Optional) - It represents an ONE-to-ONE mapping
>>>>>> +between a PMU event and the event selector value that platform expects to be
>>>>>> +written to the MHPMEVENTx CSR for that event. The mapping is encoded in a
>>>>>> +table format where each row represents an event. The first column represent the
>>>>>> +event idx where the 2nd & 3rd column represent the event selector value that
>>>>>> +should be encoded in the expected value to be written in MHPMEVENTx.
>>>>>> +This property shouldn't encode any raw hardware event.
>>>>>> +
>>>>>> +* **opensbi,event-to-counters**(Optional) - It represents a MANY-to-MANY
>>>>>> +mapping between a range of events and all the MHPMCOUNTERx in a bitmap format
>>>>>> +that can be used to monitor these range of events. The information is encoded in
>>>>>> +a table format where each row represent a certain range of events and
>>>>>> +corresponding counters. The first column represents starting of the pmu event id
>>>>>> +and 2nd column represents the end of the pmu event id. The third column
>>>>>> +represent a bitmap of all the MHPMCOUNTERx. This property is mandatory if
>>>>>> +event-to-mhpmevent is present. Otherwise, it can be omitted. This property
>>>>>> +shouldn't encode any raw event.
>>>>>> +
>>>>>> +* **opensbi,raw-event-to-counters**(Optional) - It represents an ONE-to-MANY
>>>>>> +mapping between a raw event and all the MHPMCOUNTERx in a bitmap format that can
>>>>>> +be used to monitor that raw event. The information is encoded in a table format
>>>>>> +where each raw represent a specific raw event. The first column stores the
>>>>>> +expected event selector value that should be encoded in the expected value to be
>>>>>> +written in MHPMEVENTx. The second column stores a bitmap of all the MHPMCOUNTERx
>>>>>> +that can be used for monitoring the specified event.
>>>>>> +
>>>>>> +*Note:* A platform may choose to provide the mapping between event & counters
>>>>>> +via platform hooks rather than the device tree.
>>>>>> +
>>>>>> +### Example
>>>>>> +
>>>>>> +```
>>>>>> +pmu {
>>>>>> +      compatible                     = "riscv,pmu";
>>>>>> +      interrupts                     = <0x100>;
>>>>>> +      interrupt-parent                       = <&plic>
>>>>>> +      opensbi,event-to-mhpmevent     = <0x0000B  0x0000 0x0001>,
>>>>>> +      opensbi,event-to-counters      = <0x00001 0x00001 0x00000001>,
>>>>>> +                                               <0x00002 0x00002 0x00000004>,
>>>>>> +                                               <0x00003 0x0000A 0x00000ff8>,
>>>>>> +                                               <0x10000 0x10033 0x000ff000>,
>>>>>> +      opensbi,raw-event-to-counters  = <0x0000 0x0002 0x00000f8>,
>>>>>> +                                       <0x0000 0x0003 0x00000ff0>,
>>>>> 
>>>>> If this is a generic specification then the node name should not
>>>>> include the implementation-specific opensbi string in the name. If this
>>>>> is not a generic specification then it should not be in riscv-sbi-doc.
>>>>> 
>>>> 
>>>> The DT binding is OpenSBI specific. The SBI specification doesn't say
>>>> anything about how SBI implementation/platform
>>>> wants to encode the counter/event mapping.
>>> 
>>> Other DT-using implementations will need to specify the same thing.
>>> Either they?ll be forced to use opensbi strings, which is wrong, or
>>> they?ll have to invent their own and we have two ways to say the same
>>> thing. If at least one of Xvisor, KVM, RustSBI, Diosix or another SBI
>>> implementation is also using an FDT (which seems highly likely since
>>> ACPI on RISC-V is currently a pie in the sky) and wishing to implement
>>> the PMU extension then it will have to communicate exactly the same
>>> information as OpenSBI here. This is not specific to OpenSBI; it should
>>> be an implementation-agnostic string.
>> 
>> ... and the specification *should* specify the bindings for the FDT,
>> just as we do for things like the PLIC, otherwise it is incomplete and
>> you require platform-specific knowledge to use it, which is precisely
>> what the SBI spec is trying to avoid.
> 
> Well, there or devicetree-source?s Bindings folder, which effectively
> means Linux?s bindings folder. But it needs to be specified and
> appropriately named to not be implementation-specific when it?s an SBI
> implementation-agnostic thing that OpenSBI just happens to implement
> first.

Thinking about this more, why is this even in the device tree? Why is
it not just a separate SBI call to query the information? Once ACPI
exists you?ll have to have two different parsers to get the same thing,
whereas if it?s an SBI call then (a) it?s the same regardless of
whether you?re using an FDT or ACPI (b) the same interface that
receives the numbers tells you them in the first place, rather than
requiring you to magic them up from somewhere else. This just seems
unnecessarily disjoint and not forward thinking with ACPI in mind.

Jess


