From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 21 Dec 2022 10:41:30 -0800
Subject: [PATCH Zisslpcfi 2/2] lib: sbi: zsslpcfi detection and elp cfi
 state reflect back in status
In-Reply-To: <CAEUhbmVbzA5UhFnV+Z_eDVBd1BizjyYjrzoJ7ymT4c=Vx6FjiQ@mail.gmail.com>
References: <20221212030804.927309-1-debug@rivosinc.com> <20221212030804.927309-3-debug@rivosinc.com>
 <CAEUhbmVbzA5UhFnV+Z_eDVBd1BizjyYjrzoJ7ymT4c=Vx6FjiQ@mail.gmail.com>
Message-ID: <CAKC1njT7f_UWDB_gOWYt9o6R39U-89-vDgpStndyPq4y3uo_sA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 21, 2022 at 5:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> > @@ -87,6 +87,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
> >                       struct sbi_trap_info *trap)
> >  {
> >         ulong hstatus, vsstatus, prev_mode;
> > +       bool elp = FALSE;
>
> s/FALSE/false

I followed whatever rest of the code is following. In the same function

"
int sbi_trap_redirect(struct sbi_trap_regs *regs,
                      struct sbi_trap_info *trap)
{
        ulong hstatus, vsstatus, prev_mode;
        bool elp = FALSE;
#if __riscv_xlen == 32
        bool prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? TRUE : FALSE;
#else
        bool prev_virt = (regs->mstatus & MSTATUS_MPV) ? TRUE : FALSE;
#endif
        /* By default, we redirect to HS-mode */
        bool next_virt = FALSE;
"
I can change it to false but it'll look ugly because at other places
we're using upper case FALSE.
Let me know what needs to be done.

>
> >  #if __riscv_xlen == 32
> >         bool prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? TRUE : FALSE;
> >  #else
> > @@ -100,6 +101,13 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
> >         if (prev_mode != PRV_S && prev_mode != PRV_U)
> >                 return SBI_ENOTSUPP;
> >
> > +       /* If extension has support for CFI, clear MPELP because redirecting to VS or (H)S */
> > +       if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSLPCFI)) {
> > +               elp = (regs->mstatus & MSTATUS_MPELP)? TRUE: FALSE;
> > +               /* Since redirecting, clear mpelp unconditionally */
> > +               regs->mstatus &= ~MSTATUS_MPELP;
> > +       }
> > +
> >         /* If exceptions came from VS/VU-mode, redirect to VS-mode if
> >          * delegated in hedeleg
> >          */
> > @@ -153,6 +161,11 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
> >                 /* Get VS-mode SSTATUS CSR */
> >                 vsstatus = csr_read(CSR_VSSTATUS);
> >
> > +               /*if elp was set, set it back in vsstatus */
>
> need space after /*
>
> > +               if (elp) {
> > +                       vsstatus |= MSTATUS_SPELP;
> > +               }
> > +
> >                 /* Set SPP for VS-mode */
> >                 vsstatus &= ~SSTATUS_SPP;
> >                 if (prev_mode == PRV_S)
> > @@ -193,6 +206,11 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
> >
> >                 /* Clear SIE for S-mode */
> >                 regs->mstatus &= ~MSTATUS_SIE;
> > +
> > +               /* if elp was set, set it back in mstatus */
> > +               if (elp) {
> > +                       regs->mstatus |= MSTATUS_SPELP;
> > +               }
> >         }
> >
>
> Regards,
> Bin

