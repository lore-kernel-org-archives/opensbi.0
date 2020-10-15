From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 Oct 2020 17:35:29 +0530
Subject: [PATCH 08/16] lib: sbi: Extend sbi_hsm_hart_start() for domains
In-Reply-To: <CAOnJCU+4jdc06+nCzbPao0Wg3QAvxKj859-7gvfXpbE_uEL6Ow@mail.gmail.com>
References: <20200925112914.725846-1-anup.patel@wdc.com>
 <20200925112914.725846-9-anup.patel@wdc.com>
 <CAOnJCU+4jdc06+nCzbPao0Wg3QAvxKj859-7gvfXpbE_uEL6Ow@mail.gmail.com>
Message-ID: <CAAhSdy35-5_2zbx+9Y8kPw2FG2nih5R_7XfgerzH4nXzUv1ctw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 7, 2020 at 5:27 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Sep 25, 2020 at 4:30 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The sbi_hsm_hart_start() should consider the domain under which we
> > are trying to start the HART. This will help ensure that HART A can
> > start HART B only if both HARTs A and B belong to the same domain.
> >
> > We also have a special case when we bring-up boot HART of non-root
> > domains in sbi_domain_finalize() where we should skip domain checks
> > in sbi_hsm_hart_start(). To achieve this, sbi_hsm_hart_start() should
> > do domain checks only when domain parameter is non-NULL.
> >
> > This patch extends sbi_hsm_hart_start() as-per above.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/sbi_hsm.h   |  5 +++--
> >  lib/sbi/sbi_domain.c    |  6 ++++--
> >  lib/sbi/sbi_ecall_hsm.c |  4 ++--
> >  lib/sbi/sbi_hsm.c       | 16 ++++++++--------
> >  4 files changed, 17 insertions(+), 14 deletions(-)
> >
> > diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
> > index 296b267..4823383 100644
> > --- a/include/sbi/sbi_hsm.h
> > +++ b/include/sbi/sbi_hsm.h
> > @@ -25,8 +25,9 @@ struct sbi_scratch;
> >  int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot);
> >  void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch);
> >
> > -int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
> > -                      ulong saddr, ulong smode, ulong priv);
> > +int sbi_hsm_hart_start(struct sbi_scratch *scratch,
> > +                      const struct sbi_domain *dom,
> > +                      u32 hartid, ulong saddr, ulong smode, ulong priv);
> >  int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
> >  int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
> >  int sbi_hsm_hart_state_to_status(int state);
> > diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> > index 8d5dae1..df0f2a5 100644
> > --- a/lib/sbi/sbi_domain.c
> > +++ b/lib/sbi/sbi_domain.c
> > @@ -309,8 +309,10 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
> >                         scratch->next_mode = dom->next_mode;
> >                         scratch->next_arg1 = dom->next_arg1;
> >                 } else {
> > -                       rc = sbi_hsm_hart_start(scratch, dhart, dom->next_addr,
> > -                                       dom->next_mode, dom->next_arg1);
> > +                       rc = sbi_hsm_hart_start(scratch, NULL, dhart,
> > +                                               dom->next_addr,
> > +                                               dom->next_mode,
> > +                                               dom->next_arg1);
> >                         if (rc)
> >                                 return rc;
> >                 }
> > diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
> > index 3698a41..376740c 100644
> > --- a/lib/sbi/sbi_ecall_hsm.c
> > +++ b/lib/sbi/sbi_ecall_hsm.c
> > @@ -28,8 +28,8 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
> >         case SBI_EXT_HSM_HART_START:
> >                 smode = csr_read(CSR_MSTATUS);
> >                 smode = (smode & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
> > -               ret = sbi_hsm_hart_start(scratch, args[0], args[1],
> > -                                        smode, args[2]);
> > +               ret = sbi_hsm_hart_start(scratch, sbi_domain_thishart_ptr(),
> > +                                        args[0], args[1], smode, args[2]);
> >                 break;
> >         case SBI_EXT_HSM_HART_STOP:
> >                 ret = sbi_hsm_hart_stop(scratch, TRUE);
> > diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> > index 1f8dadc..c16d542 100644
> > --- a/lib/sbi/sbi_hsm.c
> > +++ b/lib/sbi/sbi_hsm.c
> > @@ -205,10 +205,10 @@ fail_exit:
> >         sbi_hart_hang();
> >  }
> >
> > -int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
> > -                      ulong saddr, ulong smode, ulong priv)
> > +int sbi_hsm_hart_start(struct sbi_scratch *scratch,
> > +                      const struct sbi_domain *dom,
> > +                      u32 hartid, ulong saddr, ulong smode, ulong priv)
> >  {
> > -       int rc;
> >         unsigned long init_count;
> >         unsigned int hstate;
> >         struct sbi_scratch *rscratch;
> > @@ -217,6 +217,11 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
> >
> >         if (smode != PRV_M && smode != PRV_S && smode != PRV_U)
> >                 return SBI_EINVAL;
> > +       if (dom && !sbi_domain_assigned_hart(dom, hartid))
> > +               return SBI_EINVAL;
> > +       if (dom && !sbi_domain_check_addr(dom, saddr, smode,
> > +                                         FALSE, FALSE, FALSE, TRUE))
> > +               return SBI_EINVAL;
> >
> >         rscratch = sbi_hartid_to_scratch(hartid);
> >         if (!rscratch)
> > @@ -234,11 +239,6 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
> >         if (hstate != SBI_HART_STOPPED)
> >                 return SBI_EINVAL;
> >
> > -       rc = sbi_hart_pmp_check_addr(scratch, saddr, smode, PMP_X);
> > -       if (rc)
> > -               return rc;
> > -       //TODO: We also need to check saddr for valid physical address as well.
> > -
>
> Why is the check being removed ? IIRC, this API was improved in your
> last series to include the mode but removed completely later in this
> series.
> Maybe I missed something in the series or yet to review.

The sbi_hart_pmp_check_addr() call is redundant here because the
sbi_domain_check_addr() above does the required checks.

>
> >         init_count = sbi_init_count(hartid);
> >         rscratch->next_arg1 = priv;
> >         rscratch->next_addr = saddr;
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
>
>
> --
> Regards,
> Atish

Regards,
Anup

