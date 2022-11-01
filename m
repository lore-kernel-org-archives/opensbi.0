From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 1 Nov 2022 12:39:06 +0300
Subject: [PATCH RFC v1 1/1] lib: sbi: add support for debug triggers
In-Reply-To: <CAEUhbmWDqCtb9ZifTTq2yPR=H_5a70msprvcWAyU3QKDLdMS2w@mail.gmail.com>
References: <20221031211859.910439-1-geomatsi@gmail.com>
 <CAEUhbmWDqCtb9ZifTTq2yPR=H_5a70msprvcWAyU3QKDLdMS2w@mail.gmail.com>
Message-ID: <Y2DpOqSS+5eJOtrJ@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Bin and all,

> > RISC-V Debug specification includes Sdtrig ISA extension.
> > This extension describes Trigger Module. Triggers can cause
> > a breakpoint exception, entry into Debug Mode, or a trace
> > action without having to execute a special instruction. For
> > native debugging triggers can be used to implement hardware
> > breakpoints and watchpoints.
> >
> > Software support for RISC-V hardware triggers consists of the
> > following major components:
> > - U-mode: gdb support for setting hw breakpoints/watchpoints
> > - S/VS-mode: hardware breakpoints framework in Linux kernel
> 
> Do you have WIP patches for gdb and Linux kernel?

Linux RFC patch has been posted for review to linux-riscv mailing list:
https://lore.kernel.org/linux-riscv/20221031213225.912258-1-geomatsi at gmail.com/T/#u

GDB support is a work in progress at the moment. Patches have not yet
been posted.

> > - M-mode: SBI firmware code to handle triggers
> >
> > SBI Debug Trigger extension proposal (draft v4) has been posted
> > by Anup Patel to lists.riscv.org tech-debug mailing list:
> >
> > https://lists.riscv.org/g/tech-debug/topic/92375492
> 
> I believe this patch won't be merged until the SBI spec has been ratified?

I think so. Besides, RISC-V Debug Support specificaton v1.0.0 has not yet
been ratified as well. So both Debug Support spec and SBI Debug Trigger
extension need to be ratified before the support for hardware breakpoints
can be merged into Linux and OpenSBI.

> > This patch provides initial implementation of SBI Debug
> > Trigger Extension in OpenSBI library based on the
> > suggested extension proposal.
> >
> > Initial implementation has the following limitations:
> > - only mcontrol6 trigger type is supported
> 
> I would suggest add type 2 trigger support too, since it's the one
> that SiFive FU540/740 supports.

Agree. RISC-V Debug spec v1.0.0 recommends to use type 6 trigger in
newer implementations. But if this type is not supported, we should
be able to fall back to type 2 triggers.

> > - no support for chained triggers
> > - trigger update supports only address change
> >
> > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > ---
> >  include/sbi/riscv_dbtr.h          |  78 ++++++
> >  include/sbi/riscv_encoding.h      |   1 +
> >  include/sbi/sbi_dbtr.h            |  79 ++++++
> >  include/sbi/sbi_ecall_interface.h |  10 +
> >  lib/sbi/Kconfig                   |   4 +
> >  lib/sbi/objects.mk                |   3 +
> >  lib/sbi/sbi_dbtr.c                | 404 ++++++++++++++++++++++++++++++
> >  lib/sbi/sbi_ecall_dbtr.c          |  68 +++++
> >  lib/sbi/sbi_init.c                |   9 +
> >  9 files changed, 656 insertions(+)
> >  create mode 100644 include/sbi/riscv_dbtr.h
> >  create mode 100644 include/sbi/sbi_dbtr.h
> >  create mode 100644 lib/sbi/sbi_dbtr.c
> >  create mode 100644 lib/sbi/sbi_ecall_dbtr.c
> >
> 
> Regards,
> Bin

Regards,
Sergey

