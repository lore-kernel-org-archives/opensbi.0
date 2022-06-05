From: Schwarz, Konrad <konrad.schwarz@siemens.com>
Date: Sun, 5 Jun 2022 14:56:17 +0000
Subject: [sig-hypervisors] [RISC-V] [tech-unixplatformspec] SBI Debug
 Console Extension Proposal (Draft v1)
In-Reply-To: <bd57d6943d48cf9c7615ec1c043a323474e479ff.camel@wdc.com>
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
 <bd57d6943d48cf9c7615ec1c043a323474e479ff.camel@wdc.com>
Message-ID: <d38afd171c164548a4f66e85fa1b9e50@siemens.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit




> -----Original Message-----
> From: Alistair Francis <Alistair.Francis@wdc.com>
> Sent: Friday, June 3, 2022 10:47
> > Consider the case where we have more VMs than physical UARTs -- this
> > will actually be the norm in most deployments.
> 
> In this case you should use virtIO or some other more powerful
> interface
> 
> >
> > (To counter the argument that the hypervisor can provide virtual
> > UARTs
> > for its guests, note that a dedicated para-virtualized interface is
> > much more
> > efficient than trapping individual memory accesses to simulated HW
> > registers).
> 
> Agreed, but tha seems up to the Hypervisor to implement an effient
> virtual UART implementation. For example the Xen HYPERVISOR_console_io
> that Stefano mentioned earlier. Plus then we can leverage existing
> implementations insted of inveting a another virtual serial device.

But this makes it incumbent on each hypervisor to provide such an
interface, and requires each OS to provide drivers for each
hypervisor it knows about.  You then have an N:M situation,
which is bad for the RISC-V platform.

> > By making the interface a bit richer, as discussed in my earlier
> > proposal,
> > a hypervisor can cover a much larger set of use cases.
> 
> Which we also then need to support in M-mode firmware. The more complex
> the firmware becomes the more exposed it is.

The same argument applies to hypervisors. What fundamental difference
between M-mode and HS-mode software is there that makes the risk
so much different?

An implementation wishing to minimize its responsibilities can
always return run-time errors for functionality it does not
wish to support.

-- 
Konrad
