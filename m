From: Xiang W <wxjstz@126.com>
Date: Mon, 12 Apr 2021 13:42:23 +0800
Subject: [PATCH 4/7] lib: utils/sys: Add CLINT memregion in the root domain
In-Reply-To: <CAAhSdy3RXmSTH78zMLtOPuLQqTzQRkFHmMcPWtOhN-jRBO7Sqg@mail.gmail.com>
References: <20210410071808.759856-1-anup.patel@wdc.com>
 <20210410071808.759856-5-anup.patel@wdc.com>
 <f277ff1b39e108996d72315a3d1286aeb9943d44.camel@126.com>
 <CAAhSdy3RXmSTH78zMLtOPuLQqTzQRkFHmMcPWtOhN-jRBO7Sqg@mail.gmail.com>
Message-ID: <3e0812e732394a3f39bd678332edd2cbc7478014.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-04-12?? 10:53 +0530?Anup Patel???
> On Sun, Apr 11, 2021 at 2:35 PM Xiang W <wxjstz@126.com> wrote:
> > ? 2021-04-10?? 12:48 +0530?Anup Patel???
> > > The CLINT memory should not be accessed by the supervisor-mode
> > > software so let's protect it by adding CLINT memregion to the
> > > root domain.
> > > 
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > clint_cold_timer_init and clint_cold_ipi_init may use the same
> > clint,
> > which will call clint_add_root_memregion twice and generate an
> > error.
> > I suggest to separate
> > 
> > In clint_cold_timer_init execute
> > sbi_domain_memregion_init(clint->addr, 0x4000,
> > SBI_DOMAIN_MEMREGION_MMIO, &reg);
> > 
> > In clint_cold_ipi_init execute
> > sbi_domain_memregion_init(clint->addr + 0x4000, 0x8000,
> > SBI_DOMAIN_MEMREGION_MMIO, &reg);
> 
> I had though about this but the only issue in having two
> separate memregions for CLINT is that it will take-up more
> PMP CSRs. The "skip_conflt" flag was added as parameter
> to sbi_domain_root_add_memregion() so that CLINT driver
> can call it multiple time.
> 
> I think we can have a better implementation of the
> sbi_domain_root_add_memregion() which will merge
> consecutive regions with matching flags. This will allow
> use to add separate regions for CLINT driver but
> sbi_domain_root_add_memregion() will merge them
> into single region.
Merge regions is a good idea. I think the merger can be performed by
default. So we can separate this side first, and then modify
sbi_domain_root_add_memregion to add the merge function.

Regards,
Xiang W
> 
> Regards,
> Anup
> 
> > Regards,
> > Xiang W
> > > ---
> > >  lib/utils/sys/clint.c | 17 +++++++++++++++--
> > >  1 file changed, 15 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/lib/utils/sys/clint.c b/lib/utils/sys/clint.c
> > > index 7a392aa..fe98cc4 100644
> > > --- a/lib/utils/sys/clint.c
> > > +++ b/lib/utils/sys/clint.c
> > > @@ -10,6 +10,7 @@
> > >  #include <sbi/riscv_asm.h>
> > >  #include <sbi/riscv_atomic.h>
> > >  #include <sbi/riscv_io.h>
> > > +#include <sbi/sbi_domain.h>
> > >  #include <sbi/sbi_error.h>
> > >  #include <sbi/sbi_hartmask.h>
> > >  #include <sbi_utils/sys/clint.h>
> > > @@ -17,9 +18,19 @@
> > >  #define CLINT_IPI_OFF                0
> > >  #define CLINT_TIME_CMP_OFF   0x4000
> > >  #define CLINT_TIME_VAL_OFF   0xbff8
> > > +#define CLINT_SIZE           0xc000
> > > 
> > >  static struct clint_data
> > > *clint_ipi_hartid2data[SBI_HARTMASK_MAX_BITS];
> > > 
> > > +static int clint_add_root_memregion(struct clint_data *clint)
> > > +{
> > > +     struct sbi_domain_memregion reg;
> > > +
> > > +     sbi_domain_memregion_init(clint->addr, CLINT_SIZE,
> > > +                               SBI_DOMAIN_MEMREGION_MMIO, &reg);
> > > +     return sbi_domain_root_add_memregion(&reg, true);
> > > +}
> > > +
> > >  void clint_ipi_send(u32 target_hart)
> > >  {
> > >       struct clint_data *clint;
> > > @@ -70,7 +81,8 @@ int clint_cold_ipi_init(struct clint_data
> > > *clint)
> > >       for (i = 0; i < clint->hart_count; i++)
> > >               clint_ipi_hartid2data[clint->first_hartid + i] =
> > > clint;
> > > 
> > > -     return 0;
> > > +     /* Add CLINT region to the root domain */
> > > +     return clint_add_root_memregion(clint);
> > >  }
> > > 
> > >  static struct clint_data
> > > *clint_timer_hartid2data[SBI_HARTMASK_MAX_BITS];
> > > @@ -199,5 +211,6 @@ int clint_cold_timer_init(struct clint_data
> > > *clint,
> > >       for (i = 0; i < clint->hart_count; i++)
> > >               clint_timer_hartid2data[clint->first_hartid + i] =
> > > clint;
> > > 
> > > -     return 0;
> > > +     /* Add CLINT region to the root domain */
> > > +     return clint_add_root_memregion(clint);
> > >  }
> > > --
> > > 2.25.1
> > > 
> > > 


