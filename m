From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Aug 2021 15:48:36 +0530
Subject: [PATCH v2] lib: sbi: Fix bug in strncmp function
In-Reply-To: <CAEUhbmVy3HzUJgW1HvJoU3k8pnNRopfD4N4oCMrP5e8U2DAzXg@mail.gmail.com>
References: <20210728161535.421-1-Dd_nirvana@sjtu.edu.cn>
 <CAEUhbmVeLtGTbpbiO9we8vxmsV+HU1e-11kaS4VL_=XgOcBmvA@mail.gmail.com>
 <87bl6cth1m.fsf@igel.home>
 <CAEUhbmVy3HzUJgW1HvJoU3k8pnNRopfD4N4oCMrP5e8U2DAzXg@mail.gmail.com>
Message-ID: <CAAhSdy1QQS6CqaD3ucFOWVn4n30fX8K+dHt_VmrJ8rEnx=09XA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 5, 2021 at 2:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Aug 5, 2021 at 4:46 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> >
> > On Aug 05 2021, Bin Meng wrote:
> >
> > > Hi Dong,
> > >
> > > On Thu, Jul 29, 2021 at 12:23 AM Dong Du <Dd_nirvana@sjtu.edu.cn> wrote:
> > >>
> > >> No need to compare characters when the count turns to 0.
> > >> Fix the issue in sbi_strncmp.
> > >>
> > >> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> > >> ---
> > >>  lib/sbi/sbi_string.c | 4 ++++
> > >>  1 file changed, 4 insertions(+)
> > >>
> > >> diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
> > >> index 7805ba4..c87bce9 100644
> > >> --- a/lib/sbi/sbi_string.c
> > >> +++ b/lib/sbi/sbi_string.c
> > >> @@ -33,6 +33,10 @@ int sbi_strncmp(const char *a, const char *b, size_t count)
> > >>         for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
> > >>                 ;
> > >>
> > >> +       /* No difference till the end */
> > >> +       if (!count)
> > >> +               return 0;
> > >> +
> > >>         return *a - *b;
> > >>  }
> > >>
> > >
> > > Your original patch is also needed: "strncmp should return 0 when the
> > > count is 0"
> >
> > Which this patch duly implements.
>
> Ah, yes. Maybe we should update the comment to make it clear.
>
> Anyway:
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

