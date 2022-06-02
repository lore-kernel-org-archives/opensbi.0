From: Ved Shanbhogue <ved@rivosinc.com>
Date: Thu, 2 Jun 2022 15:01:33 -0500
Subject: [sig-hypervisors] [RISC-V] [tech-unixplatformspec] SBI Debug
 Console Extension Proposal (Draft v1)
In-Reply-To: <alpine.DEB.2.22.394.2206021240390.2783803@ubuntu-linux-20-04-desktop>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
 <CAK9=C2XXu9JpdsTLFiamQkgj_P6titwAohPdgwWUCm-xN8A2kw@mail.gmail.com>
 <5091667.6fTUFtlzNn@diego>
 <3070891.fEcJ0Lxnt5@diego>
 <CAK9=C2WETO-XJxTg1_jCLWaxkMJ8ubKkpeg3xKNnUvtJicrjyA@mail.gmail.com>
 <CAG5apL1PfuCoYOVChaXO2wp93RnUifuxQZq1xebpNvH=BnXxrA@mail.gmail.com>
 <CAK9=C2XB3wBu0agiCfKZzN57waK6-0sq1emjwb2DG5m9V634xw@mail.gmail.com>
 <YpjQkMhoKuoCj/Do@ved-XPS-8940>
 <alpine.DEB.2.22.394.2206021240390.2783803@ubuntu-linux-20-04-desktop>
Message-ID: <YpkXHYwhz8efa6ON@ved-XPS-8940>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>Of course, if a hypervisor is already available for the board, then it
>would be just as easy to use a paravirtualized interface, e.g. Xen's
>HYPERVISOR_console_io hypercall. But somebody has to port the
>hypervisor first :-)
>
Of course a console is needed. But I was questioning the need for something much
more elaborate than a putchar/getchar interface. I understand its needed to port
the hypervisor but I undersatnd it would be needed for very early parts of the 
hypervisor where it does not even have the ability to master a uart on its own.

regards
ved

