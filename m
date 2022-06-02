From: Schwarz, Konrad <konrad.schwarz@siemens.com>
Date: Thu, 2 Jun 2022 12:00:37 +0000
Subject: [sig-hypervisors] SBI Debug Console Extension Proposal (Draft v1)
In-Reply-To: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
Message-ID: <dc89b97c48364769b1bf7bbc51dd440b@siemens.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

> From: sig-hypervisors at lists.riscv.org <sig-hypervisors@lists.riscv.org> On Behalf Of Anup Patel via
> lists.riscv.org
> Subject: [sig-hypervisors] SBI Debug Console Extension Proposal (Draft v1)
> 
> Below is the draft proposal for SBI Debug Console Extension.

Here are my thoughts:

* Guest memory access: I think this would be the first SBI extension to require access to
  guest memory. This needs to be considered carefully, but I think the higher bandwidth afforded by
  the interface is useful enough to allow this.

* API:
	* Currently, only a write interface is provided. It would be much better to have a
	  read/write interface.

        Benefits of this would be to allow a hypervisor to control an OS, e.g., for testing purposes
        or to automate installation tasks.  Inter-guest communication could also be realized
        via such an interface.

	* As the relationship between SBI and OS is the same as OS and user process, an interface
	  in the style of e.g., Unix IO is possible.

        * Global shared memory buffer design and alternatives:

        The API should have per read() or write() parameters for buffer address and length.
	  This makes it easy for different parts of the OS kernel to output strings directly,
	  without requiring thread synchronization of the shared buffer used by the present proposal.
	  A single buffer (i.e., shared memory) will in most SW architectures require an
	  extra copying of the formatted output string into the shared memory region, which
	  would be avoided using per read()/write() call parameters.
        The exact same argument applies to the SBI implementation: a multi-hart machine
	  utilizing a single shared memory block to communicate with S-mode software
        will require m-mode thread synchronization when accessing the block.
        Having only a single shared memory block will lead to scaling problems
        on high hart count machines.

        I see no advantages of the proposed design to dedicate a block of memory to
	  I/O in advance (and no modern API does this).
        The SBI implementation will still need to be prepared to handle
        access faults on each read and write call, there is no amortization of one-time costs
	  regarding address translation or permission checking that I see.  In the H-extension,
        the guest memory access instructions are as effective as possible, for M-mode code,
        I'm sure that efficient access to S-mode virtual addresses is possible as well.
        (Or the convention can be made that addresses are specified as guest-physical,
        which should be avoided if efficient alternatives are available in RISC-V.
        Note that the draft proposal does not speak of this at all).

	  * Multiple device support: a parameter should be allocated to allow the OS to
	  select which of possibly several output devices to utilize, like the "file
	  descriptor" parameter of the POSIX read()/write() interface.

	  This raises the question of binding these file descriptors to physical devices,
        but a start could be made in analogy to Unix (again), where devices 0, 1, 2 are
        assigned to standard in, standard out, and standard error, and in many cases
        will be attached to the same physical device, and that are pre-opened when the
	  OS starts. As in Unix, the semantics of these would be roughly defined,
        but an OS could write out its boot logging strings to 2, and drive an interactive
        console process (such as a shell) from 0 and 1.

	  The question of binding string-valued names to file descriptor (open()) and
	  closing them, etc., could be deferred to a later date and possibly
        be implementation defined.

        * Asynchronicity and flow control: Unix solves this (poorly) via select()
        or the SIGIO signal.  If SBI introduces an interface for this, this will need to
        co-exist with the OS scheduling that is largely driven by the interrupt controller,
	  which is a hard thing to do.

        I think that the SBI interface should
	  be best effort, copying all data from the client immediately (as Unix does):
        when buffer space in the SBI implementation is exhausted,
        it should return short counts; if the SBI client is prepared to wait, a blocking
	  flush call could be added, which returns when some measure space is
        available in the SBI implementation's output buffers (or when input is available).
        
        The existing Unix interfaces for this can again be used as a guide; they
        should be mature enough to cover all relevant cases.

        For highest performance, an S-mode interrupt could be synthesized by the
	  SBI implementation when buffer space is available.

With best regards,
Konrad Schwarz

Siemens AG
T CED SES-DE
Otto-Hahn-Ring 6
81739 Munich, Germany
Phone: +49 (89) 7805-22579
Fax.: +49 (89) 636-33045
Mobile: +49 (1522) 8864636
mailto:konrad.schwarz at siemens.com
www.siemens.com

Siemens Aktiengesellschaft: Chairman of the Supervisory Board: Jim Hagemann Snabe; Managing Board: Roland Busch, Chairman, President and Chief Executive Officer; Cedrik Neike, Matthias Rebellius, Ralf P. Thomas, Judith Wiese; Registered offices: Berlin and Munich, Germany; Commercial registries: Berlin-Charlottenburg, HRB 12300, Munich, HRB 6684; WEEE-Reg.-No. DE 23691322

