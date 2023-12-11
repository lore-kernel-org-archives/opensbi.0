From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Dec 2023 09:36:03 +0530
Subject: [PATCH v2] platform: recalculate heap size to support new tlb
 entry number
In-Reply-To: <PH7PR20MB4962077CAA56A1196CB2242DBB88A@PH7PR20MB4962.namprd20.prod.outlook.com>
References: <PH7PR20MB4962077CAA56A1196CB2242DBB88A@PH7PR20MB4962.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy2AWF+qGX52LGn-E-TYkMeZeOiX042j_W0gY690RvphuA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 10, 2023 at 3:14?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Previous patch introduced a change that using hart count as the default
> number of tlb entries in the fifo. This makes the default tlb fifo size
> grow in square with the number of harts. So the default heap size is
> not enough to allocate tlb fifo when the hart count is big.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Fixes: 52fd64b ("platform: Uses hart count as the default size of tlb info")

The "Fixes:" line should be before SoB and Rb lines. I will take care
of it at the time of merging this patch.

> ---
>  include/sbi/sbi_bitops.h    |  1 +
>  include/sbi/sbi_heap.h      |  3 +++
>  lib/sbi/sbi_heap.c          |  2 --
>  platform/generic/platform.c | 16 +++++++++++++++-
>  4 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/include/sbi/sbi_bitops.h b/include/sbi/sbi_bitops.h
> index 48a2090..7d90334 100644
> --- a/include/sbi/sbi_bitops.h
> +++ b/include/sbi/sbi_bitops.h
> @@ -26,6 +26,7 @@
>  #define BIT_MASK(nr)           (1UL << ((nr) % BITS_PER_LONG))
>  #define BIT_WORD(bit)          ((bit) / BITS_PER_LONG)
>  #define BIT_WORD_OFFSET(bit)   ((bit) & (BITS_PER_LONG - 1))
> +#define BIT_ALIGN(bit, align)  (((bit) + ((align) - 1)) & ~((align) - 1))
>
>  #define GENMASK(h, l) \
>         (((~0UL) - (1UL << (l)) + 1) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
> diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
> index 88d176e..16755ec 100644
> --- a/include/sbi/sbi_heap.h
> +++ b/include/sbi/sbi_heap.h
> @@ -12,6 +12,9 @@
>
>  #include <sbi/sbi_types.h>
>
> +/* Alignment of heap base address and size */
> +#define HEAP_BASE_ALIGN                        1024
> +
>  struct sbi_scratch;
>
>  /** Allocate from heap area */
> diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
> index 698c377..bcd404b 100644
> --- a/lib/sbi/sbi_heap.c
> +++ b/lib/sbi/sbi_heap.c
> @@ -14,8 +14,6 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
>
> -/* Alignment of heap base address and size */
> -#define HEAP_BASE_ALIGN                        1024
>  /* Minimum size and alignment of heap allocations */
>  #define HEAP_ALLOC_ALIGN               64
>  #define HEAP_HOUSEKEEPING_FACTOR       16
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 4246efd..44f3844 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -10,7 +10,9 @@
>  #include <libfdt.h>
>  #include <platform_override.h>
>  #include <sbi/riscv_asm.h>
> +#include <sbi/sbi_bitops.h>
>  #include <sbi/sbi_hartmask.h>
> +#include <sbi/sbi_heap.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_string.h>
>  #include <sbi/sbi_system.h>
> @@ -54,6 +56,18 @@ static void fw_platform_lookup_special(void *fdt, int root_offset)
>         }
>  }
>
> +static u32 fw_platform_calculate_heap_size(u32 hart_count)
> +{
> +       u32 heap_size;
> +
> +       heap_size = SBI_PLATFORM_DEFAULT_HEAP_SIZE(hart_count);
> +
> +       // For TLB fifo

We only use "/* */" style comments. I have taken care of it
at the time of merging this patch.

> +       heap_size += 0x40 * (hart_count) * (hart_count);
> +
> +       return BIT_ALIGN(heap_size, HEAP_BASE_ALIGN);
> +}
> +
>  extern struct sbi_platform platform;
>  static bool platform_has_mlevel_imsic = false;
>  static u32 generic_hart_index2id[SBI_HARTMASK_MAX_BITS] = { 0 };
> @@ -115,7 +129,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
>         }
>
>         platform.hart_count = hart_count;
> -       platform.heap_size = SBI_PLATFORM_DEFAULT_HEAP_SIZE(hart_count);
> +       platform.heap_size = fw_platform_calculate_heap_size(hart_count);
>         platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
>
>         /* Return original FDT pointer */
> --
> 2.43.0
>

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

