From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 16 Sep 2020 05:30:46 +0000
Subject: [PATCH 1/5] lib: sbi: Allow specifying start mode to
 sbi_hsm_hart_start() API
In-Reply-To: <CAOnJCUKcH7CJsu_TLmMkjiGM-jgBgByCHb0ivC=MJ_EcuGuCVQ@mail.gmail.com>
References: <20200909145028.446794-1-anup.patel@wdc.com>
 <20200909145028.446794-2-anup.patel@wdc.com>
 <CAOnJCUL_8Wj-S2yc8sxPVGRf6U1K9Pm0tG0MBJRA1rxbEEERuA@mail.gmail.com>
 <DM6PR04MB62010676BCD3438D75100C868D230@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CAOnJCUKcH7CJsu_TLmMkjiGM-jgBgByCHb0ivC=MJ_EcuGuCVQ@mail.gmail.com>
Message-ID: <DM6PR04MB6201497A48C92814515FA1D58D210@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 15 September 2020 13:04
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH 1/5] lib: sbi: Allow specifying start mode to
> sbi_hsm_hart_start() API
> 
> On Mon, Sep 14, 2020 at 12:44 AM Anup Patel <Anup.Patel@wdc.com>
> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Atish Patra <atishp@atishpatra.org>
> > > Sent: 11 September 2020 06:29
> > > To: Anup Patel <Anup.Patel@wdc.com>
> > > Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> > > <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>;
> > > OpenSBI <opensbi@lists.infradead.org>
> > > Subject: Re: [PATCH 1/5] lib: sbi: Allow specifying start mode to
> > > sbi_hsm_hart_start() API
> > >
> > > On Wed, Sep 9, 2020 at 7:51 AM Anup Patel <anup.patel@wdc.com>
> wrote:
> > > >
> > > > The sbi_scratch already has provision to specify the next stage
> > > > mode so we can leverage this to specify start mode to
> sbi_hsm_hart_start().
> > > >
> > > > In future, this will be useful in providing SBI calls to U-mode on
> > > > embedded cores where we M-mode and U-mode but no S-mode.
> > > >
> > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > ---
> > > >  include/sbi/sbi_hsm.h   | 2 +-
> > > >  lib/sbi/sbi_ecall_hsm.c | 6 +++++-
> > > >  lib/sbi/sbi_hsm.c       | 6 +++++-
> > > >  3 files changed, 11 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h index
> > > > 57d41ff..18d129b 100644
> > > > --- a/include/sbi/sbi_hsm.h
> > > > +++ b/include/sbi/sbi_hsm.h
> > > > @@ -25,7 +25,7 @@ int sbi_hsm_init(struct sbi_scratch *scratch,
> > > > u32 hartid, bool cold_boot);  void __noreturn sbi_hsm_exit(struct
> > > > sbi_scratch *scratch);
> > > >
> > > >  int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
> > > > -                      ulong saddr, ulong priv);
> > > > +                      ulong saddr, ulong smode, ulong priv);
> > > >  int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
> > > > int sbi_hsm_hart_get_state(u32 hartid);  int
> > > > sbi_hsm_hart_state_to_status(int state); diff --git
> > > > a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c index
> > > > 028bf68..992c93a 100644
> > > > --- a/lib/sbi/sbi_ecall_hsm.c
> > > > +++ b/lib/sbi/sbi_ecall_hsm.c
> > > > @@ -19,12 +19,16 @@ static int sbi_ecall_hsm_handler(unsigned long
> > > extid, unsigned long funcid,
> > > >                                  unsigned long *args, unsigned long *out_val,
> > > >                                  struct sbi_trap_info *out_trap)
> > > > {
> > > > +       ulong smode;
> > > >         int ret = 0, hstate;
> > > >         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> > > >
> > > >         switch (funcid) {
> > > >         case SBI_EXT_HSM_HART_START:
> > > > -               ret = sbi_hsm_hart_start(scratch, args[0], args[1], args[2]);
> > > > +               smode = csr_read(CSR_MSTATUS);
> > > > +               smode = (smode & MSTATUS_MPP) >>
> MSTATUS_MPP_SHIFT;
> > > > +               ret = sbi_hsm_hart_start(scratch, args[0], args[1],
> > > > +                                        smode, args[2]);
> > > >                 break;
> > > >         case SBI_EXT_HSM_HART_STOP:
> > > >                 ret = sbi_hsm_hart_stop(scratch, TRUE); diff --git
> > > > a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c index 013647a..b430793
> > > > 100644
> > > > --- a/lib/sbi/sbi_hsm.c
> > > > +++ b/lib/sbi/sbi_hsm.c
> > > > @@ -203,7 +203,7 @@ fail_exit:
> > > >  }
> > > >
> > > >  int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
> > > > -                      ulong saddr, ulong priv)
> > > > +                      ulong saddr, ulong smode, ulong priv)
> > > >  {
> > > >         int rc;
> > > >         unsigned long init_count;
> > > > @@ -212,6 +212,9 @@ int sbi_hsm_hart_start(struct sbi_scratch
> > > > *scratch,
> > > u32 hartid,
> > > >         struct sbi_hsm_data *hdata;
> > > >         const struct sbi_platform *plat =
> > > > sbi_platform_ptr(scratch);
> > > >
> > > > +       if (smode != PRV_M && smode != PRV_S && smode != PRV_U)
> > > > +               return SBI_EINVAL;
> > > > +
> > > >         rscratch = sbi_hartid_to_scratch(hartid);
> > > >         if (!rscratch)
> > > >                 return SBI_EINVAL; @@ -236,6 +239,7 @@ int
> > > > sbi_hsm_hart_start(struct sbi_scratch *scratch,
> > > u32 hartid,
> > > >         init_count = sbi_init_count(hartid);
> > > >         rscratch->next_arg1 = priv;
> > > >         rscratch->next_addr = saddr;
> > > > +       rscratch->next_mode = smode;
> > > >
> > > >         if (sbi_platform_has_hart_hotplug(plat) ||
> > > >            (sbi_platform_has_hart_secondary_boot(plat) &&
> > > > !init_count)) {
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > >
> > > The change as such looks okay to me. But if it is done inside an
> > > internal function instead of changing sbi_hsm_hart_start,we can avoid
> confusion.
> > > We should keep the function names/arguments same as the spec if
> possible.
> >
> > The purpose of adding parameter in sbi_hsm_hart_start(), was to have
> > capability to start boot HART of all non-root domains from init_coldboot().
> > That's why this series is a preparatory series for OpenSBI domain support.
> >
> 
> Got it. We are getting the priv mode of the caller hart for ecall use case but
> domains will get that information domain information. That's why the mode
> has to be extracted before sbi_hsm_hart_start not inside it. Thanks for the
> explanation.
> 
> > The sbi_ecall_hsm.c is the one which follows SBI spec but sbi_hsm.c is
> > our Internal library for HSM functionality. (Similar example is
> > sbi_ecall_replace.c and sbi_tlb.c)
> >
> > Regards,
> > Anup
> 
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup
