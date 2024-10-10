From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Oct 2024 10:52:40 +0530
Subject: [PATCH 6/9] include: sbi: Remove cyclic include in sbi_domain_context.h
In-Reply-To: <045b3207-66f2-4c5d-a471-1229b7f5ea76@sifive.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-7-apatel@ventanamicro.com> <045b3207-66f2-4c5d-a471-1229b7f5ea76@sifive.com>
Message-ID: <CAAhSdy0KYBjkVR_QQK4RSHQ3aq8_VO05ozDdeoRvkCNbJg-VLA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 10, 2024 at 4:45?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Anup,
>
> On 2024-09-23 6:56 AM, Anup Patel wrote:
> > The sbi_domain_context.h includes sbi_domain.h and the sbi_domain.h
> > also includes sbi_domain_context.h. Remove this cyclic include in
> > sbi_domain_context.h.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi/sbi_domain_context.h | 3 ++-
> >  lib/sbi/sbi_domain_context.c     | 2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
> > index 0d25884a..3f43b622 100755
> > --- a/include/sbi/sbi_domain_context.h
> > +++ b/include/sbi/sbi_domain_context.h
> > @@ -9,7 +9,8 @@
> >
> >  #include <sbi/sbi_types.h>
> >  #include <sbi/sbi_trap.h>
> > -#include <sbi/sbi_domain.h>
> > +
> > +struct sbi_domain;
> >
> >  /** Context representation for a hart within a domain */
> >  struct sbi_context {
> > diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> > index 1432e3a8..29e2d280 100755
> > --- a/lib/sbi/sbi_domain_context.c
> > +++ b/lib/sbi/sbi_domain_context.c
> > @@ -13,7 +13,7 @@
> >  #include <sbi/sbi_heap.h>
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi/sbi_string.h>
> > -#include <sbi/sbi_domain_context.h>
>
> We should keep this include, so the functions defined in this file are checked
> against their prototypes.

I dropped this include because it was already included through sbi_domain.h
but I don't mind keeping it. I will update.

>
> Regards,
> Samuel
>
> > +#include <sbi/sbi_domain.h>
> >
> >  /**
> >   * Switches the HART context from the current domain to the target domain.
>

Thanks,
Anup

