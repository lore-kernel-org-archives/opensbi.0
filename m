From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Feb 2025 18:28:17 +0530
Subject: [PATCH 2/2] lib: utils/fdt: Allocate fdt_pmu_evt_select on the heap
In-Reply-To: <20250213225024.3586544-2-samuel.holland@sifive.com>
References: <20250213225024.3586544-1-samuel.holland@sifive.com> <20250213225024.3586544-2-samuel.holland@sifive.com>
Message-ID: <CAAhSdy0z5_S4kZp4Y-oC6KE4MFa6_KKiFa9=Gj1LRFyQb5xigQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 14, 2025 at 4:20?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This reduces .bss size by 8 KiB, and should reduce overall memory usage
> since most platforms will have significantly fewer than 512 entries in
> this table. At the same time, it removes the fixed table size limit.
> Since the table is only used within fdt_pmu.c, instead of updating the
> extern declaration, make the table local to this file.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  include/sbi_utils/fdt/fdt_pmu.h |  5 -----
>  lib/utils/fdt/fdt_pmu.c         | 17 +++++++++++------
>  2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/include/sbi_utils/fdt/fdt_pmu.h b/include/sbi_utils/fdt/fdt_pmu.h
> index b31d8351..3879e111 100644
> --- a/include/sbi_utils/fdt/fdt_pmu.h
> +++ b/include/sbi_utils/fdt/fdt_pmu.h
> @@ -62,11 +62,6 @@ int fdt_pmu_setup(const void *fdt);
>   */
>  uint64_t fdt_pmu_get_select_value(uint32_t event_idx);
>
> -/** The event index to selector value table instance */
> -extern struct fdt_pmu_hw_event_select_map fdt_pmu_evt_select[];
> -/** The number of valid entries in fdt_pmu_evt_select[] */
> -extern uint32_t hw_event_count;
> -
>  #else
>
>  static inline void fdt_pmu_fixup(void *fdt) { }
> diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
> index 22760603..ee76d87f 100644
> --- a/lib/utils/fdt/fdt_pmu.c
> +++ b/lib/utils/fdt/fdt_pmu.c
> @@ -11,15 +11,14 @@
>  #include <libfdt.h>
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_error.h>
> +#include <sbi/sbi_heap.h>
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/fdt/fdt_pmu.h>
>
> -#define FDT_PMU_HW_EVENT_MAX (SBI_PMU_HW_EVENT_MAX * 2)
> -
> -struct fdt_pmu_hw_event_select_map fdt_pmu_evt_select[FDT_PMU_HW_EVENT_MAX] = {0};
> -uint32_t hw_event_count;
> +static struct fdt_pmu_hw_event_select_map *fdt_pmu_evt_select;
> +static uint32_t hw_event_count;
>
>  uint64_t fdt_pmu_get_select_value(uint32_t event_idx)
>  {
> @@ -91,13 +90,19 @@ int fdt_pmu_setup(const void *fdt)
>                                 "riscv,event-to-mhpmevent", &len);
>         if (event_val) {
>                 len = len / (sizeof(u32) * 3);
> +
> +               hw_event_count = len;
> +               fdt_pmu_evt_select = sbi_calloc(hw_event_count,
> +                                               sizeof(*fdt_pmu_evt_select));
> +               if (!fdt_pmu_evt_select)
> +                       return SBI_ENOMEM;
> +
>                 for (i = 0; i < len; i++) {
> -                       event = &fdt_pmu_evt_select[hw_event_count];
> +                       event = &fdt_pmu_evt_select[i];
>                         event->eidx = fdt32_to_cpu(event_val[3 * i]);
>                         event->select = fdt32_to_cpu(event_val[3 * i + 1]);
>                         event->select = (event->select << 32) |
>                                         fdt32_to_cpu(event_val[3 * i + 2]);
> -                       hw_event_count++;
>                 }
>         }
>
> --
> 2.47.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

