From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 4 Dec 2024 05:59:37 +0000
Subject: [PATCH 2/2] include: Fix compiling bool with C23 enabled
 compilers
In-Reply-To: <20241204055452.652401-2-michaelneuling@tenstorrent.com>
References: <20241204055452.652401-1-michaelneuling@tenstorrent.com>
 <20241204055452.652401-2-michaelneuling@tenstorrent.com>
Message-ID: <B1E09387-2790-418A-847E-9A79D82FF9AD@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4 Dec 2024, at 05:54, Michael Neuling <michaelneuling@tenstorrent.com> wrote:
> 
> C23 pre-definies bool so we need to gate our defines.
> 
> Without this C23 enabled compiler gives this error:
> 
>   CC        lib/sbi/riscv_asm.o
>  In file included from /home/mneuling/src/opensbi/include/sbi/sbi_scratch.h:54,
>   from /home/mneuling/src/opensbi/include/sbi/sbi_platform.h:49,
>   from /home/mneuling/src/opensbi/lib/sbi/riscv_asm.c:13:
>  /home/mneuling/src/opensbi/include/sbi/sbi_types.h:47:33: error: two or more data types in declaration specifiers
>     47 | typedef int                     bool;
> |                                 ^~~~
>  /home/mneuling/src/opensbi/include/sbi/sbi_types.h:47:1: error: useless type name in empty declaration [-Werror]
>     47 | typedef int                     bool;
> | ^~~~~~~
>  cc1: all warnings being treated as errors
> 
> Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>
> ---
> include/sbi/sbi_types.h | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
> index def88bbad2..3f054f481a 100644
> --- a/include/sbi/sbi_types.h
> +++ b/include/sbi/sbi_types.h
> @@ -44,7 +44,12 @@ typedef unsigned long long uint64_t;
> #error "Unexpected __riscv_xlen"
> #endif
> 
> +#if __STDC_VERSION__ < 202311L
> typedef int bool;

Existing issue but this should be using _Bool. Otherwise it?s 4 bytes
(and doesn?t match the C23 1 byte definition).

Jess

> +#define true 1
> +#define false 0
> +#endif
> +
> typedef unsigned long ulong;
> typedef unsigned long uintptr_t;
> typedef unsigned long size_t;
> @@ -61,9 +66,6 @@ typedef uint32_t be32_t;
> typedef uint64_t le64_t;
> typedef uint64_t be64_t;
> 
> -#define true 1
> -#define false 0
> -
> #define NULL ((void *)0)
> 
> #define __packed __attribute__((packed))
> -- 
> 2.34.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


