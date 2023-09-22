From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Sep 2023 11:14:22 +0530
Subject: [PATCH 1/8] lib: sbi: Introduce HART index in sbi_scratch
In-Reply-To: <3307bded65f816a5fe9e2929003bf8fe14324265.camel@126.com>
References: <20230904040346.118604-1-apatel@ventanamicro.com>
 <20230904040346.118604-2-apatel@ventanamicro.com> <3307bded65f816a5fe9e2929003bf8fe14324265.camel@126.com>
Message-ID: <CAAhSdy0iL9WUt_y7=YMY1-VROWFMaBoNtkSUiiwgtGGfFGSD0w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 20, 2023 at 11:24?PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2023-09-04???? 09:33 +0530?Anup Patel???
> > We introduce HART index and related helper functions in sbi_scratch
> > where HART index is contiguous and each HART index maps to a physical
> > HART id such that 0 <= HART index and HART index < SBI_HARTMASK_MAX_BITS.
> >
> > The HART index to HART id mapping follows the index2id mapping provided
> > by the platform. If the platform does not provide index2id mapping then
> > identity mapping is assumed.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi/sbi_scratch.h | 45 ++++++++++++++++++++++++++++++++++++---
> >  lib/sbi/sbi_scratch.c     | 38 ++++++++++++++++++++++-----------
> >  2 files changed, 68 insertions(+), 15 deletions(-)
> >
> > diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> > index 4801492..9a4dce1 100644
> > --- a/include/sbi/sbi_scratch.h
> > +++ b/include/sbi/sbi_scratch.h
> > @@ -202,12 +202,47 @@ do {                                                                    \
> >                                       = (__type)(__ptr);              \
> >  } while (0)
> >
> > -/** HART id to scratch table */
> > -extern struct sbi_scratch *hartid_to_scratch_table[];
> > +/** Last HART index having a sbi_scratch pointer */
> > +extern u32 last_hartindex_having_scratch;
> > +
> > +/** Get last HART index having a sbi_scratch pointer */
> > +#define sbi_scratch_last_hartindex() last_hartindex_having_scratch
> > +
> > +/** Check whether a particular HART index is valid or not */
> > +#define sbi_hartindex_valid(__hartindex) \
> > +(((__hartindex) <= sbi_scratch_last_hartindex()) ? true : false)
> The implementation here is strange. If the last index does not have scratch,
> it will be considered an invalid index. But other index do not be considered
> invalid without scratch.

I don't understand. The "last_hartindex" is literally the index of the last
HART having a scratch.

Regards,
Anup

>
> Regards,
> Xiang W
> > +
> > +/** HART index to HART id table */
> > +extern u32 hartindex_to_hartid_table[];
> > +
> > +/** Get sbi_scratch from HART index */
> > +#define sbi_hartindex_to_hartid(__hartindex)         \
> > +({                                                   \
> > +     ((__hartindex) <= sbi_scratch_last_hartindex()) ?\
> > +     hartindex_to_hartid_table[__hartindex] : -1U;   \
> > +})
> > +
> > +/** HART index to scratch table */
> > +extern struct sbi_scratch *hartindex_to_scratch_table[];
> > +
> > +/** Get sbi_scratch from HART index */
> > +#define sbi_hartindex_to_scratch(__hartindex)                \
> > +({                                                   \
> > +     ((__hartindex) <= sbi_scratch_last_hartindex()) ?\
> > +     hartindex_to_scratch_table[__hartindex] : NULL;\
> > +})
> > +
> > +/**
> > + * Get logical index for given HART id
> > + * @param hartid physical HART id
> > + * @returns value between 0 to SBI_HARTMASK_MAX_BITS upon success and
> > + *       SBI_HARTMASK_MAX_BITS upon failure.
> > + */
> > +u32 sbi_hartid_to_hartindex(u32 hartid);
> >
> >  /** Get sbi_scratch from HART id */
> >  #define sbi_hartid_to_scratch(__hartid) \
> > -     hartid_to_scratch_table[__hartid]
> > +     sbi_hartindex_to_scratch(sbi_hartid_to_hartindex(__hartid))
> >
> >  /** Last HART id having a sbi_scratch pointer */
> >  extern u32 last_hartid_having_scratch;
> > @@ -215,6 +250,10 @@ extern u32 last_hartid_having_scratch;
> >  /** Get last HART id having a sbi_scratch pointer */
> >  #define sbi_scratch_last_hartid()    last_hartid_having_scratch
> >
> > +/** Check whether particular HART id is valid or not */
> > +#define sbi_hartid_valid(__hartid)   \
> > +     sbi_hartindex_valid(sbi_hartid_to_hartindex(__hartid))
> > +
> >  #endif
> >
> >  #endif
> > diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> > index 87ef84c..d2abc89 100644
> > --- a/lib/sbi/sbi_scratch.c
> > +++ b/lib/sbi/sbi_scratch.c
> > @@ -15,26 +15,40 @@
> >  #include <sbi/sbi_string.h>
> >
> >  u32 last_hartid_having_scratch = SBI_HARTMASK_MAX_BITS - 1;
> > -struct sbi_scratch *hartid_to_scratch_table[SBI_HARTMASK_MAX_BITS] = { 0 };
> > +u32 last_hartindex_having_scratch = 0;
> > +u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
> > +struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
> >
> >  static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
> >  static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
> >
> > +u32 sbi_hartid_to_hartindex(u32 hartid)
> > +{
> > +     u32 i;
> > +
> > +     for (i = 0; i <= last_hartindex_having_scratch; i++)
> > +             if (hartindex_to_hartid_table[i] == hartid)
> > +                     return i;
> > +
> > +     return -1U;
> > +}
> > +
> >  typedef struct sbi_scratch *(*hartid2scratch)(ulong hartid, ulong hartindex);
> >
> >  int sbi_scratch_init(struct sbi_scratch *scratch)
> >  {
> > -     u32 i;
> > +     u32 i, h;
> >       const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> >
> > -     for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
> > -             if (sbi_platform_hart_invalid(plat, i))
> > -                     continue;
> > -             hartid_to_scratch_table[i] =
> > -                     ((hartid2scratch)scratch->hartid_to_scratch)(i,
> > -                                     sbi_platform_hart_index(plat, i));
> > -             if (hartid_to_scratch_table[i])
> > -                     last_hartid_having_scratch = i;
> > +     for (i = 0; i < plat->hart_count; i++) {
> > +             h = (plat->hart_index2id) ? plat->hart_index2id[i] : i;
> > +             hartindex_to_hartid_table[i] = h;
> > +             hartindex_to_scratch_table[i] =
> > +                     ((hartid2scratch)scratch->hartid_to_scratch)(h, i);
> > +             if (hartindex_to_scratch_table[i]) {
> > +                     last_hartid_having_scratch = h;
> > +                     last_hartindex_having_scratch = i;
> > +             }
> >       }
> >
> >       return 0;
> > @@ -74,8 +88,8 @@ done:
> >       spin_unlock(&extra_lock);
> >
> >       if (ret) {
> > -             for (i = 0; i <= sbi_scratch_last_hartid(); i++) {
> > -                     rscratch = sbi_hartid_to_scratch(i);
> > +             for (i = 0; i <= sbi_scratch_last_hartindex(); i++) {
> > +                     rscratch = sbi_hartindex_to_scratch(i);
> >                       if (!rscratch)
> >                               continue;
> >                       ptr = sbi_scratch_offset_ptr(rscratch, ret);
> > --
> > 2.34.1
> >
> >
>

