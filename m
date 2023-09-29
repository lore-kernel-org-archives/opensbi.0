From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 29 Sep 2023 15:39:48 -0700
Subject: [PATCH v2] lib: sbi_pmu: check for index overflows
In-Reply-To: <20230928130357.46224-1-heinrich.schuchardt@canonical.com>
References: <20230928130357.46224-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAOnJCUKoYUC4ts3BqNAJBRmWqV4=J08ZAJpgq3zJ65coX4uL0A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 28, 2023 at 6:04?AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> sbi_pmu_ctr_cfg_match() receives data from a lower privilege level mode.
> We must catch maliciously wrong values.
>
> We already check against total_ctrs. But we do not check that total_ctrs is
> less than SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX.
>
> Check that the number of hardware counters is in the valid range.
>
> Addresses-Coverity-ID: 1566114 Out-of-bounds write
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
>         check num_hw_ctrs
> ---
>  lib/sbi/sbi_pmu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 9694aae..f4c8fc4 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -981,6 +981,9 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>                 else
>                         num_hw_ctrs = hpm_count + 1;
>
> +               if (num_hw_ctrs > SBI_PMU_HW_CTR_MAX)
> +                       return SBI_EINVAL;
> +

You can't have num_hw_ctrs more than SBI_PMU_HW_CTR_MAX as that is
defined by spec.
I guess you just want future proof code where someone accidentally
changed without realizing this.
Ideally, we should catch those kinds of bugs during review. But I am
okay with another level sanity check ;)

>                 total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
>         }
>
> --
> 2.40.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

