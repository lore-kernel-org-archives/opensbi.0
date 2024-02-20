From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Feb 2024 16:29:03 +0530
Subject: [PATCH] lib: sbi_pmu: Before using we should ensure PMU init done
In-Reply-To: <20240201020126.23833-1-gaoshanliukou@163.com>
References: <20240201020126.23833-1-gaoshanliukou@163.com>
Message-ID: <CAAhSdy1=iL-XCOT0WDRD1bZ3cV-6KCqTJSx2Quqa6YkJAwRypA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 1, 2024 at 7:32?AM yang.zhang <gaoshanliukou@163.com> wrote:
>
> From: "yang.zhang" <yang.zhang@hexintek.com>
>
> If trap earlier before sbi_pmu_init done, some path would call
> sbi_pmu_ctr_incr_fw, then it would go wrong:
> 1. if phs_ptr_offset is zero, then it get a wrong pmu state ptr
> 2. if phs_ptr_offset is ok, but we didn't call pmu_set_hart_state_ptr
> it would be NULL POINT
>
> Of course, the above situation will not occur at present, but i think
> it's reasonable that we should check it before we use it.
>
> Test:
> 1. I test it on our platform, for now we only support LR/SC not AMO.
> So when call spin_lock, would trap for amo instruction then emulate
> it with LR/SC, then it goes wrong.Of course, this case is special only
> for us, but other trap earlier cases maybe also encounter this situation.
> 2.I aslo test on qemu thead-c906, but need do some changes for simulating
> this scenario.
>   2.1 revert f067bb84cf2dd6493ff3fa49294d3ec80481ad75, the commit causes
>   we can't emulate some instructions from M mode, i think the requirement
>   may be not reasonable.
>   2.2 Then, insert a 'rdtime' instruction before pmu_get_hart_state_ptr in
>   sbi_pmu_init, then something goes wrong.

The patch description needs to be simplified because it is too verbose.

>
> Signed-off-by: yang.zhang <yang.zhang@hexintek.com>
> ---
>  lib/sbi/sbi_pmu.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 6209ccc..4eccb82 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -74,7 +74,7 @@ struct sbi_pmu_hart_state {
>  static unsigned long phs_ptr_offset;
>
>  #define pmu_get_hart_state_ptr(__scratch)                              \
> -       sbi_scratch_read_type((__scratch), void *, phs_ptr_offset)
> +       phs_ptr_offset ? sbi_scratch_read_type((__scratch), void *, phs_ptr_offset) : NULL
>
>  #define pmu_thishart_state_ptr()                                       \
>         pmu_get_hart_state_ptr(sbi_scratch_thishart_ptr())
> @@ -207,6 +207,9 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
>         uint32_t event_code;
>         struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
>
> +       if (unlikely(!phs))
> +               return SBI_EINVAL;
> +
>         event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
>         if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
>                 return SBI_EINVAL;
> @@ -432,6 +435,10 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>                       unsigned long flags, uint64_t ival)
>  {
>         struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
> +
> +       if (unlikely(!phs))
> +               return SBI_EINVAL;
> +
>         int event_idx_type;
>         uint32_t event_code;
>         int ret = SBI_EINVAL;
> @@ -535,6 +542,10 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
>                      unsigned long flag)
>  {
>         struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
> +
> +       if (unlikely(!phs))
> +               return SBI_EINVAL;
> +
>         int ret = SBI_EINVAL;
>         int event_idx_type;
>         uint32_t event_code;
> @@ -794,6 +805,10 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>                           uint64_t event_data)
>  {
>         struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
> +
> +       if (unlikely(!phs))
> +               return SBI_EINVAL;
> +
>         int ret, event_type, ctr_idx = SBI_ENOTSUPP;
>         u32 event_code;
>
> @@ -869,6 +884,9 @@ int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id)
>         uint64_t *fcounter = NULL;
>         struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
>
> +       if (unlikely(!phs))
> +               return 0;
> +
>         if (likely(!phs->fw_counters_started))
>                 return 0;
>
> @@ -967,7 +985,12 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
>         if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
>                 csr_write(CSR_MCOUNTEREN, -1);
>
> -       pmu_reset_event_map(pmu_get_hart_state_ptr(scratch));
> +       struct sbi_pmu_hart_state *phs = pmu_get_hart_state_ptr(scratch);

Variable declaration should be at the start of function.

> +
> +       if (unlikely(!phs))
> +               return;
> +
> +       pmu_reset_event_map(phs);
>  }
>
>  int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

I have taken care of the above comments at the time of merging
this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

