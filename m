From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Date: Thu, 2 Jun 2022 12:39:50 -0700
Subject: [sig-hypervisors] SBI Debug Console Extension Proposal (Draft
 v1)
In-Reply-To: <dc89b97c48364769b1bf7bbc51dd440b@siemens.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com> <dc89b97c48364769b1bf7bbc51dd440b@siemens.com>
Message-ID: <alpine.DEB.2.22.394.2206021231060.2783803@ubuntu-linux-20-04-desktop>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2 Jun 2022, Schwarz, Konrad via lists.riscv.org wrote:
> Hi Anup,
> 
> > From: sig-hypervisors at lists.riscv.org <sig-hypervisors@lists.riscv.org> On Behalf Of Anup Patel via
> > lists.riscv.org
> > Subject: [sig-hypervisors] SBI Debug Console Extension Proposal (Draft v1)
> > 
> > Below is the draft proposal for SBI Debug Console Extension.
> 
> Here are my thoughts:
> 
> * Guest memory access: I think this would be the first SBI extension to require access to
>   guest memory. This needs to be considered carefully, but I think the higher bandwidth afforded by
>   the interface is useful enough to allow this.

> * API:
> 	* Currently, only a write interface is provided. It would be much better to have a
> 	  read/write interface.
> 
>         Benefits of this would be to allow a hypervisor to control an OS, e.g., for testing purposes
>         or to automate installation tasks.  Inter-guest communication could also be realized
>         via such an interface.
> 

This could be done. As an example Xen provides the hypercall
HYPERVISOR_console_io. The first parameter is the operation:
CONSOLEIO_write or CONSOLEIO_read.

The interface in RISC-V spec language would be something along these
lines:

struct sbiret sbi_debug_console_io(unsigned long operation, /* read or write */
                                   unsigned long address,
                                   unsigned long num_chars)

There is no memory area pre-registration required, however appropriate
checks on the validity of the address provided should always be done in
the implementation.

The good thing about getting rid of the pre-registration is that
multiple threads could make concurrent sbi_debug_console_io requests on
different CPUs.

I think it might be a good idea in the guest-side implementation (e.g.
Linux or Zephyr) to choose a specific memory area for this. However, it
doesn't have to be part of the interface. I think it should be an
implementation detail.

The firmware/hypervisor-side implementation of sbi_debug_console_io
can deal with any addresses provided as long as they are valid.

