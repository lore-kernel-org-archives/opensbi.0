From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 16 Jan 2023 20:17:16 +0000
Subject: [PATCH 5/6] lib: reset/fdt_reset_atcwdt200: use defined macros
 in atcsmu.h
In-Reply-To: <CAAhSdy3XC9b8FWYqDd1gTTwz-_BL9ZAnHZZKeja7+a01L0RpQw@mail.gmail.com>
References: <20230104062927.15628-1-peterlin@andestech.com>
 <20230104062927.15628-6-peterlin@andestech.com>
 <CAAhSdy3XC9b8FWYqDd1gTTwz-_BL9ZAnHZZKeja7+a01L0RpQw@mail.gmail.com>
Message-ID: <Y8WwzLahq52eTGcl@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On Mon, Jan 16, 2023 at 02:45:51PM +0530, Anup Patel wrote:
> On Wed, Jan 4, 2023 at 12:02 PM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Reuse the smu related macros defined in atcsmu.h.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> >  lib/utils/reset/fdt_reset_atcwdt200.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
> > index 91acc9f..a6e6834 100644
> > --- a/lib/utils/reset/fdt_reset_atcwdt200.c
> > +++ b/lib/utils/reset/fdt_reset_atcwdt200.c
> > @@ -17,6 +17,8 @@
> >  #include <sbi_utils/fdt/fdt_helper.h>
> >  #include <sbi_utils/reset/fdt_reset.h>
> >
> > +#include <andes/atcsmu.h>
> > +
> 
> This can result in compile error because andes/atcsmu.h is
> part of platform code.
> 
> I suggest that andes/atcsmu.h should be in a common location
> include/sbi_utils/sys/ which is meant for common system devices.
>
> Regards,
> Anup

OK, will fix.

Thanks,
Peter Lin

