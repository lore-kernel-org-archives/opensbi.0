From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 1 Nov 2022 19:25:05 +0300
Subject: [PATCH RFC v1 1/1] lib: sbi: add support for debug triggers
In-Reply-To: <CAAhSdy3SUVook-K4xMdh7R_dGRF0teo0BThYMreEPMJYHuBWMg@mail.gmail.com>
References: <20221031211859.910439-1-geomatsi@gmail.com>
 <E994763E-172E-4C90-AA97-0F8F899ADF55@jrtc27.com>
 <Y2D7MMfuqDGC3e0X@curiosity>
 <CAAhSdy3SUVook-K4xMdh7R_dGRF0teo0BThYMreEPMJYHuBWMg@mail.gmail.com>
Message-ID: <Y2FIYXGkrWtPIzQm@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > > > RISC-V Debug specification includes Sdtrig ISA extension.
> > > > This extension describes Trigger Module. Triggers can cause
> > > > a breakpoint exception, entry into Debug Mode, or a trace
> > > > action without having to execute a special instruction. For
> > > > native debugging triggers can be used to implement hardware
> > > > breakpoints and watchpoints.
> > > >
> > > > Software support for RISC-V hardware triggers consists of the
> > > > following major components:
> > > > - U-mode: gdb support for setting hw breakpoints/watchpoints
> > > > - S/VS-mode: hardware breakpoints framework in Linux kernel
> > > > - M-mode: SBI firmware code to handle triggers
> > > >
> > > > SBI Debug Trigger extension proposal (draft v4) has been posted
> > > > by Anup Patel to lists.riscv.org tech-debug mailing list:
> > > >
> > > > https://lists.riscv.org/g/tech-debug/topic/92375492
> > > >
> > > > This patch provides initial implementation of SBI Debug
> > > > Trigger Extension in OpenSBI library based on the
> > > > suggested extension proposal.
> > > >
> > > > Initial implementation has the following limitations:
> > > > - only mcontrol6 trigger type is supported
> > > > - no support for chained triggers
> > > > - trigger update supports only address change
> >
> > ...
> >
> > > > +union riscv_dbtr_tdata1 {
> > > > +   unsigned long value;
> > > > +   struct {
> > > > +#if __riscv_xlen == 64
> > > > +           unsigned long data:59;
> > > > +#elif __riscv_xlen == 32
> > > > +           unsigned long data:27;
> > > > +#else
> > > > +#error "Unexpected __riscv_xlen"
> > > > +#endif
> > > > +           unsigned long dmode:1;
> > > > +           unsigned long type:4;
> > > > +   };
> > > > +};
> > >
> > > Bitfield order depends on endianness (type is in the MSBs for
> > > little-endian but LSBs for big-endian).
> >
> > Do we need to support non-standard BE cases as well ? If so, then
> > accessing fields in shared memory messages between OpenSBI and kernel
> > will have to be wrapped by cpu_to_le/le_to_cpu macros on both sides.
> 
> Yes, in the long term we might support BE in both Linux and OpenSBI
> so better to avoid bitfield for data structures in shared memory.

Do we have to avoid using bitfields in this context ?
How about using a Linux approach with appropriate defines:

union riscv_dbtr_tdata1_mcontrol6 {
	unsigned long value;
	struct {
#if defined(__LITTLE_ENDIAN_BITFIELD)
		unsigned long load:1;
		unsigned long store:1;
		...
#elif defined (__BIG_ENDIAN_BITFIELD)
		...
		unsigned long store:1;
		unsigned long load:1;
#endif
	};


Regards,
Sergey

