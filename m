From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 May 2022 10:33:19 +0530
Subject: [PATCH 07/11] lib: sbi: Fix AIA feature detection
In-Reply-To: <CAOnJCUKaAKJJOGHzwO=z4cEnbQSFjkMG5MdmAd3fHTdpd+kjPA@mail.gmail.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
 <20220429155151.314788-8-apatel@ventanamicro.com>
 <CAOnJCUKaAKJJOGHzwO=z4cEnbQSFjkMG5MdmAd3fHTdpd+kjPA@mail.gmail.com>
Message-ID: <CAAhSdy0uwxg-Sm7ekeoKmLVdaHm4tq1du03G9nX8mroyxsUbLQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 4, 2022 at 7:28 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Apr 29, 2022 at 8:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The AIA feature detection uses unnecessary goto which is not need
> > and AIA case in sbi_hart_feature_id2string() does not break. This
> > patch fixes both issues in AIA feature detection.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  lib/sbi/sbi_hart.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > index 5ee5ddd..fdfb6d9 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -408,6 +408,7 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
> >                 break;
> >         case SBI_HART_HAS_AIA:
> >                 fstr = "aia";
> > +               break;
> >         case SBI_HART_HAS_SSTC:
> >                 fstr = "sstc";
> >                 break;
> > @@ -632,10 +633,8 @@ __mhpm_skip:
> >
> >         /* Detect if hart has AIA local interrupt CSRs */
> >         csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
> > -       if (trap.cause)
> > -               goto __aia_skip;
> > -       hfeatures->features |= SBI_HART_HAS_AIA;
> > -__aia_skip:
> > +       if (!trap.cause)
> > +               hfeatures->features |= SBI_HART_HAS_AIA;
> >
> >         /* Detect if hart supports stimecmp CSR(Sstc extension) */
> >         if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> > --
> > 2.34.1
> >
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

>
> --
> Regards,
> Atish

