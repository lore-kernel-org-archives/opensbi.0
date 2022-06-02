From: Ved Shanbhogue <ved@rivosinc.com>
Date: Thu, 2 Jun 2022 16:05:06 -0500
Subject: [sig-hypervisors] [RISC-V] [tech-unixplatformspec] SBI Debug
 Console Extension Proposal (Draft v1)
In-Reply-To: <CA+Qh7TnDUN4kBKJqkeSQoypTm71Sz8QhzqMSE9xVDrre_gGt8w@mail.gmail.com>
References: <5091667.6fTUFtlzNn@diego>
 <3070891.fEcJ0Lxnt5@diego>
 <CAK9=C2WETO-XJxTg1_jCLWaxkMJ8ubKkpeg3xKNnUvtJicrjyA@mail.gmail.com>
 <CAG5apL1PfuCoYOVChaXO2wp93RnUifuxQZq1xebpNvH=BnXxrA@mail.gmail.com>
 <CAK9=C2XB3wBu0agiCfKZzN57waK6-0sq1emjwb2DG5m9V634xw@mail.gmail.com>
 <YpjQkMhoKuoCj/Do@ved-XPS-8940>
 <alpine.DEB.2.22.394.2206021240390.2783803@ubuntu-linux-20-04-desktop>
 <YpkXHYwhz8efa6ON@ved-XPS-8940>
 <alpine.DEB.2.22.394.2206021327250.2783803@ubuntu-linux-20-04-desktop>
 <CA+Qh7TnDUN4kBKJqkeSQoypTm71Sz8QhzqMSE9xVDrre_gGt8w@mail.gmail.com>
Message-ID: <YpkmAkGcS2qzSX2K@ved-XPS-8940>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 02, 2022 at 01:50:01PM -0700, Greg Favor wrote:
>On Thu, Jun 2, 2022 at 1:29 PM Stefano Stabellini <
>stefano.stabellini at xilinx.com> wrote:
>
>> On Thu, 2 Jun 2022, Vedvyas Shanbhogue via lists.riscv.org wrote:
>> > Of course a console is needed. But I was questioning the need for
>> something much
>> > more elaborate than a putchar/getchar interface. I understand its needed
>> to port
>> > the hypervisor but I undersatnd it would be needed for very early parts
>> of the
>> > hypervisor where it does not even have the ability to master a uart on
>> its own.
>>
>> Yeah, I think you are right that it is not a must-have feature but a
>> nice-to-have feature.
>
>
>Even though we all (me included) tend to think that slowing down something
>like this will be inconsequential to the time to boot and/or who cares how
>fast or slow is boot time, in the past I have found that to be a risky
>presumption in certain production environments where boot time matters
>(especially with frequent standing up of VMs from scratch).  So a
>worthwhile sanity check question would be 1) what percentage of early boot
>time is spent writing to the console with per-string SBI calls, and 2) by
>what order of magnitude does that percentage inflate due to SBI calls for
>every individual character.
>
I think the extension was proposed to be a Debug console extension.

In a production environment if 10's of VMs were booting having them emit
to the physical console - where all of those outputs will get interspersed
seems to be not so useful. In a production environment would we expect the
VMM to provide a console service and not need SBI calls into M-mode firmare
to emit VM output to a physical console?

I was thinking this was about early boot debug and not so much about needing
a console at early boot. In most production deployments there may not be 
someone sitting at a terminal watching prints and so it may make more sense
for VM console outputs to be logged into a persistent file somewhere for example.
Or be held in the VM itself - e.g. a kernel ring buffer that someone may want
to display using a tool like dmesg when needed but otherwise does not get 
emitted chattily to a physical console.

Hope I am understanding this right.

regards
ved

