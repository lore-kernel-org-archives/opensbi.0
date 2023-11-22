From: Anup Patel <anup@brainfault.org>
Date: Wed, 22 Nov 2023 20:59:27 +0530
Subject: [PATCH 1/1] lib: sbi_pmu: avoid buffer overflow
In-Reply-To: <20231117135931.26666-1-heinrich.schuchardt@canonical.com>
References: <20231117135931.26666-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy33g04XKigsAEHT2HnG27=DKcMZWZ8D9=jwLGp9Uym7Pw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 17, 2023 at 7:29?PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> total_ctrs is bounded by
>
>     SBI_PMU_FW_CTR_MAX + SBI_PMU_HW_CTR_MAX) == 48
>
> which exceeds BITS_PER_LONG on 32 bit systems.
>
> Iterating over the bits of &cmask results in a buffer overflow when looking
> for a bit >= BITS_PER_LONG.
>
> Adjust the iterators in sbi_pmu_ctr_start() and sbi_pmu_ctr_stop()
> accordingly.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index f4c8fc4..185068b 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -445,7 +445,7 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>         if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
>                 bUpdate = true;
>
> -       for_each_set_bit(i, &cmask, total_ctrs) {
> +       for_each_set_bit(i, &cmask, BITS_PER_LONG) {
>                 cidx = i + cbase;
>                 event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
>                 if (event_idx_type < 0)
> @@ -540,7 +540,7 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
>         if ((cbase + sbi_fls(cmask)) >= total_ctrs)
>                 return SBI_EINVAL;
>
> -       for_each_set_bit(i, &cmask, total_ctrs) {
> +       for_each_set_bit(i, &cmask, BITS_PER_LONG) {
>                 cidx = i + cbase;
>                 event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
>                 if (event_idx_type < 0)
> --
> 2.40.1
>

