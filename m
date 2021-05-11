From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 11 May 2021 12:18:59 -0700
Subject: [PATCH RFC] platform: generic: How to add custom extensions for
 sbi_call?
In-Reply-To: <MN2PR04MB6207AD3426C3DB434E7E46D48D5E9@MN2PR04MB6207.namprd04.prod.outlook.com>
References: <1619618066-11406-1-git-send-email-guoren@kernel.org>
 <CAJF2gTTrcfR5iNXNOxooTe6q2oB=PQhr6yKNU+C+8iaPbcj1KQ@mail.gmail.com>
 <DM6PR04MB62015F7B26E92382551D064C8D5F9@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CAJF2gTTKMG9nv9jujsFjJM1k+KMXmq2Fv8BT-cigsoRbhwP+aw@mail.gmail.com>
 <MN2PR04MB6207AD3426C3DB434E7E46D48D5E9@MN2PR04MB6207.namprd04.prod.outlook.com>
Message-ID: <CAOnJCULgUWtHKMJWBwT9ac2aiav1b7kyBYLqRR2Rx8sNkWeKjA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 29, 2021 at 9:03 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Guo Ren <guoren@kernel.org>
> > Sent: 30 April 2021 09:18
> > To: Anup Patel <Anup.Patel@wdc.com>
> > Cc: Anup Patel <anup@brainfault.org>; Alistair Francis
> > <alistair23@gmail.com>; Atish Patra <atishp@atishpatra.org>; OpenSBI
> > <opensbi@lists.infradead.org>; Guo Ren <guoren@linux.alibaba.com>
> > Subject: Re: [PATCH RFC] platform: generic: How to add custom extensions
> > for sbi_call?
> >
> > On Thu, Apr 29, 2021 at 11:43 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Guo Ren <guoren@kernel.org>
> > > > Sent: 29 April 2021 07:24
> > > > To: Guo Ren <guoren@kernel.org>; Anup Patel <anup@brainfault.org>;
> > > > Alistair Francis <alistair23@gmail.com>; Atish Patra
> > > > <atishp@atishpatra.org>
> > > > Cc: OpenSBI <opensbi@lists.infradead.org>; Guo Ren
> > > > <guoren@linux.alibaba.com>; Anup Patel <Anup.Patel@wdc.com>
> > > > Subject: Re: [PATCH RFC] platform: generic: How to add custom
> > > > extensions for sbi_call?
> > > >
> > > > @Anup Patel @Atish Patra @Alistair Francis
> > > >
> > > > Could we add a fdt_vendor_ext_provider for generic? How do you think?
> > > >
> > > > On Wed, Apr 28, 2021 at 9:55 PM <guoren@kernel.org> wrote:
> > > > >
> > > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > > >
> > > > > Here is the sample of thead PMU sbi implementation, it could work
> > > > > with linux perf record:
> > > > >
> > > > > https://github.com/c-sky/csky-linux/blob/linux-5.10.4/drivers/perf
> > > > > /the
> > > > > ad_c900_pmu.c
> > > > >
> > > > > It support perf record with hardware event.
> > > > >
> > > > > How to support this in platform/generic?
> > >
> > > We will certainly extend platform/generic for allow vendor specific
> > > SBI calls but using vendor specific SBI calls should be last resort.
> > >
> > > In case of PMU, we already have a work-in-progress SBI PMU extension.
> > >
> > > The latest SBI PMU proposal is here:
> > > https://github.com/avpatel/riscv-sbi-doc/blob/pmu_v5/riscv-sbi.adoc
> > >
> > > The OpenSBI PMU implementation is here:
> > > https://github.com/atishp04/opensbi/tree/sbi_pmu_v1
> > >
> > > The Linux PMU driver is here:
> > > https://github.com/atishp04/linux/tree/sbi_pmu_v1
> > >
> > > I would suggest you to use SBI PMU extension for your platform. In
> > > fact, T-HEAD C9xx could be the first platform to actively use SBI PMU.
> > Good idea, I'll try SBI PMU.
> >
> > Another issue is C9xx all support "PMU overflow interrupt", which means it
> > could work with "perf record".
> > So, I need to add an overflow irq handler in riscv_pmu.c to update the perf
> > period for the next event.
>
> For this you need to implement "Sscofpmf" fast-track extension proposed by
> Greg Favor.
>
> >
> > Here are our custom CSRs (For performance reason, updating perf period
> > should be done in s-mode, not sbi_call.):
>
> Yes, "Sscofpmf" extension is for S-mode overflow interrupts.
>
> > /*
> >  * Counter Enable register
> >  */
> > #define SCOUNTEREN              0x106
> >
> > /*
> >  * Counter inhibit register
> >  */
> > #define SCOUNTINHIBIT           0x5c8
> >
> > /*
> >  * 11: PMDS - rw, Performance monitor disable S-mode counting
> >  * 10: PMDU - rw, Performance monitor disable U-mode counting  */
> > #define SXSTATUS                0x5c0
> >
> > /*
> >  * Overflow interrupt enable & status register  */
> > #define SCOUNTERINTEN           0x5c4
> > #define SCOUNTEROF              0x5c5
> >
> > /*
> >  * 63: TS - rw, status of trigger
> >  * 13: PMDM - ro, Performance monitor disable machine mode counting
> >  * 11: PMDS - rw, Performance monitor disable supervisor mode counting
> >  * 10: PMDU - rw, Performance monitor disable user mode counting
> >  * 0-1: TME - Trigger Mode, 2'b00 trigger disabled, 2'b01 triger enable  */
> > #define SHPMCR                  0x5c9
> >
> > /*
> >  * Start/End trigger register. It's used to focus on a region of the code.
> >  */
> > #define SHPMSP                  0x5ca
> > #define SHPMEP                  0x5cb
>
>
> All this is specific T-HEAD C9xx, we need a standardized approach to
> PMU counter overflow.
>
> Please work with Greg Favor to have "Sscofpmf" extension merged in
> RISC-V specification sooner.
>

FWIW, I have started working on Sscofpmf extension support in
Qemu/OpenSBI/kernel.
I will include those in the next version of perf support series.

> Regards,
> Anup
>
> >
> >
> > >
> > > Regards,
> > > Anup
> > >
> > > > >
> > > > > Thx
> > > > >
> > > > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > > > Cc: Anup Patel <anup.patel@wdc.com>
> > > > > ---
> > > > >  platform/generic/platform.c | 159
> > > > > ++++++++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 159 insertions(+)
> > > > >
> > > > > diff --git a/platform/generic/platform.c
> > > > > b/platform/generic/platform.c index 7581556..52084dd 100644
> > > > > --- a/platform/generic/platform.c
> > > > > +++ b/platform/generic/platform.c
> > > > > @@ -206,7 +206,166 @@ static void generic_system_reset(u32
> > > > > reset_type,
> > > > u32 reset_reason)
> > > > >         writew(0x5555, (void *)0x100000); // qemu poweroff  }
> > > > >
> > > > > +#include <sbi/sbi_trap.h>
> > > > > +#define CSR_MCOUNTERWEN  0x7c9
> > > > > +static void sbi_thead_pmu_init(void) {
> > > > > +       unsigned long interrupts;
> > > > > +
> > > > > +       interrupts = csr_read(CSR_MIDELEG) | (1 << 17);
> > > > > +       csr_write(CSR_MIDELEG, interrupts);
> > > > > +
> > > > > +       /* CSR_MCOUNTEREN has already been set in mstatus_init() */
> > > > > +       csr_write(CSR_MCOUNTERWEN, 0xffffffff);
> > > > > +       csr_write(CSR_MHPMEVENT3, 1);
> > > > > +       csr_write(CSR_MHPMEVENT4, 2);
> > > > > +       csr_write(CSR_MHPMEVENT5, 3);
> > > > > +       csr_write(CSR_MHPMEVENT6, 4);
> > > > > +       csr_write(CSR_MHPMEVENT7, 5);
> > > > > +       csr_write(CSR_MHPMEVENT8, 6);
> > > > > +       csr_write(CSR_MHPMEVENT9, 7);
> > > > > +       csr_write(CSR_MHPMEVENT10, 8);
> > > > > +       csr_write(CSR_MHPMEVENT11, 9);
> > > > > +       csr_write(CSR_MHPMEVENT12, 10);
> > > > > +       csr_write(CSR_MHPMEVENT13, 11);
> > > > > +       csr_write(CSR_MHPMEVENT14, 12);
> > > > > +       csr_write(CSR_MHPMEVENT15, 13);
> > > > > +       csr_write(CSR_MHPMEVENT16, 14);
> > > > > +       csr_write(CSR_MHPMEVENT17, 15);
> > > > > +       csr_write(CSR_MHPMEVENT18, 16);
> > > > > +       csr_write(CSR_MHPMEVENT19, 17);
> > > > > +       csr_write(CSR_MHPMEVENT20, 18);
> > > > > +       csr_write(CSR_MHPMEVENT21, 19);
> > > > > +       csr_write(CSR_MHPMEVENT22, 20);
> > > > > +       csr_write(CSR_MHPMEVENT23, 21);
> > > > > +       csr_write(CSR_MHPMEVENT24, 22);
> > > > > +       csr_write(CSR_MHPMEVENT25, 23);
> > > > > +       csr_write(CSR_MHPMEVENT26, 24);
> > > > > +       csr_write(CSR_MHPMEVENT27, 25);
> > > > > +       csr_write(CSR_MHPMEVENT28, 26); }
> > > > > +
> > > > > +static void sbi_thead_pmu_map(unsigned long idx, unsigned long
> > > > > +event_id) {
> > > > > +       switch (idx) {
> > > > > +       case 3:
> > > > > +               csr_write(CSR_MHPMEVENT3, event_id);
> > > > > +               break;
> > > > > +       case 4:
> > > > > +               csr_write(CSR_MHPMEVENT4, event_id);
> > > > > +               break;
> > > > > +       case 5:
> > > > > +               csr_write(CSR_MHPMEVENT5, event_id);
> > > > > +               break;
> > > > > +       case 6:
> > > > > +               csr_write(CSR_MHPMEVENT6, event_id);
> > > > > +               break;
> > > > > +       case 7:
> > > > > +               csr_write(CSR_MHPMEVENT7, event_id);
> > > > > +               break;
> > > > > +       case 8:
> > > > > +               csr_write(CSR_MHPMEVENT8, event_id);
> > > > > +               break;
> > > > > +       case 9:
> > > > > +               csr_write(CSR_MHPMEVENT9, event_id);
> > > > > +               break;
> > > > > +       case 10:
> > > > > +               csr_write(CSR_MHPMEVENT10, event_id);
> > > > > +               break;
> > > > > +       case 11:
> > > > > +               csr_write(CSR_MHPMEVENT11, event_id);
> > > > > +               break;
> > > > > +       case 12:
> > > > > +               csr_write(CSR_MHPMEVENT12, event_id);
> > > > > +               break;
> > > > > +       case 13:
> > > > > +               csr_write(CSR_MHPMEVENT13, event_id);
> > > > > +               break;
> > > > > +       case 14:
> > > > > +               csr_write(CSR_MHPMEVENT14, event_id);
> > > > > +               break;
> > > > > +       case 15:
> > > > > +               csr_write(CSR_MHPMEVENT15, event_id);
> > > > > +               break;
> > > > > +       case 16:
> > > > > +               csr_write(CSR_MHPMEVENT16, event_id);
> > > > > +               break;
> > > > > +       case 17:
> > > > > +               csr_write(CSR_MHPMEVENT17, event_id);
> > > > > +               break;
> > > > > +       case 18:
> > > > > +               csr_write(CSR_MHPMEVENT18, event_id);
> > > > > +               break;
> > > > > +       case 19:
> > > > > +               csr_write(CSR_MHPMEVENT19, event_id);
> > > > > +               break;
> > > > > +       case 20:
> > > > > +               csr_write(CSR_MHPMEVENT20, event_id);
> > > > > +               break;
> > > > > +       case 21:
> > > > > +               csr_write(CSR_MHPMEVENT21, event_id);
> > > > > +               break;
> > > > > +       case 22:
> > > > > +               csr_write(CSR_MHPMEVENT22, event_id);
> > > > > +               break;
> > > > > +       case 23:
> > > > > +               csr_write(CSR_MHPMEVENT23, event_id);
> > > > > +               break;
> > > > > +       case 24:
> > > > > +               csr_write(CSR_MHPMEVENT24, event_id);
> > > > > +               break;
> > > > > +       case 25:
> > > > > +               csr_write(CSR_MHPMEVENT25, event_id);
> > > > > +               break;
> > > > > +       case 26:
> > > > > +               csr_write(CSR_MHPMEVENT26, event_id);
> > > > > +               break;
> > > > > +       case 27:
> > > > > +               csr_write(CSR_MHPMEVENT27, event_id);
> > > > > +               break;
> > > > > +       case 28:
> > > > > +               csr_write(CSR_MHPMEVENT28, event_id);
> > > > > +               break;
> > > > > +       case 29:
> > > > > +               csr_write(CSR_MHPMEVENT29, event_id);
> > > > > +               break;
> > > > > +       case 30:
> > > > > +               csr_write(CSR_MHPMEVENT30, event_id);
> > > > > +               break;
> > > > > +       case 31:
> > > > > +               csr_write(CSR_MHPMEVENT31, event_id);
> > > > > +               break;
> > > > > +       }
> > > > > +}
> > > > > +
> > > > > +static void sbi_thead_pmu_set(unsigned long type, unsigned long
> > > > > +idx, unsigned long event_id) {
> > > > > +       switch (type) {
> > > > > +       case 2:
> > > > > +               sbi_thead_pmu_map(idx, event_id);
> > > > > +               break;
> > > > > +       default:
> > > > > +               sbi_thead_pmu_init();
> > > > > +               break;
> > > > > +       }
> > > > > +}
> > > > > +
> > > > > +static int thead_vendor_ext_provider(long extid, long funcid,
> > > > > +       const struct sbi_trap_regs *regs, unsigned long *out_value,
> > > > > +       struct sbi_trap_info *out_trap) {
> > > > > +       switch (extid) {
> > > > > +       case 0x09000001:
> > > > > +               sbi_thead_pmu_set(regs->a0, regs->a1, regs->a2);
> > > > > +               break;
> > > > > +       default:
> > > > > +               sbi_hart_hang();
> > > > > +       }
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > >  const struct sbi_platform_operations platform_ops = {
> > > > > +       .vendor_ext_provider    = thead_vendor_ext_provider,
> > > > >         .early_init             = generic_early_init,
> > > > >         .final_init             = generic_final_init,
> > > > >         .early_exit             = generic_early_exit,
> > > > > --
> > > > > 2.7.4
> > > > >
> > > >
> > > >
> > > > --
> > > > Best Regards
> > > >  Guo Ren
> > > >
> > > > ML: https://lore.kernel.org/linux-csky/
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/



-- 
Regards,
Atish

