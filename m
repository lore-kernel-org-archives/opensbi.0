From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Mar 2025 09:39:31 +0530
Subject: [PATCH 1/4] lib: sbi_scratch: Apply bounds check to platform hart_count
In-Reply-To: <72525c18-ce60-4781-818f-7870f6cf31d8@sifive.com>
References: <20250220184233.23802-1-samuel.holland@sifive.com>
 <20250220184233.23802-2-samuel.holland@sifive.com> <CAMSwOgpP9ecscbiiD=Wd+cf4EvLWVwXduHb07uFLAyqhVTvZOg@mail.gmail.com_9b4e6db0_release>
 <72525c18-ce60-4781-818f-7870f6cf31d8@sifive.com>
Message-ID: <CAAhSdy16o1CdEDeAGETdAkzBxGYvdETjvNmMj3ET81RPUODZ3A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 3, 2025 at 8:23?PM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Hi Rahul,
>
> On 2025-03-03 8:41 AM, Rahul Pathak wrote:
> > On Fri, Feb 21, 2025 at 12:13?AM Samuel Holland
> > <samuel.holland@sifive.com> wrote:
> >>
> >> The internal limit on the number of harts is SBI_HARTMASK_MAX_BITS, as
> >> this value determines the size of various bitmaps and arrays (including
> >> hartindex_to_hartid_table and hartindex_to_scratch_table). Clamp the
> >> value provided by the platform, and drop the extra array element.
> >>
> >> Update the documentation to indicate that hart_index2id must be sized
> >> based on hart_count, and that hart indexes must be contiguous. As of
> >> commit 5e90e54a1a53 ("lib: utils:Check that hartid is valid"), there is
> >> no restriction on the valid hart ID values.
> >>
> >> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >> ---
> >>
> >>  include/sbi/sbi_platform.h | 11 +++--------
> >>  lib/sbi/sbi_scratch.c      | 14 +++++++++-----
> >>  2 files changed, 12 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> >> index 6d5fbc7d..5e50c997 100644
> >> --- a/include/sbi/sbi_platform.h
> >> +++ b/include/sbi/sbi_platform.h
> >> @@ -169,7 +169,7 @@ struct sbi_platform {
> >>         char name[64];
> >>         /** Supported features */
> >>         u64 features;
> >> -       /** Total number of HARTs */
> >> +       /** Total number of HARTs (at most SBI_HARTMASK_MAX_BITS) */
> >>         u32 hart_count;
> >>         /** Per-HART stack size for exception/interrupt handling */
> >>         u32 hart_stack_size;
> >> @@ -184,17 +184,12 @@ struct sbi_platform {
> >>         /**
> >>          * HART index to HART id table
> >>          *
> >> -        * For used HART index <abc>:
> >> +        * If hart_index2id != NULL then the table must contain a mapping
> >> +        * for each HART index 0 <= <abc> < hart_count:
> >>          *     hart_index2id[<abc>] = some HART id
> >> -        * For unused HART index <abc>:
> >> -        *     hart_index2id[<abc>] = -1U
> >>          *
> >>          * If hart_index2id == NULL then we assume identity mapping
> >>          *     hart_index2id[<abc>] = <abc>
> >> -        *
> >> -        * We have only two restrictions:
> >> -        * 1. HART index < sbi_platform hart_count
> >> -        * 2. HART id < SBI_HARTMASK_MAX_BITS
> >>          */
> >>         const u32 *hart_index2id;
> >>  };
> >> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> >> index ccbbc68e..5a9e935b 100644
> >> --- a/lib/sbi/sbi_scratch.c
> >> +++ b/lib/sbi/sbi_scratch.c
> >> @@ -15,8 +15,8 @@
> >>  #include <sbi/sbi_string.h>
> >>
> >>  u32 last_hartindex_having_scratch = 0;
> >> -u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
> >> -struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
> >> +u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS] = { -1U };
> >> +struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS] = { 0 };
> >>
> >>  static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
> >>  static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
> >> @@ -36,17 +36,21 @@ typedef struct sbi_scratch *(*hartid2scratch)(ulong hartid, ulong hartindex);
> >>
> >>  int sbi_scratch_init(struct sbi_scratch *scratch)
> >>  {
> >> -       u32 i, h;
> >> +       u32 i, h, hart_count;
> >>         const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> >>
> >> -       for (i = 0; i < plat->hart_count; i++) {
> >> +       hart_count = plat->hart_count;
> >> +       if (hart_count > SBI_HARTMASK_MAX_BITS)
> >> +               hart_count = SBI_HARTMASK_MAX_BITS;
> >>
> > From a platform perspective case where hart_count > SBI_HARTMASK_MAX_BITS
> > Since its a limitation of SBI to not be able to represent all what
> > platform expects. Is it a
> > point of failure and it should not continue from here or it should
> > silently move forward with
> > what SBI can accommodate?
>
> Only OpenSBI the implementation has this limitation, not SBI more generally.
>
> I would expect a good quality implementation to crash or hang only as a last
> resort. In this case, the system can continue running normally, with a reduced
> number of harts available to lower privilege modes. The remaining harts remain
> safely off or parked in M-mode. S-mode software will be aware of the issue when
> sbi_hsm_hart_start() fails to start the excess harts, but it should already
> expect to handle errors from that function, so it would be just another instance
> of the interface working as intended.

In fact, OpenSBI already does this in fw_base.S where _start_warm() will jump
to _start_hang() when it can't find the HART index for current HART id.

Regards,
Anup

>
> Regards,
> Samuel
>
> >>
> >> +       for (i = 0; i < hart_count; i++) {
> >>                 h = (plat->hart_index2id) ? plat->hart_index2id[i] : i;
> >>                 hartindex_to_hartid_table[i] = h;
> >>                 hartindex_to_scratch_table[i] =
> >>                         ((hartid2scratch)scratch->hartid_to_scratch)(h, i);
> >>         }
> >>
> >> -       last_hartindex_having_scratch = plat->hart_count - 1;
> >> +       last_hartindex_having_scratch = hart_count - 1;
> >>
> >>         return 0;
> >>  }
> >> --
> >> 2.47.2
> >>
> >>
> >> --
> >> opensbi mailing list
> >> opensbi at lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/opensbi
> >
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

