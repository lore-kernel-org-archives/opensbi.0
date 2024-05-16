From: Cyan Yang <cyan.yang@sifive.com>
Date: Thu, 16 May 2024 14:54:58 +0800
Subject: [PATCH] lib: utils/irqchip: Add sanity checks to imsic_warm_irqchip_init()
In-Reply-To: <CAAhSdy2HBGTavDvkmax1hgjS-QXFrtctVUKSavOjY3SodpbO2w@mail.gmail.com>
References: <20240409144547.87893-1-cyan.yang@sifive.com> <CAAhSdy0_2tsMWjAJTbgrfY+U9Wngs5WWHREQm8E0=2ZOGGAjqg@mail.gmail.com>
 <ZjshYHp4wESBeTVb@cyan-mbp> <CAAhSdy2HBGTavDvkmax1hgjS-QXFrtctVUKSavOjY3SodpbO2w@mail.gmail.com>
Message-ID: <CANn7AkE+C_TJGmmKS97NMc8hSQgGXdGaG_fAi4Ah0vO_tYJo+A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 14, 2024 at 2:08?PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, May 8, 2024 at 12:23?PM Cyan Yang <cyan.yang@sifive.com> wrote:
> >
> > On Tue, May 07, 2024 at 06:09:25PM +0530, Anup Patel wrote:
> > > On Tue, Apr 9, 2024 at 8:25?PM Cyan Yang <cyan.yang@sifive.com> wrote:
> > > >
> > > > Add sanity checks for per-HART IMSIC pointer in warm init flow, similar to
> > > > what the cold init flow does. This will help prevent any misuse of the
> > > > data in scratch space.
> > >
> > > Can you elaborate on the kind of misuse which can happen ?
> > >
> >
> > We found a case that if a caller misused this function on a platform without
> > imsic, the extra check will be needed here since "imsic_get_data()" will not
> > guarantee to return a null pointer.
> >
> > It's not a normal case, of course, but since this is not a static function,
> > having more sanity checks could help prevent the unexpected results.
>
> If that's the case then imsic_get_data() should return NULL if
> imsic_ptr_offset == 0

Yes, your suggestion will fix the root cause directly. Also, I found that
imsic_get_target_file() has the same issue. So I will submit another patch
to check imsic_ptr_offset in imsic_get_data() and imsic_file_offset in
imsic_get_target_file() and return NULL if the offset is not set.

Thanks,
Cyan

>
> Regards,
> Anup
>
> >
> > Regards,
> > Cyan
> >
> > > >
> > > > Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
> > > > ---
> > > >  lib/utils/irqchip/imsic.c | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> > > > index f2a35c6..e6a3657 100644
> > > > --- a/lib/utils/irqchip/imsic.c
> > > > +++ b/lib/utils/irqchip/imsic.c
> > > > @@ -243,10 +243,15 @@ void imsic_local_irqchip_init(void)
> > > >
> > > >  int imsic_warm_irqchip_init(void)
> > > >  {
> > > > +       int rc;
> > > >         struct imsic_data *imsic = imsic_get_data(current_hartid());
> > > >
> > > >         /* Sanity checks */
> > > > -       if (!imsic || !imsic->targets_mmode)
> > > > +       rc = imsic_data_check(imsic);
> > > > +       if (rc)
> > > > +               return rc;
> > > > +
> > > > +       if (!imsic->targets_mmode)
> > > >                 return SBI_EINVAL;
> > > >
> > > >         /* Disable all interrupts */
> > > > --
> > > > 2.39.3 (Apple Git-146)
> > > >
> > > >
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > >
> > > Regards,
> > > Anup

