From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Feb 2022 20:44:56 +0530
Subject: [PATCH v2 02/13] lib: sbi: Detect AIA CSRs at boot-time
In-Reply-To: <CAOnJCUJhfE4eDHx2xp9PhtSacQK-QJPPZaWiQtE0gNwaJB7QZA@mail.gmail.com>
References: <20220209150441.121729-1-apatel@ventanamicro.com>
 <20220209150441.121729-3-apatel@ventanamicro.com>
 <CAOnJCUJhfE4eDHx2xp9PhtSacQK-QJPPZaWiQtE0gNwaJB7QZA@mail.gmail.com>
Message-ID: <CAAhSdy2qoTxmTL2Mn1S1AyHCuL7nn6H_w2fCZzTBJBCVoMs+8A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 9, 2022 at 10:04 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Feb 9, 2022 at 7:05 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We extend HART feature detection to discover AIA CSRs at boot-time.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi/sbi_hart.h |  4 +++-
> >  lib/sbi/sbi_hart.c     | 11 +++++++++++
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> > index d2db9d6..a83b45b 100644
> > --- a/include/sbi/sbi_hart.h
> > +++ b/include/sbi/sbi_hart.h
> > @@ -24,9 +24,11 @@ enum sbi_hart_features {
> >         SBI_HART_HAS_SSCOFPMF = (1 << 3),
> >         /** HART has timer csr implementation in hardware */
> >         SBI_HART_HAS_TIME = (1 << 4),
> > +       /** HART has AIA local interrupt CSRs */
> > +       SBI_HART_HAS_AIA = (1 << 5),
> >
> >         /** Last index of Hart features*/
> > -       SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_TIME,
> > +       SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_AIA,
> >  };
> >
> >  struct sbi_scratch;
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > index 36908b1..e028540 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -301,6 +301,9 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
> >         case SBI_HART_HAS_TIME:
> >                 fstr = "time";
> >                 break;
> > +       case SBI_HART_HAS_AIA:
> > +               fstr = "aia";
> > +               break;
> >         default:
> >                 break;
> >         }
> > @@ -524,6 +527,14 @@ __mhpm_skip:
> >         csr_read_allowed(CSR_TIME, (unsigned long)&trap);
> >         if (!trap.cause)
> >                 hfeatures->features |= SBI_HART_HAS_TIME;
> > +
> > +       /* Detect if hart has AIA local interrupt CSRs */
> > +       csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
> > +       if (trap.cause)
> > +               goto __aia_skip;
> > +       hfeatures->features |= SBI_HART_HAS_AIA;
> > +__aia_skip:
> > +       return;
> >  }
> >
> >  int sbi_hart_reinit(struct sbi_scratch *scratch)
> > --
> > 2.25.1
> >
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

>
>
> --
> Regards,
> Atish

