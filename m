From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 10 Jul 2021 21:30:20 +0800
Subject: [PATCH] firmware: Minor optimization in _scratch_init()
In-Reply-To: <CAOnJCULkDt5ih9sc9q0nxXdn95T0V5b9EM_vg3Xk-2H67a3N+w@mail.gmail.com>
References: <20210708133511.9198-1-bmeng.cn@gmail.com>
 <CAOnJCULkDt5ih9sc9q0nxXdn95T0V5b9EM_vg3Xk-2H67a3N+w@mail.gmail.com>
Message-ID: <CAEUhbmWvj85dh5EMu2TOqfUhd-BhwDUKKRUJkt1NrFymYovNeg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 12:50 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Jul 8, 2021 at 6:35 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Before entering _scratch_init(), register t3 already holds a copy
> > of the firmware end address, hence there is no need to calculate
> > it again. This reduces 3 instructions in each _scratch_init() loop.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  firmware/fw_base.S | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> > index a5ce946..e35f18e 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -287,10 +287,7 @@ _scratch_init:
> >         /* Initialize scratch space */
> >         /* Store fw_start and fw_size in scratch space */
> >         lla     a4, _fw_start
> > -       lla     a5, _fw_end
> > -       mul     t0, s7, s8
> > -       add     a5, a5, t0
> > -       sub     a5, a5, a4
> > +       sub     a5, t3, a4
>
> It saves 3 instructions during boot but uses a temporary register (t3)
> which was not computed in this block.
> The first instruction of the loop also uses t3 to save tp. Can you add
> a comment in the beginning of the loop
> saying that all the registers that are critical for _scratch_init loop ?
>
> This will remind the future developers that they shouldn't touch these
> register inside the loop.

Sure, will add a comment in v2.

>
>
> >         REG_S   a4, SBI_SCRATCH_FW_START_OFFSET(tp)
> >         REG_S   a5, SBI_SCRATCH_FW_SIZE_OFFSET(tp)
> >         /* Store next arg1 in scratch space */
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
> Otherwise, looks good to me.
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Regards,
Bin

