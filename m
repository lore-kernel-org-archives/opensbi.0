From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Feb 2023 18:23:31 +0530
Subject: [PATCH v2 2/3] lib: utils/fdt: Use byteorder conversion functions
 in libfdt_env.h
In-Reply-To: <20230202044427.1253816-3-rpathak@ventanamicro.com>
References: <20230202044427.1253816-1-rpathak@ventanamicro.com> <20230202044427.1253816-3-rpathak@ventanamicro.com>
Message-ID: <CAAhSdy3jPCOjWMSb6mctWn37HCCiTR28=Qgvw723yw7LDTeiFg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 2, 2023 at 10:15 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> FDT follows big-endian and CPU can be little or big
> endian as per the implementation.
> libfdt_env.h defines function for conversion between
> fdt and cpu byteorder according to the endianness.
>
> Currently, libfdt_env.h defines custom byte swapping
> macros and then undefines them. Instead, use the generic
> endianness conversion functions
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Reviewed-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/libfdt/libfdt_env.h | 29 ++++++++++-------------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
>
> diff --git a/lib/utils/libfdt/libfdt_env.h b/lib/utils/libfdt/libfdt_env.h
> index f9d9c6783c52..e5ad7698efca 100644
> --- a/lib/utils/libfdt/libfdt_env.h
> +++ b/lib/utils/libfdt/libfdt_env.h
> @@ -9,6 +9,7 @@
>
>  #include <sbi/sbi_string.h>
>  #include <sbi/sbi_types.h>
> +#include <sbi/sbi_byteorder.h>
>
>  #define INT_MAX                ((int)(~0U >> 1))
>  #define UINT_MAX       ((unsigned int)~0U)
> @@ -41,45 +42,35 @@ typedef uint16_t FDT_BITWISE fdt16_t;
>  typedef uint32_t FDT_BITWISE fdt32_t;
>  typedef uint64_t FDT_BITWISE fdt64_t;
>
> -#define EXTRACT_BYTE(x, n)     ((unsigned long long)((uint8_t *)&x)[n])
> -#define CPU_TO_FDT16(x) ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
> -#define CPU_TO_FDT32(x) ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
> -                        (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
> -#define CPU_TO_FDT64(x) ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
> -                        (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
> -                        (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
> -                        (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
> -
>  static inline uint16_t fdt16_to_cpu(fdt16_t x)
>  {
> -       return (FDT_FORCE uint16_t)CPU_TO_FDT16(x);
> +       return (FDT_FORCE uint16_t)be16_to_cpu(x);
>  }
> +
>  static inline fdt16_t cpu_to_fdt16(uint16_t x)
>  {
> -       return (FDT_FORCE fdt16_t)CPU_TO_FDT16(x);
> +       return (FDT_FORCE fdt16_t)cpu_to_be16(x);
>  }
>
>  static inline uint32_t fdt32_to_cpu(fdt32_t x)
>  {
> -       return (FDT_FORCE uint32_t)CPU_TO_FDT32(x);
> +       return (FDT_FORCE uint32_t)be32_to_cpu(x);
>  }
> +
>  static inline fdt32_t cpu_to_fdt32(uint32_t x)
>  {
> -       return (FDT_FORCE fdt32_t)CPU_TO_FDT32(x);
> +       return (FDT_FORCE fdt32_t)cpu_to_be32(x);
>  }
>
>  static inline uint64_t fdt64_to_cpu(fdt64_t x)
>  {
> -       return (FDT_FORCE uint64_t)CPU_TO_FDT64(x);
> +       return (FDT_FORCE uint64_t)be64_to_cpu(x);
>  }
> +
>  static inline fdt64_t cpu_to_fdt64(uint64_t x)
>  {
> -       return (FDT_FORCE fdt64_t)CPU_TO_FDT64(x);
> +       return (FDT_FORCE fdt64_t)cpu_to_be64(x);
>  }
> -#undef CPU_TO_FDT64
> -#undef CPU_TO_FDT32
> -#undef CPU_TO_FDT16
> -#undef EXTRACT_BYTE
>
>  #ifdef __APPLE__
>  #include <AvailabilityMacros.h>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

