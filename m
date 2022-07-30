From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Jul 2022 15:55:48 +0530
Subject: [PATCH v3 4/4] lib: sbi: Fix fw_event_map initialization
In-Reply-To: <20220720215035.3453553-5-atishp@rivosinc.com>
References: <20220720215035.3453553-1-atishp@rivosinc.com> <20220720215035.3453553-5-atishp@rivosinc.com>
Message-ID: <CAAhSdy1ZpRd3q6D50Gv1b5FwD_kqbGtpC4EsCV=BZxOMTnyaYA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 21, 2022 at 3:20 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> fw_event_map represents array of firmware events. It should initialized
> for maximum number of firmware events not counters.
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index ae3c00374058..b4342971bcf1 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -764,7 +764,7 @@ static void pmu_reset_event_map(u32 hartid)
>         /* Initialize the counter to event mapping table */
>         for (j = 3; j < total_ctrs; j++)
>                 active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
> -       for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
> +       for (j = 0; j < SBI_PMU_FW_EVENT_MAX; j++)
>                 sbi_memset(&fw_event_map[hartid][j], 0,
>                            sizeof(struct sbi_pmu_fw_event));
>  }
> --
> 2.25.1
>

