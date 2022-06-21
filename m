From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Jun 2022 20:34:13 +0530
Subject: [PATCH] lib: utils/mtimer: Add has_broken_mtime quirk
In-Reply-To: <CAJF2gTTtjON3yUZ0btg1OuVVOZorhgwKrL4GrwViP6htOYxNgQ@mail.gmail.com>
References: <20220621131132.110311-1-apatel@ventanamicro.com> <CAJF2gTTtjON3yUZ0btg1OuVVOZorhgwKrL4GrwViP6htOYxNgQ@mail.gmail.com>
Message-ID: <CAAhSdy2ugpwy8Dc++68CTEXsVMHLyxfrUE817cUyX5q7UP_wCQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 21, 2022 at 7:33 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Jun 21, 2022 at 9:11 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The Allwinner D1 SoC has custom CLINT implementation where the
> > MTIME register of the timer is not accessible as MMIO register
> > instead the time CSR is to be used as MTIME.
> >
> > We introduce "has_broken_mtime" quirk in MTIMER library and FDT
> > based MTIMER driver to address the Allwiner D1 situation. And
> > while we are here, let us extend the quirk mechanism in FDT based
> > MTIMER driver for both CLINT and ACLINT.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi_utils/timer/aclint_mtimer.h |  1 +
> >  lib/utils/timer/aclint_mtimer.c         | 30 +++++++++++++++++++------
> >  lib/utils/timer/fdt_timer_mtimer.c      | 29 ++++++++++++++++++------
> >  3 files changed, 46 insertions(+), 14 deletions(-)
> >
> > diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
> > index f02cc62..454a92f 100644
> > --- a/include/sbi_utils/timer/aclint_mtimer.h
> > +++ b/include/sbi_utils/timer/aclint_mtimer.h
> > @@ -32,6 +32,7 @@ struct aclint_mtimer_data {
> >         u32 first_hartid;
> >         u32 hart_count;
> >         bool has_64bit_mmio;
> > +       bool has_broken_mtime;
> >         bool has_shared_mtime;
> >         /* Private details (initialized and used by ACLINT MTIMER library) */
> >         struct aclint_mtimer_data *time_delta_reference;
> > diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> > index a957b1c..5db3120 100644
> > --- a/lib/utils/timer/aclint_mtimer.c
> > +++ b/lib/utils/timer/aclint_mtimer.c
> > @@ -60,6 +60,12 @@ static u64 mtimer_value(void)
> >         return mt->time_rd(time_val);
> >  }
> >
> > +static u64 mtimer_dummy_value(void)
> > +{
> > +       /* Dummy function for MTIMER devices with broken MTIME */
> Could we get value from CSR_TIME? (define CSR_TIME           0xc01)

The lib/sbi/sbi_timer.c will use CSR_TIME whenever it is available so
we don't need to access it here.

Maybe we can drop mtimer_dummy_value() and set
"mtimer.timer_value = NULL" when "has_broken_mtime = TRUE" ?

Can you try this patch on D1 ?

Regards,
Anup

>
> > +       return 0;
> > +}
> > +
> >  static void mtimer_event_stop(void)
> >  {
> >         u32 target_hart = current_hartid();
> > @@ -95,7 +101,9 @@ void aclint_mtimer_sync(struct aclint_mtimer_data *mt)
> >         struct aclint_mtimer_data *reference;
> >
> >         /* Sync-up non-shared MTIME if reference is available */
> > -       if (mt->has_shared_mtime || !mt->time_delta_reference)
> > +       if (mt->has_broken_mtime ||
> > +           mt->has_shared_mtime ||
> > +           !mt->time_delta_reference)
> >                 return;
> >
> >         reference = mt->time_delta_reference;
> > @@ -189,6 +197,10 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
> >         if (reference && mt->mtime_freq != reference->mtime_freq)
> >                 return SBI_EINVAL;
> >
> > +       /* Override timer_value() callback for broken MTIME */
> > +       if (mt->has_broken_mtime)
> > +               mtimer.timer_value = mtimer_dummy_value;
> > +
> >         /* Initialize private data */
> >         aclint_mtimer_set_reference(mt, reference);
> >         mt->time_rd = mtimer_time_rd32;
> > @@ -207,21 +219,25 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
> >                 mtimer_hartid2data[mt->first_hartid + i] = mt;
> >
> >         /* Add MTIMER regions to the root domain */
> > -       if (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
> > +       if (!mt->has_broken_mtime &&
> > +           mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
> >                 rc = aclint_mtimer_add_regions(mt->mtimecmp_addr,
> >                                         mt->mtime_size + mt->mtimecmp_size);
> >                 if (rc)
> >                         return rc;
> > -       } else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
> > +       } else if (!mt->has_broken_mtime &&
> > +                  mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
> >                 rc = aclint_mtimer_add_regions(mt->mtime_addr,
> >                                         mt->mtime_size + mt->mtimecmp_size);
> >                 if (rc)
> >                         return rc;
> >         } else {
> > -               rc = aclint_mtimer_add_regions(mt->mtime_addr,
> > -                                               mt->mtime_size);
> > -               if (rc)
> > -                       return rc;
> > +               if (!mt->has_broken_mtime) {
> > +                       rc = aclint_mtimer_add_regions(mt->mtime_addr,
> > +                                                       mt->mtime_size);
> > +                       if (rc)
> > +                               return rc;
> > +               }
> >
> >                 rc = aclint_mtimer_add_regions(mt->mtimecmp_addr,
> >                                                 mt->mtimecmp_size);
> > diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> > index e140567..bc547ac 100644
> > --- a/lib/utils/timer/fdt_timer_mtimer.c
> > +++ b/lib/utils/timer/fdt_timer_mtimer.c
> > @@ -16,8 +16,10 @@
> >  #define MTIMER_MAX_NR                  16
> >
> >  struct timer_mtimer_quirks {
> > +       bool            is_clint;
> >         unsigned int    mtime_offset;
> >         bool            has_64bit_mmio;
> > +       bool            has_broken_mtime;
> >  };
> >
> >  static unsigned long mtimer_count = 0;
> > @@ -30,6 +32,11 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >         int i, rc;
> >         unsigned long addr[2], size[2];
> >         struct aclint_mtimer_data *mt;
> > +       const struct timer_mtimer_quirks *quirks;
> > +
> > +       if (!match->data)
> > +               return SBI_ENOSYS;
> > +       quirks = match->data;
> >
> >         if (MTIMER_MAX_NR <= mtimer_count)
> >                 return SBI_ENOSPC;
> > @@ -40,16 +47,15 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >                                    &mt->first_hartid, &mt->hart_count);
> >         if (rc)
> >                 return rc;
> > -       mt->has_64bit_mmio = true;
> > +       mt->has_64bit_mmio = quirks->has_64bit_mmio;
> >         mt->has_shared_mtime = false;
> > +       mt->has_broken_mtime = quirks->has_broken_mtime;
> >
> >         rc = fdt_parse_timebase_frequency(fdt, &mt->mtime_freq);
> >         if (rc)
> >                 return rc;
> >
> > -       if (match->data) { /* SiFive CLINT */
> > -               const struct timer_mtimer_quirks *quirks = match->data;
> > -
> > +       if (quirks->is_clint) { /* SiFive CLINT */
> >                 /* Set CLINT addresses */
> >                 mt->mtimecmp_addr = addr[0] + ACLINT_DEFAULT_MTIMECMP_OFFSET;
> >                 mt->mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE;
> > @@ -59,8 +65,6 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >                 mt->mtime_addr += quirks->mtime_offset;
> >                 mt->mtimecmp_addr += quirks->mtime_offset;
> >                 mt->mtime_size -= quirks->mtime_offset;
> > -               /* Apply additional CLINT quirks */
> > -               mt->has_64bit_mmio = quirks->has_64bit_mmio;
> >         } else { /* RISC-V ACLINT MTIMER */
> >                 /* Set ACLINT MTIMER addresses */
> >                 mt->mtime_addr = addr[0];
> > @@ -110,20 +114,31 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >  }
> >
> >  static const struct timer_mtimer_quirks d1_clint_quirks = {
> > +       .is_clint       = true,
> >         .mtime_offset   = CLINT_MTIMER_OFFSET,
> >         .has_64bit_mmio = false,
> > +       .has_broken_mtime = true,
> >  };
> >
> >  static const struct timer_mtimer_quirks sifive_clint_quirks = {
> > +       .is_clint       = true,
> >         .mtime_offset   = CLINT_MTIMER_OFFSET,
> >         .has_64bit_mmio = true,
> > +       .has_broken_mtime = false,
> > +};
> > +
> > +static const struct timer_mtimer_quirks aclint_quirks = {
> > +       .is_clint       = false,
> > +       .mtime_offset   = 0,
> > +       .has_64bit_mmio = true,
> > +       .has_broken_mtime = false,
> >  };
> >
> >  static const struct fdt_match timer_mtimer_match[] = {
> >         { .compatible = "allwinner,sun20i-d1-clint", .data = &d1_clint_quirks },
> >         { .compatible = "riscv,clint0", .data = &sifive_clint_quirks },
> >         { .compatible = "sifive,clint0", .data = &sifive_clint_quirks },
> > -       { .compatible = "riscv,aclint-mtimer" },
> > +       { .compatible = "riscv,aclint-mtimer", .data = &aclint_quirks },
> >         { },
> >  };
> >
> > --
> > 2.34.1
> >
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

