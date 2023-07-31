From: Anup Patel <anup@brainfault.org>
Date: Mon, 31 Jul 2023 14:03:07 +0530
Subject: [PATCH] include: sbi: fix CSR define of mseccfg
In-Reply-To: <20230714100834.479234-1-wxjstz@126.com>
References: <20230714100834.479234-1-wxjstz@126.com>
Message-ID: <CAAhSdy2SPzVT+q9=aZECcoCxgXueG7G4p_vP9pwMFJ7iN=QyQA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 14, 2023 at 3:38?PM Xiang W <wxjstz@126.com> wrote:
>
> Because the CSR names in the spec are mseccfg and mseccfgh. Remove
> CSR_MSECCFG_LOWER and CSR_MSECCFG_UPPER and directly define
> CSR_MSECCFG and CSR_MSECCFGH.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>  include/sbi/riscv_encoding.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 50071ad..776a083 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -664,9 +664,8 @@
>  #define CSR_MHPMEVENT31H               0x73f
>
>  /* Machine Security Configuration CSR (mseccfg) */
> -#define CSR_MSECCFG_LOWER              0x747
> -#define CSR_MSECCFG_UPPER              0x757
> -#define CSR_MSECCFG                    (CSR_MSECCFG_LOWER)
> +#define CSR_MSECCFG                    0x747
> +#define CSR_MSECCFGH                   0x757
>
>  #define MSECCFG_MML_SHIFT              (0)
>  #define MSECCFG_MML                    (_UL(1) << MSECCFG_MML_SHIFT)
> --
> 2.40.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

