From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Mar 2023 12:02:04 +0530
Subject: [PATCH v3 8/8] lib: sbi_pmu: Add hartid parameter PMU device ops
In-Reply-To: <20230309055112.1516581-9-mchitale@ventanamicro.com>
References: <20230309055112.1516581-1-mchitale@ventanamicro.com> <20230309055112.1516581-9-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy0Dg8aDWDq8GE1z91n1eMogLDBr7rrjG4Jk27xWZfd2DA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 9, 2023 at 11:21?AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Platform specific firmware event handler may leverage the hartid to program
> per hart specific registers for a given counter.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_pmu.h | 14 ++++++++------
>  lib/sbi/sbi_pmu.c     | 25 +++++++++++++++----------
>  2 files changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> index 53f2700..16f6877 100644
> --- a/include/sbi/sbi_pmu.h
> +++ b/include/sbi/sbi_pmu.h
> @@ -31,13 +31,14 @@ struct sbi_pmu_device {
>         /**
>          * Validate event code of custom firmware event
>          */
> -       int (*fw_event_validate_encoding)(uint64_t event_data);
> +       int (*fw_event_validate_encoding)(uint32_t hartid, uint64_t event_data);
>
>         /**
>          * Match custom firmware counter with custom firmware event
>          * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
>          */
> -       bool (*fw_counter_match_encoding)(uint32_t counter_index,
> +       bool (*fw_counter_match_encoding)(uint32_t hartid,
> +                                         uint32_t counter_index,
>                                           uint64_t event_data);
>
>         /**
> @@ -49,27 +50,28 @@ struct sbi_pmu_device {
>          * Read value of custom firmware counter
>          * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
>          */
> -       uint64_t (*fw_counter_read_value)(uint32_t counter_index);
> +       uint64_t (*fw_counter_read_value)(uint32_t hartid,
> +                                         uint32_t counter_index);
>
>         /**
>          * Write value to custom firmware counter
>          * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
>          */
> -       void (*fw_counter_write_value)(uint32_t counter_index,
> +       void (*fw_counter_write_value)(uint32_t hartid, uint32_t counter_index,
>                                        uint64_t value);
>
>         /**
>          * Start custom firmware counter
>          * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
>          */
> -       int (*fw_counter_start)(uint32_t counter_index,
> +       int (*fw_counter_start)(uint32_t hartid, uint32_t counter_index,
>                                 uint64_t event_data);
>
>         /**
>          * Stop custom firmware counter
>          * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
>          */
> -       int (*fw_counter_stop)(uint32_t counter_index);
> +       int (*fw_counter_stop)(uint32_t hartid, uint32_t counter_index);
>
>         /**
>          * Custom enable irq for hardware counter
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 00a2c3e..74d6912 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -116,6 +116,7 @@ static int pmu_event_validate(unsigned long event_idx, uint64_t edata)
>         uint32_t event_idx_code = get_cidx_code(event_idx);
>         uint32_t event_idx_code_max = -1;
>         uint32_t cache_ops_result, cache_ops_id, cache_id;
> +       u32 hartid = current_hartid();
>
>         switch(event_idx_type) {
>         case SBI_PMU_EVENT_TYPE_HW:
> @@ -129,7 +130,8 @@ static int pmu_event_validate(unsigned long event_idx, uint64_t edata)
>
>                 if (SBI_PMU_FW_PLATFORM == event_idx_code &&
>                     pmu_dev && pmu_dev->fw_event_validate_encoding)
> -                       return pmu_dev->fw_event_validate_encoding(edata);
> +                       return pmu_dev->fw_event_validate_encoding(hartid,
> +                                                                  edata);
>                 else
>                         event_idx_code_max = SBI_PMU_FW_MAX;
>                 break;
> @@ -199,7 +201,8 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
>
>         if (SBI_PMU_FW_PLATFORM == event_code) {
>                 if (pmu_dev && pmu_dev->fw_counter_read_value)
> -                       *cval = pmu_dev->fw_counter_read_value(cidx -
> +                       *cval = pmu_dev->fw_counter_read_value(hartid,
> +                                                              cidx -
>                                                                num_hw_ctrs);
>                 else
>                         *cval = 0;
> @@ -391,10 +394,11 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
>                     }
>
>                 if (ival_update)
> -                       pmu_dev->fw_counter_write_value(cidx - num_hw_ctrs,
> +                       pmu_dev->fw_counter_write_value(hartid,
> +                                                       cidx - num_hw_ctrs,
>                                                         ival);
>
> -               return pmu_dev->fw_counter_start(cidx - num_hw_ctrs,
> +               return pmu_dev->fw_counter_start(hartid, cidx - num_hw_ctrs,
>                                                  event_data);
>         } else {
>                 if (ival_update)
> @@ -467,6 +471,7 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
>
>  static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t event_code)
>  {
> +       u32 hartid = current_hartid();
>         int ret;
>
>         if ((event_code >= SBI_PMU_FW_MAX &&
> @@ -476,7 +481,7 @@ static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t event_code)
>
>         if (SBI_PMU_FW_PLATFORM == event_code &&
>             pmu_dev && pmu_dev->fw_counter_stop) {
> -               ret = pmu_dev->fw_counter_stop(cidx - num_hw_ctrs);
> +               ret = pmu_dev->fw_counter_stop(hartid, cidx - num_hw_ctrs);
>                 if (ret)
>                         return ret;
>         }
> @@ -697,8 +702,9 @@ static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
>                         continue;
>                 if (SBI_PMU_FW_PLATFORM == event_code &&
>                     pmu_dev && pmu_dev->fw_counter_match_encoding) {
> -                       if (!pmu_dev->fw_counter_match_encoding(cidx - num_hw_ctrs,
> -                                                               edata))
> +                       if (!pmu_dev->fw_counter_match_encoding(hartid,
> +                                                           cidx - num_hw_ctrs,
> +                                                           edata))
>                                 continue;
>                 }
>
> @@ -764,9 +770,8 @@ skip_match:
>                 if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
>                         if (SBI_PMU_FW_PLATFORM == event_code &&
>                             pmu_dev && pmu_dev->fw_counter_start) {
> -                               ret = pmu_dev->fw_counter_start(ctr_idx -
> -                                                               num_hw_ctrs,
> -                                                               event_data);
> +                               ret = pmu_dev->fw_counter_start(hartid,
> +                                       ctr_idx - num_hw_ctrs, event_data);
>                                 if (ret)
>                                         return ret;
>                         }
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

