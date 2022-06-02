From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Date: Thu, 2 Jun 2022 12:43:26 -0700
Subject: [sig-hypervisors] [RISC-V] [tech-unixplatformspec] SBI Debug
 Console Extension Proposal (Draft v1)
In-Reply-To: <YpjQkMhoKuoCj/Do@ved-XPS-8940>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com> <CAK9=C2XXu9JpdsTLFiamQkgj_P6titwAohPdgwWUCm-xN8A2kw@mail.gmail.com> <5091667.6fTUFtlzNn@diego> <3070891.fEcJ0Lxnt5@diego> <CAK9=C2WETO-XJxTg1_jCLWaxkMJ8ubKkpeg3xKNnUvtJicrjyA@mail.gmail.com>
 <CAG5apL1PfuCoYOVChaXO2wp93RnUifuxQZq1xebpNvH=BnXxrA@mail.gmail.com> <CAK9=C2XB3wBu0agiCfKZzN57waK6-0sq1emjwb2DG5m9V634xw@mail.gmail.com> <YpjQkMhoKuoCj/Do@ved-XPS-8940>
Message-ID: <alpine.DEB.2.22.394.2206021240390.2783803@ubuntu-linux-20-04-desktop>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2 Jun 2022, Vedvyas Shanbhogue via lists.riscv.org wrote:
> > > Based on discussion it did not seem like it needs to be much fancier than
> > > this as this is for early OS/VMM code till it has enough functionality to
> > > directly interact with a uart.
> > 
> > The goal of the shared memory based SBI call for early prints is to
> > minimize the number of traps which in-turn helps virtualization to
> > drastically reduce boot-time.
> > 
> 
> Understand that better now. But if that is the main motivation then
> I am not understanding why we would want to push all of this into
> M-mode firmware vs. defining a set of standardized pv-ops to be used
> by guest OSes.

That is because it is useful to have debug console output when porting a
hypervisor or baremetal code to a new board.

Of course, if a hypervisor is already available for the board, then it
would be just as easy to use a paravirtualized interface, e.g. Xen's
HYPERVISOR_console_io hypercall. But somebody has to port the
hypervisor first :-)

