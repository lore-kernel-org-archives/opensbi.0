From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Dec 2022 09:29:55 +0800
Subject: [PATCH Zisslpcfi 2/2] lib: sbi: zsslpcfi detection and elp cfi
 state reflect back in status
In-Reply-To: <CAKC1njT7f_UWDB_gOWYt9o6R39U-89-vDgpStndyPq4y3uo_sA@mail.gmail.com>
References: <20221212030804.927309-1-debug@rivosinc.com> <20221212030804.927309-3-debug@rivosinc.com>
 <CAEUhbmVbzA5UhFnV+Z_eDVBd1BizjyYjrzoJ7ymT4c=Vx6FjiQ@mail.gmail.com> <CAKC1njT7f_UWDB_gOWYt9o6R39U-89-vDgpStndyPq4y3uo_sA@mail.gmail.com>
Message-ID: <CAEUhbmU_VSxOZimny4A8Ym3ELo_5EZpKD=jaYwnPGQm_Rcqwog@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 2:41 AM Deepak Gupta <debug@rivosinc.com> wrote:
>
> On Wed, Dec 21, 2022 at 5:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > > @@ -87,6 +87,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
> > >                       struct sbi_trap_info *trap)
> > >  {
> > >         ulong hstatus, vsstatus, prev_mode;
> > > +       bool elp = FALSE;
> >
> > s/FALSE/false
>
> I followed whatever rest of the code is following. In the same function
>
> "
> int sbi_trap_redirect(struct sbi_trap_regs *regs,
>                       struct sbi_trap_info *trap)
> {
>         ulong hstatus, vsstatus, prev_mode;
>         bool elp = FALSE;
> #if __riscv_xlen == 32
>         bool prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? TRUE : FALSE;
> #else
>         bool prev_virt = (regs->mstatus & MSTATUS_MPV) ? TRUE : FALSE;
> #endif
>         /* By default, we redirect to HS-mode */
>         bool next_virt = FALSE;
> "
> I can change it to false but it'll look ugly because at other places
> we're using upper case FALSE.
> Let me know what needs to be done.
>

No need to worry about other places, as I already sent one patch to
change all other places.

Regards,
Bin

