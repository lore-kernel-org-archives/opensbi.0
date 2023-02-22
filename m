From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 21 Feb 2023 18:42:09 -0800
Subject: [PATCH v2 4/5] lib: sbi_pmu: Update custom PMU device ops
In-Reply-To: <20230217144413.3720307-5-mchitale@ventanamicro.com>
References: <20230217144413.3720307-1-mchitale@ventanamicro.com> <20230217144413.3720307-5-mchitale@ventanamicro.com>
Message-ID: <CAOnJCU+geopBQy2XL8MctTcX8o60qY_c5ZMQyxpQ49rW=0oG0Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 17, 2023 at 6:44 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Update the implmentation of some of the PMU device operations to make them

/s/implmentation/implementation

> inline with the SBI spec updates for the platform specific firmware events.
>

This patch can be further split into smaller patches as it adds
multiple things in a single patch.
The commit text needs to improvement as well to indicate the purpose
more closely.

1. Allows event data for firmware events.
2. Changed the sbi_pmu_device functions to use uint64_t instead of uint32_t
3. Restrict the platform pmu device ops for SBI_PMU_FW_PLATFORM which
is a behavioral change from existing
implemenation. Even though there are no actual uses for this feature
upstream, this should be done in a separate patch
with appropriate commit message.

> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  include/sbi/sbi_pmu.h |  16 ++++---
>  lib/sbi/sbi_pmu.c     | 102 ++++++++++++++++++++++++++----------------
>  2 files changed, 73 insertions(+), 45 deletions(-)
>
> diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> index b3b75c1..467ec03 100644
> --- a/include/sbi/sbi_pmu.h
> +++ b/include/sbi/sbi_pmu.h
> @@ -30,16 +30,15 @@ struct sbi_pmu_device {
>
>         /**
>          * Validate event code of custom firmware event
> -        * Note: SBI_PMU_FW_MAX <= event_idx_code
>          */
> -       int (*fw_event_validate_code)(uint32_t event_idx_code);
> +       int (*fw_event_validate_code)(uint64_t event_idx_code);
>
>         /**
>          * Match custom firmware counter with custom firmware event
>          * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
>          */
>         bool (*fw_counter_match_code)(uint32_t counter_index,
> -                                     uint32_t event_idx_code);
> +                                     uint64_t event_idx_code);
>
>         /**
>          * Fetch the max width of this counter in number of bits.
> @@ -52,14 +51,19 @@ struct sbi_pmu_device {
>          */
>         uint64_t (*fw_counter_read_value)(uint32_t counter_index);
>
> +       /**
> +        * Write value to custom firmware counter
> +        * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
> +        */
> +       void (*fw_counter_write_value)(uint32_t counter_index,
> +                                      uint64_t value);
> +
>         /**
>          * Start custom firmware counter
> -        * Note: SBI_PMU_FW_MAX <= event_idx_code
>          * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
>          */
>         int (*fw_counter_start)(uint32_t counter_index,
> -                               uint32_t event_idx_code,
> -                               uint64_t init_val, bool init_val_update);
> +                               uint64_t event_idx_code);
>
>         /**
>          * Stop custom firmware counter
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index a99c045..05e2571 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -65,8 +65,12 @@ static uint32_t active_events[SBI_HARTMASK_MAX_BITS][SBI_PMU_HW_CTR_MAX + SBI_PM
>  #endif
>  static unsigned long fw_counters_started[SBI_HARTMASK_MAX_BITS];
>
> -/* Values of firmwares counters on each HART */
> -static uint64_t fw_counters_value[SBI_HARTMASK_MAX_BITS][SBI_PMU_FW_CTR_MAX] = {0};
> +/*
> + * Counter values for SBI firmware events and event codes for platform
> + * firmware events. Both are mutually exclusive and hence can optimally share
> + * the same memory.
> + */
> +static uint64_t fw_counters_data[SBI_HARTMASK_MAX_BITS][SBI_PMU_FW_CTR_MAX] = {0};
>
>  /* Maximum number of hardware events available */
>  static uint32_t num_hw_events;
> @@ -106,7 +110,7 @@ static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
>         return false;
>  }
>
> -static int pmu_event_validate(unsigned long event_idx)
> +static int pmu_event_validate(unsigned long event_idx, uint64_t edata)
>  {
>         uint32_t event_idx_type = get_cidx_type(event_idx);
>         uint32_t event_idx_code = get_cidx_code(event_idx);
> @@ -118,9 +122,9 @@ static int pmu_event_validate(unsigned long event_idx)
>                 event_idx_code_max = SBI_PMU_HW_GENERAL_MAX;
>                 break;
>         case SBI_PMU_EVENT_TYPE_FW:
> -               if (SBI_PMU_FW_MAX <= event_idx_code &&
> +               if (SBI_PMU_FW_PLATFORM == event_idx_code &&
>                     pmu_dev && pmu_dev->fw_event_validate_code)
> -                       return pmu_dev->fw_event_validate_code(event_idx_code);
> +                       return pmu_dev->fw_event_validate_code(edata);
>                 else
>                         event_idx_code_max = SBI_PMU_FW_MAX;
>                 break;
> @@ -183,12 +187,14 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
>         if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
>                 return SBI_EINVAL;
>
> -       if (SBI_PMU_FW_MAX <= event_code &&
> -           pmu_dev && pmu_dev->fw_counter_read_value)
> -               fw_counters_value[hartid][cidx - num_hw_ctrs] =
> -                       pmu_dev->fw_counter_read_value(cidx - num_hw_ctrs);
> -
> -       *cval = fw_counters_value[hartid][cidx - num_hw_ctrs];
> +       if (SBI_PMU_FW_PLATFORM == event_code) {
> +               if (pmu_dev && pmu_dev->fw_counter_read_value)
> +                       *cval = pmu_dev->fw_counter_read_value(cidx -
> +                                                              num_hw_ctrs);
> +               else
> +                       *cval = 0;
> +       } else
> +               *cval = fw_counters_data[hartid][cidx - num_hw_ctrs];
>
>         return 0;
>  }
> @@ -357,22 +363,30 @@ int sbi_pmu_irq_bit(void)
>  }
>
>  static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
> -                           uint64_t ival, bool ival_update)
> +                           uint64_t event_data, uint64_t ival,
> +                           bool ival_update)
>  {
> -       int ret;
>         u32 hartid = current_hartid();
>
> -       if (SBI_PMU_FW_MAX <= event_code &&
> -           pmu_dev && pmu_dev->fw_counter_start) {
> -               ret = pmu_dev->fw_counter_start(cidx - num_hw_ctrs,
> -                                               event_code,
> -                                               ival, ival_update);
> -               if (ret)
> -                       return ret;
> +       if (SBI_PMU_FW_PLATFORM == event_code) {
> +               if (!pmu_dev ||
> +                   !pmu_dev->fw_counter_write_value ||
> +                   !pmu_dev->fw_counter_start) {
> +                       return SBI_EINVAL;
> +                   }
> +
> +               if (ival_update)
> +                       pmu_dev->fw_counter_write_value(cidx - num_hw_ctrs,
> +                                                       ival);
> +
> +               if (pmu_dev->fw_counter_start(hartid, cidx - num_hw_ctrs,
> +                                             event_data))
> +                       return SBI_EINVAL;
> +       } else {
> +               if (ival_update)
> +                       fw_counters_data[hartid][cidx - num_hw_ctrs] = ival;
>         }
>
> -       if (ival_update)
> -               fw_counters_value[hartid][cidx - num_hw_ctrs] = ival;
>         fw_counters_started[hartid] |= BIT(cidx - num_hw_ctrs);
>
>         return 0;
> @@ -381,8 +395,10 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
>  int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>                       unsigned long flags, uint64_t ival)
>  {
> +       u32 hartid = current_hartid();
>         int event_idx_type;
>         uint32_t event_code;
> +       uint64_t edata;
>         int ret = SBI_EINVAL;
>         bool bUpdate = false;
>         int i, cidx;
> @@ -399,8 +415,13 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>                 if (event_idx_type < 0)
>                         /* Continue the start operation for other counters */
>                         continue;
> -               else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
> -                       ret = pmu_ctr_start_fw(cidx, event_code, ival, bUpdate);
> +               else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW) {
> +                       edata = (event_code == SBI_PMU_FW_PLATFORM) ?
> +                                fw_counters_data[hartid][cidx - num_hw_ctrs]
> +                                : 0x0;
> +                       ret = pmu_ctr_start_fw(cidx, event_code, edata, ival,
> +                                              bUpdate);
> +               }
>                 else
>                         ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
>         }
> @@ -434,7 +455,7 @@ static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t event_code)
>  {
>         int ret;
>
> -       if (SBI_PMU_FW_MAX <= event_code &&
> +       if (SBI_PMU_FW_PLATFORM == event_code &&
>             pmu_dev && pmu_dev->fw_counter_stop) {
>                 ret = pmu_dev->fw_counter_stop(cidx - num_hw_ctrs);
>                 if (ret)
> @@ -640,7 +661,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>   * check.
>   */
>  static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
> -                          uint32_t event_code, u32 hartid)
> +                          uint32_t event_code, u32 hartid, uint32_t edata)
>  {
>         int i, cidx;
>
> @@ -650,10 +671,11 @@ static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
>                         continue;
>                 if (active_events[hartid][i] != SBI_PMU_EVENT_IDX_INVALID)
>                         continue;
> -               if (SBI_PMU_FW_MAX <= event_code &&
> +               if (SBI_PMU_FW_PLATFORM == event_code &&
>                     pmu_dev && pmu_dev->fw_counter_match_code) {
> -                       if (!pmu_dev->fw_counter_match_code(cidx - num_hw_ctrs,
> -                                                           event_code))
> +                       if (!pmu_dev->fw_counter_match_code(cidx -
> +                                                           num_hw_ctrs,
> +                                                           edata))
>                                 continue;
>                 }
>
> @@ -675,7 +697,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>         if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
>                 return SBI_EINVAL;
>
> -       event_type = pmu_event_validate(event_idx);
> +       event_type = pmu_event_validate(event_idx, event_data);
>         if (event_type < 0)
>                 return SBI_EINVAL;
>         event_code = get_cidx_code(event_idx);
> @@ -693,7 +715,8 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>
>         if (event_type == SBI_PMU_EVENT_TYPE_FW) {
>                 /* Any firmware counter can be used track any firmware event */
> -               ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, event_code, hartid);
> +               ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, event_code,
> +                                         hartid, event_data);
>         } else {
>                 ctr_idx = pmu_ctr_find_hw(cidx_base, cidx_mask, flags, event_idx,
>                                           event_data);
> @@ -710,15 +733,16 @@ skip_match:
>                 if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
>                         pmu_ctr_start_hw(ctr_idx, 0, false);
>         } else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
> +               if (event_code == SBI_PMU_FW_PLATFORM)
> +                       fw_counters_data[hartid][ctr_idx - num_hw_ctrs] =
> +                                                               event_data;
>                 if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
> -                       fw_counters_value[hartid][ctr_idx - num_hw_ctrs] = 0;
> +                       fw_counters_data[hartid][ctr_idx - num_hw_ctrs] = 0;
>                 if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
> -                       if (SBI_PMU_FW_MAX <= event_code &&
> +                       if (SBI_PMU_FW_PLATFORM == event_code &&
>                             pmu_dev && pmu_dev->fw_counter_start) {
> -                               ret = pmu_dev->fw_counter_start(
> -                                       ctr_idx - num_hw_ctrs, event_code,
> -                                       fw_counters_value[hartid][ctr_idx - num_hw_ctrs],
> -                                       true);
> +                               ret = pmu_dev->fw_counter_start(ctr_idx - num_hw_ctrs,
> +                                                       event_data);
>                                 if (ret)
>                                         return ret;
>                         }
> @@ -743,7 +767,7 @@ int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id)
>         for (cidx = num_hw_ctrs; cidx < total_ctrs; cidx++) {
>                 if (get_cidx_code(active_events[hartid][cidx]) == fw_id &&
>                     (fw_counters_started[hartid] & BIT(cidx - num_hw_ctrs))) {
> -                       fcounter = &fw_counters_value[hartid][cidx - num_hw_ctrs];
> +                       fcounter = &fw_counters_data[hartid][cidx - num_hw_ctrs];
>                         break;
>                 }
>         }
> @@ -803,7 +827,7 @@ static void pmu_reset_event_map(u32 hartid)
>         for (j = 3; j < total_ctrs; j++)
>                 active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
>         for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
> -               fw_counters_value[hartid][j] = 0;
> +               fw_counters_data[hartid][j] = 0;
>         fw_counters_started[hartid] = 0;
>  }
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

