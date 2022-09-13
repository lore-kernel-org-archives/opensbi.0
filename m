From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Sep 2022 17:22:33 +0530
Subject: [PATCH v2] lib: utils/fdt: Fix DT parsing in fdt_pmu_setup()
In-Reply-To: <20220913091015.1018311-1-apatel@ventanamicro.com>
References: <20220913091015.1018311-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3V9-fq84MVPjhCyMtQv9X6XPsD5FWvinpC3gHavt-gLA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 13, 2022 at 2:41 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This patch does following fixes in fdt_pmu_setup():
> 1) If any of the event mapping DT property is absent or too small
>    then don't skip parsing of other DT properties.
> 2) Return failure if sbi_pmu_add_hw_event_counter_map() fails.
> 3) Return failure if sbi_pmu_add_raw_event_counter_map() fails.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Changes since v1:
>  - Don't use goto statments
> ---
>  lib/utils/fdt/fdt_pmu.c | 74 +++++++++++++++++++++++------------------
>  1 file changed, 42 insertions(+), 32 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
> index 8ba6b08..4829f21 100644
> --- a/lib/utils/fdt/fdt_pmu.c
> +++ b/lib/utils/fdt/fdt_pmu.c
> @@ -75,42 +75,52 @@ int fdt_pmu_setup(void *fdt)
>         if (pmu_offset < 0)
>                 return SBI_EFAIL;
>
> -       event_ctr_map = fdt_getprop(fdt, pmu_offset, "riscv,event-to-mhpmcounters", &len);
> -       if (!event_ctr_map || len < 8)
> -               return SBI_EFAIL;
> -       len = len / (sizeof(u32) * 3);
> -       for (i = 0; i < len; i++) {
> -               event_idx_start = fdt32_to_cpu(event_ctr_map[3 * i]);
> -               event_idx_end = fdt32_to_cpu(event_ctr_map[3 * i + 1]);
> -               ctr_map = fdt32_to_cpu(event_ctr_map[3 * i + 2]);
> -               sbi_pmu_add_hw_event_counter_map(event_idx_start, event_idx_end, ctr_map);
> +       event_ctr_map = fdt_getprop(fdt, pmu_offset,
> +                                   "riscv,event-to-mhpmcounters", &len);
> +       if (event_ctr_map && len >= 8) {
> +               len = len / (sizeof(u32) * 3);
> +               for (i = 0; i < len; i++) {
> +                       event_idx_start = fdt32_to_cpu(event_ctr_map[3 * i]);
> +                       event_idx_end = fdt32_to_cpu(event_ctr_map[3 * i + 1]);
> +                       ctr_map = fdt32_to_cpu(event_ctr_map[3 * i + 2]);
> +                       result = sbi_pmu_add_hw_event_counter_map(
> +                               event_idx_start, event_idx_end, ctr_map);
> +                       if (result)
> +                               return result;
> +               }
>         }
>
> -       event_val = fdt_getprop(fdt, pmu_offset, "riscv,event-to-mhpmevent", &len);
> -       if (!event_val || len < 8)
> -               return SBI_EFAIL;
> -       len = len / (sizeof(u32) * 3);
> -       for (i = 0; i < len; i++) {
> -               event = &fdt_pmu_evt_select[hw_event_count];
> -               event->eidx = fdt32_to_cpu(event_val[3 * i]);
> -               event->select = fdt32_to_cpu(event_val[3 * i + 1]);
> -               event->select = (event->select << 32) | fdt32_to_cpu(event_val[3 * i + 2]);
> -               hw_event_count++;
> +       event_val = fdt_getprop(fdt, pmu_offset,
> +                               "riscv,event-to-mhpmevent", &len);
> +       if (event_val && len >= 8) {
> +               len = len / (sizeof(u32) * 3);
> +               for (i = 0; i < len; i++) {
> +                       event = &fdt_pmu_evt_select[hw_event_count];
> +                       event->eidx = fdt32_to_cpu(event_val[3 * i]);
> +                       event->select = fdt32_to_cpu(event_val[3 * i + 1]);
> +                       event->select = (event->select << 32) |
> +                                       fdt32_to_cpu(event_val[3 * i + 2]);
> +                       hw_event_count++;
> +               }
>         }
>
> -       event_val = fdt_getprop(fdt, pmu_offset, "riscv,raw-event-to-mhpmcounters", &len);
> -       if (!event_val || len < 20)
> -               return SBI_EFAIL;
> -       len = len / (sizeof(u32) * 5);
> -       for (i = 0; i < len; i++) {
> -               raw_selector = fdt32_to_cpu(event_val[5 * i]);
> -               raw_selector = (raw_selector << 32) | fdt32_to_cpu(event_val[5 * i + 1]);
> -               select_mask = fdt32_to_cpu(event_val[5 * i + 2]);
> -               select_mask = (select_mask  << 32) | fdt32_to_cpu(event_val[5 * i + 3]);
> -               ctr_map = fdt32_to_cpu(event_val[5 * i + 4]);
> -               result = sbi_pmu_add_raw_event_counter_map(raw_selector, select_mask, ctr_map);
> -               if (!result)
> -                       hw_event_count++;
> +       event_val = fdt_getprop(fdt, pmu_offset,
> +                               "riscv,raw-event-to-mhpmcounters", &len);
> +       if (event_val && len >= 20) {
> +               len = len / (sizeof(u32) * 5);
> +               for (i = 0; i < len; i++) {
> +                       raw_selector = fdt32_to_cpu(event_val[5 * i]);
> +                       raw_selector = (raw_selector << 32) |
> +                                       fdt32_to_cpu(event_val[5 * i + 1]);
> +                       select_mask = fdt32_to_cpu(event_val[5 * i + 2]);
> +                       select_mask = (select_mask  << 32) |
> +                                       fdt32_to_cpu(event_val[5 * i + 3]);
> +                       ctr_map = fdt32_to_cpu(event_val[5 * i + 4]);
> +                       result = sbi_pmu_add_raw_event_counter_map(
> +                                       raw_selector, select_mask, ctr_map);
> +                       if (result)
> +                               return result;
> +               }
>         }
>
>         return 0;
> --
> 2.34.1
>

