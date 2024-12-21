From: Anup Patel <anup@brainfault.org>
Date: Sat, 21 Dec 2024 21:50:05 +0530
Subject: [PATCH v2 2/2] Fix compiling with C23 enabled compilers
In-Reply-To: <20241213041421.2153806-2-michaelneuling@tenstorrent.com>
References: <20241213041421.2153806-1-michaelneuling@tenstorrent.com> <20241213041421.2153806-2-michaelneuling@tenstorrent.com>
Message-ID: <CAAhSdy0vWR7RaXVc_FHO=v8BBw43Z5Gb1jkWT1tqrbMwsMFhPA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 13, 2024 at 9:44?AM Michael Neuling
<michaelneuling@tenstorrent.com> wrote:

The subject prefix should be "include: sbi:"

>
> C23 pre-definies bool so we need to gate our defines.

s/definies/defines/

>
> Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>
> ---
>  include/sbi/sbi_types.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
> index a9943d299c..f051695ffd 100644
> --- a/include/sbi/sbi_types.h
> +++ b/include/sbi/sbi_types.h
> @@ -44,7 +44,12 @@ typedef unsigned long long   uint64_t;
>  #error "Unexpected __riscv_xlen"
>  #endif
>
> +#if __STDC_VERSION__ < 202311L

I was able to reproduce the compilation issue with GCC and "-std=gnu2x"
option but I had to adjust the above #if comparison with 202000L.

>  typedef int                    bool;

I agree with Jessica. We should use _Bool to be consistent
across C standards.

> +#define true                   1
> +#define false                  0
> +#endif
> +
>  typedef unsigned long          ulong;
>  typedef unsigned long          uintptr_t;
>  typedef unsigned long          size_t;
> @@ -61,9 +66,6 @@ typedef uint32_t              be32_t;
>  typedef uint64_t               le64_t;
>  typedef uint64_t               be64_t;
>
> -#define true                   1
> -#define false                  0
> -
>  #define NULL                   ((void *)0)
>
>  #define __packed               __attribute__((packed))
> --
> 2.34.1
>

I have taken care of the above comments and tested it with
both GCC and LLVM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

