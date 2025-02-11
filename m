From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 11 Feb 2025 10:15:16 +0530
Subject: [PATCH v3] New configuration CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT
In-Reply-To: <20250127202017.1043240-1-Raj.Vishwanathan@gmail.com>
References: <20250115234607.410148-1-Raj.Vishwanathan@gmail.com> <20250127202017.1043240-1-Raj.Vishwanathan@gmail.com>
Message-ID: <CAK9=C2XT1HGr+wih9YJ=vgXnxrgPrFH1JKHpS=wp4miOAnPo+A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 28, 2025 at 1:50?AM Raj Vishwanathan
<raj.vishwanathan@gmail.com> wrote:
>
> We add a new configuration CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT as an int
> If it is set to 0 or not defined, we will continue with the previous
> defintion of allocating pointer size chunks. Otherwise we will use the
> user specified size.
> We use the scratch allocation alignment to 64 bytes or cacheline size,
> to avoid two atomic variables from the same cache line causing livelock
> on some platforms.
>
> Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
> ---
>
> Changes in V2:
>         Remove platform specific references to 64 bytes in the configuration
>
> Changes in V3:
>         Remove platform specific references in 64 bytes in the comments
> ---
>  lib/sbi/Kconfig       |  7 +++++++
>  lib/sbi/sbi_scratch.c | 14 ++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> index c6cc04b..5f7eb70 100644
> --- a/lib/sbi/Kconfig
> +++ b/lib/sbi/Kconfig
> @@ -69,4 +69,11 @@ config SBI_ECALL_SSE
>  config SBI_ECALL_MPXY
>         bool "MPXY extension"
>         default y
> +config SBI_SCRATCH_ALLOC_ALIGNMENT
> +       int  "Scratch allocation alignment"
> +       default 0
> +       help
> +         We provide the option to customize the alignment to allocate from
> +         the extra space in sbi_scratch. Leave it 0 for default behaviour.
> +

Introducing a kconfig option is not going to fly since we have to
re-compile separately for platforms while we are trying our best
to support the same firmware binary for multiple platforms.

Instead, I suggest the following:
1) The default scratch allocation alignment can be __SIZEOF_POINTER__
2) Introduce get_cache_line_size() operation in "struct sbi_platform_operations"
    which platforms can use to return desired "cache line size for allocations".
3) For generic platform, the get_cache_line_size() return value can be based
    on the "riscv,cbom-block-size" property of CPU DT nodes OR based on
    platform_overrride.
4) The sbi_scratch_init() should sanity check the value returned by platform
     get_cache_line_size() before using it as minimum allocation size for
     scratch allocations.

Regards,
Anup


>  endmenu
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> index ccbbc68..0f1be58 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -14,6 +14,16 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
>
> +/*
> + * We do the scratch allocation on the basis of a user configuration.
> + */
> +#if !defined(CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT) || (CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT==0)
> +#define SCRATCH_ALLOC_ALIGNMENT __SIZEOF_POINTER__
> +#else
> +#define SCRATCH_ALLOC_ALIGNMENT CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT
> +#endif
> +
> +
>  u32 last_hartindex_having_scratch = 0;
>  u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
>  struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
> @@ -70,8 +80,8 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
>         if (!size)
>                 return 0;
>
> -       size += __SIZEOF_POINTER__ - 1;
> -       size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
> +       size += SCRATCH_ALLOC_ALIGNMENT- 1;
> +       size &= ~((unsigned long)SCRATCH_ALLOC_ALIGNMENT - 1);
>
>         spin_lock(&extra_lock);
>
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

