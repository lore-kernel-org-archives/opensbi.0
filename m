From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Thu, 1 Dec 2022 09:05:18 +0000
Subject: [PATCH v3 1/6] lib: utils: serial: Add Renesas SCIF driver
In-Reply-To: <OS0PR01MB59228AE0FC48525FD8F255DE86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221130220825.193693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221130220825.193693-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <OS0PR01MB59228AE0FC48525FD8F255DE86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <CA+V-a8uoi+FZVQhrNqmvv+MKhtOZsUuUeWZgFUBVkobtO3sUcA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Biju,

Thank you for the review.

On Thu, Dec 1, 2022 at 8:27 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 November 2022 22:08
> > To: Anup Patel <anup@brainfault.org>; Atish Patra
> > <atishp@atishpatra.org>; opensbi at lists.infradead.org
> > Cc: Yu Chien Peter Lin <peterlin@andestech.com>; Bin Meng
> > <bmeng.cn@gmail.com>; Andrew Jones <ajones@ventanamicro.com>; Prabhakar
> > <prabhakar.csengg@gmail.com>; Biju Das <biju.das.jz@bp.renesas.com>;
> > Chris Paterson <Chris.Paterson2@renesas.com>; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: [PATCH v3 1/6] lib: utils: serial: Add Renesas SCIF driver
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add Renesas SCIF driver.
<snip>
> > +static u32 get_reg(u32 offset)
> > +{
> > +     if (SCIF_REG_8BIT(offset))
> > +             return readb(scif_base + offset);
> > +
> > +     return readw(scif_base + offset);
> > +}
> > +
> > +static void set_reg(u32 offset, u32 val) {
> > +     if (SCIF_REG_8BIT(offset))
> > +             return writeb(val, scif_base + offset);
>
> You are returning from void function. Same below as well.
>
Good catch, the compiler didn't warn me.

Cheers,
Prabhakar

