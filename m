From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 14 Apr 2023 00:36:48 +0530
Subject: [PATCH v2 2/2] lib: sbi: Fix counter index calculation for SBI_PMU_CFG_FLAG_SKIP_MATCH
In-Reply-To: <20230413140219.189916-2-alexghiti@rivosinc.com>
References: <20230413140219.189916-1-alexghiti@rivosinc.com> <20230413140219.189916-2-alexghiti@rivosinc.com>
Message-ID: <CAOnJCUL4oK2-ma5k2Wro+Wp_1KbVb7P7KrmgixyxHVofN7hKYQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 13, 2023 at 7:33?PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> As per the SBI specification, we should "unconditionally select the first
> counter from the set of counters specified by the counter_idx_base and
> counter_idx_mask", so implement this behaviour.
>
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  lib/sbi/sbi_pmu.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 2176cc7..f5dbe6d 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -735,10 +735,15 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>                 /* The caller wants to skip the match because it already knows the
>                  * counter idx for the given event. Verify that the counter idx
>                  * is still valid.
> +                * As per the specification, we should "unconditionally select
> +                * the first counter from the set of counters specified by the
> +                * counter_idx_base and counter_idx_mask".
>                  */
> -               if (active_events[hartid][cidx_base] == SBI_PMU_EVENT_IDX_INVALID)
> +               unsigned long cidx_first = cidx_base + sbi_ffs(cidx_mask);
> +
> +               if (active_events[hartid][cidx_first] == SBI_PMU_EVENT_IDX_INVALID)
>                         return SBI_EINVAL;
> -               ctr_idx = cidx_base;
> +               ctr_idx = cidx_first;
>                 goto skip_match;
>         }
>
> --
> 2.37.2
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

