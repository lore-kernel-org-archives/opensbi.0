From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 12 Dec 2023 14:28:54 +0530
Subject: [PATCH 1/5] lib: sbi_tlb: Reduce size of struct sbi_tlb_info
In-Reply-To: <9b30161e-f2cb-4943-88c7-78aae9acb54a@sifive.com>
References: <20231211180738.891727-1-apatel@ventanamicro.com>
 <20231211180738.891727-2-apatel@ventanamicro.com> <9b30161e-f2cb-4943-88c7-78aae9acb54a@sifive.com>
Message-ID: <CAK9=C2WdOswDu0jWFFnD-=6nr0jnwBo7uSvJff33ypJ+uuYmJg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 11, 2023 at 11:46?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Anup,
>
> On 2023-12-11 12:07 PM, Anup Patel wrote:
> > Let us reduce the size of struct sbi_tlb_info by doing the
> > following:
> > 1) Change the data type of asid and vmid fields to uint16_t
> > 2) Replace local_fn() function pointer with an enum
> >
> > Based on the above, the size of struct sbi_tlb_info is reduced
> > by 16 bytes on RV64 and 4 bytes on RV32.
>
> Nice improvement!
>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi/sbi_tlb.h      | 29 +++++++------
> >  lib/sbi/sbi_ecall_legacy.c |  8 ++--
> >  lib/sbi/sbi_ecall_rfence.c | 16 +++----
> >  lib/sbi/sbi_tlb.c          | 89 ++++++++++++++++++++++++++++----------
> >  4 files changed, 92 insertions(+), 50 deletions(-)
> >
> > diff --git a/include/sbi/sbi_tlb.h b/include/sbi/sbi_tlb.h
> > index 55dcab0..2c50fe8 100644
> > --- a/include/sbi/sbi_tlb.h
> > +++ b/include/sbi/sbi_tlb.h
> > [...]
> >  static void tlb_pmu_incr_fw_ctr(struct sbi_tlb_info *data)
> >  {
> >       if (unlikely(!data))
> >               return;
> >
> > -     if (data->local_fn == sbi_tlb_local_fence_i)
> > +     switch (data->type) {
> > +     case SBI_TLB_FENCE_I:
> >               sbi_pmu_ctr_incr_fw(SBI_PMU_FW_FENCE_I_SENT);
> > -     else if (data->local_fn == sbi_tlb_local_sfence_vma)
> > +             break;
> > +     case SBI_TLB_SFENCE_VMA:
> >               sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_SENT);
> > -     else if (data->local_fn == sbi_tlb_local_sfence_vma_asid)
> > +             break;
> > +     case SBI_TLB_SFENCE_VMA_ASID:
> >               sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_SENT);
> > -     else if (data->local_fn == sbi_tlb_local_hfence_gvma)
> > -             sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_SENT);
> > -     else if (data->local_fn == sbi_tlb_local_hfence_gvma_vmid)
> > +             break;
> > +     case SBI_TLB_HFENCE_GVMA_VMID:
> >               sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_VMID_SENT);
> > -     else if (data->local_fn == sbi_tlb_local_hfence_vvma)
> > -             sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_SENT);
> > -     else if (data->local_fn == sbi_tlb_local_hfence_vvma_asid)
> > +             break;
> > +     case SBI_TLB_HFENCE_GVMA:
> > +             sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_SENT);
> > +             break;
> > +     case SBI_TLB_HFENCE_VVMA_ASID:
> >               sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
> > +             break;
> > +     case SBI_TLB_HFENCE_VVMA:
> > +             sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_SENT);
> > +             break;
>
> These switch cases are all practically the same. Can this be simplified by using
> a lookup table for the PMU event?

Ahh, yes. We can use a lookup table over here. I will update in the
next revision.

Thanks,
Anup

