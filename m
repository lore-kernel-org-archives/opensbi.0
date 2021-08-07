From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Aug 2021 18:16:07 +0530
Subject: [PATCH 1/5] lib: utils/timer: Allow separate base addresses for
 MTIME and MTIMECMP
In-Reply-To: <CAEUhbmWPQU-xhzS6USZoj6FSw0ut--rvD=uY3ORpkuNd7KoWAw@mail.gmail.com>
References: <20210724122503.2486624-1-anup.patel@wdc.com>
 <20210724122503.2486624-2-anup.patel@wdc.com>
 <CAEUhbmWPQU-xhzS6USZoj6FSw0ut--rvD=uY3ORpkuNd7KoWAw@mail.gmail.com>
Message-ID: <CAAhSdy3WdAgpRQBn7iJX7yKPLaARu7nB4u61XpwzN3=sj8GTxQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 5, 2021 at 11:59 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Jul 24, 2021 at 8:26 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We extend the ACLINT library to support separate base addresses
> > for MTIME and MTIMECMP registers.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi_utils/timer/aclint_mtimer.h | 19 ++++--
> >  lib/utils/timer/aclint_mtimer.c         | 77 +++++++++++++++++++------
> >  lib/utils/timer/fdt_timer_mtimer.c      | 16 +++--
> >  platform/fpga/ariane/platform.c         |  8 ++-
> >  platform/fpga/openpiton/platform.c      | 13 ++++-
> >  platform/kendryte/k210/platform.c       |  8 ++-
> >  platform/nuclei/ux600/platform.c        |  8 ++-
> >  platform/template/platform.c            |  8 ++-
> >  8 files changed, 116 insertions(+), 41 deletions(-)
> >
> > diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
> > index 62aa086..54eb238 100644
> > --- a/include/sbi_utils/timer/aclint_mtimer.h
> > +++ b/include/sbi_utils/timer/aclint_mtimer.h
> > @@ -12,16 +12,25 @@
> >
> >  #include <sbi/sbi_types.h>
> >
> > -#define ACLINT_MTIMER_ALIGN            0x1000
> > -#define ACLINT_MTIMER_SIZE             0x8000
> > -#define ACLINT_MTIMER_MAX_HARTS        4095
> > +#define ACLINT_MTIME_ALIGN                     0x8
> > +#define ACLINT_MTIMECMP_ALIGN                  0x8
> > +#define ACLINT_MTIMER_MAX_HARTS                4095
> > +
> > +#define ACLINT_DEFAULT_MTIME_OFFSET    0x7ff8
> > +#define ACLINT_DEFAULT_MTIME_SIZE      0x8
> > +#define ACLINT_DEFAULT_MTIMECMP_OFFSET 0x0000
> > +#define ACLINT_DEFAULT_MTIMECMP_SIZE   0x7ff8
> > +#define ACLINT_DEFAULT_MTIMER_SIZE     0x8000
> > +#define ACLINT_DEFAULT_MTIMER_ALIGN    0x1000
>
> It is confusing to have some macros be defined as MTIME while some
> others with MTIMER. Can we keep them consistent?

Okay, let me try to simplify this.

Regards,
Anup

>
> >
> >  #define CLINT_MTIMER_OFFSET            0x4000
> >
> >  struct aclint_mtimer_data {
> >         /* Public details */
> > -       unsigned long addr;
> > -       unsigned long size;
> > +       unsigned long mtime_addr;
> > +       unsigned long mtime_size;
> > +       unsigned long mtimecmp_addr;
> > +       unsigned long mtimecmp_size;
> >         u32 first_hartid;
> >         u32 hart_count;
> >         bool has_64bit_mmio;
>
> [snip]
>
> Regards,
> Bin

