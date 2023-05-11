From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 11 May 2023 15:49:25 +0530
Subject: [PATCH v3] lib: sbi: Ensure SBI extension is available
In-Reply-To: <20230511-ea585185aadff781ab13f76b@orel>
References: <20230501120839.334341-1-ajones@ventanamicro.com>
 <CAAhSdy1TpSuWepN92vRfGcgZ4Sqe2FBr2v9pzgO5pwdAAs4cqA@mail.gmail.com> <20230511-ea585185aadff781ab13f76b@orel>
Message-ID: <CAK9=C2XKo=8taeSN3+8D0M2Oipdwcx2dcii-e+EreMFQ+_YhuQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 11, 2023 at 3:24?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, May 11, 2023 at 01:21:00PM +0530, Anup Patel wrote:
> > On Mon, May 1, 2023 at 5:38?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > Ensure attempts to invoke SBI extension functions fail with
> > > SBI_ERR_NOT_SUPPORTED when the extension's probe function has
> > > reported that the extension is not available. To avoid invoking
> > > probe too frequently, we check single extension ID extensions at
> > > init time and even drop them from the extension list when their
> > > probe fails. If the probe succeeds, we keep it, and then later
> > > seeing that it's a single extension ID extension is enough to know
> > > it's available. Extensions which have multiple IDs must have its probe
> > > called for each, so we don't try to reduce calls to those. It's
> > > expected that these multi-ID extension probe functions implement
> > > their own optimizations in order to ensure extension lookups are
> > > fast.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > > v3:
> > >  - Only apply optimization to single extension ID extensions [Xiang]
> > >  - Drop extensions from extension list when they can be probed
> > >    at init time (and drop the, now unnecessary, status) [Anup]
> > >
> > >  lib/sbi/sbi_ecall.c | 32 +++++++++++++++++++++++---------
> > >  1 file changed, 23 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> > > index 76a1ae9ab733..cb73105d7aa8 100644
> > > --- a/lib/sbi/sbi_ecall.c
> > > +++ b/lib/sbi/sbi_ecall.c
> > > @@ -42,16 +42,19 @@ static SBI_LIST_HEAD(ecall_exts_list);
> > >
> > >  struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid)
> > >  {
> > > -       struct sbi_ecall_extension *t, *ret = NULL;
> > > +       struct sbi_ecall_extension *t;
> > > +       unsigned long out_val;
> > >
> > >         sbi_list_for_each_entry(t, &ecall_exts_list, head) {
> > >                 if (t->extid_start <= extid && extid <= t->extid_end) {
> > > -                       ret = t;
> > > -                       break;
> > > +                       if (t->extid_start != t->extid_end && t->probe &&
> > > +                           (t->probe(extid, &out_val) || !out_val))
> >
> > I disagree with this approach of penalizing extension spread over
> > a range of extension IDs. Particularly this adds overhead for
> > vendor extension.
> >
> > I suggest, we should change the prototype of probe callback to:
> > "int (* probe)(struct sbi_ecall_extension *extl);"
> >
> > And update existing probe functions to directly register extension
> > by calling sbi_ecall_register_extension().
>
> We still need a per-extid probe function which returns an out_val in
> order to satisfy the specification's base probe extension call. So,
> if we want a "probe and register" function, which registers the
> extension if probe would return true for at least one extid in the
> extension's ID range, then we should add a new function for that.
>
> However, how do we efficiently implement "probe and register" for
> large extension ID ranges? When OpenSBI needs to forward the probe
> on through a platform-specific interface it may not have a "at least
> one of" option, i.e. "probe and register" may have to loop over the
> entire ID range trying each extid until it found one or hits the end.

There are three extension ID ranges currently:
1) Legacy extensions
2) Vendor extensions
3) Experimental extensions
4) Firmware extensions

The legacy extension ID range is small and it has to be
implemented entirely so no special handling is required
in sbi_ecall_find_extension().

The vendor extension ID range is large but there will be only
one vendor extension ID to be used so we should register
vendor extension for a particular ID instead of entire range.

From the above, 3) and 4) are not implemented in OpenSBI and
wherever we do implement them a specific set of extension IDs
will be registered instead of entire extension ranges.

I still don't see why special handling is required in
sbi_ecall_find_extension().

>
> >
> > The sbi_ecall_init() should call sbi_ecall_register_extension()
> > only for extensions which don't have a probe callback.
> >
> > Based on this suggestion, no changes are required in
> > sbi_ecall_find_extension().
>
> I still think deferring the per-extid probing until a caller needs
> it to sbi_ecall_find_extension() time is a better approach, but if
> we don't want to rely on per-probe optimizations, then I'll try to
> consider other options. Actually, how about
>
>  - Register all extensions except single ID extensions which have a
>    probe and its probe failed (this is the only thing we do eagerly,
>    since it's easy to do)
>
>  - Create a new list where each member is of type
>
>  struct extid_map {
>     unsigned long extid;
>     struct sbi_ecall_extension *ext;
>  };
>
> In find, instead of only iterating ecall_exts_list, iterate the new
> extid_map list first. If we don't find anything, then iterate the
> extension list, calling probe when a probe is available. If probe
> succeeds, then add the extid to the extid list, setting 'ext' to the
> extension pointer. Do NOT add extid to the extid list if probe fails
> (we don't want to give S-mode the possibility of growing the list to
> MAX_ULONG size nodes by probing/invoking every extension ID). The next
> time find is invoked for the same extid it will immediately return the
> extension pointer when it's available or do everything again (if S-mode
> continues to try and probe or invoke extids which have already been
> reported as not-available, then it can pay the price of a full probe
> each time).
>
> The downside of this is the extra space requirements and potentially
> longer iterations in find. One way to improve both of those may be to
> change struct extid_map to
>
>  struct extid_map {
>     unsigned long extid_start;
>     unsigned long extid_end;
>     struct sbi_ecall_extension *ext;
>  };
>
> and always merge adjacent extids which have the same 'ext' pointer,
> but I'm not sure we need that yet. How many available extids do we
> expect a platform to have?

The struct sbi_ecall_extension already has start and end
so if we have multiple scattered ranges to be registered then
caller will register multiple instances of "struct sbi_ecall_extension"
each with a separate value of start and end.

I do agree that list based lookup in sbi_ecall_find_extension()
can become slow. In the future, we can use rbtree so
that lookups are faster but this is a separate improvement.

Regards,
Anup

