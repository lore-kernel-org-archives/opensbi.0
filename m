From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Thu, 28 Mar 2024 15:12:33 +0100
Subject: [PATCH 7/9] platform: generic: Add mechanism to match via mvendorid
In-Reply-To: <50c0c631-f74d-45da-801e-10ea533b57f5@dram.page>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
 <20240327101137.3644359-8-christoph.muellner@vrull.eu> <50c0c631-f74d-45da-801e-10ea533b57f5@dram.page>
Message-ID: <CAEg0e7jrP4dzpLRSpujyZBv5xeQi_LCi6qnRCMvcLqkfFkw1Rw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[adding the list]

On Wed, Mar 27, 2024 at 12:32?PM Vivian Wang <uwu@dram.page> wrote:
>
> On 3/27/24 18:11, Christoph M?llner wrote:
> > Currently, all platforms and their overrides are matched
> > via FDT-compatible strings. While this is the right approach,
> > we are sometimes confronted with platforms that don't provide
> > the necessary FDT-compatible strings.
>
> In that case, wouldn't it be easier to just provide a different FDT? If
> anything, probing mvendorid makes it much harder to fix things later on
> since it will match all future T-Head cores.
>
> I know Linux has some mvendorid-probing code, but those are for
> situations so early in boot that FDT code isn't working yet. It wouldn't
> be necessary here at all.

MAEE probing is needed before setting up the page table (this is about
PTE bits).
So, I think this qualifies for CSR probing during early boot (and
that's how it is implemented in Linux).

>
> Vivian "dram"
>
> > To still be able to match a platforms, let's add a secondary
> > matching mechanism for the MVENDORID CSR.
> >
> > Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
> > ---
> >  platform/generic/include/platform_override.h |  1 +
> >  platform/generic/platform.c                  | 38 ++++++++++++++++++--
> >  2 files changed, 36 insertions(+), 3 deletions(-)
> >
> > diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
> > index 6802126..a968346 100644
> > --- a/platform/generic/include/platform_override.h
> > +++ b/platform/generic/include/platform_override.h
> > @@ -17,6 +17,7 @@
> >
> >  struct platform_override {
> >       const struct fdt_match *match_table;
> > +     const unsigned long *match_vendor_ids;
> >       u64 (*features)(const struct fdt_match *match);
> >       u64 (*tlbr_flush_limit)(const struct fdt_match *match);
> >       u32 (*tlb_num_entries)(const struct fdt_match *match);
> > diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> > index 07fa9cc..e1b97c8 100644
> > --- a/platform/generic/platform.c
> > +++ b/platform/generic/platform.c
> > @@ -36,12 +36,28 @@ extern unsigned long platform_override_modules_size;
> >  static const struct platform_override *generic_plat = NULL;
> >  static const struct fdt_match *generic_plat_match = NULL;
> >
> > -static void fw_platform_lookup_special(void *fdt, int root_offset)
> > +static unsigned long vendor_id_match(unsigned long vendor_id,
> > +                                  const unsigned long *vendor_ids)
> > +{
> > +     const unsigned long *vid_ptr = vendor_ids;
> > +
> > +     while (*vid_ptr) {
> > +             if (*vid_ptr == vendor_id)
> > +                     return vendor_id;
> > +
> > +             vid_ptr++;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void fw_platform_lookup_override(void *fdt, int root_offset)
> >  {
> >       const struct platform_override *plat;
> >       const struct fdt_match *match;
> >       int pos;
> >
> > +     /* First try to find a FDT match. */
> >       for (pos = 0; pos < platform_override_modules_size; pos++) {
> >               plat = platform_override_modules[pos];
> >               if (!plat->match_table)
> > @@ -53,7 +69,23 @@ static void fw_platform_lookup_special(void *fdt, int root_offset)
> >
> >               generic_plat = plat;
> >               generic_plat_match = match;
> > -             break;
> > +             return;
> > +     }
> > +
> > +     /* No match via FDT -> try matching the vendor ID. */
> > +     const unsigned long vendor_id = csr_read(CSR_MVENDORID);
> > +     for (pos = 0; pos < platform_override_modules_size; pos++) {
> > +             plat = platform_override_modules[pos];
> > +             if (!plat->match_vendor_ids)
> > +                     continue;
> > +
> > +             unsigned long match = vendor_id_match(vendor_id, plat->match_vendor_ids);
> > +             if (!match)
> > +                     continue;
> > +
> > +             generic_plat = plat;
> > +             generic_plat_match = NULL;
> > +             return;
> >       }
> >  }
> >
> > @@ -154,7 +186,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> >       if (root_offset < 0)
> >               goto fail;
> >
> > -     fw_platform_lookup_special(fdt, root_offset);
> > +     fw_platform_lookup_override(fdt, root_offset);
> >
> >       if (generic_plat && generic_plat->fw_init)
> >               generic_plat->fw_init(fdt, generic_plat_match);
>
>

