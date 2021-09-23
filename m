From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 14:20:40 +0530
Subject: [RFC PATCH 9/9] lib: sbi: Counter info width should be zero
 indexed
In-Reply-To: <20210909204031.1239254-10-atish.patra@wdc.com>
References: <20210909204031.1239254-1-atish.patra@wdc.com>
 <20210909204031.1239254-10-atish.patra@wdc.com>
Message-ID: <CAAhSdy0t5e=OqNJpSw=PBrfo9Y+ATzsKAuV_2ixBZJ+49mEBOA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 2:11 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The mhpm bits represent the number of bits available in mhpmcounter
> while counter width describes a zero indexed value. Fix the counter width
> calculation.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  lib/sbi/sbi_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index f33842052a46..0e61417db14b 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -645,7 +645,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
>                 if (cidx == 0 || cidx == 2)
>                         cinfo.width = 63;
>                 else
> -                       cinfo.width = sbi_hart_mhpm_bits(scratch);
> +                       cinfo.width = sbi_hart_mhpm_bits(scratch) - 1;
>         } else {
>                 /* it's a firmware counter */
>                 cinfo.type = SBI_PMU_CTR_TYPE_FW;
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

