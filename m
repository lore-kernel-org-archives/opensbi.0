From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Feb 2023 09:55:06 +0530
Subject: [PATCH v5 5/8] lib: sbi: Implement SBI debug console extension
In-Reply-To: <20230201093558.ty5emxqvl5vrdfg3@orel>
References: <20230113114110.1916226-1-apatel@ventanamicro.com>
 <20230113114110.1916226-6-apatel@ventanamicro.com> <20230201093558.ty5emxqvl5vrdfg3@orel>
Message-ID: <CAAhSdy3uL_O+BCqvA-A3W72UVziHVJMBU=xqAj_zNqyxd5diHA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 1, 2023 at 3:06 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Jan 13, 2023 at 05:11:07PM +0530, Anup Patel wrote:
> > We implement SBI debug console extension as one of the replacement
> > SBI extensions. This extension is only available when OpenSBI platform
> > provides a console device to generic library.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > Reviewed-by: Xiang W <wxjstz@126.com>
> > Reviewed-by: Bin Meng <bmeng@tinylab.org>
> > ---
> >  lib/sbi/Kconfig          |  4 +++
> >  lib/sbi/objects.mk       |  3 ++
> >  lib/sbi/sbi_ecall_dbcn.c | 72 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 79 insertions(+)
> >  create mode 100644 lib/sbi/sbi_ecall_dbcn.c
> >
> > diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> > index df74bba..ef6728b 100644
> > --- a/lib/sbi/Kconfig
> > +++ b/lib/sbi/Kconfig
> > @@ -26,6 +26,10 @@ config SBI_ECALL_PMU
> >       bool "Performance Monitoring Unit extension"
> >       default y
> >
> > +config SBI_ECALL_DBCN
> > +     bool "Debug Console extension"
> > +     default y
> > +
> >  config SBI_ECALL_LEGACY
> >       bool "SBI v0.1 legacy extensions"
> >       default y
> > diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> > index c774ebb..319f38d 100644
> > --- a/lib/sbi/objects.mk
> > +++ b/lib/sbi/objects.mk
> > @@ -37,6 +37,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SRST) += sbi_ecall_srst.o
> >  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_PMU) += ecall_pmu
> >  libsbi-objs-$(CONFIG_SBI_ECALL_PMU) += sbi_ecall_pmu.o
> >
> > +carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_DBCN) += ecall_dbcn
> > +libsbi-objs-$(CONFIG_SBI_ECALL_DBCN) += sbi_ecall_dbcn.o
> > +
> >  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_LEGACY) += ecall_legacy
> >  libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
> >
> > diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
> > new file mode 100644
> > index 0000000..bfa40e9
> > --- /dev/null
> > +++ b/lib/sbi/sbi_ecall_dbcn.c
> > @@ -0,0 +1,72 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2022 Ventana Micro Systems Inc.
> > + *
> > + * Authors:
> > + *   Anup Patel <apatel@ventanamicro.com>
> > + */
> > +
> > +#include <sbi/sbi_console.h>
> > +#include <sbi/sbi_domain.h>
> > +#include <sbi/sbi_error.h>
> > +#include <sbi/sbi_ecall.h>
> > +#include <sbi/sbi_ecall_interface.h>
> > +#include <sbi/sbi_trap.h>
> > +#include <sbi/riscv_asm.h>
> > +
> > +static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
> > +                               const struct sbi_trap_regs *regs,
> > +                               unsigned long *out_val,
> > +                               struct sbi_trap_info *out_trap)
> > +{
> > +     ulong smode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >>
> > +                     MSTATUS_MPP_SHIFT;
> > +
> > +     switch (funcid) {
> > +     case SBI_EXT_DBCN_CONSOLE_WRITE:
> > +     case SBI_EXT_DBCN_CONSOLE_READ:
> > +             /*
> > +              * On RV32, the M-mode can only access the first 4GB of
> > +              * the physical address space because M-mode does not have
> > +              * MMU to access full 34-bit physical address space.
> > +              *
> > +              * Based on above, we simply fail if the upper 32bits of
> > +              * the physical address (i.e. a2 register) is non-zero on
> > +              * RV32.
> > +              */
> > +#if __riscv_xlen == 32
> > +             if (regs->a2)
> > +                     return SBI_ERR_FAILED;
> > +#endif
> > +             if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
> > +                                     regs->a1, regs->a0, smode,
> > +                                     SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
> > +                     return SBI_EINVALID_ADDR;
> > +             if (funcid == SBI_EXT_DBCN_CONSOLE_WRITE)
> > +                     sbi_nputs((const char *)regs->a1, regs->a0);
>
> The spec draft says we return the number of bytes written, so we need
> sbi_nputs to return that. If we never intend to support partial writes,
> then I guess we at least need '*out_val = regs->a0'.

I had already updated the implementation based on the latest draft so
this is already taken care in v6.

Regards,
Anup

>
> Thanks,
> drew
>
> > +             else
> > +                     *out_val = sbi_ngets((char *)regs->a1, regs->a0);
> > +             return 0;
> > +     case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
> > +             sbi_putc(regs->a0);
> > +             return 0;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return SBI_ENOTSUPP;
> > +}
> > +
> > +static int sbi_ecall_dbcn_probe(unsigned long extid, unsigned long *out_val)
> > +{
> > +     *out_val = (sbi_console_get_device()) ? 1 : 0;
> > +     return 0;
> > +}
> > +
> > +struct sbi_ecall_extension ecall_dbcn = {
> > +     .extid_start = SBI_EXT_DBCN,
> > +     .extid_end = SBI_EXT_DBCN,
> > +     .handle = sbi_ecall_dbcn_handler,
> > +     .probe = sbi_ecall_dbcn_probe,
> > +};
> > --
> > 2.34.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

