From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 7 Jan 2021 04:32:21 +0000
Subject: [PATCH 1/3] lib: sbi: Replace args with trap registers in ecall
 handler
In-Reply-To: <CAOnJCUJBDrL4nXARmo-U1jNjjYnACUFmQbnf6pt+sGb86+t+bw@mail.gmail.com>
References: <20201230033304.295706-1-anup.patel@wdc.com>
 <20201230033304.295706-2-anup.patel@wdc.com>
 <CAOnJCUJBDrL4nXARmo-U1jNjjYnACUFmQbnf6pt+sGb86+t+bw@mail.gmail.com>
Message-ID: <DM6PR04MB62011EE2CBBC2B5C791699FD8DAF0@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 06 January 2021 08:07
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH 1/3] lib: sbi: Replace args with trap registers in ecall
> handler
> 
> On Tue, Dec 29, 2020 at 7:34 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We had added args pointer in ecall handler to ensure that ecall
> > handler only implements functionality and does not deal with SBI
> > calling convention. This also helped us to keep SBI calling convention
> > related code in one place at sbi_ecall_handler().
> >
> > The Keystone Enclavce project needs access to the trap regsiters in
> > their ecall handler so that they can context switch enclaves in custom
> > SBI calls. To help the Keystone Enclave project, we replace the args
> > pointer in ecall handler parameter with a const pointer to trap
> > registers.
> >
> 
> Yeah. This is much simpler. Thanks.
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> 
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/sbi_ecall.h         |  3 +-
> >  include/sbi/sbi_platform.h      |  9 ++---
> >  lib/sbi/sbi_ecall.c             | 10 +-----
> >  lib/sbi/sbi_ecall_base.c        |  6 ++--
> >  lib/sbi/sbi_ecall_hsm.c         |  8 +++--
> >  lib/sbi/sbi_ecall_legacy.c      | 25 +++++++-------
> >  lib/sbi/sbi_ecall_replace.c     | 59 ++++++++++++++++++---------------
> >  lib/sbi/sbi_ecall_vendor.c      |  6 ++--
> >  platform/andes/ae350/platform.c | 19 ++++++-----
> >  9 files changed, 76 insertions(+), 69 deletions(-)
> >
> > diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h index
> > 1ef86e2..d357085 100644
> > --- a/include/sbi/sbi_ecall.h
> > +++ b/include/sbi/sbi_ecall.h
> > @@ -26,7 +26,8 @@ struct sbi_ecall_extension {
> >         unsigned long extid_end;
> >         int (* probe)(unsigned long extid, unsigned long *out_val);
> >         int (* handle)(unsigned long extid, unsigned long funcid,
> > -                      unsigned long *args, unsigned long *out_val,
> > +                      const struct sbi_trap_regs *regs,
> > +                      unsigned long *out_val,
> >                        struct sbi_trap_info *out_trap);  };
> >
> > diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> > index 58aba71..7b8fe89 100644
> > --- a/include/sbi/sbi_platform.h
> > +++ b/include/sbi/sbi_platform.h
> > @@ -47,6 +47,7 @@
> >
> >  struct sbi_domain;
> >  struct sbi_trap_info;
> > +struct sbi_trap_regs;
> >
> >  /** Possible feature flags of a platform */  enum
> > sbi_platform_features { @@ -146,7 +147,7 @@ struct
> > sbi_platform_operations {
> >         int (*vendor_ext_check)(long extid);
> >         /** platform specific SBI extension implementation provider */
> >         int (*vendor_ext_provider)(long extid, long funcid,
> > -                                  unsigned long *args,
> > +                                  const struct sbi_trap_regs *regs,
> >                                    unsigned long *out_value,
> >                                    struct sbi_trap_info *out_trap);  }
> > __packed; @@ -710,7 +711,7 @@ static inline int
> > sbi_platform_vendor_ext_check(const struct sbi_platform *plat,
> >   * @param plat pointer to struct sbi_platform
> >   * @param extid        vendor SBI extension id
> >   * @param funcid SBI function id within the extension id
> > - * @param args pointer to arguments passed by the caller
> > + * @param regs pointer to trap registers passed by the caller
> >   * @param out_value output value that can be filled by the callee
> >   * @param out_trap trap info that can be filled by the callee
> >   *
> > @@ -719,13 +720,13 @@ static inline int
> > sbi_platform_vendor_ext_check(const struct sbi_platform *plat,  static
> inline int sbi_platform_vendor_ext_provider(
> >                                         const struct sbi_platform *plat,
> >                                         long extid, long funcid,
> > -                                       unsigned long *args,
> > +                                       const struct sbi_trap_regs
> > + *regs,
> >                                         unsigned long *out_value,
> >                                         struct sbi_trap_info
> > *out_trap)  {
> >         if (plat && sbi_platform_ops(plat)->vendor_ext_provider) {
> >                 return sbi_platform_ops(plat)->vendor_ext_provider(extid,
> > -                                                               funcid, args,
> > +
> > + funcid, regs,
> >                                                                 out_value,
> >                                                                 out_trap);
> >         }
> > diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c index
> > 6d41cff..e92a539 100644
> > --- a/lib/sbi/sbi_ecall.c
> > +++ b/lib/sbi/sbi_ecall.c
> > @@ -101,19 +101,11 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
> >         struct sbi_trap_info trap = {0};
> >         unsigned long out_val = 0;
> >         bool is_0_1_spec = 0;
> > -       unsigned long args[6];
> > -
> > -       args[0] = regs->a0;
> > -       args[1] = regs->a1;
> > -       args[2] = regs->a2;
> > -       args[3] = regs->a3;
> > -       args[4] = regs->a4;
> > -       args[5] = regs->a5;
> >
> >         ext = sbi_ecall_find_extension(extension_id);
> >         if (ext && ext->handle) {
> >                 ret = ext->handle(extension_id, func_id,
> > -                                 args, &out_val, &trap);
> > +                                 regs, &out_val, &trap);
> >                 if (extension_id >= SBI_EXT_0_1_SET_TIMER &&
> >                     extension_id <= SBI_EXT_0_1_SHUTDOWN)
> >                         is_0_1_spec = 1; diff --git
> > a/lib/sbi/sbi_ecall_base.c b/lib/sbi/sbi_ecall_base.c index
> > 53c93c8..786d2ac 100644
> > --- a/lib/sbi/sbi_ecall_base.c
> > +++ b/lib/sbi/sbi_ecall_base.c
> > @@ -11,6 +11,7 @@
> >  #include <sbi/sbi_ecall.h>
> >  #include <sbi/sbi_ecall_interface.h>
> >  #include <sbi/sbi_error.h>
> > +#include <sbi/sbi_trap.h>
> >  #include <sbi/sbi_version.h>
> >  #include <sbi/riscv_asm.h>
> >
> > @@ -32,7 +33,8 @@ static int sbi_ecall_base_probe(unsigned long extid,
> > unsigned long *out_val)  }
> >
> >  static int sbi_ecall_base_handler(unsigned long extid, unsigned long
> funcid,
> > -                                 unsigned long *args, unsigned long *out_val,
> > +                                 const struct sbi_trap_regs *regs,
> > +                                 unsigned long *out_val,
> >                                   struct sbi_trap_info *out_trap)  {
> >         int ret = 0;
> > @@ -61,7 +63,7 @@ static int sbi_ecall_base_handler(unsigned long extid,
> unsigned long funcid,
> >                 *out_val = csr_read(CSR_MIMPID);
> >                 break;
> >         case SBI_EXT_BASE_PROBE_EXT:
> > -               ret = sbi_ecall_base_probe(args[0], out_val);
> > +               ret = sbi_ecall_base_probe(regs->a0, out_val);
> >                 break;
> >         default:
> >                 ret = SBI_ENOTSUPP;
> > diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c index
> > 376740c..df29d51 100644
> > --- a/lib/sbi/sbi_ecall_hsm.c
> > +++ b/lib/sbi/sbi_ecall_hsm.c
> > @@ -11,13 +11,15 @@
> >  #include <sbi/sbi_ecall.h>
> >  #include <sbi/sbi_ecall_interface.h>
> >  #include <sbi/sbi_error.h>
> > +#include <sbi/sbi_trap.h>
> >  #include <sbi/sbi_version.h>
> >  #include <sbi/sbi_hsm.h>
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi/riscv_asm.h>
> >
> >  static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
> > -                                unsigned long *args, unsigned long *out_val,
> > +                                const struct sbi_trap_regs *regs,
> > +                                unsigned long *out_val,
> >                                  struct sbi_trap_info *out_trap)  {
> >         ulong smode;
> > @@ -29,14 +31,14 @@ static int sbi_ecall_hsm_handler(unsigned long
> extid, unsigned long funcid,
> >                 smode = csr_read(CSR_MSTATUS);
> >                 smode = (smode & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
> >                 ret = sbi_hsm_hart_start(scratch, sbi_domain_thishart_ptr(),
> > -                                        args[0], args[1], smode, args[2]);
> > +                                        regs->a0, regs->a1, smode,
> > + regs->a2);
> >                 break;
> >         case SBI_EXT_HSM_HART_STOP:
> >                 ret = sbi_hsm_hart_stop(scratch, TRUE);
> >                 break;
> >         case SBI_EXT_HSM_HART_GET_STATUS:
> >                 hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(),
> > -                                               args[0]);
> > +                                               regs->a0);
> >                 ret = sbi_hsm_hart_state_to_status(hstate);
> >                 break;
> >         default:
> > diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
> > index 7844fbb..8afeb00 100644
> > --- a/lib/sbi/sbi_ecall_legacy.c
> > +++ b/lib/sbi/sbi_ecall_legacy.c
> > @@ -43,7 +43,8 @@ static int sbi_load_hart_mask_unpriv(ulong *pmask,
> > ulong *hmask,  }
> >
> >  static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long
> funcid,
> > -                                   unsigned long *args, unsigned long *out_val,
> > +                                   const struct sbi_trap_regs *regs,
> > +                                   unsigned long *out_val,
> >                                     struct sbi_trap_info *out_trap)  {
> >         int ret = 0;
> > @@ -54,13 +55,13 @@ static int sbi_ecall_legacy_handler(unsigned long
> extid, unsigned long funcid,
> >         switch (extid) {
> >         case SBI_EXT_0_1_SET_TIMER:
> >  #if __riscv_xlen == 32
> > -               sbi_timer_event_start((((u64)args[1] << 32) | (u64)args[0]));
> > +               sbi_timer_event_start((((u64)regs->a1 << 32) |
> > + (u64)regs->a0));
> >  #else
> > -               sbi_timer_event_start((u64)args[0]);
> > +               sbi_timer_event_start((u64)regs->a0);
> >  #endif
> >                 break;
> >         case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> > -               sbi_putc(args[0]);
> > +               sbi_putc(regs->a0);
> >                 break;
> >         case SBI_EXT_0_1_CONSOLE_GETCHAR:
> >                 ret = sbi_getc();
> > @@ -69,13 +70,13 @@ static int sbi_ecall_legacy_handler(unsigned long
> extid, unsigned long funcid,
> >                 sbi_ipi_clear_smode();
> >                 break;
> >         case SBI_EXT_0_1_SEND_IPI:
> > -               ret = sbi_load_hart_mask_unpriv((ulong *)args[0],
> > +               ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
> >                                                 &hmask, out_trap);
> >                 if (ret != SBI_ETRAP)
> >                         ret = sbi_ipi_send_smode(hmask, 0);
> >                 break;
> >         case SBI_EXT_0_1_REMOTE_FENCE_I:
> > -               ret = sbi_load_hart_mask_unpriv((ulong *)args[0],
> > +               ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
> >                                                 &hmask, out_trap);
> >                 if (ret != SBI_ETRAP) {
> >                         SBI_TLB_INFO_INIT(&tlb_info, 0, 0, 0, 0, @@
> > -84,21 +85,21 @@ static int sbi_ecall_legacy_handler(unsigned long extid,
> unsigned long funcid,
> >                 }
> >                 break;
> >         case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
> > -               ret = sbi_load_hart_mask_unpriv((ulong *)args[0],
> > +               ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
> >                                                 &hmask, out_trap);
> >                 if (ret != SBI_ETRAP) {
> > -                       SBI_TLB_INFO_INIT(&tlb_info, args[1], args[2], 0, 0,
> > +                       SBI_TLB_INFO_INIT(&tlb_info, regs->a1,
> > + regs->a2, 0, 0,
> >                                           SBI_TLB_FLUSH_VMA, source_hart);
> >                         ret = sbi_tlb_request(hmask, 0, &tlb_info);
> >                 }
> >                 break;
> >         case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
> > -               ret = sbi_load_hart_mask_unpriv((ulong *)args[0],
> > +               ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
> >                                                 &hmask, out_trap);
> >                 if (ret != SBI_ETRAP) {
> > -                       SBI_TLB_INFO_INIT(&tlb_info, args[1], args[2], args[3],
> > -                                         0, SBI_TLB_FLUSH_VMA_ASID,
> > -                                         source_hart);
> > +                       SBI_TLB_INFO_INIT(&tlb_info, regs->a1,
> > +                                         regs->a2, regs->a3, 0,
> > +                                         SBI_TLB_FLUSH_VMA_ASID,
> > + source_hart);
> >                         ret = sbi_tlb_request(hmask, 0, &tlb_info);
> >                 }
> >                 break;
> > diff --git a/lib/sbi/sbi_ecall_replace.c b/lib/sbi/sbi_ecall_replace.c
> > index d06dfa2..a95821b 100644
> > --- a/lib/sbi/sbi_ecall_replace.c
> > +++ b/lib/sbi/sbi_ecall_replace.c
> > @@ -17,18 +17,20 @@
> >  #include <sbi/sbi_system.h>
> >  #include <sbi/sbi_timer.h>
> >  #include <sbi/sbi_tlb.h>
> > +#include <sbi/sbi_trap.h>
> >
> >  static int sbi_ecall_time_handler(unsigned long extid, unsigned long
> funcid,
> > -                                 unsigned long *args, unsigned long *out_val,
> > +                                 const struct sbi_trap_regs *regs,
> > +                                 unsigned long *out_val,
> >                                   struct sbi_trap_info *out_trap)  {
> >         int ret = 0;
> >
> >         if (funcid == SBI_EXT_TIME_SET_TIMER) {  #if __riscv_xlen ==
> > 32
> > -               sbi_timer_event_start((((u64)args[1] << 32) | (u64)args[0]));
> > +               sbi_timer_event_start((((u64)regs->a1 << 32) |
> > + (u64)regs->a0));
> >  #else
> > -               sbi_timer_event_start((u64)args[0]);
> > +               sbi_timer_event_start((u64)regs->a0);
> >  #endif
> >         } else
> >                 ret = SBI_ENOTSUPP;
> > @@ -43,7 +45,8 @@ struct sbi_ecall_extension ecall_time = {  };
> >
> >  static int sbi_ecall_rfence_handler(unsigned long extid, unsigned long
> funcid,
> > -                                   unsigned long *args, unsigned long *out_val,
> > +                                   const struct sbi_trap_regs *regs,
> > +                                   unsigned long *out_val,
> >                                     struct sbi_trap_info *out_trap)  {
> >         int ret = 0;
> > @@ -60,41 +63,41 @@ static int sbi_ecall_rfence_handler(unsigned long
> extid, unsigned long funcid,
> >         case SBI_EXT_RFENCE_REMOTE_FENCE_I:
> >                 SBI_TLB_INFO_INIT(&tlb_info, 0, 0, 0, 0,
> >                                   SBI_ITLB_FLUSH, source_hart);
> > -               ret = sbi_tlb_request(args[0], args[1], &tlb_info);
> > +               ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
> >                 break;
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
> > -               SBI_TLB_INFO_INIT(&tlb_info, args[2], args[3], 0, 0,
> > +               SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, 0,
> >                                   SBI_TLB_FLUSH_GVMA, source_hart);
> > -               ret = sbi_tlb_request(args[0], args[1], &tlb_info);
> > +               ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
> >                 break;
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
> > -               SBI_TLB_INFO_INIT(&tlb_info, args[2], args[3], 0, args[4],
> > +               SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0,
> > + regs->a4,
> >                                   SBI_TLB_FLUSH_GVMA_VMID, source_hart);
> > -               ret = sbi_tlb_request(args[0], args[1], &tlb_info);
> > +               ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
> >                 break;
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
> >                 vmid = (csr_read(CSR_HGATP) & HGATP_VMID_MASK);
> >                 vmid = vmid >> HGATP_VMID_SHIFT;
> > -               SBI_TLB_INFO_INIT(&tlb_info, args[2], args[3], 0, vmid,
> > +               SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0,
> > + vmid,
> >                                   SBI_TLB_FLUSH_VVMA, source_hart);
> > -               ret = sbi_tlb_request(args[0], args[1], &tlb_info);
> > +               ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
> >                 break;
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
> >                 vmid = (csr_read(CSR_HGATP) & HGATP_VMID_MASK);
> >                 vmid = vmid >> HGATP_VMID_SHIFT;
> > -               SBI_TLB_INFO_INIT(&tlb_info, args[2], args[3], args[4], vmid,
> > -                                 SBI_TLB_FLUSH_VVMA_ASID, source_hart);
> > -               ret = sbi_tlb_request(args[0], args[1], &tlb_info);
> > +               SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, regs->a4,
> > +                                 vmid, SBI_TLB_FLUSH_VVMA_ASID, source_hart);
> > +               ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
> >                 break;
> >         case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
> > -               SBI_TLB_INFO_INIT(&tlb_info, args[2], args[3], 0, 0,
> > +               SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, 0,
> >                                   SBI_TLB_FLUSH_VMA, source_hart);
> > -               ret = sbi_tlb_request(args[0], args[1], &tlb_info);
> > +               ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
> >                 break;
> >         case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
> > -               SBI_TLB_INFO_INIT(&tlb_info, args[2], args[3], args[4], 0,
> > +               SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3,
> > + regs->a4, 0,
> >                                   SBI_TLB_FLUSH_VMA_ASID, source_hart);
> > -               ret = sbi_tlb_request(args[0], args[1], &tlb_info);
> > +               ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
> >                 break;
> >         default:
> >                 ret = SBI_ENOTSUPP;
> > @@ -110,13 +113,14 @@ struct sbi_ecall_extension ecall_rfence = {  };
> >
> >  static int sbi_ecall_ipi_handler(unsigned long extid, unsigned long funcid,
> > -                                unsigned long *args, unsigned long *out_val,
> > +                                const struct sbi_trap_regs *regs,
> > +                                unsigned long *out_val,
> >                                  struct sbi_trap_info *out_trap)  {
> >         int ret = 0;
> >
> >         if (funcid == SBI_EXT_IPI_SEND_IPI)
> > -               ret = sbi_ipi_send_smode(args[0], args[1]);
> > +               ret = sbi_ipi_send_smode(regs->a0, regs->a1);
> >         else
> >                 ret = SBI_ENOTSUPP;
> >
> > @@ -130,15 +134,16 @@ struct sbi_ecall_extension ecall_ipi = {  };
> >
> >  static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
> > -                                 unsigned long *args, unsigned long *out_val,
> > +                                 const struct sbi_trap_regs *regs,
> > +                                 unsigned long *out_val,
> >                                   struct sbi_trap_info *out_trap)  {
> >         if (funcid == SBI_EXT_SRST_RESET) {
> > -               if ((((u32)-1U) <= ((u64)args[0])) ||
> > -                   (((u32)-1U) <= ((u64)args[1])))
> > +               if ((((u32)-1U) <= ((u64)regs->a0)) ||
> > +                   (((u32)-1U) <= ((u64)regs->a1)))
> >                         return SBI_EINVAL;
> >
> > -               switch (args[0]) {
> > +               switch (regs->a0) {
> >                 case SBI_SRST_RESET_TYPE_SHUTDOWN:
> >                 case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> >                 case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> > @@ -147,7 +152,7 @@ static int sbi_ecall_srst_handler(unsigned long
> extid, unsigned long funcid,
> >                         return SBI_ENOTSUPP;
> >                 }
> >
> > -               switch (args[1]) {
> > +               switch (regs->a1) {
> >                 case SBI_SRST_RESET_REASON_NONE:
> >                 case SBI_SRST_RESET_REASON_SYSFAIL:
> >                         break;
> > @@ -155,8 +160,8 @@ static int sbi_ecall_srst_handler(unsigned long
> extid, unsigned long funcid,
> >                         return SBI_ENOTSUPP;
> >                 }
> >
> > -               if (sbi_system_reset_supported(args[0], args[1]))
> > -                       sbi_system_reset(args[0], args[1]);
> > +               if (sbi_system_reset_supported(regs->a0, regs->a1))
> > +                       sbi_system_reset(regs->a0, regs->a1);
> >         }
> >
> >         return SBI_ENOTSUPP;
> > diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
> > index 34c0be6..9252829 100644
> > --- a/lib/sbi/sbi_ecall_vendor.c
> > +++ b/lib/sbi/sbi_ecall_vendor.c
> > @@ -12,6 +12,7 @@
> >  #include <sbi/sbi_ecall_interface.h>
> >  #include <sbi/sbi_error.h>
> >  #include <sbi/sbi_platform.h>
> > +#include <sbi/sbi_trap.h>
> >
> >  static int sbi_ecall_vendor_probe(unsigned long extid,
> >                                   unsigned long *out_val) @@ -22,11
> > +23,12 @@ static int sbi_ecall_vendor_probe(unsigned long extid,  }
> >
> >  static int sbi_ecall_vendor_handler(unsigned long extid, unsigned long
> funcid,
> > -                                   unsigned long *args, unsigned long *out_val,
> > +                                   const struct sbi_trap_regs *regs,
> > +                                   unsigned long *out_val,
> >                                     struct sbi_trap_info *out_trap)  {
> >         return
> sbi_platform_vendor_ext_provider(sbi_platform_thishart_ptr(),
> > -                                               extid, funcid, args,
> > +                                               extid, funcid, regs,
> >                                                 out_val, out_trap);  }
> >
> > diff --git a/platform/andes/ae350/platform.c
> > b/platform/andes/ae350/platform.c index 6d6ce4e..aec91cd 100644
> > --- a/platform/andes/ae350/platform.c
> > +++ b/platform/andes/ae350/platform.c
> > @@ -13,6 +13,7 @@
> >  #include <sbi/sbi_console.h>
> >  #include <sbi/sbi_const.h>
> >  #include <sbi/sbi_platform.h>
> > +#include <sbi/sbi_trap.h>
> >  #include <sbi_utils/fdt/fdt_fixup.h>
> >  #include <sbi_utils/irqchip/plic.h>
> >  #include <sbi_utils/serial/uart8250.h> @@ -116,7 +117,7 @@ static int
> > ae350_timer_init(bool cold_boot)
> >
> >  /* Vendor-Specific SBI handler */
> >  static int ae350_vendor_ext_provider(long extid, long funcid,
> > -       unsigned long *args, unsigned long *out_value,
> > +       const struct sbi_trap_regs *regs, unsigned long *out_value,
> >         struct sbi_trap_info *out_trap)  {
> >         int ret = 0;
> > @@ -128,28 +129,28 @@ static int ae350_vendor_ext_provider(long extid,
> long funcid,
> >                 *out_value = csr_read(CSR_MMISCCTL);
> >                 break;
> >         case SBI_EXT_ANDES_SET_MCACHE_CTL:
> > -               ret = mcall_set_mcache_ctl(args[0]);
> > +               ret = mcall_set_mcache_ctl(regs->a0);
> >                 break;
> >         case SBI_EXT_ANDES_SET_MMISC_CTL:
> > -               ret = mcall_set_mmisc_ctl(args[0]);
> > +               ret = mcall_set_mmisc_ctl(regs->a0);
> >                 break;
> >         case SBI_EXT_ANDES_ICACHE_OP:
> > -               ret = mcall_icache_op(args[0]);
> > +               ret = mcall_icache_op(regs->a0);
> >                 break;
> >         case SBI_EXT_ANDES_DCACHE_OP:
> > -               ret = mcall_dcache_op(args[0]);
> > +               ret = mcall_dcache_op(regs->a0);
> >                 break;
> >         case SBI_EXT_ANDES_L1CACHE_I_PREFETCH:
> > -               ret = mcall_l1_cache_i_prefetch_op(args[0]);
> > +               ret = mcall_l1_cache_i_prefetch_op(regs->a0);
> >                 break;
> >         case SBI_EXT_ANDES_L1CACHE_D_PREFETCH:
> > -               ret = mcall_l1_cache_d_prefetch_op(args[0]);
> > +               ret = mcall_l1_cache_d_prefetch_op(regs->a0);
> >                 break;
> >         case SBI_EXT_ANDES_NON_BLOCKING_LOAD_STORE:
> > -               ret = mcall_non_blocking_load_store(args[0]);
> > +               ret = mcall_non_blocking_load_store(regs->a0);
> >                 break;
> >         case SBI_EXT_ANDES_WRITE_AROUND:
> > -               ret = mcall_write_around(args[0]);
> > +               ret = mcall_write_around(regs->a0);
> >                 break;
> >         default:
> >                 sbi_printf("Unsupported vendor sbi call : %ld\n",
> > funcid);
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
> 
> --
> Regards,
> Atish

Applied this patch to riscv/opensbi repo.

Regards,
Anup
