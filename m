From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Nov 2022 15:52:18 +0800
Subject: [PATCH v2 1/7] lib: utils: serial: Add Renesas SCIF driver
In-Reply-To: <CA+V-a8urvQf+53sjSR3kLsyLTZjhhKYJYLshA98Js3PnkDH9uA@mail.gmail.com>
References: <20221111182105.614094-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221111182105.614094-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAEUhbmX82_EhkF62GbvYyAsztK1XpJ4XcG+XwzWrQ1gBV2P7QA@mail.gmail.com> <CA+V-a8urvQf+53sjSR3kLsyLTZjhhKYJYLshA98Js3PnkDH9uA@mail.gmail.com>
Message-ID: <CAEUhbmVAtQ+MScY4V6UpjZD+nURCvC7T-2fLC1diz_5GVURsZQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Prabhakar,

On Wed, Nov 16, 2022 at 1:34 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Bin,
>
> Thank you for the review.
>
> On Tue, Nov 15, 2022 at 7:30 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Sat, Nov 12, 2022 at 2:22 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > >
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add Renesas SCIF driver.
> > >
> > > Based on a patch in the BSP by Takeki Hamada
> > > <takeki.hamada.ak@bp.renesas.com>
> >
> > If there is a public URL for the BSP you mentioned, better put that in
> > the commit here for future reference.
> >
> you mean link for the BSP/File/Commit. Ive followed the same approach
> that we follow on Linux.

Do you have any link for the BSP files, ie: on Renesas website?

>
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > RFC->v2
> > > * Fixed comments pointed by Xiang W
> > > ---
> > >  include/sbi_utils/serial/renesas-scif.h |  11 ++
> > >  lib/utils/serial/Kconfig                |   4 +
> > >  lib/utils/serial/objects.mk             |   1 +
> > >  lib/utils/serial/renesas_scif.c         | 139 ++++++++++++++++++++++++
> > >  4 files changed, 155 insertions(+)
> > >  create mode 100644 include/sbi_utils/serial/renesas-scif.h
> > >  create mode 100644 lib/utils/serial/renesas_scif.c
> > >
> > > diff --git a/include/sbi_utils/serial/renesas-scif.h b/include/sbi_utils/serial/renesas-scif.h
> > > new file mode 100644
> > > index 0000000..0002a1a
> > > --- /dev/null
> > > +++ b/include/sbi_utils/serial/renesas-scif.h
> > > @@ -0,0 +1,11 @@
> > > +/* SPDX-License-Identifier: BSD-2-Clause */
> > > +/*
> > > + * Copyright (C) 2022 Renesas Electronics Corporation
> > > + */
> > > +
> > > +#ifndef __SERIAL_RENESAS_SCIF_H__
> > > +#define __SERIAL_RENESAS_SCIF_H__
> > > +
> > > +int renesas_scif_init(unsigned long base, u32 in_freq, u32 baudrate);
> > > +
> > > +#endif /* __SERIAL_RENESAS_SCIF_H__ */
> > > diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
> > > index da549a7..f6ed803 100644
> > > --- a/lib/utils/serial/Kconfig
> > > +++ b/lib/utils/serial/Kconfig
> > > @@ -59,6 +59,10 @@ config SERIAL_GAISLER
> > >         bool "Gaisler UART support"
> > >         default n
> > >
> > > +config SERIAL_RENESAS_SCIF
> > > +       bool "Renesas SCIF support"
> > > +       default n
> > > +
> > >  config SERIAL_SHAKTI
> > >         bool "Shakti UART support"
> > >         default n
> > > diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
> > > index 98f3f9a..6520424 100644
> > > --- a/lib/utils/serial/objects.mk
> > > +++ b/lib/utils/serial/objects.mk
> > > @@ -36,6 +36,7 @@ libsbiutils-objs-$(CONFIG_FDT_SERIAL_XILINX_UARTLITE) += serial/fdt_serial_xlnx_
> > >
> > >  libsbiutils-objs-$(CONFIG_SERIAL_CADENCE) += serial/cadence-uart.o
> > >  libsbiutils-objs-$(CONFIG_SERIAL_GAISLER) += serial/gaisler-uart.o
> > > +libsbiutils-objs-$(CONFIG_SERIAL_RENESAS_SCIF) += serial/renesas_scif.o
> > >  libsbiutils-objs-$(CONFIG_SERIAL_SHAKTI) += serial/shakti-uart.o
> > >  libsbiutils-objs-$(CONFIG_SERIAL_SIFIVE) += serial/sifive-uart.o
> > >  libsbiutils-objs-$(CONFIG_SERIAL_LITEX) += serial/litex-uart.o
> > > diff --git a/lib/utils/serial/renesas_scif.c b/lib/utils/serial/renesas_scif.c
> > > new file mode 100644
> > > index 0000000..0586e1a
> > > --- /dev/null
> > > +++ b/lib/utils/serial/renesas_scif.c
> > > @@ -0,0 +1,139 @@
> > > +// SPDX-License-Identifier: BSD-2-Clause
> > > +/*
> > > + * Copyright (C) 2022 Renesas Electronics Corporation
> > > + */
> > > +
> > > +#include <sbi/riscv_io.h>
> > > +#include <sbi/sbi_console.h>
> > > +#include <sbi/sbi_timer.h>
> > > +#include <sbi_utils/serial/renesas-scif.h>
> > > +
> > > +/* clang-format off */
> > > +
> > > +#define SCIF_REG_SMR           0x0
> > > +#define SCIF_REG_BRR           0x2
> > > +#define SCIF_REG_SCR           0x4
> > > +#define SCIF_REG_FTDR          0x6
> > > +#define SCIF_REG_FSR           0x8
> > > +#define SCIF_REG_FRDR          0xa
> >
> > This register is not used by the driver. Drop it.
> >
> OK, I will drop it.
>
> > > +#define SCIF_REG_FCR           0xc
> > > +#define SCIF_REG_LSR           0x12
> > > +#define SCIF_REG_SEMR          0x14
> > > +
> > > +#define SCIF_RFRST             0x2 /* Reset assert receive-FIFO (bit[1]) */
> > > +#define SCIF_TFRST             0x4 /* Reset assert transmit-FIFO(bit[2]) */
> >
> > The above 2 macros should probably be named as SCIF_FCR_* as they only
> > apply to the FCR register.
> >
> Agreed.
>
> > > +
> > > +#define SCIF_FCR_RST_ASSRT_TFRF        (SCIF_RFRST | SCIF_TFRST) /* Reset assert tx-FIFO & rx-FIFO */
> >
> > The macro name should probably be named to have RF come before TF,
> > like SCIF_FCR_RST_ASSRT_RFTF, to keep in consistency with the rest,
> > and the codes.
> >
> Agreed.
>
> > #define SCIF_FCR_RST_ASSRT_RFTF        (SCIF_RFRST | SCIF_TFRST) /*
> > Reset assert rx-FIFO & tx-FIFO */
> >
> > > +#define SCIF_FCR_RST_NGATE_TFRF        0x0 /* Reset negate tx-FIFO & rx-FIFO*/
> >
> > ditto
> >
> > need a space before */
> >
> OK, I will fix it.
>
> > > +
> > > +#define SCIF_RE                        0x10 /* Enable receive (bit[4])  */
> > > +#define SCIF_TE                        0x20 /* Enable transmit(bit[5])  */
> >
> > The above 2 macros should probably be named as SCIF_SCR_* as they only
> > apply to the SCR register.
> >
> Agreed.
>
> > nits: only need one space fore */
> >
> > > +#define SCIF_SCR_RCV_TRN_EN    (SCIF_RE | SCIF_TE) /* Enable receive & transmit */
> > > +#define SCIF_SCR_RCV_TRN_DIS   0x0 /* Disable receive & transmit */
> > > +
> > > +#define SCIF_FSR_ER            0x80 /* Receive error flag */
> > > +#define SCIF_FSR_TEND          0x40 /* Detect break flag */
> > > +#define SCIF_FSR_TDFE          0x20 /* Detect break flag */
> >
> > The comments of the above 2 bit fields are wrong
> >
> Ouch will fix that.
>
> > > +#define SCIF_FSR_BRK           0x10 /* Detect break flag */
> > > +#define SCIF_FSR_RDF           0x2  /* Receive FIFO data full flag */
> >
> > This bit field seems not to be used anywhere. Drop it?
> >
> Sure, I will drop it.
>
> > > +#define SCIF_FSR_DR            0x1  /* Receive data ready flag */
> > > +
> > > +#define SCIF_FSR_RXD_CHK       (SCIF_FSR_ER | SCIF_FSR_BRK | SCIF_FSR_DR)
> > > +#define SCIF_FSR_TXD_CHK       (SCIF_FSR_TEND | SCIF_FSR_TDFE)
> > > +
> > > +#define SCIF_LSR_ORER          0x1 /* Overrun error flag */
> >
> > This macro is not used anywhere. Drop it.
> >
> ditto.
>
> > > +
> > > +#define SCIF_SPTR_SPB2DT       0x1 /* if SCR.TE setting, don't care */
> > > +#define SCIF_SPTR_SPB2IO       0x2 /* if SCR.TE setting, don't care */
> >
> > The above 2 macros are not used anywhere. Drop them.
> >
> ditto.
>
> > > +
> > > +#define SCIF_SEMR_BRME         0x20 /* bit-rate modulation enable */
> >
> > This macro is not used anywhere. Drop it.
> >
> ditto.
>
> > > +#define SCIF_SEMR_MDDRS                0x10 /* MDDR access enable */
> > > +
> > > +#define SCIF_SIZE(reg)         ((reg == SCIF_REG_BRR) || \
> > > +                                (reg == SCIF_REG_FTDR) || \
> > > +                                (reg == SCIF_REG_FRDR) || \
> >
> > I don't see the driver programs SCIF_REG_FRDR register. We can just
> > remove it to save some cycles.
> >
> > > +                                (reg == SCIF_REG_SEMR))
> >
> > The name of this macro is not meaningful. It looks like it's the size
> > of a register at the first glance but it's actually returning logical
> > true or false.
> > Better rename it to something like SCIF_REG_8BIT(reg).
> >
> Good point, I'll rename it.
>
> > > +
> > > +#define SCBRR_VALUE(clk, baudrate) ((clk) / (32 * (baudrate)) - 1)
> > > +
> > > +/* clang-format on */
> > > +
> > > +static volatile char *scif_base;
> > > +
> > > +static u32 get_reg(u32 offset)
> > > +{
> > > +       if (SCIF_SIZE(offset))
> > > +               return readb(scif_base + offset);
> > > +
> > > +       return readw(scif_base + offset);
> > > +}
> > > +
> > > +static void set_reg(u32 offset, u32 val)
> > > +{
> > > +       if (SCIF_SIZE(offset))
> > > +               return writeb(val, scif_base + offset);
> > > +
> > > +       return writew(val, scif_base + offset);
> > > +}
> > > +
> > > +static void scif_wait(unsigned long baudrate)
> > > +{
> > > +       unsigned long utime;
> > > +
> > > +       utime = 1000000 / baudrate + 1;
> >
> > What is this?
> >
> It's the delay required when using the external clock. But as we arent
> using it on RZ/Five SMARC we can get rid of it for now.

Could we make such logic be based on DTS settings, instead of hardcoding?

This driver should be able to support both internal and external clocks, right?

>
> > > +
> > > +       sbi_timer_udelay(utime);
> > > +}
> > > +
> > > +static void renesas_scif_putc(char ch)
> > > +{
> > > +       uint16_t reg;
> > > +
> > > +       while (!(SCIF_FSR_TXD_CHK & get_reg(SCIF_REG_FSR)))
> > > +               ;
> > > +
> > > +       set_reg(SCIF_REG_FTDR, ch);
> > > +       reg = get_reg(SCIF_REG_FSR);
> > > +       reg &= ~SCIF_FSR_TXD_CHK;
> > > +       set_reg(SCIF_REG_FSR, reg);
> >
> > The FSR Tx status bits clear should happen before writing a new char
> > to the Tx fifo, no?
> >
> No, this has to be cleared only after char write.

Based on my read of the user manual, after the while () check, we can
clear the status bits. After you write a new char to the FIFO, the
status bits might be triggered by the new char write, instead of the
previous one. Hence clearing status bits after writing char will cause
the status bits check next time fail.

>
> > > +}
> > > +
> > > +static struct sbi_console_device renesas_scif_console = {
> > > +       .name           = "renesas_scif",
> > > +       .console_putc   = renesas_scif_putc,
> > > +};
> > > +
> > > +int renesas_scif_init(unsigned long base, u32 in_freq, u32 baudrate)
> > > +{
> > > +       volatile uint16_t data16;
> > > +
> > > +       scif_base = (volatile char *)base;
> > > +
> > > +       set_reg(SCIF_REG_SCR, SCIF_SCR_RCV_TRN_DIS); /* Disable receive & transmit */
> > > +       set_reg(SCIF_REG_FCR, SCIF_FCR_RST_ASSRT_TFRF); /* Reset assert tx-FIFO & rx-FIFO */
> > > +
> > > +       data16 = get_reg(SCIF_REG_FSR); /* Dummy read */
> > > +       set_reg(SCIF_REG_FSR, 0x0); /* Clear all error bit */
> > > +
> > > +       data16 = get_reg(SCIF_REG_LSR); /* Dummy read */
> > > +       set_reg(SCIF_REG_LSR, 0x0); /* Clear ORER bit */
> > > +
> > > +       set_reg(SCIF_REG_SCR, 0x0); /* Select internal clock, SC_CLK pin unused for output pin */
> > > +
> > > +       set_reg(SCIF_REG_SMR, 0x0); /* Set asynchronous, 8bit data, no-parity, 1 stop and Po/1 */
> > > +
> > > +       data16 = get_reg(SCIF_REG_SEMR);
> > > +       set_reg(SCIF_REG_SEMR, data16 & (~SCIF_SEMR_MDDRS)); /* Select to access BRR */
> > > +       set_reg(SCIF_REG_BRR, SCBRR_VALUE(in_freq, baudrate));
> > > +
> > > +       scif_wait(baudrate);
> >
> > What is this?
> >
> As mentioned above I'll get rid of it.
>
> > > +
> > > +       /* FTCR is left at initial value, because this interrupt isn't used. */
> >
> > What is FTCR? There is no such register in your defines.
> >
> It's the "FIFO Trigger Control Register". I'll drop the comment.
>

Regards,
Bin

