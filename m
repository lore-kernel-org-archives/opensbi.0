From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 11 Aug 2023 03:05:28 +0100
Subject: [PATCH] docs/platform: thead-c9xx: Improve the documentation
In-Reply-To: <CAJF2gTQhH2ju1kjaS5hgygQAhTFBKLFvJ1j7626hyE00HZTRow@mail.gmail.com>
References: <20230808132958.1097873-1-guoren@kernel.org>
 <ZNURXBKkYdiWLanf@xhacker> <0783057A-9D05-4ED9-8246-135A6641565D@jrtc27.com>
 <CAJF2gTQhH2ju1kjaS5hgygQAhTFBKLFvJ1j7626hyE00HZTRow@mail.gmail.com>
Message-ID: <FD240B24-B8F8-4D7B-9036-EFFE70D68BA8@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11 Aug 2023, at 03:01, Guo Ren <guoren@kernel.org> wrote:
> 
> On Fri, Aug 11, 2023 at 8:42?AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> On 10 Aug 2023, at 17:33, Jisheng Zhang <jszhang@kernel.org> wrote:
>>> 
>>> On Tue, Aug 08, 2023 at 09:29:58AM -0400, guoren at kernel.org wrote:
>>>> From: Guo Ren <guoren@linux.alibaba.com>
>>>> 
>>>> Add detailed information about thead,reset-sample driver, and improve
>>>> usage documentation.
>>>> 
>>>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>>>> Signed-off-by: Guo Ren <guoren@kernel.org>
>>>> ---
>>>> docs/platform/thead-c9xx.md | 87 ++++++++++++++++++++++++++++---------
>>>> 1 file changed, 67 insertions(+), 20 deletions(-)
>>>> 
>>>> diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
>>>> index 8bb9e91f1a9b..fe05fc5bb85a 100644
>>>> --- a/docs/platform/thead-c9xx.md
>>>> +++ b/docs/platform/thead-c9xx.md
>>>> @@ -1,8 +1,8 @@
>>>> -T-HEAD C9xx Series Processors
>>>> -=============================
>>>> +T-HEAD Processors
>>>> +=================
>>>> 
>>>> -The **C9xx** series processors are high-performance RISC-V architecture
>>>> -multi-core processors with AI vector acceleration engine.
>>>> +T-HEAD provides high-performance RISC-V architecture multi-core
>>>> +processors with AI vector acceleration engine.
>>>> 
>>>> For more details, refer [T-HEAD.CN](https://www.t-head.cn/)
>>>> 
>>>> @@ -12,15 +12,75 @@ To build the platform-specific library and firmware images, provide the
>>>> Platform Options
>>>> ----------------
>>>> 
>>>> -The *T-HEAD C9xx* does not have any platform-specific compile options
>>>> +The *T-HEAD CPU* does not have any platform-specific compile options
>>>> because it uses generic platform.
>>>> 
>>>> ```
>>>> CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic /usr/bin/make
>>>> ```
>>>> 
>>>> -The *T-HEAD C9xx* DTB provided to OpenSBI generic firmwares will usually have
>>>> -"riscv,clint0", "riscv,plic0", "thead,reset-sample" compatible strings.
>>>> +The *T-HEAD CPU* DTB provided to OpenSBI generic firmwares will usually have
>>>> +"thead,reset-sample" compatible strings. The "thead,reset-sample" is a T-HEAD
>>>> +custom driver for the SMP system bootup; the single-core system doesn't need
>>>> +it.
>>>> +
>>>> +T-HEAD Fdt Reset Driver Introduction
>>>> +------------------------------------
>>>> +
>>>> +Every T-HEAD CPU provides a reset control signal and reset address signals.
>>>> + - Reset address signal determines CPU where to start up.
>>>> + - Reset control signal releases CPU from reset state and begins to execute
>>>> +   at reset address.
>>>> +
>>>> +Many vendors would gather these signals into SoC control registers. These
>>>> +register designs are similar but with different base addresses and bits
>>>> +definitions. We only provide standard opensbi, Linux binaries, and jtag gdbinit
>>>> +script to simplify Linux booting at the FPGA stage. The fdt reset driver helps
>>>> +users bring up their SMP system quickly with the below settings:
>>> 
>>> +DT maintainers and DT list.
>>> 
>>> I can submit a dt-binding for this if DT maintainers agree with below
>>> properties. Could you please help review?
>> 
>> I thought this was already discussed on the OpenSBI list 2 months ago,
>> and received pretty negative feedback.
> Yes, we want to correct all DT grammar & compile problems, and make it
> legal first and try again. I thought every vendor has their own choice
> of how to deliver their hardware support. The motivation of this
> driver is to ease the delivery of T-HEAD CPU cores on different
> platforms; people only need three things: jtag_init_script & opensbi &
> linux_Image, then they could boot on their own FPGA prototype
> platform, and they needn't prepare any software stuff, all the generic
> binaries could be directly used. The th1520 could be a good example
> for them. That's why we consistently push this thing.

What?s changed to make people say yes rather than no this time?

I for one will not give positive feedback for self-modifying code in my
firmware (outside of the necessary self-relocation at startup before
the PMP is enabled).

Jess


