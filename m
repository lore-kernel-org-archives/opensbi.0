From: Cyan Yang <cyan.yang@sifive.com>
Date: Wed, 8 May 2024 14:53:20 +0800
Subject: [PATCH] lib: utils/irqchip: Add sanity checks to
 imsic_warm_irqchip_init()
In-Reply-To: <CAAhSdy0_2tsMWjAJTbgrfY+U9Wngs5WWHREQm8E0=2ZOGGAjqg@mail.gmail.com>
References: <20240409144547.87893-1-cyan.yang@sifive.com>
 <CAAhSdy0_2tsMWjAJTbgrfY+U9Wngs5WWHREQm8E0=2ZOGGAjqg@mail.gmail.com>
Message-ID: <ZjshYHp4wESBeTVb@cyan-mbp>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 07, 2024 at 06:09:25PM +0530, Anup Patel wrote:
> On Tue, Apr 9, 2024 at 8:25?PM Cyan Yang <cyan.yang@sifive.com> wrote:
> >
> > Add sanity checks for per-HART IMSIC pointer in warm init flow, similar to
> > what the cold init flow does. This will help prevent any misuse of the
> > data in scratch space.
> 
> Can you elaborate on the kind of misuse which can happen ?
> 

We found a case that if a caller misused this function on a platform without
imsic, the extra check will be needed here since "imsic_get_data()" will not
guarantee to return a null pointer. 

It's not a normal case, of course, but since this is not a static function,
having more sanity checks could help prevent the unexpected results.

Regards,
Cyan

> >
> > Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
> > ---
> >  lib/utils/irqchip/imsic.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> > index f2a35c6..e6a3657 100644
> > --- a/lib/utils/irqchip/imsic.c
> > +++ b/lib/utils/irqchip/imsic.c
> > @@ -243,10 +243,15 @@ void imsic_local_irqchip_init(void)
> >
> >  int imsic_warm_irqchip_init(void)
> >  {
> > +       int rc;
> >         struct imsic_data *imsic = imsic_get_data(current_hartid());
> >
> >         /* Sanity checks */
> > -       if (!imsic || !imsic->targets_mmode)
> > +       rc = imsic_data_check(imsic);
> > +       if (rc)
> > +               return rc;
> > +
> > +       if (!imsic->targets_mmode)
> >                 return SBI_EINVAL;
> >
> >         /* Disable all interrupts */
> > --
> > 2.39.3 (Apple Git-146)
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> Regards,
> Anup

