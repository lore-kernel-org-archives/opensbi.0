From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Fri, 3 Jun 2022 08:47:02 +0000
Subject: [sig-hypervisors] [RISC-V] [tech-unixplatformspec] SBI Debug
 Console Extension Proposal (Draft v1)
In-Reply-To: <2f93033e0b07411e92384c00722eb742@siemens.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
	 <CAK9=C2XXu9JpdsTLFiamQkgj_P6titwAohPdgwWUCm-xN8A2kw@mail.gmail.com>
	 <5091667.6fTUFtlzNn@diego> <3070891.fEcJ0Lxnt5@diego>
	 <CAK9=C2WETO-XJxTg1_jCLWaxkMJ8ubKkpeg3xKNnUvtJicrjyA@mail.gmail.com>
	 <CAG5apL1PfuCoYOVChaXO2wp93RnUifuxQZq1xebpNvH=BnXxrA@mail.gmail.com>
	 <CAK9=C2XB3wBu0agiCfKZzN57waK6-0sq1emjwb2DG5m9V634xw@mail.gmail.com>
	 <YpjQkMhoKuoCj/Do@ved-XPS-8940>
	 <alpine.DEB.2.22.394.2206021240390.2783803@ubuntu-linux-20-04-desktop>
	 <YpkXHYwhz8efa6ON@ved-XPS-8940>
	 <alpine.DEB.2.22.394.2206021327250.2783803@ubuntu-linux-20-04-desktop>
	 <CA+Qh7TnDUN4kBKJqkeSQoypTm71Sz8QhzqMSE9xVDrre_gGt8w@mail.gmail.com>
	 <alpine.DEB.2.22.394.2206021354290.2783803@ubuntu-linux-20-04-desktop>
	 <CAK9=C2XbTQysZghPa393A7R=y8OhD2Hyg_4iqxNsgJBAGj4O7Q@mail.gmail.com>
	 <2f93033e0b07411e92384c00722eb742@siemens.com>
Message-ID: <bd57d6943d48cf9c7615ec1c043a323474e479ff.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2022-06-03 at 07:49 +0000, Schwarz, Konrad wrote:
> 
> > From:
> > sig-hypervisors at lists.riscv.org?<sig-hypervisors@lists.riscv.org>
> > On Behalf Of Anup Patel via
> > lists.riscv.org
> > Sent: Friday, June 3, 2022 5:01
> 
> > We have legacy SBI v0.1 calls where most of them are replaced by
> > newer SBI v0.2 (or higher) calls. Only the SBI v0.1 putchar() does
> > not
> > have a replacement. This putchar() was being used in various cases
> > for early prints from OSes and bootloaders.
> > 
> > The SBI debug console extension is an attempt to replace the legacy
> > SBI v0.1 putchar(). The use of shared memory in this proposal is
> > motivated by the need to allow users to print multiple characters
> > in
> > one SBI call.
> 
> As I pointed out in an earlier message, the design using a shared
> memory block
> is a hindrance.? Instead, each call should provide a pointer to the
> (virtual)
> address of the character buffer.

I agree

With the current design there is no way for the supervisor software to
reclaim the memory once it has shared it with OpenSBI. We can add a
close() call, but it seems simpler and safer to instead just pass an
address and size to print.

> 
> > The legacy SBI v0.1 also had a getchar() call which is deprecated
> > and
> > does not need any newer SBI call replacing it because it is
> > expected
> > all platforms (including virtual platforms emulated by hypervisors)
> > will
> > have a proper interrupt driver console for supervisor software. The
> > proposed SBI debug console extension only tries to provide a
> > solution
> > for early prints.
> 
> Consider the case where we have more VMs than physical UARTs -- this
> will actually be the norm in most deployments.

In this case you should use virtIO or some other more powerful
interface

> 
> (To counter the argument that the hypervisor can provide virtual
> UARTs
> for its guests, note that a dedicated para-virtualized interface is
> much more
> efficient than trapping individual memory accesses to simulated HW
> registers).

Agreed, but tha seems up to the Hypervisor to implement an effient
virtual UART implementation. For example the Xen HYPERVISOR_console_io
that Stefano mentioned earlier. Plus then we can leverage existing
implementations insted of inveting a another virtual serial device.

> 
> By making the interface a bit richer, as discussed in my earlier
> proposal,
> a hypervisor can cover a much larger set of use cases. 

Which we also then need to support in M-mode firmware. The more complex
the firmware becomes the more exposed it is.

Alistair

> 
> 
> -- 
> Konrad
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1747):
> https://lists.riscv.org/g/tech-unixplatformspec/message/1747
> Mute This Topic: https://lists.riscv.org/mt/91507495/1782774
> Group Owner: tech-unixplatformspec+owner at lists.riscv.org
> Unsubscribe:
> https://lists.riscv.org/g/tech-unixplatformspec/unsub?[alistair.francis at wdc.com
> ]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

