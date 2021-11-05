From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 5 Nov 2021 12:01:35 -0700
Subject: [PATCH v3 03/11] lib: sbi: Detect SSCOF extension at run time
In-Reply-To: <CAEUhbmVNOKEcDN_YwHoD63ntfkZa+QL2gHnsgKYcXwZ1BeP7nQ@mail.gmail.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
 <20211102150959.492991-4-atish.patra@wdc.com>
 <CAEUhbmVNOKEcDN_YwHoD63ntfkZa+QL2gHnsgKYcXwZ1BeP7nQ@mail.gmail.com>
Message-ID: <CAOnJCULiPXaYK--Yk86x+PiqF_XawU978PERDtaNYz3oUXdEiQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 3, 2021 at 8:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Nov 2, 2021 at 11:11 PM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > SSCOF ISA extension introduces PMU counter overflow and filtering support.
>
> nits: the official name is Sscofpmf, so we should stick to using it
> consistently, and the correct capital/lower case (please fix this
> globally in this series)

Done.

>
> > It introduces a read only `scountovf` csr that can be used to detect if
> > a hart supports this extension at runtime. However, this feature is only
> > useful if the hart already supports mcounteren and mcountinhibit.
> >
> > Add a dynamic detection mechanism and boot time print message if scoff
>
> nits: Sscofpmf
>
> > is present.
> >
> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  include/sbi/sbi_hart.h |  4 +++-
> >  lib/sbi/sbi_hart.c     | 12 ++++++++++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> > index 0c18ef9325b2..580a7989a4de 100644
> > --- a/include/sbi/sbi_hart.h
> > +++ b/include/sbi/sbi_hart.h
> > @@ -20,8 +20,10 @@ enum sbi_hart_features {
> >         SBI_HART_HAS_MCOUNTEREN = (1 << 1),
> >         /** Hart has counter inhibit CSR */
> >         SBI_HART_HAS_MCOUNTINHIBIT = (1 << 2),
> > +       /** Hart has sscofpmf extension */
> > +       SBI_HART_HAS_SSCOF = (1 << 3),
>
> Should it be named as HAS_SSCOFPMF ?

Done.

>
> >         /** HART has timer csr implementation in hardware */
> > -       SBI_HART_HAS_TIME = (1 << 3),
> > +       SBI_HART_HAS_TIME = (1 << 4),
> >
> >         /** Last index of Hart features*/
> >         SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_TIME,
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > index 6254452e11bb..44b8dfd1b551 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -288,6 +288,9 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
> >         case SBI_HART_HAS_MCOUNTINHIBIT:
> >                 fstr = "mcountinhibit";
> >                 break;
> > +       case SBI_HART_HAS_SSCOF:
> > +               fstr = "sscof";
> > +               break;
> >         case SBI_HART_HAS_TIME:
> >                 fstr = "time";
> >                 break;
> > @@ -497,6 +500,15 @@ __mhpm_skip:
> >                         hfeatures->features |= SBI_HART_HAS_MCOUNTINHIBIT;
> >         }
> >
> > +       /* Counter overflow/filtering is not useful without mcounter/inhibit */
> > +       if (hfeatures->features & SBI_HART_HAS_MCOUNTINHIBIT &&
> > +           hfeatures->features & SBI_HART_HAS_MCOUNTEREN) {
> > +               /* Detect if hart supports sscofpmf */
> > +               csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
> > +               if (!trap.cause)
> > +                       hfeatures->features |= SBI_HART_HAS_SSCOF;
> > +       }
> > +
> >         /* Detect if hart supports time CSR */
> >         csr_read_allowed(CSR_TIME, (unsigned long)&trap);
> >         if (!trap.cause)
> > --
>
> Regards,
> Bin
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

