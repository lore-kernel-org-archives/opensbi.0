From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 Apr 2022 15:27:56 +0530
Subject: [PATCH] include: sbi: Define SBI_PMU_HW_EVENT_MAX to 256
In-Reply-To: <20220428094502.12614-1-junliang.tan@linux.starfivetech.com>
References: <20220428094502.12614-1-junliang.tan@linux.starfivetech.com>
Message-ID: <CAAhSdy3UGcc7hbpc7weaYC0VEO6LDKh-7RqTZcqQwyD-bexscg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

+Atish

On Thu, Apr 28, 2022 at 3:28 PM Jun Liang Tan
<junliang.tan@linux.starfivetech.com> wrote:
>
> Increase maximum number of PMU hardware events that can be mapped
> by OpenSBI to 256
>
> Signed-off-by: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
> Signed-off-by: Wei Liang Lim <weiliang.lim@linux.starfivetech.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

@Atish, we need to find better ways to control memory used by sbi_pmu.c

Regards,
Anup

> ---
>  include/sbi/sbi_pmu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> index 6a1c62c..f5e3dbd 100644
> --- a/include/sbi/sbi_pmu.h
> +++ b/include/sbi/sbi_pmu.h
> @@ -17,7 +17,7 @@
>
>  /* Event related macros */
>  /* Maximum number of hardware events that can mapped by OpenSBI */
> -#define SBI_PMU_HW_EVENT_MAX 64
> +#define SBI_PMU_HW_EVENT_MAX 256
>
>  /* Maximum number of firmware events that can mapped by OpenSBI */
>  #define SBI_PMU_FW_EVENT_MAX 32
> --
> 2.25.1
>
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

