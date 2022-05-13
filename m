From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 May 2022 10:08:44 +0530
Subject: [PATCH] lib: utils/irqchip: fix typo when checking for CPU node
In-Reply-To: <CAAhSdy2_g1U_qaq=22G_8YOgsagyFjq07rKoAbjoOMf6+6Q0xA@mail.gmail.com>
References: <CALXH3=LymzDa6c7DjYSfqZFTU3eUFZa0QgYxw6OOc3_577hO9g@mail.gmail.com>
 <CAAhSdy2_g1U_qaq=22G_8YOgsagyFjq07rKoAbjoOMf6+6Q0xA@mail.gmail.com>
Message-ID: <CAAhSdy33_iaeV7UsnUkoSjefJh5UqOzraCKYbi=Ftyk0g+OzNg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 9, 2022 at 6:17 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, May 9, 2022 at 6:13 PM Jan Reme? <jan.remes@codasip.com> wrote:
> >
> > Fix typo in irqchip_imsic_update_hartid_table() when checking for CPU
> > node.
> >
> > Signed-off-by: Jan Remes <jan.remes@codasip.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

It seems this patch was not received correctly on the mailing lists since
tabs were converted to spaces. Please prefer "git send-email" for sending
patches to OpenSBI mailing list.

I have taken care of the above issue at the time of merging this patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> >  lib/utils/irqchip/fdt_irqchip_imsic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c
> > b/lib/utils/irqchip/fdt_irqchip_imsic.c
> > index b6962be..6020ac0 100644
> > --- a/lib/utils/irqchip/fdt_irqchip_imsic.c
> > +++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
> > @@ -42,7 +42,7 @@ static int irqchip_imsic_update_hartid_table(void
> > *fdt, int nodeoff,
> >   continue;
> >
> >   cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
> > - if (cpu_intc_offset < 0)
> > + if (cpu_offset < 0)
> >   continue;
> >
> >   err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
> > --
> > 2.35.1
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

