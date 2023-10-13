From: Guo Ren <guoren@kernel.org>
Date: Fri, 13 Oct 2023 09:05:28 +0800
Subject: [PATCH 1/3] lib: utils/timer: Allow ACLINT MTIMER driver to setup quirks
In-Reply-To: <IA1PR20MB4953FF9940A6522ADDB18AC3BBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <CAJF2gTSwKx6T9YmKN8i+R_VZ9H9MTVs9NygUiDhRBip_bjDdwQ@mail.gmail.com>
 <IA1PR20MB4953FF9940A6522ADDB18AC3BBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAJF2gTStYzrYon2xuq3TFPLVkH=mS_-weNV9xM9r25p2xTsevA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 12, 2023 at 7:19?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> >On Thu, Oct 12, 2023 at 5:01?PM Inochi Amaoto <inochiama@outlook.com> wrote:
> >>
> >> The quirks checking will cause ACLINT step into a CLINT code path, this
> >> is not expected when ACLINT needs a quirks.
> >>
> >> Add more check to ensure the timer is CLINT before applying quirks.
> >> And now apply the general quirks after applying CLINT specific quirks.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> ---
> >>  lib/utils/timer/fdt_timer_mtimer.c | 17 ++++++++++++++---
> >>  1 file changed, 14 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> >> index 9eaa11d..cd14f75 100644
> >> --- a/lib/utils/timer/fdt_timer_mtimer.c
> >> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> >> @@ -29,6 +29,12 @@ static SBI_LIST_HEAD(mtn_list);
> >>
> >>  static struct aclint_mtimer_data *mt_reference = NULL;
> >>
> >> +static int timer_is_clint(const void *data)
> >
> >The timer is not clint, the timer is in the clint, right?
>
> I have no idea about what you mean.
> I think your meaning is that this is for clint timer, right?0
> For this function, it just checks whether the quirk is for clint.
>
> >How about timer_in_clint?
> >
>
> This name make me confused, maybe is_clint_quirk is better?
In timer_is_clint, you detect mtime_offset, if "mtime_offset != 0"
means the clint address contains a timer, we add an offset for it.
Otherwise, clint & timer are separated.

That's my suggestion of timer_in_clint's meaning. The is_clint_quirk
didn't give the correct meaning because the quirk is always there.

Here are many options:
!timer_is_separate(data)/clint_contains_timer(data)/!clint_is_separate(data)/!clint_is_split(data)/...

>
> >> +{
> >> +       const struct timer_mtimer_quirks *quirks = data;
> >> +       return quirks && quirks->mtime_offset;
> >> +}
> >> +
> >>  static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >>                                   const struct fdt_match *match)
> >>  {
> >> @@ -58,7 +64,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >>                 return rc;
> >>         }
> >>
> >> -       if (match->data) { /* SiFive CLINT */
> >> +       if (timer_is_clint(match->data)) { /* SiFive CLINT */
> >The comment is confusing. So, how about deleting it:
> >if (timer_in_clint(match->data)) {
> >
>
> I think this is ok, the code can be comment.
>
> >>                 const struct timer_mtimer_quirks *quirks = match->data;
> >>
> >>                 /* Set CLINT addresses */
> >> @@ -74,8 +80,6 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >>                         mt->mtime_addr = mt->mtime_size = 0;
> >>                 }
> >>                 mt->mtimecmp_addr += quirks->mtime_offset;
> >> -               /* Apply additional CLINT quirks */
> >> -               mt->has_64bit_mmio = quirks->has_64bit_mmio;
> >>         } else { /* RISC-V ACLINT MTIMER */
> >>                 /* Set ACLINT MTIMER addresses */
> >>                 mt->mtime_addr = addr[0];
> >> @@ -84,6 +88,13 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >>                 mt->mtimecmp_size = size[1];
> >>         }
> >>
> >> +       /* Apply additional quirks for CLINT and ACLINT */
> >> +       if (match->data) {
> >> +               const struct timer_mtimer_quirks *quirks = match->data;
> >> +
> >> +               mt->has_64bit_mmio = quirks->has_64bit_mmio;
> >> +       }
> >> +
> >>         /* Check if MTIMER device has shared MTIME address */
> >>         if (mt->mtime_size) {
> >>                 mt->has_shared_mtime = false;
> >> --
> >> 2.42.0
> >>
> >
> >
> >--
> >Best Regards
> > Guo Ren
> >
> >



-- 
Best Regards
 Guo Ren

