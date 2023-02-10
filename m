From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Feb 2023 12:41:45 +0530
Subject: [PATCH] include: sbi: Fix BSWAPx() macros for big-endian host
In-Reply-To: <20230209040251.451328-1-apatel@ventanamicro.com>
References: <20230209040251.451328-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy0z0qEz9BwapO+GYdj5Q5u4iShaA1eyhkR_gfjVUoB3sA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 9, 2023 at 9:33 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The BSWAPx() macros won't do any swapping for big-endian host
> because the EXTRACT_BYTE() macro will pickup bytes in reverse
> order. Also, the EXTRACT_BYTE() will generate compile error
> for constants.
>
> To fix this, we get remove the EXTRACT_BYTE() macro and re-write
> BSWAPx() using simple mask and shift operations.
>
> Fixes: 09b34d8cca51 ("include: Add support for byteorder/endianness
> conversion")
> Reported-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> ---
>  include/sbi/sbi_byteorder.h | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/include/sbi/sbi_byteorder.h b/include/sbi/sbi_byteorder.h
> index 680710f..15107e1 100644
> --- a/include/sbi/sbi_byteorder.h
> +++ b/include/sbi/sbi_byteorder.h
> @@ -9,16 +9,20 @@
>
>  #include <sbi/sbi_types.h>
>
> -#define EXTRACT_BYTE(x, n)     ((unsigned long long)((uint8_t *)&x)[n])
> -
> -#define BSWAP16(x)     ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
> -#define BSWAP32(x)     ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
> -                        (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
> -#define BSWAP64(x)     ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
> -                        (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
> -                        (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
> -                        (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
> -
> +#define BSWAP16(x)     ((((x) & 0x00ff) << 8) | \
> +                        (((x) & 0xff00) >> 8))
> +#define BSWAP32(x)     ((((x) & 0x000000ff) << 24) | \
> +                        (((x) & 0x0000ff00) << 8) | \
> +                        (((x) & 0x00ff0000) >> 8) | \
> +                        (((x) & 0xff000000) >> 24))
> +#define BSWAP64(x)     ((((x) & 0x00000000000000ffULL) << 56) | \
> +                        (((x) & 0x000000000000ff00ULL) << 40) | \
> +                        (((x) & 0x0000000000ff0000ULL) << 24) | \
> +                        (((x) & 0x00000000ff000000ULL) << 8) | \
> +                        (((x) & 0x000000ff00000000ULL) >> 8) | \
> +                        (((x) & 0x0000ff0000000000ULL) >> 24) | \
> +                        (((x) & 0x00ff000000000000ULL) >> 40) | \
> +                        (((x) & 0xff00000000000000ULL) >> 56))
>
>  #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__  /* CPU(little-endian) */
>  #define cpu_to_be16(x)         ((uint16_t)BSWAP16(x))
> --
> 2.34.1
>

