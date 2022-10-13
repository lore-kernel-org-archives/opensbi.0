From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 13 Oct 2022 09:40:48 +0000
Subject: [PATCH v2 10/12] lib: utils/ipi: Add PLICSW mmio region to root
 domain
In-Reply-To: <CAAhSdy0WXhv3h_sXC3vjR9qLzJf+fD5QYVbOhJJN_ZVFshYXiQ@mail.gmail.com>
References: <20221003115230.10127-1-peterlin@andestech.com>
 <20221003115230.10127-11-peterlin@andestech.com>
 <CAAhSdy0WXhv3h_sXC3vjR9qLzJf+fD5QYVbOhJJN_ZVFshYXiQ@mail.gmail.com>
Message-ID: <Y0fdIH8ADF54uVS1@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 11, 2022 at 10:27:23PM +0530, Anup Patel wrote:
> On Mon, Oct 3, 2022 at 5:24 PM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Add PLICSW as mmio memregion in root domain at boot-time.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > ---
> >  lib/utils/ipi/fdt_ipi_plicsw.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/lib/utils/ipi/fdt_ipi_plicsw.c b/lib/utils/ipi/fdt_ipi_plicsw.c
> > index 8788f74..3af92bd 100644
> > --- a/lib/utils/ipi/fdt_ipi_plicsw.c
> > +++ b/lib/utils/ipi/fdt_ipi_plicsw.c
> > @@ -10,6 +10,7 @@
> >   *   Yu Chien Peter Lin <peterlin@andestech.com>
> >   */
> >
> > +#include <sbi/sbi_domain.h>
> >  #include <sbi/sbi_error.h>
> >  #include <sbi/sbi_ipi.h>
> >  #include <sbi_utils/fdt/fdt_helper.h>
> > @@ -34,6 +35,34 @@ static int plicsw_warm_ipi_init(void)
> >         return 0;
> >  }
> >
> > +static int andes_plicsw_add_regions(unsigned long addr, unsigned long size)
> > +{
> > +#define PLICSW_ADD_REGION_ALIGN 0x1000
> > +       int rc;
> > +       unsigned long pos, end, region_size;
> > +       struct sbi_domain_memregion reg;
> > +
> > +       pos = addr;
> > +       end = addr + size;
> > +       while (pos < end) {
> > +               if (pos & (PLICSW_ADD_REGION_ALIGN - 1))
> > +                       region_size = 1UL << sbi_ffs(pos);
> > +               else
> > +                       region_size = ((end - pos) < PLICSW_ADD_REGION_ALIGN)
> > +                                             ? (end - pos)
> > +                                             : PLICSW_ADD_REGION_ALIGN;
> > +
> > +               sbi_domain_memregion_init(pos, region_size,
> > +                                         SBI_DOMAIN_MEMREGION_MMIO, &reg);
> > +               rc = sbi_domain_root_add_memregion(&reg);
> > +               if (rc)
> > +                       return rc;
> > +               pos += region_size;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> 
> This is exactly same as your PATCH5 and aclint_mtimer_add_regions()
> defined in lib/utils/timer/aclint_mtimer.c
> 
> I suggest adding a common function in sbi_domain.c and sbi_domain.h
> with following function prototype:
> int sbi_domain_root_add_memrange(unsigned long addr,
>                                                             unsigned long size,
>                                                             unsigned long align,
>                                                             unsigned
> long region_flags);
> 
> You can have one patch at the beginning of the series which adds
> above function in sbi_domain.c and remove it from aclint_mtimer.c
> 
> Your PATCH4 and PATCH9 can directly use this new function
> which will allow you to drop your PATCH5 and PATCH10
> 
> Regards,
> Anup


Hi Anup,
Thanks for your suggestion, I'll resend patches with this function
factored out into sbi_domain.c.

Best Regards,
Peter Lin


