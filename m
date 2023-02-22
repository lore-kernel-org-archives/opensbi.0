From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 21 Feb 2023 18:49:49 -0800
Subject: [PATCH v2 5/5] lib: sbi_pmu: Add hartid parameter PMU device ops
In-Reply-To: <20230217144413.3720307-6-mchitale@ventanamicro.com>
References: <20230217144413.3720307-1-mchitale@ventanamicro.com> <20230217144413.3720307-6-mchitale@ventanamicro.com>
Message-ID: <CAOnJCUK99ApA+XPX6Oxe-ojDhW9m5s_7+vRTOpkJA9YJe2L4fQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 17, 2023 at 6:45 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Pass the hartid parameter to custom PMU device ops. It is required by
> platform event handler to be able to program correct registers for a
> given counter.
>

This can be improved..something along the lines

"Platform event handler may leverage the hartid to program  per hart
specific registers
for a given counter."

> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  include/sbi/sbi_pmu.h | 18 +++++++++++-------
>  lib/sbi/sbi_pmu.c     | 28 +++++++++++++++++-----------
>  2 files changed, 28 insertions(+), 18 deletions(-)
>
> diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> index 467ec03..90a564f 100644
> --- a/include/sbi/sbi_pmu.h
> +++ b/include/sbi/sbi_pmu.h
> @@ -31,14 +31,15 @@ struct sbi_pmu_device {
>         /**
>          * Validate event code of custom firmware event
>          */
> -       int (*fw_event_validate_code)(uint64_t event_idx_code);
> +       int (*fw_event_validate_encoding)(uint64_t event_idx_code);
>
>         /**
>          * Match custom firmware counter with custom firmware event
>          * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
>          */
> -       bool (*fw_counter_match_code)(uint32_t counter_index,
> -                                     uint64_t event_idx_code);
> +       bool (*fw_counter_match_encoding)(uint32_t hartid,
> +                                         uint32_t counter_index,
> +                                         uint64_t event_idx_code);
>
>         /**
>          * Fetch the max width of this counter in number of bits.
> @@ -49,27 +50,30 @@ struct sbi_pmu_device {
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
> +       void (*fw_counter_write_value)(uint32_t hartid,
> +                                      uint32_t counter_index,
>                                        uint64_t value);
>
>         /**
>          * Start custom firmware counter
>          * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
>          */
> -       int (*fw_counter_start)(uint32_t counter_index,
> +       int (*fw_counter_start)(uint32_t hartid,
> +                               uint32_t counter_index,
>                                 uint64_t event_idx_code);
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
> index 05e2571..4479aa4 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -123,8 +123,8 @@ static int pmu_event_validate(unsigned long event_idx, uint64_t edata)
>                 break;
>         case SBI_PMU_EVENT_TYPE_FW:
>                 if (SBI_PMU_FW_PLATFORM == event_idx_code &&
> -                   pmu_dev && pmu_dev->fw_event_validate_code)
> -                       return pmu_dev->fw_event_validate_code(edata);
> +                   pmu_dev && pmu_dev->fw_event_validate_encoding)
> +                       return pmu_dev->fw_event_validate_encoding(edata);
>                 else
>                         event_idx_code_max = SBI_PMU_FW_MAX;
>                 break;
> @@ -189,7 +189,8 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
>
>         if (SBI_PMU_FW_PLATFORM == event_code) {
>                 if (pmu_dev && pmu_dev->fw_counter_read_value)
> -                       *cval = pmu_dev->fw_counter_read_value(cidx -
> +                       *cval = pmu_dev->fw_counter_read_value(hartid,
> +                                                              cidx -
>                                                                num_hw_ctrs);
>                 else
>                         *cval = 0;
> @@ -376,7 +377,8 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
>                     }
>
>                 if (ival_update)
> -                       pmu_dev->fw_counter_write_value(cidx - num_hw_ctrs,
> +                       pmu_dev->fw_counter_write_value(hartid,
> +                                                       cidx - num_hw_ctrs,
>                                                         ival);
>
>                 if (pmu_dev->fw_counter_start(hartid, cidx - num_hw_ctrs,
> @@ -453,11 +455,12 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
>
>  static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t event_code)
>  {
> +       u32 hartid = current_hartid();
>         int ret;
>
>         if (SBI_PMU_FW_PLATFORM == event_code &&
>             pmu_dev && pmu_dev->fw_counter_stop) {
> -               ret = pmu_dev->fw_counter_stop(cidx - num_hw_ctrs);
> +               ret = pmu_dev->fw_counter_stop(hartid, cidx - num_hw_ctrs);
>                 if (ret)
>                         return ret;
>         }
> @@ -672,10 +675,11 @@ static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
>                 if (active_events[hartid][i] != SBI_PMU_EVENT_IDX_INVALID)
>                         continue;
>                 if (SBI_PMU_FW_PLATFORM == event_code &&
> -                   pmu_dev && pmu_dev->fw_counter_match_code) {
> -                       if (!pmu_dev->fw_counter_match_code(cidx -
> -                                                           num_hw_ctrs,
> -                                                           edata))
> +                   pmu_dev && pmu_dev->fw_counter_match_encoding) {
> +                       if (!pmu_dev->fw_counter_match_encoding(hartid,
> +                                                               cidx -
> +                                                               num_hw_ctrs,
> +                                                               edata))
>                                 continue;
>                 }
>
> @@ -741,8 +745,10 @@ skip_match:
>                 if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
>                         if (SBI_PMU_FW_PLATFORM == event_code &&
>                             pmu_dev && pmu_dev->fw_counter_start) {
> -                               ret = pmu_dev->fw_counter_start(ctr_idx - num_hw_ctrs,
> -                                                       event_data);
> +                               ret = pmu_dev->fw_counter_start(hartid,
> +                                                               ctr_idx -
> +                                                               num_hw_ctrs,
> +                                                               event_data);
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

IMO, this patch can be applied before PATCH4.

Either Way,

Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

