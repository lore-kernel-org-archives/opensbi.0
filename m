From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Apr 2024 17:24:52 +0530
Subject: [RFC PATCH 1/2] include: sbi: Support byteorder macros in assembly
In-Reply-To: <TYYP286MB1439AAF2C6C6682003C64DE0C6282@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439244707DDDB3B2734D67AC6282@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB1439AAF2C6C6682003C64DE0C6282@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy1f4-j8bvQHxCZOuSbkPtFH7XuyVcfFGkmOvAUeEi=8mQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 15, 2024 at 11:07?PM Vivian Wang <dramforever@live.com> wrote:
>
> Avoid using C types and casts if sbi/sbi_byteorder.h is included in
> assembly code
>
> Signed-off-by: Vivian Wang <dramforever@live.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_byteorder.h | 55 ++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 25 deletions(-)
>
> diff --git a/include/sbi/sbi_byteorder.h b/include/sbi/sbi_byteorder.h
> index db6eb2b..2b4981e 100644
> --- a/include/sbi/sbi_byteorder.h
> +++ b/include/sbi/sbi_byteorder.h
> @@ -7,7 +7,12 @@
>  #ifndef __SBI_BYTEORDER_H__
>  #define __SBI_BYTEORDER_H__
>
> -#include <sbi/sbi_types.h>
> +#ifdef __ASSEMBLER__
> +# define _conv_cast(type, val) (val)
> +#else
> +# include <sbi/sbi_types.h>
> +# define _conv_cast(type, val) ((type)(val))
> +#endif
>
>  #define BSWAP16(x)     ((((x) & 0x00ff) << 8) | \
>                          (((x) & 0xff00) >> 8))
> @@ -25,37 +30,37 @@
>                          (((x) & 0xff00000000000000ULL) >> 56))
>
>  #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__  /* CPU(little-endian) */
> -#define cpu_to_be16(x)         ((uint16_t)BSWAP16(x))
> -#define cpu_to_be32(x)         ((uint32_t)BSWAP32(x))
> -#define cpu_to_be64(x)         ((uint64_t)BSWAP64(x))
> +#define cpu_to_be16(x)         _conv_cast(uint16_t, BSWAP16(x))
> +#define cpu_to_be32(x)         _conv_cast(uint32_t, BSWAP32(x))
> +#define cpu_to_be64(x)         _conv_cast(uint64_t, BSWAP64(x))
>
> -#define be16_to_cpu(x)         ((uint16_t)BSWAP16(x))
> -#define be32_to_cpu(x)         ((uint32_t)BSWAP32(x))
> -#define be64_to_cpu(x)         ((uint64_t)BSWAP64(x))
> +#define be16_to_cpu(x)         _conv_cast(uint16_t, BSWAP16(x))
> +#define be32_to_cpu(x)         _conv_cast(uint32_t, BSWAP32(x))
> +#define be64_to_cpu(x)         _conv_cast(uint64_t, BSWAP64(x))
>
> -#define cpu_to_le16(x)         ((uint16_t)(x))
> -#define cpu_to_le32(x)         ((uint32_t)(x))
> -#define cpu_to_le64(x)         ((uint64_t)(x))
> +#define cpu_to_le16(x)         _conv_cast(uint16_t, (x))
> +#define cpu_to_le32(x)         _conv_cast(uint32_t, (x))
> +#define cpu_to_le64(x)         _conv_cast(uint64_t, (x))
>
> -#define le16_to_cpu(x)         ((uint16_t)(x))
> -#define le32_to_cpu(x)         ((uint32_t)(x))
> -#define le64_to_cpu(x)         ((uint64_t)(x))
> +#define le16_to_cpu(x)         _conv_cast(uint16_t, (x))
> +#define le32_to_cpu(x)         _conv_cast(uint32_t, (x))
> +#define le64_to_cpu(x)         _conv_cast(uint64_t, (x))
>  #else /* CPU(big-endian) */
> -#define cpu_to_be16(x)         ((uint16_t)(x))
> -#define cpu_to_be32(x)         ((uint32_t)(x))
> -#define cpu_to_be64(x)         ((uint64_t)(x))
> +#define cpu_to_be16(x)         _conv_cast(uint16_t, (x))
> +#define cpu_to_be32(x)         _conv_cast(uint32_t, (x))
> +#define cpu_to_be64(x)         _conv_cast(uint64_t, (x))
>
> -#define be16_to_cpu(x)         ((uint16_t)(x))
> -#define be32_to_cpu(x)         ((uint32_t)(x))
> -#define be64_to_cpu(x)         ((uint64_t)(x))
> +#define be16_to_cpu(x)         _conv_cast(uint16_t, (x))
> +#define be32_to_cpu(x)         _conv_cast(uint32_t, (x))
> +#define be64_to_cpu(x)         _conv_cast(uint64_t, (x))
>
> -#define cpu_to_le16(x)         ((uint16_t)BSWAP16(x))
> -#define cpu_to_le32(x)         ((uint32_t)BSWAP32(x))
> -#define cpu_to_le64(x)         ((uint64_t)BSWAP64(x))
> +#define cpu_to_le16(x)         _conv_cast(uint16_t, BSWAP16(x))
> +#define cpu_to_le32(x)         _conv_cast(uint32_t, BSWAP32(x))
> +#define cpu_to_le64(x)         _conv_cast(uint64_t, BSWAP64(x))
>
> -#define le16_to_cpu(x)         ((uint16_t)BSWAP16(x))
> -#define le32_to_cpu(x)         ((uint32_t)BSWAP32(x))
> -#define le64_to_cpu(x)         ((uint64_t)BSWAP64(x))
> +#define le16_to_cpu(x)         _conv_cast(uint16_t, BSWAP16(x))
> +#define le32_to_cpu(x)         _conv_cast(uint32_t, BSWAP32(x))
> +#define le64_to_cpu(x)         _conv_cast(uint64_t, BSWAP64(x))
>  #endif
>
>  #if __riscv_xlen == 64
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

