From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 09:33:51 +0530
Subject: [PATCH] lib: sbi: Correctly limit flushes to a single ASID/VMID
In-Reply-To: <20231017222027.3668468-1-samuel.holland@sifive.com>
References: <20231017222027.3668468-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1tW2YNQzkDqsRWhSw0J7Vfg9DX5hSHarnw246QGL3Zrg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 18, 2023 at 3:50?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Per the SBI specification, the effects of these functions are limited to
> a specific ASID and/or VMID. This applies even when flushing the entire
> address space.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

This patch looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

> ---
> The SBI spec doesn't say anything about this `start == 0 && size == 0`
> exception, so I wonder if it should be removed entirely.

The SBI spec does define behaviour for `start == 0 && size == 0`.

At the beginning of "Chapter 8. RFENCE Extension" we have the
following text which describes this behavior:

"
The remote fence function acts as a full TLB flush if
* start_addr and size are both 0
* size is equal to 2^XLEN-1
"

>
>  lib/sbi/sbi_tlb.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
>
> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> index ced2854..dad9508 100644
> --- a/lib/sbi/sbi_tlb.c
> +++ b/lib/sbi/sbi_tlb.c
> @@ -111,12 +111,7 @@ void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo)
>         hgatp = csr_swap(CSR_HGATP,
>                          (vmid << HGATP_VMID_SHIFT) & HGATP_VMID_MASK);
>
> -       if (start == 0 && size == 0) {
> -               __sbi_hfence_vvma_all();
> -               goto done;
> -       }
> -
> -       if (size == SBI_TLB_FLUSH_ALL) {
> +       if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
>                 __sbi_hfence_vvma_asid(asid);
>                 goto done;
>         }
> @@ -138,12 +133,7 @@ void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
>
>         sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD);
>
> -       if (start == 0 && size == 0) {
> -               __sbi_hfence_gvma_all();
> -               return;
> -       }
> -
> -       if (size == SBI_TLB_FLUSH_ALL) {
> +       if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
>                 __sbi_hfence_gvma_vmid(vmid);
>                 return;
>         }
> @@ -162,13 +152,8 @@ void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
>
>         sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_RCVD);
>
> -       if (start == 0 && size == 0) {
> -               tlb_flush_all();
> -               return;
> -       }
> -
>         /* Flush entire MM context for a given ASID */
> -       if (size == SBI_TLB_FLUSH_ALL) {
> +       if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
>                 __asm__ __volatile__("sfence.vma x0, %0"
>                                      :
>                                      : "r"(asid)
> --
> 2.41.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Thanks,
Anup

