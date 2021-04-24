From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 24 Apr 2021 07:33:19 +0000
Subject: [PATCH] utils: irqchip: plic: Using 1 as default priority value
In-Reply-To: <CAJF2gTS4ZNJ6iWA9Rbp6zCqE1w5FsZw9Q5b4MP7JByJSYRwcNQ@mail.gmail.com>
References: <1619232227-97067-1-git-send-email-guoren@kernel.org>
 <DM6PR04MB62015CAA39939B037A6C1CB68D449@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CAJF2gTS4ZNJ6iWA9Rbp6zCqE1w5FsZw9Q5b4MP7JByJSYRwcNQ@mail.gmail.com>
Message-ID: <DM6PR04MB6201643500D14972F6DFF5078D449@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Guo Ren <guoren@kernel.org>
> Sent: 24 April 2021 12:24
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: anup at brainfault.org; opensbi at lists.infradead.org; Guo Ren
> <guoren@linux.alibaba.com>
> Subject: Re: [PATCH] utils: irqchip: plic: Using 1 as default priority value
> 
> Hi Anup,
> 
> On Sat, Apr 24, 2021 at 12:04 PM Anup Patel <Anup.Patel@wdc.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: guoren at kernel.org <guoren@kernel.org>
> > > Sent: 24 April 2021 08:14
> > > To: guoren at kernel.org; anup at brainfault.org
> > > Cc: opensbi at lists.infradead.org; Guo Ren <guoren@linux.alibaba.com>;
> > > Anup Patel <Anup.Patel@wdc.com>
> > > Subject: [PATCH] utils: irqchip: plic: Using 1 as default priority
> > > value
> > >
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > In linux plic drivers:
> > > static inline void plic_irq_toggle(const struct cpumask *mask,
> > >                                  struct irq_data *d, int enable) {
> > >       int cpu;
> > >       struct plic_priv *priv = irq_data_get_irq_chip_data(d);
> > >
> > >       writel(enable, priv->regs + PRIORITY_BASE + d->hwirq *
> > > PRIORITY_PER_ID);
> > >
> > > It sets PRIORITY in enable/disable irq, but not during init.
> > > Actually, priority is no use at all and just keep them the same is enough.
> > >
> > > The motivation of my patch: When we want to run 2 different Linux OS
> > > in the same SMP system, the second Linux cold boot will flush all
> > > priority to zero and the patch is to solve the problem.
> >
> > Don't create separate OpenSBI instances for 2 different OSes.
> >
> > The OpenSBI domain support allows you to create 2 different domains
> > for each Linux. Please checkout recent YouTube video on OpenSBI
> > domains
> I agree with the idea of OpenSBI domains, but it isn't related to the patch.
> 
> What we've done in a 4 cores SMP with 8GB memory system is:
> 
>  - "hart0 + hart1, with memory 0 - 4GB" run linux1 + opensbi1
>  - "hart2 + hart3" with memory 4GB - 8GB run linux2 + opensbi2
> 
> They are physical separated in memory and CPUs, but plic is shared.
> Current opensbi + Linux almost could natively support this kind of simple
> scenario, but this patch.

You don't need split OpenSBI because OpenSBI domains allow you
to partition the system as-per your requirements.

Please explore OpenSBI domain support instead of adding
work-around like this which affects everyone.

Slides: https://events.linuxfoundation.org/riscv-forum-security/program/schedule/
Video: https://www.youtube.com/watch?v=lMxSrfn12ec

Regards,
Anup

> 
> >
> > Regards,
> > Anup
> >
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Cc: Anup Patel <anup.patel@wdc.com>
> > > ---
> > >  lib/utils/irqchip/plic.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> > > index
> > > 7665c62..70e89a6 100644
> > > --- a/lib/utils/irqchip/plic.c
> > > +++ b/lib/utils/irqchip/plic.c
> > > @@ -94,7 +94,7 @@ int plic_cold_irqchip_init(struct plic_data *plic)
> > >
> > >       /* Configure default priorities of all IRQs */
> > >       for (i = 1; i <= plic->num_src; i++)
> > > -             plic_set_priority(plic, i, 0);
> > > +             plic_set_priority(plic, i, 1);
> > >
> > >       return 0;
> > >  }
> > > --
> > > 2.7.4
> >
> 
> 
> --
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/
