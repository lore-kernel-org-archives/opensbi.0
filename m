From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Thu, 1 Dec 2022 09:06:06 +0000
Subject: [PATCH v3 3/6] lib: utils/irqchip: Add compatible string for
 Andestech NCEPLIC100
In-Reply-To: <OS0PR01MB5922D6966D7DE0687CD36C7C86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221130220825.193693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221130220825.193693-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <OS0PR01MB5922D6966D7DE0687CD36C7C86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <CA+V-a8tTnEHAUoSMhSYoJTNcy8xjNbSpbwqa=9iP2oTfo2AHAg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Biju,

Thank you for the review.

On Thu, Dec 1, 2022 at 8:29 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Prabhakar,
>
> > Subject: [PATCH v3 3/6] lib: utils/irqchip: Add compatible string for
> > Andestech NCEPLIC100
> >
<snip>
> > index a6e185c..83d091a 100644
> > --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> > +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> > @@ -163,7 +163,8 @@ static const struct fdt_match irqchip_plic_match[] =
> > {
> >       { .compatible = "sifive,plic-1.0.0" },
> >       { .compatible = "thead,c900-plic",
> >         .data = thead_plic_plat_init },
> > -     { },
> > +     { .compatible = "andestech,nceplic100" },
> > +     { /* sentinel */ }
>
> Maybe sort alphabetically.
>
Ok.

Cheers,
Prabhakar

