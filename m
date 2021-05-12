From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 12 May 2021 05:53:05 +0000
Subject: [RFC 13/14] lib: sbi: Implement firmware counters
In-Reply-To: <CAOnJCULBCmFS1pQyM=S+Ry429bxLH1DxKDevkzDk61=zpHwUEA@mail.gmail.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
 <20210319221305.2138412-14-atish.patra@wdc.com>
 <DM6PR04MB6201D26D3F38F246C96B3E0A8D499@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CAOnJCU+oxHX3KTcFrdvupxYkkuVdas=S7qiLMLU86t7xGaxF9A@mail.gmail.com>
 <DM6PR04MB6201681C2E4C9E2DDDAD528E8D539@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CAOnJCUL+8NGYi-PAMW7csGEaMB8i5Yap9xQXcbrc2npMSqgRCg@mail.gmail.com>
 <MN2PR04MB62070AEF2ACFF0FFC5D6E0698D539@MN2PR04MB6207.namprd04.prod.outlook.com>
 <CAOnJCULBCmFS1pQyM=S+Ry429bxLH1DxKDevkzDk61=zpHwUEA@mail.gmail.com>
Message-ID: <CO6PR04MB7812F029482C204367A59F8C8D529@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Atish
> Patra
> Sent: 12 May 2021 00:33
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; opensbi at lists.infradead.org
> Subject: Re: [RFC 13/14] lib: sbi: Implement firmware counters
> 
> On Tue, May 11, 2021 at 8:46 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> >
> > Please avoid replying in HTML mode. See my reply inline below.
> >
> >
> 
> My bad. I replied from my phone where the default is html.
> 
> >
> > Regards,
> >
> > Anup
> >
> >
> >
> > From: Atish Patra <atishp@atishpatra.org>
> > Sent: 11 May 2021 18:30
> > To: Anup Patel <Anup.Patel@wdc.com>
> > Cc: Atish Patra <Atish.Patra@wdc.com>; opensbi at lists.infradead.org
> > Subject: Re: [RFC 13/14] lib: sbi: Implement firmware counters
> >
> >
> >
> >
> >
> >
> >
> > On Tue, May 11, 2021 at 1:08 AM Anup Patel <Anup.Patel@wdc.com>
> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Atish Patra <atishp@atishpatra.org>
> > > Sent: 11 May 2021 00:29
> > > To: Anup Patel <Anup.Patel@wdc.com>
> > > Cc: Atish Patra <Atish.Patra@wdc.com>; opensbi at lists.infradead.org
> > > Subject: Re: [RFC 13/14] lib: sbi: Implement firmware counters
> > >
> > > On Mon, Apr 19, 2021 at 5:37 AM Anup Patel <Anup.Patel@wdc.com>
> wrote:
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Atish Patra <atish.patra@wdc.com>
> > > > > Sent: 20 March 2021 03:43
> > > > > To: opensbi at lists.infradead.org
> > > > > Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel
> > > > > <Anup.Patel@wdc.com>
> > > > > Subject: [RFC 13/14] lib: sbi: Implement firmware counters
> > > > >
> > > > > RISC-V SBI v0.3 specification defines a set of firmware events
> > > > > that can provide additional information about the current
> > > > > firmware context. All of the firmware event monitoring are
> > > > > enabled now. The firmware events must be defined as raw perf
> > > > > event with MSB set as
> > > specified in the specification.
> > > > >
> > > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > > ---
> > > > >  include/sbi/sbi_tlb.h       |  1 +
> > > > >  lib/sbi/sbi_ecall_replace.c |  2 ++
> > > > >  lib/sbi/sbi_ipi.c           |  7 +++++++
> > > > >  lib/sbi/sbi_tlb.c           | 36
> ++++++++++++++++++++++++++++++++++++
> > > > >  lib/sbi/sbi_trap.c          |  9 +++++++++
> > > > >  5 files changed, 55 insertions(+)
> > > > >
> > > > > diff --git a/include/sbi/sbi_tlb.h b/include/sbi/sbi_tlb.h index
> > > > > 48f1962d7dcf..680fcc758072 100644
> > > > > --- a/include/sbi/sbi_tlb.h
> > > > > +++ b/include/sbi/sbi_tlb.h
> > > > > @@ -33,6 +33,7 @@ struct sbi_tlb_info {
> > > > >       struct sbi_hartmask smask;  };
> > > > >
> > > > > +void sbi_tlb_pmu_incr_fw_ctr(struct sbi_tlb_info *data);
> > > > >  void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo);
> > > > > void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo);
> > > > > void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo); diff
> > > > > --git a/lib/sbi/sbi_ecall_replace.c
> > > > > b/lib/sbi/sbi_ecall_replace.c index a7935d97300d..83544bb6e05f
> > > > > 100644
> > > > > --- a/lib/sbi/sbi_ecall_replace.c
> > > > > +++ b/lib/sbi/sbi_ecall_replace.c
> > > > > @@ -14,6 +14,7 @@
> > > > >  #include <sbi/sbi_error.h>
> > > > >  #include <sbi/sbi_hart.h>
> > > > >  #include <sbi/sbi_ipi.h>
> > > > > +#include <sbi/sbi_pmu.h>
> > > > >  #include <sbi/sbi_system.h>
> > > > >  #include <sbi/sbi_timer.h>
> > > > >  #include <sbi/sbi_tlb.h>
> > > > > @@ -27,6 +28,7 @@ static int sbi_ecall_time_handler(unsigned
> > > > > long extid, unsigned long funcid,
> > > > >       int ret = 0;
> > > > >
> > > > >       if (funcid == SBI_EXT_TIME_SET_TIMER) {
> > > > > +             sbi_pmu_incr_fw_ctr(SBI_PMU_FW_SET_TIMER);
> > > >
> > > > This one I am not sure.
> > > >
> > > > May be we should call sbi_pmu_incr_fw_ctr() from
> > > > sbi_timer_event_start() ?? No ??
> > > >
> > >
> > > Sure.
> > >
> > > > >  #if __riscv_xlen == 32
> > > > >               sbi_timer_event_start((((u64)regs->a1 << 32) |
> > > > > (u64)regs-
> > > > > >a0));  #else diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> > > > > >index
> > > > > b50735e4099a..cd998ac7acfa 100644
> > > > > --- a/lib/sbi/sbi_ipi.c
> > > > > +++ b/lib/sbi/sbi_ipi.c
> > > > > @@ -19,6 +19,9 @@
> > > > >  #include <sbi/sbi_init.h>
> > > > >  #include <sbi/sbi_ipi.h>
> > > > >  #include <sbi/sbi_platform.h>
> > > > > +#include <sbi/sbi_pmu.h>
> > > > > +#include <sbi/sbi_string.h>
> > > > > +#include <sbi/sbi_tlb.h>
> > > > >
> > > > >  struct sbi_ipi_data {
> > > > >       unsigned long ipi_type;
> > > > > @@ -61,6 +64,10 @@ static int sbi_ipi_send(struct sbi_scratch
> > > > > *scratch, u32 remote_hartid,
> > > > >        */
> > > > >       atomic_raw_set_bit(event, &ipi_data->ipi_type);
> > > > >       smp_wmb();
> > > > > +     sbi_pmu_incr_fw_ctr(SBI_PMU_FW_IPI_SENT);
> > > > > +     if (sbi_strncmp(ipi_ops->name, "IPI_TLB", 7))
> > > > > +             sbi_tlb_pmu_incr_fw_ctr(data);
> > > > > +
> > > > >       sbi_platform_ipi_send(plat, remote_hartid);
> > > > >
> > > > >       if (ipi_ops->sync)
> > > > > diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c index
> > > > > 73f59e8681e2..36b21a74a713 100644
> > > > > --- a/lib/sbi/sbi_tlb.c
> > > > > +++ b/lib/sbi/sbi_tlb.c
> > > > > @@ -21,6 +21,7 @@
> > > > >  #include <sbi/sbi_string.h>
> > > > >  #include <sbi/sbi_console.h>
> > > > >  #include <sbi/sbi_platform.h>
> > > > > +#include <sbi/sbi_pmu.h>
> > > > >
> > > > >  static unsigned long tlb_sync_off;  static unsigned long
> > > > > tlb_fifo_off; @@ -39,6 +40,8 @@ void
> > > > > sbi_tlb_local_hfence_vvma(struct sbi_tlb_info
> > > > > *tinfo)
> > > > >       unsigned long vmid  = tinfo->vmid;
> > > > >       unsigned long i, hgatp;
> > > > >
> > > > > +     sbi_pmu_incr_fw_ctr(SBI_PMU_FW_HFENCE_VVMA_RCVD);
> > > > > +
> > > > >       hgatp = csr_swap(CSR_HGATP,
> > > > >                        (vmid << HGATP_VMID_SHIFT) &
> > > > > HGATP_VMID_MASK);
> > > > >
> > > > > @@ -61,6 +64,8 @@ void sbi_tlb_local_hfence_gvma(struct
> > > > > sbi_tlb_info
> > > > > *tinfo)
> > > > >       unsigned long size  = tinfo->size;
> > > > >       unsigned long i;
> > > > >
> > > > > +     sbi_pmu_incr_fw_ctr(SBI_PMU_FW_HFENCE_GVMA_RCVD);
> > > > > +
> > > > >       if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
> > > > >               __sbi_hfence_gvma_all();
> > > > >               return;
> > > > > @@ -77,6 +82,8 @@ void sbi_tlb_local_sfence_vma(struct
> > > > > sbi_tlb_info
> > > > > *tinfo)
> > > > >       unsigned long size  = tinfo->size;
> > > > >       unsigned long i;
> > > > >
> > > > > +     sbi_pmu_incr_fw_ctr(SBI_PMU_FW_SFENCE_VMA_RCVD);
> > > > > +
> > > > >       if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
> > > > >               sbi_tlb_flush_all();
> > > > >               return;
> > > > > @@ -98,6 +105,8 @@ void sbi_tlb_local_hfence_vvma_asid(struct
> > > > > sbi_tlb_info *tinfo)
> > > > >       unsigned long vmid  = tinfo->vmid;
> > > > >       unsigned long i, hgatp;
> > > > >
> > > > > +
> sbi_pmu_incr_fw_ctr(SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
> > > > > +
> > > > >       hgatp = csr_swap(CSR_HGATP,
> > > > >                        (vmid << HGATP_VMID_SHIFT) &
> > > > > HGATP_VMID_MASK);
> > > > >
> > > > > @@ -126,6 +135,8 @@ void sbi_tlb_local_hfence_gvma_vmid(struct
> > > > > sbi_tlb_info *tinfo)
> > > > >       unsigned long vmid  = tinfo->vmid;
> > > > >       unsigned long i;
> > > > >
> > > > > +
> sbi_pmu_incr_fw_ctr(SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD);
> > > > > +
> > > > >       if (start == 0 && size == 0) {
> > > > >               __sbi_hfence_gvma_all();
> > > > >               return;
> > > > > @@ -148,6 +159,8 @@ void sbi_tlb_local_sfence_vma_asid(struct
> > > > > sbi_tlb_info *tinfo)
> > > > >       unsigned long asid  = tinfo->asid;
> > > > >       unsigned long i;
> > > > >
> > > > > +     sbi_pmu_incr_fw_ctr(SBI_PMU_FW_SFENCE_VMA_ASID_RCVD);
> > > > > +
> > > > >       if (start == 0 && size == 0) {
> > > > >               sbi_tlb_flush_all();
> > > > >               return;
> > > > > @@ -172,9 +185,32 @@ void sbi_tlb_local_sfence_vma_asid(struct
> > > > > sbi_tlb_info *tinfo)
> > > > >
> > > > >  void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo)  {
> > > > > +     sbi_pmu_incr_fw_ctr(SBI_PMU_FW_FENCE_I_RECVD);
> > > > > +
> > > > >       __asm__ __volatile("fence.i");  }
> > > > >
> > > > > +void sbi_tlb_pmu_incr_fw_ctr(struct sbi_tlb_info *data) {
> > > > > +     if (unlikely(!data))
> > > > > +             return;
> > > > > +
> > > > > +     if (data->local_fn == sbi_tlb_local_fence_i)
> > > > > +             sbi_pmu_incr_fw_ctr(SBI_PMU_FW_FENCE_I_SENT);
> > > > > +     else if (data->local_fn == sbi_tlb_local_sfence_vma)
> > > > > +             sbi_pmu_incr_fw_ctr(SBI_PMU_FW_SFENCE_VMA_SENT);
> > > > > +     else if (data->local_fn == sbi_tlb_local_sfence_vma_asid)
> > > > > +
> > > > >       sbi_pmu_incr_fw_ctr(SBI_PMU_FW_SFENCE_VMA_ASID_SENT);
> > > > > +     else if (data->local_fn == sbi_tlb_local_hfence_gvma)
> > > > > +
> > > > >       sbi_pmu_incr_fw_ctr(SBI_PMU_FW_HFENCE_GVMA_SENT);
> > > > > +     else if (data->local_fn == sbi_tlb_local_hfence_gvma_vmid)
> > > > > +
> > > > >
> sbi_pmu_incr_fw_ctr(SBI_PMU_FW_HFENCE_GVMA_VMID_SENT);
> > > > > +     else if (data->local_fn == sbi_tlb_local_hfence_vvma)
> > > > > +             sbi_pmu_incr_fw_ctr(SBI_PMU_FW_HFENCE_VVMA_SENT);
> > > > > +     else if (data->local_fn == sbi_tlb_local_hfence_vvma_asid)
> > > > > +
> > > > >
> sbi_pmu_incr_fw_ctr(SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
> > > > > +}
> > > > > +
> > > >
> > > > Drop the sbi_tlb_pmu_incr_fw_ctr() function and call
> > > > sbi_pmu_incr_fw_ctr() from sbi_tlb_request() function.
> > > >
> > >
> > > sbi_tlb_pmu_incr_fw_ctr is called from sbi_ipi_send so that every
> > > request to other hart are counted.
> > > If we invoke sbi_pmu_incr_fw_ctr from sbi_tlb_request, we will be
> > > counting only 1 for every request from the supervisor.
> > >
> > > Did I misunderstand the purpose of the tlb specific firmware counters ?
> >
> > The sbi_ipi_send() is for sending any kind of IPIs and remote TLB
> > request is just one type of IPI request.
> >
> > For example, we will be having inter-domain messaging using the
> > sbi_ipi_send() as well so if sbi_tlb_pmu_incr_fw_ctr() Is called from
> > sbi_ipi_send() then it will unnecessary increment TLB events.
> >
> >
> >
> > It will not as I am checking for ipi_ops name.
> >
> >
> >
> > [Anup] You can avoid unnecessary comparison of the ipi_ops name
> >
> > if sbi_tlb_pmu_incr_fw_ctr() is called from sbi_tlb_request()
> >
> >
> I think my earlier point was not clear to you.
> 
> What should a firmware fence counter indicate as a tlb flush request can be
> sent to one or more hart ?
> 
> sbi_tlb_pmu_incr_fw_ctr is called from sbi_ipi_send so that every request to
> other heart are counted. If we invoke sbi_pmu_incr_fw_ctr from
> sbi_tlb_request, we will be counting only 1 for every request from the
> supervisor.
> 
> I thought the counters should increment per hart per request. It looks like
> you want the counters to increment once per request for all the harts ? If
> that is the case, we can move sbi_tlb_pmu_incr_fw_ctr to sbi_tlb_request.

I think there is confusion here.

All the SBI_PMU_FW_xyz_SENT events are incremented on the HART
doing the SBI IPI or TLB request.

All the SBI_PMU_FW_xyz_RECEIVED events are incremented on all
HARTs receiving the SBI IPI or TLB request.

This means all SBI_PMU_FW_xFENCE_xyz_SENT events should be
incremented in sbi_tlb_request() while all the
SBI_PMU_FW_xFENCE_xyz_RECEIVED events should be incremented
in sbi_tlb_process() path.

> >
> >
> > >
> > >
> > > > >  static void sbi_tlb_entry_process(struct sbi_tlb_info *tinfo)  {
> > > > >       u32 rhartid;
> > > > > diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c index
> > > > > b7349d2c914e..3b540ea7f76c 100644
> > > > > --- a/lib/sbi/sbi_trap.c
> > > > > +++ b/lib/sbi/sbi_trap.c
> > > > > @@ -16,6 +16,7 @@
> > > > >  #include <sbi/sbi_illegal_insn.h>  #include <sbi/sbi_ipi.h>
> > > > > #include <sbi/sbi_misaligned_ldst.h>
> > > > > +#include <sbi/sbi_pmu.h>
> > > > >  #include <sbi/sbi_scratch.h>
> > > > >  #include <sbi/sbi_timer.h>
> > > > >  #include <sbi/sbi_trap.h>
> > > > > @@ -230,6 +231,7 @@ void sbi_trap_handler(struct sbi_trap_regs
> *regs)
> > > > >                       sbi_timer_process();
> > > > >                       break;
> > > > >               case IRQ_M_SOFT:
> > > > > +                     sbi_pmu_incr_fw_ctr(SBI_PMU_FW_IPI_RECVD);
> > > > >                       sbi_ipi_process();
> > > >
> > > > Move sbi_pmu_incr_fw_ctr() call to sbi_ipi_process()
> > > >
> > > > >                       break;
> > > > >               default:
> > > > > @@ -241,14 +243,17 @@ void sbi_trap_handler(struct sbi_trap_regs
> > > > > *regs)
> > > > >
> > > > >       switch (mcause) {
> > > > >       case CAUSE_ILLEGAL_INSTRUCTION:
> > > > > +             sbi_pmu_incr_fw_ctr(SBI_PMU_FW_ILLEGAL_INSN);
> > > >
> > > > Move sbi_pmu_incr_fw_ctr() call to sbi_illegal_insn_handler()
> > > >
> > > Done.
> > >
> > > > >               rc  = sbi_illegal_insn_handler(mtval, regs);
> > > > >               msg = "illegal instruction handler failed";
> > > > >               break;
> > > > >       case CAUSE_MISALIGNED_LOAD:
> > > > > +             sbi_pmu_incr_fw_ctr(SBI_PMU_FW_MISALIGNED_LOAD);
> > > > >               rc = sbi_misaligned_load_handler(mtval, mtval2,
> > > > > mtinst, regs);
> > > >
> > > > Same as above.
> > > >
> > > Done.
> > >
> > > > >               msg = "misaligned load handler failed";
> > > > >               break;
> > > > >       case CAUSE_MISALIGNED_STORE:
> > > > > +             sbi_pmu_incr_fw_ctr(SBI_PMU_FW_MISALIGNED_STORE);
> > > > >               rc  = sbi_misaligned_store_handler(mtval, mtval2,
> > > > > mtinst, regs);
> > > >
> > > > Same as above.
> > > >
> > > Done.
> > >
> > > > >               msg = "misaligned store handler failed";
> > > > >               break;
> > > > > @@ -257,6 +262,10 @@ void sbi_trap_handler(struct sbi_trap_regs
> > > *regs)
> > > > >               rc  = sbi_ecall_handler(regs);
> > > > >               msg = "ecall handler failed";
> > > > >               break;
> > > > > +     case CAUSE_LOAD_ACCESS:
> > > > > +             sbi_pmu_incr_fw_ctr(SBI_PMU_FW_ACCESS_LOAD);
> > > > > +     case CAUSE_STORE_ACCESS:
> > > > > +             sbi_pmu_incr_fw_ctr(SBI_PMU_FW_ACCESS_STORE);
> > > >
> > > > These ones are fine over here at the moment but eventually we
> > > > might have separate access fault handling file.
> > > >
> > >
> > > ok.
> > >
> > > > >       default:
> > > > >               /* If the trap came from S or U mode, redirect it there */
> > > > >               trap.epc = regs->mepc;
> > > > > --
> > > > > 2.25.1
> > > >
> > > > Regards,
> > > > Anup
> > > >
> > > >
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > >
> > >
> > >
> > > --
> > > Regards,
> > > Atish
> >
> > Regards,
> > Anup
> >
> > --
> >
> > Regards,
> >
> > Atish
> 
> 
> 
> --
> Regards,
> Atish
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

