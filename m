From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 9 Sep 2020 05:04:24 +0000
Subject: [PATCH 3/3] lib: sbi_trap: Allow M-mode to M-mode ECALLs
In-Reply-To: <CAOnJCU+43kWH0Uaex=yPHPZCRxqz0cTqNnuFLb-Wjkkpc5_Cog@mail.gmail.com>
References: <20200904121341.156416-1-anup.patel@wdc.com>
 <20200904121341.156416-4-anup.patel@wdc.com>
 <CAOnJCU+43kWH0Uaex=yPHPZCRxqz0cTqNnuFLb-Wjkkpc5_Cog@mail.gmail.com>
Message-ID: <DM6PR04MB6201E8B64DCFAD3FFBA44CA58D260@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 08 September 2020 11:20
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH 3/3] lib: sbi_trap: Allow M-mode to M-mode ECALLs
> 
> On Fri, Sep 4, 2020 at 5:14 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We should allow M-mode to M-mode ECALLs because:
> > 1. No other mode can handle M-mode ECALLs 2. In future, we can allow
> > M-mode baremetal application (not
> >    linked to OpenSBI) running independently and cooperatively
> >    without corrupting OpenSBI M-mode state (CSRs and memory).
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  lib/sbi/sbi_trap.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c index
> > b8bb20c..db5aa2f 100644
> > --- a/lib/sbi/sbi_trap.c
> > +++ b/lib/sbi/sbi_trap.c
> > @@ -252,6 +252,7 @@ void sbi_trap_handler(struct sbi_trap_regs *regs)
> >                 msg = "misaligned store handler failed";
> >                 break;
> >         case CAUSE_SUPERVISOR_ECALL:
> > +       case CAUSE_MACHINE_ECALL:
> >                 rc  = sbi_ecall_handler(regs);
> >                 msg = "ecall handler failed";
> >                 break;
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
