From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Apr 2023 10:18:48 +0530
Subject: [PATCH] sbi/sbi_pmu.c: Align the event type offset as per SBI specification
In-Reply-To: <20230330084114.24166-1-peterlin@andestech.com>
References: <20230330084114.24166-1-peterlin@andestech.com>
Message-ID: <CAAhSdy2T2UrBu_S93m-WLsuespb_D5V6u2pFqk56_9mcGbLPXw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 30, 2023 at 2:11?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> The bits encoded in event_idx[19:16] indicate the event type, with an
> offset of 16 instead of 20.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

I have updated the commit description to have a Fixes tag and use
"lib: sbi_pmu:" as the subject prefix.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_ecall_interface.h | 4 ++--
>  lib/sbi/sbi_pmu.c                 | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index 4597358..54d1951 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -214,10 +214,10 @@ enum sbi_pmu_ctr_type {
>  };
>
>  /* Helper macros to decode event idx */
> -#define SBI_PMU_EVENT_IDX_OFFSET 20
>  #define SBI_PMU_EVENT_IDX_MASK 0xFFFFF
> +#define SBI_PMU_EVENT_IDX_TYPE_OFFSET 16
> +#define SBI_PMU_EVENT_IDX_TYPE_MASK (0xF << SBI_PMU_EVENT_IDX_TYPE_OFFSET)
>  #define SBI_PMU_EVENT_IDX_CODE_MASK 0xFFFF
> -#define SBI_PMU_EVENT_IDX_TYPE_MASK 0xF0000
>  #define SBI_PMU_EVENT_RAW_IDX 0x20000
>
>  #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 74d6912..ef1eab0 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -81,7 +81,8 @@ static uint32_t num_hw_ctrs;
>  static uint32_t total_ctrs;
>
>  /* Helper macros to retrieve event idx and code type */
> -#define get_cidx_type(x) ((x & SBI_PMU_EVENT_IDX_TYPE_MASK) >> 16)
> +#define get_cidx_type(x) \
> +  ((x & SBI_PMU_EVENT_IDX_TYPE_MASK) >> SBI_PMU_EVENT_IDX_TYPE_OFFSET)
>  #define get_cidx_code(x) (x & SBI_PMU_EVENT_IDX_CODE_MASK)
>
>  /**
> @@ -903,10 +904,10 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>         pmu_reset_event_map(hartid);
>
>         /* First three counters are fixed by the priv spec and we enable it by default */
> -       active_events[hartid][0] = SBI_PMU_EVENT_TYPE_HW << SBI_PMU_EVENT_IDX_OFFSET |
> +       active_events[hartid][0] = SBI_PMU_EVENT_TYPE_HW << SBI_PMU_EVENT_IDX_TYPE_OFFSET |
>                                    SBI_PMU_HW_CPU_CYCLES;
>         active_events[hartid][1] = SBI_PMU_EVENT_IDX_INVALID;
> -       active_events[hartid][2] = SBI_PMU_EVENT_TYPE_HW << SBI_PMU_EVENT_IDX_OFFSET |
> +       active_events[hartid][2] = SBI_PMU_EVENT_TYPE_HW << SBI_PMU_EVENT_IDX_TYPE_OFFSET |
>                                    SBI_PMU_HW_INSTRUCTIONS;
>
>         return 0;
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

