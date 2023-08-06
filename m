From: Anup Patel <anup@brainfault.org>
Date: Sun, 6 Aug 2023 10:19:27 +0530
Subject: [PATCH] lib: sbi_pmu: Enable noncontigous hpm event and counters
In-Reply-To: <20230802111523.3362467-1-mchitale@ventanamicro.com>
References: <20230802111523.3362467-1-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy1UBQy+=RMFzFv+ze4-EU8GYDVbsh-hXjjDnMHm4L3B2w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 2, 2023 at 4:46?PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Platforms may implement hpm events/counters non contiguously but the current
> implementation assumes them to be always contigous. Add a bitmap that
> captures the hpm events/counters as implemented in the hardware and use
> it to set the max limit of hardware counters visible to the OS. Counters
> not implemented in the hardware can't be used by the OS because those
> wont be described in the DT.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_hart.h |  2 ++
>  lib/sbi/sbi_hart.c     | 56 +++++++++++++++++++++++++++++++-----------
>  lib/sbi/sbi_init.c     |  2 ++
>  lib/sbi/sbi_pmu.c      | 13 ++++++----
>  4 files changed, 54 insertions(+), 19 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index c150b7e..1310198 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -68,6 +68,7 @@ struct sbi_hart_features {
>         unsigned int pmp_addr_bits;
>         unsigned long pmp_gran;
>         unsigned int mhpm_count;
> +       unsigned int mhpm_mask;
>         unsigned int mhpm_bits;
>  };
>
> @@ -83,6 +84,7 @@ static inline ulong sbi_hart_expected_trap_addr(void)
>  }
>
>  unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch);
> +unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
>  void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
>                               const char *prefix, const char *suffix);
>  unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 7b5f380..252f33d 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -35,7 +35,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
>  {
>         unsigned long menvcfg_val, mstatus_val = 0;
>         int cidx;
> -       unsigned int num_mhpm = sbi_hart_mhpm_count(scratch);
> +       unsigned int mhpm_mask = sbi_hart_mhpm_mask(scratch);
>         uint64_t mhpmevent_init_val = 0;
>         uint64_t mstateen_val;
>
> @@ -69,13 +69,14 @@ static void mstatus_init(struct sbi_scratch *scratch)
>         /**
>          * The mhpmeventn[h] CSR should be initialized with interrupt disabled
>          * and inhibited running in M-mode during init.
> -        * To keep it simple, only contiguous mhpmcounters are supported as a
> -        * platform with discontiguous mhpmcounters may not make much sense.
>          */
>         mhpmevent_init_val |= (MHPMEVENT_OF | MHPMEVENT_MINH);
> -       for (cidx = 0; cidx < num_mhpm; cidx++) {
> +       for (cidx = 0; cidx <= 28; cidx++) {
> +               if (!(mhpm_mask & 1 << (cidx + 3)))
> +                       continue;
>  #if __riscv_xlen == 32
> -               csr_write_num(CSR_MHPMEVENT3 + cidx, mhpmevent_init_val & 0xFFFFFFFF);
> +               csr_write_num(CSR_MHPMEVENT3 + cidx,
> +                              mhpmevent_init_val & 0xFFFFFFFF);
>                 if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
>                         csr_write_num(CSR_MHPMEVENT3H + cidx,
>                                       mhpmevent_init_val >> BITS_PER_LONG);
> @@ -244,6 +245,14 @@ void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
>                    prefix, suffix, csr_read(CSR_MEDELEG));
>  }
>
> +unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch)
> +{
> +       struct sbi_hart_features *hfeatures =
> +                       sbi_scratch_offset_ptr(scratch, hart_features_offset);
> +
> +       return hfeatures->mhpm_mask;
> +}
> +
>  unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch)
>  {
>         struct sbi_hart_features *hfeatures =
> @@ -715,6 +724,30 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>         hfeatures->extensions = 0;
>         hfeatures->pmp_count = 0;
>         hfeatures->mhpm_count = 0;
> +       hfeatures->mhpm_mask = 0;
> +
> +#define __check_hpm_csr(__csr, __count, __mask)                          \
> +       oldval = csr_read_allowed(__csr, (ulong)&trap);                   \
> +       if (!trap.cause) {                                                \
> +               csr_write_allowed(__csr, (ulong)&trap, 1UL);              \
> +               if (!trap.cause && csr_swap(__csr, oldval) == 1UL) {      \
> +                       (hfeatures->__count)++;                           \
> +                       (hfeatures->__mask) |= 1 << (__csr - CSR_MCYCLE); \
> +               }                                                         \
> +       }
> +
> +#define __check_hpm_csr_2(__csr, __count, __mask)                        \
> +       __check_hpm_csr(__csr + 0, __count, __mask)                       \
> +       __check_hpm_csr(__csr + 1, __count, __mask)
> +#define __check_hpm_csr_4(__csr, __count, __mask)                        \
> +       __check_hpm_csr_2(__csr + 0, __count, __mask)                     \
> +       __check_hpm_csr_2(__csr + 2, __count, __mask)
> +#define __check_hpm_csr_8(__csr, __count, __mask)                        \
> +       __check_hpm_csr_4(__csr + 0, __count, __mask)                     \
> +       __check_hpm_csr_4(__csr + 4, __count, __mask)
> +#define __check_hpm_csr_16(__csr, __count, __mask)                       \
> +       __check_hpm_csr_8(__csr + 0, __count, __mask)                     \
> +       __check_hpm_csr_8(__csr + 8, __count, __mask)
>
>  #define __check_csr(__csr, __rdonly, __wrval, __field, __skip) \
>         oldval = csr_read_allowed(__csr, (ulong)&trap);                 \
> @@ -766,22 +799,17 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>                 __check_csr_64(CSR_PMPADDR0, 0, val, pmp_count, __pmp_skip);
>         }
>  __pmp_skip:
> -
>         /* Detect number of MHPM counters */
> -       __check_csr(CSR_MHPMCOUNTER3, 0, 1UL, mhpm_count, __mhpm_skip);
> +       __check_hpm_csr(CSR_MHPMCOUNTER3, mhpm_count, mhpm_mask);
>         hfeatures->mhpm_bits = hart_mhpm_get_allowed_bits();
> -
> -       __check_csr_4(CSR_MHPMCOUNTER4, 0, 1UL, mhpm_count, __mhpm_skip);
> -       __check_csr_8(CSR_MHPMCOUNTER8, 0, 1UL, mhpm_count, __mhpm_skip);
> -       __check_csr_16(CSR_MHPMCOUNTER16, 0, 1UL, mhpm_count, __mhpm_skip);
> +       __check_hpm_csr_4(CSR_MHPMCOUNTER4, mhpm_count, mhpm_mask);
> +       __check_hpm_csr_8(CSR_MHPMCOUNTER8, mhpm_count, mhpm_mask);
> +       __check_hpm_csr_16(CSR_MHPMCOUNTER16, mhpm_count, mhpm_mask);
>
>         /**
>          * No need to check for MHPMCOUNTERH for RV32 as they are expected to be
>          * implemented if MHPMCOUNTER is implemented.
>          */
> -
> -__mhpm_skip:
> -
>  #undef __check_csr_64
>  #undef __check_csr_32
>  #undef __check_csr_16
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 35e6633..eae4f28 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -182,6 +182,8 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
>                    sbi_hart_pmp_addrbits(scratch));
>         sbi_printf("Boot HART MHPM Count      : %d\n",
>                    sbi_hart_mhpm_count(scratch));
> +       sbi_printf("Boot HART MHPM Mask       : 0x%x\n",
> +                  sbi_hart_mhpm_mask(scratch));
>         sbi_hart_delegation_dump(scratch, "Boot HART ", "         ");
>  }
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 7213a53..cc8a88e 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -236,8 +236,7 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
>         bool is_overlap;
>         struct sbi_pmu_hw_event *event = &hw_event_map[num_hw_events];
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> -       int hw_ctr_avail = sbi_hart_mhpm_count(scratch);
> -       uint32_t ctr_avail_mask = ((uint32_t)(~0) >> (32 - (hw_ctr_avail + 3)));
> +       uint32_t ctr_avail_mask = sbi_hart_mhpm_mask(scratch) | 0x7;
>
>         /* The first two counters are reserved by priv spec */
>         if (eidx_start > SBI_PMU_HW_INSTRUCTIONS && (cmap & SBI_PMU_FIXED_CTR_MASK))
> @@ -912,6 +911,7 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
>
>  int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>  {
> +       int hpm_count = sbi_fls(sbi_hart_mhpm_mask(scratch));
>         struct sbi_pmu_hart_state *phs;
>         const struct sbi_platform *plat;
>
> @@ -932,9 +932,12 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>                 sbi_platform_pmu_init(plat);
>
>                 /* mcycle & minstret is available always */
> -               num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 3;
> -               if (num_hw_ctrs > SBI_PMU_HW_CTR_MAX)
> -                       return SBI_EINVAL;
> +               if (!hpm_count)
> +                       /* Only CY, TM & IR are implemented in the hw */
> +                       num_hw_ctrs = 3;
> +               else
> +                       num_hw_ctrs = hpm_count + 1;
> +
>                 total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
>         }
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

