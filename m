From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 1 Nov 2021 16:20:26 +0800
Subject: [PATCH] lib: sbi: Emulate debug CSR read/write
In-Reply-To: <CAAhSdy1+HbRfeXY0rwXp1=VcsK33Tp-mDaCKW=hdui+gx-_K-g@mail.gmail.com>
References: <20211029134612.23513-1-bmeng.cn@gmail.com>
 <349ae26f5f3dad1e7ff193fdbd8855755951981c.camel@126.com>
 <CAAhSdy2DiExhJizT0Eg-vS9eg0UPQhZhud=LUtvy4EthWQvYdw@mail.gmail.com>
 <CAEUhbmXBo9sLZGSkjAfq_QFxs-kEgOod=g+PjgLQgH5WLSVroA@mail.gmail.com>
 <CAAhSdy1+HbRfeXY0rwXp1=VcsK33Tp-mDaCKW=hdui+gx-_K-g@mail.gmail.com>
Message-ID: <CAEUhbmU2tprx7NfMkGVQWdKLN8yA2u24xBhZJ+WoG13wSRcXoA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 1, 2021 at 3:52 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Nov 1, 2021 at 12:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Nov 1, 2021 at 2:45 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Sun, Oct 31, 2021 at 12:40 PM Xiang W <wxjstz@126.com> wrote:
> > > >
> > > > ? 2021-10-29???? 21:46 +0800?Bin Meng???
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > Trap-n-emulate debug CSR read/write, which is needed by S-mode
> > > > > software to implement the self-hosted debugger functionality.
> > > > >
> > > > > Since these CSRs might be optional, use CSR detect read/write,
> > > > > and redirect the illegal instruction exception if unavailable.
> > > > >
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > Reviewed-by: Xiang W <wxjstz@126.com>
> > >
> > > Directly exposing machine-mode CSRs via CSR emulation is not
> > > acceptable. The S-mode should only be accessing CSRs meant
> > > for S-mode. If required we should define SBI extension and use
> > > that program debug CSRs from S-mode.
> > >
> > > Further, directly using csr_read/write_allowed() in CSR emulation
> > > is also not appropriate because these calls are slower compared
> > > to regular csr_read/write().
> >
> > I am afraid they have to be. Even if we use SBI to abstract the
> > register programming, it still may need to use the _allowed version
> > for the tdata1/2/3 access as these registers may not be available for
> > a specific trigger and may cause illegal instruction for one trigger
> > but not another.
>
> Why can't we discover/know the conditions in which some of the
> CSRs trigger illegal instruction ?

Not possible now with current latest priv & debug spec, neither on the
real hardware (SiFive U54/U74). Maybe via mconfigptr in the future.

> This still seems like HACK which is trying to avoid getting into
> details of debug capabilities.
>
> >
> > >
> > > I suggest the following:
> > > 1) Define SBI debug extension
> > > 2) Have a patch to detect debug CSRs in hart_detect_features()
> > > 3) Implement SBI debug extension in OpenSBI
> >
> > The RISC-V debug spec is very loose (or flexible) in defining what
> > capabilities are to be provided by the hardware, so it becomes quite
> > complicated to provide a complete SBI mapping to what the hardware can
> > provide. I feel the best way is to expose such to S-mode and have
> > S-mode to directly program these debug registers.
>
> Flexibility and modularity is nature of RISC-V but this does not mean
> we should not put efforts in defining proper abstraction. The best
> example is SBI PMU extension where platforms have lot of flexibility
> in implementation but the SBI PMU tries it's best to standardize the
> interface.
>
> Allowing direct access to M-mode CSRs from S-mode is not the
> right way to go. What if VS-mode accesses this M-mode CSRs
> which will now trap to M-mode ? What about nested virtualization ?

The breakpoint trap needs to be delegated to VS-mode anyway. This
delegation should be done regardless how this is implemented.

> We can discover the debug capabilities in some way and present
> a standard SBI debug interface to S-mode. We can also ensure
> that SBI debug interface is virtualization friendly so that VS-mode
> can also happily use it running under a hypervisor.

Will need some time to think about the SBI debug interface.

Regards,
Bin

