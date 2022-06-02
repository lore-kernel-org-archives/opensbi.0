From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Date: Thu, 2 Jun 2022 14:05:47 -0700
Subject: [sig-hypervisors] [RISC-V] [tech-unixplatformspec] SBI Debug
 Console Extension Proposal (Draft v1)
In-Reply-To: <CA+Qh7TnDUN4kBKJqkeSQoypTm71Sz8QhzqMSE9xVDrre_gGt8w@mail.gmail.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com> <CAK9=C2XXu9JpdsTLFiamQkgj_P6titwAohPdgwWUCm-xN8A2kw@mail.gmail.com> <5091667.6fTUFtlzNn@diego> <3070891.fEcJ0Lxnt5@diego> <CAK9=C2WETO-XJxTg1_jCLWaxkMJ8ubKkpeg3xKNnUvtJicrjyA@mail.gmail.com>
 <CAG5apL1PfuCoYOVChaXO2wp93RnUifuxQZq1xebpNvH=BnXxrA@mail.gmail.com> <CAK9=C2XB3wBu0agiCfKZzN57waK6-0sq1emjwb2DG5m9V634xw@mail.gmail.com> <YpjQkMhoKuoCj/Do@ved-XPS-8940> <alpine.DEB.2.22.394.2206021240390.2783803@ubuntu-linux-20-04-desktop>
 <YpkXHYwhz8efa6ON@ved-XPS-8940> <alpine.DEB.2.22.394.2206021327250.2783803@ubuntu-linux-20-04-desktop> <CA+Qh7TnDUN4kBKJqkeSQoypTm71Sz8QhzqMSE9xVDrre_gGt8w@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206021354290.2783803@ubuntu-linux-20-04-desktop>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2 Jun 2022, Greg Favor wrote:
> On Thu, Jun 2, 2022 at 1:29 PM Stefano Stabellini <stefano.stabellini@xilinx.com> wrote:
>       On Thu, 2 Jun 2022, Vedvyas Shanbhogue via lists.riscv.org wrote:
>       > Of course a console is needed. But I was questioning the need for something much
>       > more elaborate than a putchar/getchar interface. I understand its needed to port
>       > the hypervisor but I undersatnd it would be needed for very early parts of the
>       > hypervisor where it does not even have the ability to master a uart on its own.
> 
>       Yeah, I think you are right that it is not a must-have feature but a
>       nice-to-have feature.
> 
> 
> Even though we all (me included) tend to think that slowing down something like this will be inconsequential to the time to boot and/or who
> cares how fast or slow is boot?time, in the past I have found that to be a risky presumption in certain production environments where boot
> time matters (especially with frequent standing up of VMs from scratch).? So a worthwhile sanity check question would be 1) what percentage
> of early boot time is spent writing to the console with per-string SBI calls, and 2) by what order of magnitude does that percentage
> inflate due to SBI calls for every individual character.

The numbers you asked will help but I just wanted to add that in my
opinion a per-character putchar interface is not suitable for production
due to the reasons you mentioned. I would compile it out in non-DEBUG
builds.

On the other hand the per-string print interface might be usable in
production, even not just early boot. However, of course, a proper UART
driver would be even better.

This is why I think it is nice to have: it expands the potential uses of
the SBI console interface, and it is simple and easy to use. At the same
time it is not a must-have because you could get away with just putchat
in early boot for DEBUG builds, and nothing + UART driver in non-DEBUG
builds.

That is why I am in favor of this addition, although I recognize it is
not critical.
