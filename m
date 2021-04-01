From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 1 Apr 2021 05:35:14 +0000
Subject: [PATCH] firware: optimize the exception exit code
In-Reply-To: <DM6PR04MB6201E80E3F23AEA4DD8DDB118D7C9@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20210330120735.22198-1-wxjstz@126.com>
 <DM6PR04MB6201E80E3F23AEA4DD8DDB118D7C9@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <DM6PR04MB6201DC3675B13BD2C9DEA9AC8D7B9@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 31 March 2021 10:29
> To: wxjstz at 126.com; opensbi at lists.infradead.org
> Subject: RE: [PATCH] firware: optimize the exception exit code
> 
> 
> 
> > -----Original Message-----
> > From: wxjstz at 126.com <wxjstz@126.com>
> > Sent: 30 March 2021 17:38
> > To: opensbi at lists.infradead.org
> > Cc: Anup Patel <Anup.Patel@wdc.com>; Xiang W <wxjstz@126.com>
> > Subject: [PATCH] firware: optimize the exception exit code
> >
> > From: Xiang W <wxjstz@126.com>
> >
> > There are two copies of the same abnormal exit code, this patch
> > deletes one
> >
> > Signed-off-by: Xiang W <wxjstz@126.com>
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> 
> Regards,
> Anup
> 
> > ---
> >  firmware/fw_base.S     | 24 ++----------------------
> >  include/sbi/sbi_trap.h |  2 +-
> >  lib/sbi/sbi_trap.c     |  5 +++--
> >  3 files changed, 6 insertions(+), 25 deletions(-)
> >
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S index
> > 2ce3851..c897ed0 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -711,6 +711,7 @@ fw_platform_init:
> >  	.section .entry, "ax", %progbits
> >  	.align 3
> >  	.globl _trap_handler
> > +	.globl _trap_exit
> >  _trap_handler:
> >  	TRAP_SAVE_AND_SETUP_SP_T0
> >
> > @@ -720,17 +721,6 @@ _trap_handler:
> >
> >  	TRAP_CALL_C_ROUTINE
> >
> > -	TRAP_RESTORE_GENERAL_REGS_EXCEPT_SP_T0
> > -
> > -	TRAP_RESTORE_MEPC_MSTATUS 0
> > -
> > -	TRAP_RESTORE_SP_T0
> > -
> > -	mret
> > -
> > -	.section .entry, "ax", %progbits
> > -	.align 3
> > -	.globl _trap_exit
> >  _trap_exit:
> >  	add	sp, a0, zero
> >
> > @@ -746,6 +736,7 @@ _trap_exit:
> >  	.section .entry, "ax", %progbits
> >  	.align 3
> >  	.globl _trap_handler_rv32_hyp
> > +	.globl _trap_exit_rv32_hyp
> >  _trap_handler_rv32_hyp:
> >  	TRAP_SAVE_AND_SETUP_SP_T0
> >
> > @@ -755,17 +746,6 @@ _trap_handler_rv32_hyp:
> >
> >  	TRAP_CALL_C_ROUTINE
> >
> > -	TRAP_RESTORE_GENERAL_REGS_EXCEPT_SP_T0
> > -
> > -	TRAP_RESTORE_MEPC_MSTATUS 1
> > -
> > -	TRAP_RESTORE_SP_T0
> > -
> > -	mret
> > -
> > -	.section .entry, "ax", %progbits
> > -	.align 3
> > -	.globl _trap_exit_rv32_hyp
> >  _trap_exit_rv32_hyp:
> >  	add	sp, a0, zero
> >
> > diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h index
> > 070d000..0ed10df 100644
> > --- a/include/sbi/sbi_trap.h
> > +++ b/include/sbi/sbi_trap.h
> > @@ -205,7 +205,7 @@ struct sbi_trap_info {  int
> > sbi_trap_redirect(struct sbi_trap_regs *regs,
> >  		      struct sbi_trap_info *trap);
> >
> > -void sbi_trap_handler(struct sbi_trap_regs *regs);
> > +struct sbi_trap_regs* sbi_trap_handler(struct sbi_trap_regs *regs);
> >
> >  void __noreturn sbi_trap_exit(const struct sbi_trap_regs *regs);
> >
> > diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c index
> > b7349d2..07d5acb
> > 100644
> > --- a/lib/sbi/sbi_trap.c
> > +++ b/lib/sbi/sbi_trap.c
> > @@ -210,7 +210,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
> >   *
> >   * @param regs pointer to register state
> >   */
> > -void sbi_trap_handler(struct sbi_trap_regs *regs)
> > +struct sbi_trap_regs* sbi_trap_handler(struct sbi_trap_regs *regs)
> >  {
> >  	int rc = SBI_ENOTSUPP;
> >  	const char *msg = "trap handler failed"; @@ -236,7 +236,7 @@ void
> > sbi_trap_handler(struct sbi_trap_regs *regs)
> >  			msg = "unhandled external interrupt";
> >  			goto trap_error;
> >  		};
> > -		return;
> > +		return regs;
> >  	}
> >
> >  	switch (mcause) {
> > @@ -271,6 +271,7 @@ void sbi_trap_handler(struct sbi_trap_regs *regs)
> >  trap_error:
> >  	if (rc)
> >  		sbi_trap_error(msg, rc, mcause, mtval, mtval2, mtinst, regs);
> > +	return regs;
> >  }
> >
> >  typedef void (*trap_exit_t)(const struct sbi_trap_regs *regs);
> > --
> > 2.20.1


