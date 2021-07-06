From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jul 2021 17:15:18 +0530
Subject: [PATCH] include: simplify the definition of s64/u64/int64/uint64
In-Reply-To: <20210706105035.48473-1-wxjstz@126.com>
References: <20210706105035.48473-1-wxjstz@126.com>
Message-ID: <CAAhSdy1JP=3Kmv3XVZRROe4ghLDLPPtMck1kFO2g8KjAMy+_yQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 6, 2021 at 4:20 PM Xiang W <wxjstz@126.com> wrote:
>
> The length of long long in RV32 and RV64 is both 64 bits, and there is no
> need to use conditional compilation to define 64-bit related types

The current way of defining s64 and u64 is much more readable.

I don't see the point behind this simplification because we still have
the "#if" for PRILX.

Regards,
Anup

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  include/sbi/sbi_types.h | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
> index 38e3565..7d00c12 100644
> --- a/include/sbi/sbi_types.h
> +++ b/include/sbi/sbi_types.h
> @@ -28,17 +28,14 @@ typedef unsigned int                u32;
>  typedef int                    int32_t;
>  typedef unsigned int           uint32_t;
>
> -#if __riscv_xlen == 64
> -typedef long                   s64;
> -typedef unsigned long          u64;
> -typedef long                   int64_t;
> -typedef unsigned long          uint64_t;
> -#define PRILX                  "016lx"
> -#elif __riscv_xlen == 32
>  typedef long long              s64;
>  typedef unsigned long long     u64;
>  typedef long long              int64_t;
>  typedef unsigned long long     uint64_t;
> +
> +#if __riscv_xlen == 64
> +#define PRILX                  "016lx"
> +#elif __riscv_xlen == 32
>  #define PRILX                  "08lx"
>  #else
>  #error "Unexpected __riscv_xlen"
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

