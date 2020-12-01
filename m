From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 1 Dec 2020 16:28:32 +0000
Subject: [PATCH v3 3/5] platform: Remove dummy system reset functions
In-Reply-To: <CAOnJCU+F8jQEhBrirKHXD+pemHCjD8c57nAQjNsbn15vhsq7QA@mail.gmail.com>
References: <20201125051647.295472-1-anup.patel@wdc.com>
 <20201125051647.295472-4-anup.patel@wdc.com>
 <CAOnJCU+F8jQEhBrirKHXD+pemHCjD8c57nAQjNsbn15vhsq7QA@mail.gmail.com>
Message-ID: <DM6PR04MB62010DDB2D87AC724E39919B8DF40@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 01 December 2020 13:14
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH v3 3/5] platform: Remove dummy system reset
> functions
> 
> On Tue, Nov 24, 2020 at 9:17 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > Few platforms have dummy system reset functions so let's remove these
> > dummy system reset functions to allow generic code deal with it in the
> > right way.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  platform/andes/ae350/platform.c    | 10 ----------
> >  platform/fpga/ariane/platform.c    | 11 -----------
> >  platform/fpga/openpiton/platform.c | 11 -----------
> > platform/kendryte/k210/platform.c  | 10 ----------
> >  platform/sifive/fu540/platform.c   |  7 -------
> >  5 files changed, 49 deletions(-)
> >
> > diff --git a/platform/andes/ae350/platform.c
> > b/platform/andes/ae350/platform.c index 954942c..6d6ce4e 100644
> > --- a/platform/andes/ae350/platform.c
> > +++ b/platform/andes/ae350/platform.c
> > @@ -114,14 +114,6 @@ static int ae350_timer_init(bool cold_boot)
> >         return plmt_warm_timer_init();  }
> >
> > -/* Reset the platform. */
> > -static int ae350_system_reset(u32 type) -{
> > -       /* For now nothing to do. */
> > -       sbi_printf("System reset\n");
> > -       return 0;
> > -}
> > -
> >  /* Vendor-Specific SBI handler */
> >  static int ae350_vendor_ext_provider(long extid, long funcid,
> >         unsigned long *args, unsigned long *out_value, @@ -185,8
> > +177,6 @@ const struct sbi_platform_operations platform_ops = {
> >         .timer_event_start = plmt_timer_event_start,
> >         .timer_event_stop  = plmt_timer_event_stop,
> >
> > -       .system_reset    = ae350_system_reset,
> > -
> >         .vendor_ext_provider = ae350_vendor_ext_provider  };
> >
> > diff --git a/platform/fpga/ariane/platform.c
> > b/platform/fpga/ariane/platform.c index a4d437e..ea179e5 100644
> > --- a/platform/fpga/ariane/platform.c
> > +++ b/platform/fpga/ariane/platform.c
> > @@ -147,16 +147,6 @@ static int ariane_timer_init(bool cold_boot)
> >         return clint_warm_timer_init();  }
> >
> > -/*
> > - * Reset the ariane.
> > - */
> > -static int ariane_system_reset(u32 type) -{
> > -       /* For now nothing to do. */
> > -       sbi_printf("System reset\n");
> > -       return 0;
> > -}
> > -
> >  /*
> >   * Platform descriptor.
> >   */
> > @@ -174,7 +164,6 @@ const struct sbi_platform_operations platform_ops
> = {
> >         .timer_value = clint_timer_value,
> >         .timer_event_start = clint_timer_event_start,
> >         .timer_event_stop = clint_timer_event_stop,
> > -       .system_reset = ariane_system_reset
> >  };
> >
> >  const struct sbi_platform platform = { diff --git
> > a/platform/fpga/openpiton/platform.c
> > b/platform/fpga/openpiton/platform.c
> > index 095004d..5eae477 100644
> > --- a/platform/fpga/openpiton/platform.c
> > +++ b/platform/fpga/openpiton/platform.c
> > @@ -173,16 +173,6 @@ static int openpiton_timer_init(bool cold_boot)
> >         return clint_warm_timer_init();  }
> >
> > -/*
> > - * Reset the openpiton.
> > - */
> > -static int openpiton_system_reset(u32 type) -{
> > -       /* For now nothing to do. */
> > -       sbi_printf("System reset\n");
> > -       return 0;
> > -}
> > -
> >  /*
> >   * Platform descriptor.
> >   */
> > @@ -200,7 +190,6 @@ const struct sbi_platform_operations platform_ops
> = {
> >         .timer_value = clint_timer_value,
> >         .timer_event_start = clint_timer_event_start,
> >         .timer_event_stop = clint_timer_event_stop,
> > -       .system_reset = openpiton_system_reset
> >  };
> >
> >  const struct sbi_platform platform = { diff --git
> > a/platform/kendryte/k210/platform.c
> > b/platform/kendryte/k210/platform.c
> > index 75883ed..944b388 100644
> > --- a/platform/kendryte/k210/platform.c
> > +++ b/platform/kendryte/k210/platform.c
> > @@ -129,14 +129,6 @@ static int k210_timer_init(bool cold_boot)
> >         return clint_warm_timer_init();  }
> >
> > -static int k210_system_reset(u32 type) -{
> > -       /* For now nothing to do. */
> > -       sbi_printf("System reset\n");
> > -
> > -       return 0;
> > -}
> > -
> >  const struct sbi_platform_operations platform_ops = {
> >         .final_init     = k210_final_init,
> >
> > @@ -154,8 +146,6 @@ const struct sbi_platform_operations platform_ops
> = {
> >         .timer_value       = clint_timer_value,
> >         .timer_event_stop  = clint_timer_event_stop,
> >         .timer_event_start = clint_timer_event_start,
> > -
> > -       .system_reset    = k210_system_reset
> >  };
> >
> >  const struct sbi_platform platform = { diff --git
> > a/platform/sifive/fu540/platform.c b/platform/sifive/fu540/platform.c
> > index 755e479..cdd8293 100644
> > --- a/platform/sifive/fu540/platform.c
> > +++ b/platform/sifive/fu540/platform.c
> > @@ -154,12 +154,6 @@ static u32
> fu540_hart_index2id[FU540_HART_COUNT - 1] = {
> >         [3] = 4,
> >  };
> >
> > -static int fu540_system_reset(u32 type) -{
> > -       /* For now nothing to do. */
> > -       return 0;
> > -}
> > -
> >  const struct sbi_platform_operations platform_ops = {
> >         .final_init             = fu540_final_init,
> >         .console_putc           = sifive_uart_putc,
> > @@ -174,7 +168,6 @@ const struct sbi_platform_operations platform_ops
> = {
> >         .timer_event_stop       = clint_timer_event_stop,
> >         .timer_event_start      = clint_timer_event_start,
> >         .timer_init             = fu540_timer_init,
> > -       .system_reset           = fu540_system_reset
> >  };
> >
> >  const struct sbi_platform platform = {
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup
