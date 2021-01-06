From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 5 Jan 2021 18:42:03 -0800
Subject: [PATCH 3/3] lib: sbi: Allow custom local TLB flush function
In-Reply-To: <20201230033304.295706-4-anup.patel@wdc.com>
References: <20201230033304.295706-1-anup.patel@wdc.com>
 <20201230033304.295706-4-anup.patel@wdc.com>
Message-ID: <CAOnJCU+w8GT0K5BVup-+u_=7UjZv0rwYHOC5ogcfJ7tq4YOk6g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 29, 2020 at 7:34 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Currently, we have fixed TLB flush types supported by the
> remote TLB library. This approach is not flexible and does
> not allow custom local TLB flush function. For example,
> after updating PMP entries on a set of HARTs at runtime,
> we have to flush TLB on these HARTs as well.
>
> To support custom local TLB flush function, we replace the
> "type" field of "struct sbi_tlb_info" with a local TLB flush
> function pointer. We also provide definitions of standard TLB
> flush operations (such as fence_i, sfence.vma, hfence.vvma,
> hfence.gvma, etc).
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/sbi_tlb.h       | 24 +++++++--------
>  lib/sbi/sbi_ecall_legacy.c  |  9 ++++--
>  lib/sbi/sbi_ecall_replace.c | 16 +++++-----
>  lib/sbi/sbi_tlb.c           | 59 +++++++++++--------------------------
>  4 files changed, 44 insertions(+), 64 deletions(-)
>
> diff --git a/include/sbi/sbi_tlb.h b/include/sbi/sbi_tlb.h
> index 6ee64a9..48f1962 100644
> --- a/include/sbi/sbi_tlb.h
> +++ b/include/sbi/sbi_tlb.h
> @@ -22,16 +22,6 @@
>
>  #define SBI_TLB_FIFO_NUM_ENTRIES               8
>
> -enum sbi_tlb_info_types {
> -       SBI_TLB_FLUSH_VMA,
> -       SBI_TLB_FLUSH_VMA_ASID,
> -       SBI_TLB_FLUSH_GVMA,
> -       SBI_TLB_FLUSH_GVMA_VMID,
> -       SBI_TLB_FLUSH_VVMA,
> -       SBI_TLB_FLUSH_VVMA_ASID,
> -       SBI_ITLB_FLUSH
> -};
> -
>  struct sbi_scratch;
>
>  struct sbi_tlb_info {
> @@ -39,17 +29,25 @@ struct sbi_tlb_info {
>         unsigned long size;
>         unsigned long asid;
>         unsigned long vmid;
> -       unsigned long type;
> +       void (*local_fn)(struct sbi_tlb_info *tinfo);
>         struct sbi_hartmask smask;
>  };
>
> -#define SBI_TLB_INFO_INIT(__p, __start, __size, __asid, __vmid, __type, __src) \
> +void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo);
> +void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo);
> +void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo);
> +void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo);
> +void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo);
> +void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo);
> +void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo);
> +
> +#define SBI_TLB_INFO_INIT(__p, __start, __size, __asid, __vmid, __lfn, __src) \
>  do { \
>         (__p)->start = (__start); \
>         (__p)->size = (__size); \
>         (__p)->asid = (__asid); \
>         (__p)->vmid = (__vmid); \
> -       (__p)->type = (__type); \
> +       (__p)->local_fn = (__lfn); \
>         SBI_HARTMASK_INIT_EXCEPT(&(__p)->smask, (__src)); \
>  } while (0)
>
> diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
> index 8afeb00..1a7fe26 100644
> --- a/lib/sbi/sbi_ecall_legacy.c
> +++ b/lib/sbi/sbi_ecall_legacy.c
> @@ -80,7 +80,8 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
>                                                 &hmask, out_trap);
>                 if (ret != SBI_ETRAP) {
>                         SBI_TLB_INFO_INIT(&tlb_info, 0, 0, 0, 0,
> -                                         SBI_ITLB_FLUSH, source_hart);
> +                                         sbi_tlb_local_fence_i,
> +                                         source_hart);
>                         ret = sbi_tlb_request(hmask, 0, &tlb_info);
>                 }
>                 break;
> @@ -89,7 +90,8 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
>                                                 &hmask, out_trap);
>                 if (ret != SBI_ETRAP) {
>                         SBI_TLB_INFO_INIT(&tlb_info, regs->a1, regs->a2, 0, 0,
> -                                         SBI_TLB_FLUSH_VMA, source_hart);
> +                                         sbi_tlb_local_sfence_vma,
> +                                         source_hart);
>                         ret = sbi_tlb_request(hmask, 0, &tlb_info);
>                 }
>                 break;
> @@ -99,7 +101,8 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
>                 if (ret != SBI_ETRAP) {
>                         SBI_TLB_INFO_INIT(&tlb_info, regs->a1,
>                                           regs->a2, regs->a3, 0,
> -                                         SBI_TLB_FLUSH_VMA_ASID, source_hart);
> +                                         sbi_tlb_local_sfence_vma_asid,
> +                                         source_hart);
>                         ret = sbi_tlb_request(hmask, 0, &tlb_info);
>                 }
>                 break;
> diff --git a/lib/sbi/sbi_ecall_replace.c b/lib/sbi/sbi_ecall_replace.c
> index a95821b..a7935d9 100644
> --- a/lib/sbi/sbi_ecall_replace.c
> +++ b/lib/sbi/sbi_ecall_replace.c
> @@ -62,41 +62,43 @@ static int sbi_ecall_rfence_handler(unsigned long extid, unsigned long funcid,
>         switch (funcid) {
>         case SBI_EXT_RFENCE_REMOTE_FENCE_I:
>                 SBI_TLB_INFO_INIT(&tlb_info, 0, 0, 0, 0,
> -                                 SBI_ITLB_FLUSH, source_hart);
> +                                 sbi_tlb_local_fence_i, source_hart);
>                 ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
>                 SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, 0,
> -                                 SBI_TLB_FLUSH_GVMA, source_hart);
> +                                 sbi_tlb_local_hfence_gvma, source_hart);
>                 ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
>                 SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, regs->a4,
> -                                 SBI_TLB_FLUSH_GVMA_VMID, source_hart);
> +                                 sbi_tlb_local_hfence_gvma_vmid,
> +                                 source_hart);
>                 ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
>                 vmid = (csr_read(CSR_HGATP) & HGATP_VMID_MASK);
>                 vmid = vmid >> HGATP_VMID_SHIFT;
>                 SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, vmid,
> -                                 SBI_TLB_FLUSH_VVMA, source_hart);
> +                                 sbi_tlb_local_hfence_vvma, source_hart);
>                 ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
>                 vmid = (csr_read(CSR_HGATP) & HGATP_VMID_MASK);
>                 vmid = vmid >> HGATP_VMID_SHIFT;
>                 SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, regs->a4,
> -                                 vmid, SBI_TLB_FLUSH_VVMA_ASID, source_hart);
> +                                 vmid, sbi_tlb_local_hfence_vvma_asid,
> +                                 source_hart);
>                 ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
>                 SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, 0,
> -                                 SBI_TLB_FLUSH_VMA, source_hart);
> +                                 sbi_tlb_local_sfence_vma, source_hart);
>                 ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
>                 SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, regs->a4, 0,
> -                                 SBI_TLB_FLUSH_VMA_ASID, source_hart);
> +                                 sbi_tlb_local_sfence_vma_asid, source_hart);
>                 ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
>                 break;
>         default:
> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> index c8e62cd..73f59e8 100644
> --- a/lib/sbi/sbi_tlb.c
> +++ b/lib/sbi/sbi_tlb.c
> @@ -32,7 +32,7 @@ static void sbi_tlb_flush_all(void)
>         __asm__ __volatile("sfence.vma");
>  }
>
> -static void sbi_tlb_hfence_vvma(struct sbi_tlb_info *tinfo)
> +void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo)
>  {
>         unsigned long start = tinfo->start;
>         unsigned long size  = tinfo->size;
> @@ -55,7 +55,7 @@ done:
>         csr_write(CSR_HGATP, hgatp);
>  }
>
> -static void sbi_tlb_hfence_gvma(struct sbi_tlb_info *tinfo)
> +void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo)
>  {
>         unsigned long start = tinfo->start;
>         unsigned long size  = tinfo->size;
> @@ -71,7 +71,7 @@ static void sbi_tlb_hfence_gvma(struct sbi_tlb_info *tinfo)
>         }
>  }
>
> -static void sbi_tlb_sfence_vma(struct sbi_tlb_info *tinfo)
> +void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
>  {
>         unsigned long start = tinfo->start;
>         unsigned long size  = tinfo->size;
> @@ -90,7 +90,7 @@ static void sbi_tlb_sfence_vma(struct sbi_tlb_info *tinfo)
>         }
>  }
>
> -static void sbi_tlb_hfence_vvma_asid(struct sbi_tlb_info *tinfo)
> +void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo)
>  {
>         unsigned long start = tinfo->start;
>         unsigned long size  = tinfo->size;
> @@ -119,7 +119,7 @@ done:
>         csr_write(CSR_HGATP, hgatp);
>  }
>
> -static void sbi_tlb_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
> +void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
>  {
>         unsigned long start = tinfo->start;
>         unsigned long size  = tinfo->size;
> @@ -141,7 +141,7 @@ static void sbi_tlb_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
>         }
>  }
>
> -static void sbi_tlb_sfence_vma_asid(struct sbi_tlb_info *tinfo)
> +void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
>  {
>         unsigned long start = tinfo->start;
>         unsigned long size  = tinfo->size;
> @@ -170,35 +170,9 @@ static void sbi_tlb_sfence_vma_asid(struct sbi_tlb_info *tinfo)
>         }
>  }
>
> -static void sbi_tlb_local_flush(struct sbi_tlb_info *tinfo)
> +void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo)
>  {
> -       switch (tinfo->type) {
> -       case SBI_TLB_FLUSH_VMA:
> -               sbi_tlb_sfence_vma(tinfo);
> -               break;
> -       case SBI_TLB_FLUSH_VMA_ASID:
> -               sbi_tlb_sfence_vma_asid(tinfo);
> -               break;
> -       case SBI_TLB_FLUSH_GVMA:
> -               sbi_tlb_hfence_gvma(tinfo);
> -               break;
> -       case SBI_TLB_FLUSH_GVMA_VMID:
> -               sbi_tlb_hfence_gvma_vmid(tinfo);
> -               break;
> -       case SBI_TLB_FLUSH_VVMA:
> -               sbi_tlb_hfence_vvma(tinfo);
> -               break;
> -       case SBI_TLB_FLUSH_VVMA_ASID:
> -               sbi_tlb_hfence_vvma_asid(tinfo);
> -               break;
> -       case SBI_ITLB_FLUSH:
> -               __asm__ __volatile("fence.i");
> -               break;
> -       default:
> -               sbi_printf("Invalid tlb flush request type [%lu]\n",
> -                          tinfo->type);
> -       }
> -       return;
> +       __asm__ __volatile("fence.i");
>  }
>
>  static void sbi_tlb_entry_process(struct sbi_tlb_info *tinfo)
> @@ -207,7 +181,7 @@ static void sbi_tlb_entry_process(struct sbi_tlb_info *tinfo)
>         struct sbi_scratch *rscratch = NULL;
>         unsigned long *rtlb_sync = NULL;
>
> -       sbi_tlb_local_flush(tinfo);
> +       tinfo->local_fn(tinfo);
>
>         sbi_hartmask_for_each_hart(rhartid, &tinfo->smask) {
>                 rscratch = sbi_hartid_to_scratch(rhartid);
> @@ -316,13 +290,13 @@ static int sbi_tlb_update_cb(void *in, void *data)
>         curr = (struct sbi_tlb_info *)data;
>         next = (struct sbi_tlb_info *)in;
>
> -       if (next->type == SBI_TLB_FLUSH_VMA_ASID &&
> -           curr->type == SBI_TLB_FLUSH_VMA_ASID) {
> +       if (next->local_fn == sbi_tlb_local_sfence_vma_asid &&
> +           curr->local_fn == sbi_tlb_local_sfence_vma_asid) {
>                 if (next->asid == curr->asid)
>                         ret = __sbi_tlb_range_check(curr, next);
> -       } else if (next->type == SBI_TLB_FLUSH_VMA &&
> -                  curr->type == SBI_TLB_FLUSH_VMA) {
> -                       ret = __sbi_tlb_range_check(curr, next);
> +       } else if (next->local_fn == sbi_tlb_local_sfence_vma &&
> +                  curr->local_fn == sbi_tlb_local_sfence_vma) {
> +               ret = __sbi_tlb_range_check(curr, next);
>         }
>
>         return ret;
> @@ -352,7 +326,7 @@ static int sbi_tlb_update(struct sbi_scratch *scratch,
>          * then just do a local flush and return;
>          */
>         if (remote_hartid == curr_hartid) {
> -               sbi_tlb_local_flush(tinfo);
> +               tinfo->local_fn(tinfo);
>                 return -1;
>         }
>
> @@ -391,6 +365,9 @@ static u32 tlb_event = SBI_IPI_EVENT_MAX;
>
>  int sbi_tlb_request(ulong hmask, ulong hbase, struct sbi_tlb_info *tinfo)
>  {
> +       if (!tinfo->local_fn)
> +               return SBI_EINVAL;
> +
>         return sbi_ipi_send_many(hmask, hbase, tlb_event, tinfo);
>  }
>
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Looks good.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

