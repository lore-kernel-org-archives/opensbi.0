From: Samuel Holland <samuel@sholland.org>
Date: Sat, 29 Oct 2022 10:51:15 -0500
Subject: [PATCH v4 08/14] lib: utils/timer: Add Andes fdt timer support
In-Reply-To: <CAOnJCUK0wm3igL1F0wq1M1YwJjCVs82fJG0Wh8ZmzePxS9qywQ@mail.gmail.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
 <20221014003252.17765-9-peterlin@andestech.com>
 <43cddb0a-934c-a020-f7d4-dcc5ef0401f3@sholland.org>
 <CAAhSdy2diaow70xY-f9Kd2sMGapetcJrrSzZqvpno+29AsiXHw@mail.gmail.com>
 <CAOnJCUK0wm3igL1F0wq1M1YwJjCVs82fJG0Wh8ZmzePxS9qywQ@mail.gmail.com>
Message-ID: <6f8384ed-4a2c-e024-c1b9-3e8f4e3a6fd1@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/21/22 01:01, Atish Patra wrote:
> On Thu, Oct 20, 2022 at 10:12 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Mon, Oct 17, 2022 at 12:45 AM Samuel Holland <samuel@sholland.org> wrote:
>>>
>>> On 10/13/22 19:32, Yu Chien Peter Lin wrote:
>>>> Since we can get the PLMT base address and timer frequency from
>>>> device tree, move plmt timer device to fdt timer framework.
>>>>
>>>> dts example (Quad-core AX45MP):
>>>>
>>>>   cpus {
>>>>       ...
>>>>       timebase-frequency = <0x3938700>;
>>>>       ...
>>>>   }
>>>>   soc {
>>>>       ...
>>>>       plmt0 at e6000000 {
>>>>           compatible = "andestech,plmt0";
>>>>           reg = <0x00 0xe6000000 0x00 0x100000>;
>>>>           interrupts-extended = <&cpu0_intc 0x07
>>>>                                  &cpu1_intc 0x07
>>>>                                  &cpu2_intc 0x07
>>>>                                  &cpu3_intc 0x07>;
>>>>       };
>>>>       ...
>>>>   }
>>>
>>> Where is the binding for this compatible string? I do not see anything
>>> either upstream or downstream:
>>>
>>> https://lore.kernel.org/linux-devicetree/?q=andestech%2Cplmt0
>>> https://github.com/andestech/linux/commits/RISCV-Linux-5.4-ast-v5_1_0-branch/Documentation/devicetree/bindings
>>>
>>> We really shouldn't be accepting any devicetree compatible unless a YAML
>>> binding for it exists, ideally one acked by the DT schema maintainers.
>>>
>>
>> Ideally, we should only accept patches for which DT bindings
>> have been accepted in kernel but at the moment we are not
>> strict about this as long as:
>> 1) It does not affect other platforms
>> 2) The platform/SoC vendor are willing to keep things up-to-date
>>     whenever DT bindings are merged in kernel
>>
>> I am still not sure about from which OpenSBI release we should
>> change our patch acceptance policy and mandate DT bindings to
>> be present in the kernel.
>>
> 
> That should be the policy for drivers present in the kernel. However,
> there may be some other driver
> that only operates in M-mode and may not need to be present in the kernel.
> 
> The SBI PMU extension also falls into this category. The DT bindings
> have to be maintained in the OpenSBI
> as the kernel driver doesn't need to be aware of PMU DT bindings.

Bindings still need to be in the Linux kernel (or dt-schema) repository
for several reasons. Most importantly, the DT maintainers there provide
a thorough review and enforce backward compatibility. If a binding is
only documented in some downstream repository, there is nothing ensuring
its validity or stability. Bindings hosted elsewhere cannot be trusted.

Linux is the de facto "upstream" for both devicetrees and DT bindings,
even when no Linux driver exists. U-Boot's policy is to use DTS files
from Linux verbatim. When using the standard U-Boot boot flow, that
devicetree is passed at runtime from U-Boot SPL to OpenSBI. That means
any (static) node used by either U-Boot or OpenSBI needs to be in the
Linux DTS. And any node in the Linux DTS needs to have its binding
documented in the Linux repository (or the dt-schema repository).

See for example the U-Boot patch driven by this very thread:
https://lore.kernel.org/u-boot/20221025150350.19300-1-peterlin at andestech.com/

The drivers in OpenSBI consume DT nodes which are provided by U-Boot. So
unless the bindings are upstreamed and can be considered stable, we have
now introduced a version dependency between OpenSBI and U-Boot.

Finally, Linux supports running in M-mode. And so does U-Boot, which
again takes its DTSs from Linux. So a device being limited to M-mode is
not a good reason to exclude it from the Linux DTS or DT bindings.

Regards,
Samuel


