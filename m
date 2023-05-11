From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 11 May 2023 16:52:21 +0200
Subject: [PATCH v3] lib: sbi: Ensure SBI extension is available
In-Reply-To: <CAK9=C2XKo=8taeSN3+8D0M2Oipdwcx2dcii-e+EreMFQ+_YhuQ@mail.gmail.com>
References: <20230501120839.334341-1-ajones@ventanamicro.com>
 <CAAhSdy1TpSuWepN92vRfGcgZ4Sqe2FBr2v9pzgO5pwdAAs4cqA@mail.gmail.com>
 <20230511-ea585185aadff781ab13f76b@orel>
 <CAK9=C2XKo=8taeSN3+8D0M2Oipdwcx2dcii-e+EreMFQ+_YhuQ@mail.gmail.com>
Message-ID: <20230511-850f4ec83824eb8a821d51bf@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 11, 2023 at 03:49:25PM +0530, Anup Patel wrote:
> On Thu, May 11, 2023 at 3:24?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, May 11, 2023 at 01:21:00PM +0530, Anup Patel wrote:
> > > On Mon, May 1, 2023 at 5:38?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > Ensure attempts to invoke SBI extension functions fail with
> > > > SBI_ERR_NOT_SUPPORTED when the extension's probe function has
> > > > reported that the extension is not available. To avoid invoking
> > > > probe too frequently, we check single extension ID extensions at
> > > > init time and even drop them from the extension list when their
> > > > probe fails. If the probe succeeds, we keep it, and then later
> > > > seeing that it's a single extension ID extension is enough to know
> > > > it's available. Extensions which have multiple IDs must have its probe
> > > > called for each, so we don't try to reduce calls to those. It's
> > > > expected that these multi-ID extension probe functions implement
> > > > their own optimizations in order to ensure extension lookups are
> > > > fast.
> > > >
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > > v3:
> > > >  - Only apply optimization to single extension ID extensions [Xiang]
> > > >  - Drop extensions from extension list when they can be probed
> > > >    at init time (and drop the, now unnecessary, status) [Anup]
> > > >
> > > >  lib/sbi/sbi_ecall.c | 32 +++++++++++++++++++++++---------
> > > >  1 file changed, 23 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> > > > index 76a1ae9ab733..cb73105d7aa8 100644
> > > > --- a/lib/sbi/sbi_ecall.c
> > > > +++ b/lib/sbi/sbi_ecall.c
> > > > @@ -42,16 +42,19 @@ static SBI_LIST_HEAD(ecall_exts_list);
> > > >
> > > >  struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid)
> > > >  {
> > > > -       struct sbi_ecall_extension *t, *ret = NULL;
> > > > +       struct sbi_ecall_extension *t;
> > > > +       unsigned long out_val;
> > > >
> > > >         sbi_list_for_each_entry(t, &ecall_exts_list, head) {
> > > >                 if (t->extid_start <= extid && extid <= t->extid_end) {
> > > > -                       ret = t;
> > > > -                       break;
> > > > +                       if (t->extid_start != t->extid_end && t->probe &&
> > > > +                           (t->probe(extid, &out_val) || !out_val))
> > >
> > > I disagree with this approach of penalizing extension spread over
> > > a range of extension IDs. Particularly this adds overhead for
> > > vendor extension.
> > >
> > > I suggest, we should change the prototype of probe callback to:
> > > "int (* probe)(struct sbi_ecall_extension *extl);"
> > >
> > > And update existing probe functions to directly register extension
> > > by calling sbi_ecall_register_extension().
> >
> > We still need a per-extid probe function which returns an out_val in
> > order to satisfy the specification's base probe extension call. So,
> > if we want a "probe and register" function, which registers the
> > extension if probe would return true for at least one extid in the
> > extension's ID range, then we should add a new function for that.
> >
> > However, how do we efficiently implement "probe and register" for
> > large extension ID ranges? When OpenSBI needs to forward the probe
> > on through a platform-specific interface it may not have a "at least
> > one of" option, i.e. "probe and register" may have to loop over the
> > entire ID range trying each extid until it found one or hits the end.
> 
> There are three extension ID ranges currently:
> 1) Legacy extensions
> 2) Vendor extensions
> 3) Experimental extensions
> 4) Firmware extensions
> 
> The legacy extension ID range is small and it has to be
> implemented entirely so no special handling is required
> in sbi_ecall_find_extension().
> 
> The vendor extension ID range is large but there will be only
> one vendor extension ID to be used so we should register
> vendor extension for a particular ID instead of entire range.
> 
> From the above, 3) and 4) are not implemented in OpenSBI and
> wherever we do implement them a specific set of extension IDs
> will be registered instead of entire extension ranges.

OK, my assumptions didn't match the above. I thought there could be a
very large range where each ID of the range could require probing which
could require invoking platform-specific callbacks. Now, taking the above
into account, I think we should handle the four cases with

 1) Legacy extensions are fine as they are now
 2) Vendor extensions need to have its range narrowed to one
    at init time
 3) Experimental extensions need a way to narrow its range (or
    remove IDs from its range by registering multiple scattered
    ranges) at init time
 4) Same as (3)

> 
> I still don't see why special handling is required in
> sbi_ecall_find_extension().

I agree with that now. We just need another extension callback
to support 2-4 which would get invoked from sbi_ecall_init() when
it's present. We can also still apply the filtering of single
ID extensions from the list when their probes fail at init time.

I'll send a v4 with a new callback applied to vendor extensions.

Thanks,
drew

