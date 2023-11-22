From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 22 Nov 2023 15:47:43 -0800
Subject: [PATCH v3 02/15] sbi: sbi_pmu: Improve sbi_pmu_init() error handling
In-Reply-To: <20231122073617.379441-3-peterlin@andestech.com>
References: <20231122073617.379441-1-peterlin@andestech.com> <20231122073617.379441-3-peterlin@andestech.com>
Message-ID: <CAOnJCUJ14BFthoaBoroQYFDHZqnq60mLTfQ8A7AB9EXo4_yKBA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 21, 2023 at 11:39?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> This patch makes the following changes:
>
> - As sbi_platform_pmu_init() returns a negative error code on
>   failure, let sbi_pmu_init() to hang by propagating the error
>   code.
>

Why ? PMU is not a critical resource for booting the system. A system
can function without it.
Do we really want to hang the system booting in case sbi_pmu_init fails ?

> - In order to distinguish the SBI_EFAIL error returned by
>   sbi_pmu_add_*_counter_map(), return SBI_ENOENT to indicate
>   that fdt_pmu_setup() failed to locate "riscv,pmu" node, and
>   generic_pmu_init() ignores such case.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - Include Anup's RB tag
> ---
>  lib/sbi/sbi_pmu.c           | 5 ++++-
>  lib/utils/fdt/fdt_pmu.c     | 2 +-
>  platform/generic/platform.c | 8 +++++++-
>  3 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index f4c8fc4..3cbd4ff 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -957,6 +957,7 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>         int hpm_count = sbi_fls(sbi_hart_mhpm_mask(scratch));
>         struct sbi_pmu_hart_state *phs;
>         const struct sbi_platform *plat;
> +       int rc;
>
>         if (cold_boot) {
>                 hw_event_map = sbi_calloc(sizeof(*hw_event_map),
> @@ -972,7 +973,9 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>
>                 plat = sbi_platform_ptr(scratch);
>                 /* Initialize hw pmu events */
> -               sbi_platform_pmu_init(plat);
> +               rc = sbi_platform_pmu_init(plat);
> +               if (rc)
> +                       return rc;
>
>                 /* mcycle & minstret is available always */
>                 if (!hpm_count)
> diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
> index 83301bb..a8d7648 100644
> --- a/lib/utils/fdt/fdt_pmu.c
> +++ b/lib/utils/fdt/fdt_pmu.c
> @@ -74,7 +74,7 @@ int fdt_pmu_setup(void *fdt)
>
>         pmu_offset = fdt_node_offset_by_compatible(fdt, -1, "riscv,pmu");
>         if (pmu_offset < 0)
> -               return SBI_EFAIL;
> +               return SBI_ENOENT;
>
>         event_ctr_map = fdt_getprop(fdt, pmu_offset,
>                                     "riscv,event-to-mhpmcounters", &len);
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 85acecd..fa400b9 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -265,7 +265,13 @@ static u32 generic_tlb_num_entries(void)
>
>  static int generic_pmu_init(void)
>  {
> -       return fdt_pmu_setup(fdt_get_address());
> +       int rc;
> +
> +       rc = fdt_pmu_setup(fdt_get_address());
> +       if (rc && rc != SBI_ENOENT)
> +               return rc;
> +
> +       return 0;
>  }
>
>  static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
> --
> 2.34.1
>


-- 
Regards,
Atish

