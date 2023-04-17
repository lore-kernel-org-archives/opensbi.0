From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Apr 2023 09:35:20 +0530
Subject: [PATCH v2 1/2] lib: sbi: Do not clear active_events for
 cycle/instret when stopping
In-Reply-To: <20230413140219.189916-1-alexghiti@rivosinc.com>
References: <20230413140219.189916-1-alexghiti@rivosinc.com>
Message-ID: <CAAhSdy0sZ0=tB_EJMAD4qAiHPH=0eVEanZrVURvgr2SuC__Qkw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 13, 2023 at 7:32?PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> Those events are enabled by default and should not be reset afterwards
> since when using SBI_PMU_CFG_FLAG_SKIP_MATCH, it leads to unaccessible
> counters after the first use.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 74d6912..2176cc7 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -531,7 +531,7 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
>                 else
>                         ret = pmu_ctr_stop_hw(cidx);
>
> -               if (flag & SBI_PMU_STOP_FLAG_RESET) {
> +               if (cidx > (CSR_INSTRET - CSR_CYCLE) && flag & SBI_PMU_STOP_FLAG_RESET) {
>                         active_events[hartid][cidx] = SBI_PMU_EVENT_IDX_INVALID;
>                         pmu_reset_hw_mhpmevent(cidx);
>                 }
> --
> 2.37.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

