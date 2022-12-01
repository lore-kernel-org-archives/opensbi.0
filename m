From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Thu, 1 Dec 2022 10:47:47 +0000
Subject: [PATCH v3 1/6] lib: utils: serial: Add Renesas SCIF driver
In-Reply-To: <OS0PR01MB5922BEAA3000624365C8B7E486149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221130220825.193693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221130220825.193693-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <OS0PR01MB5922BEAA3000624365C8B7E486149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <CA+V-a8ua5sUsNUrcdt=4XdJ+ZXVfKYnzp_T3RytgYeaXnGk-_w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 1, 2022 at 10:40 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
>
<snip>
> > +
> > +     set_reg(SCIF_REG_FTDR, ch);
> > +     reg = get_reg(SCIF_REG_FSR);
> > +     reg &= ~SCIF_FSR_TXD_CHK;
> > +     set_reg(SCIF_REG_FSR, reg);
> > +}
> > +
> > +static struct sbi_console_device renesas_scif_console = {
> > +     .name           = "renesas_scif",
> > +     .console_putc   = renesas_scif_putc,
> > +};
> > +
> > +int renesas_scif_init(unsigned long base, u32 in_freq, u32 baudrate) {
> > +     volatile uint16_t data16;
>
> Why volatile??
>
Yep not needed. I will drop it.

Cheers,
Prabhakar

