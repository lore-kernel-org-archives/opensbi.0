From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Oct 2021 10:38:36 +0530
Subject: [PATCH 2/2] lib: sbi: add priority for reset handler
In-Reply-To: <CAAhSdy0_yox-jjB2qqEF1GDtZkviRhWRJMS4P_PetjOekaPWLg@mail.gmail.com>
References: <20211001083117.2008-1-nikita.shubin@maquefel.me>
 <20211001083117.2008-3-nikita.shubin@maquefel.me>
 <CAAhSdy0_yox-jjB2qqEF1GDtZkviRhWRJMS4P_PetjOekaPWLg@mail.gmail.com>
Message-ID: <CAAhSdy0J=ejXx-8ZT76+Nf7h5NUPXO=JFF06y84iL3J7Gg+0wQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 7, 2021 at 5:41 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Oct 1, 2021 at 2:01 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> >
> > From: Nikita Shubin <n.shubin@yadro.com>
> >
> > Let's make system_reset_check returning priority instead of only
> > true/false. In that case 0 - means not supported, and anything above
> > means priority that makes existing reset handlers being used in first
> > place, unless it is decided to lower their priority.
> >
> > The handler with the most priority wins.
> >
> > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > ---
> > rfc -> v0:
> > - changed priority meaning to classic, the more the more prioritized
> > - moved all checks to sbi_system_reset
> > ---
> >  lib/sbi/sbi_system.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
> > index 6e6bb80..177f130 100644
> > --- a/lib/sbi/sbi_system.c
> > +++ b/lib/sbi/sbi_system.c
> > @@ -22,18 +22,29 @@ static SBI_LIST_HEAD(reset_devices_list);
> >
> >  const struct sbi_system_reset_device *sbi_system_reset_get_device(u32 reset_type, u32 reset_reason)
> >  {
> > -       struct sbi_system_reset_device *dev = 0;
> > +       struct sbi_system_reset_device *reset_dev = 0;
>
> Better assign NULL here since this is a pointer.
>
> >         struct sbi_dlist *pos;
> > +       /** lowest priority - any non zero is our candidate */
> > +       int priority = 0;
> >
> >         /* Check each reset device registered for supported reset type */
> >         sbi_list_for_each(pos, &(reset_devices_list)) {
> > -               dev = to_system_reset_device(pos);
> > -               if (dev->system_reset_check &&
> > -                       dev->system_reset_check(reset_type, reset_reason))
> > -                       break;
> > +               struct sbi_system_reset_device *dev =
> > +                       to_system_reset_device(pos);
> > +               if (dev->system_reset_check) {
> > +                       int status = dev->system_reset_check(reset_type, reset_reason);
> > +                       /** reset_type not supported */
> > +                       if (status == 0)
> > +                               continue;
> > +
> > +                       if (status > priority) {
> > +                               reset_dev = dev;
> > +                               priority = status;
> > +                       }
> > +               }
> >         }
> >
> > -       return dev;
> > +       return reset_dev;
> >  }
> >
> >  void sbi_system_reset_add_device(struct sbi_system_reset_device *dev)
> > --
> > 2.31.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
> Apart from the minor comment above, it looks good to me.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

I have taken care of the comment above at time of merging this patch.

Applied this patch to the riscv/opensbi repo

Thanks,
Anup
>
> Regards,
> Anup

