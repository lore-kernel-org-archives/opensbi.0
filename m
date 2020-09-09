From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 9 Sep 2020 05:03:50 +0000
Subject: [PATCH 1/3] lib: sbi: Don't handle VS-mode ecall in
 sbi_trap_handler()
In-Reply-To: <CAOnJCUL-ifQu5oWBSJ7jJwb_N+YW6YWcShHrOs-pCHBrjDnXsA@mail.gmail.com>
References: <20200904121341.156416-1-anup.patel@wdc.com>
 <20200904121341.156416-2-anup.patel@wdc.com>
 <CAOnJCUL-ifQu5oWBSJ7jJwb_N+YW6YWcShHrOs-pCHBrjDnXsA@mail.gmail.com>
Message-ID: <DM6PR04MB6201EF77530A8511B62D53348D260@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 08 September 2020 11:18
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH 1/3] lib: sbi: Don't handle VS-mode ecall in
> sbi_trap_handler()
> 
> On Fri, Sep 4, 2020 at 5:14 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The VS-mode ecall is supposed to be handled by HS-mode so
> > sbi_trap_handler() should fallback to default case for VS-mode ecall
> > trap.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  lib/sbi/sbi_trap.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c index
> > c2bd061..8fe6753 100644
> > --- a/lib/sbi/sbi_trap.c
> > +++ b/lib/sbi/sbi_trap.c
> > @@ -251,7 +251,6 @@ void sbi_trap_handler(struct sbi_trap_regs *regs)
> >                 rc  = sbi_misaligned_store_handler(mtval, mtval2, mtinst, regs);
> >                 msg = "misaligned store handler failed";
> >                 break;
> > -       case CAUSE_SUPERVISOR_ECALL:
> >         case CAUSE_HYPERVISOR_ECALL:
> >                 rc  = sbi_ecall_handler(regs);
> >                 msg = "ecall handler failed";
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
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup
