From: Anup Patel <anup@brainfault.org>
Date: Wed, 5 Jul 2023 10:11:57 +0530
Subject: [PATCH 1/1] lib: sbi_pmu: Avoid out of bounds access
In-Reply-To: <20230703134318.109435-1-heinrich.schuchardt@canonical.com>
References: <20230703134318.109435-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy1k7oQqmnsE-uyVz1zgPkt+Fh=-RfEeVE0eEqahABn5jQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 3, 2023 at 7:13?PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On a misconfigured system we could access phs->active_events[] out of
> bounds. Check that num_hw_ctrs is less or equal SBI_PMU_HW_CTR_MAX.
>
> Addresses-Coverity-ID: 1566113 ("Out-of-bounds read")
> Addresses-Coverity-ID: 1566114 ("Out-of-bounds write")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  lib/sbi/sbi_pmu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index c73e6ef..7213a53 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -933,6 +933,8 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>
>                 /* mcycle & minstret is available always */
>                 num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 3;
> +               if (num_hw_ctrs > SBI_PMU_HW_CTR_MAX)
> +                       return SBI_EINVAL;
>                 total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
>         }
>
> --
> 2.40.1
>

