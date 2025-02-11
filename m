From: Anup Patel <anup@brainfault.org>
Date: Tue, 11 Feb 2025 16:24:56 +0530
Subject: [RFC 4/7] opensbi: make io little-endian for big endian build
In-Reply-To: <20241220160206.1989527-5-ben.dooks@codethink.co.uk>
References: <20241220160206.1989527-1-ben.dooks@codethink.co.uk> <20241220160206.1989527-5-ben.dooks@codethink.co.uk>
Message-ID: <CAAhSdy26VKPZxk1fMTcYXrrSy9KwsA64pD2oROVwm-cSaSUD4Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 20, 2024 at 9:32?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Generally IO is little endian, if we're running in big-endian
> mode then swap the byte ordering in the IO accessors.
>
> Reviewed-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Reviewed-by: Roan Richmod <roan.richmond@codethink.co.uk>
> Signed-off-by: Ben Dooks <ben.doosk@codethink.co.uk>
> ---
>  include/sbi/riscv_io.h | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/include/sbi/riscv_io.h b/include/sbi/riscv_io.h
> index 4913232..a8fa579 100644
> --- a/include/sbi/riscv_io.h
> +++ b/include/sbi/riscv_io.h
> @@ -12,6 +12,7 @@
>
>  #include <sbi/riscv_barrier.h>
>  #include <sbi/sbi_types.h>
> +#include <sbi/sbi_byteorder.h>
>
>  static inline void __raw_writeb(u8 val, volatile void *addr)
>  {
> @@ -73,22 +74,32 @@ static inline u64 __raw_readq(const volatile void *addr)
>
>  /* clang-format off */
>
> +#ifdef CONFIG_OPENSBI_BE
> +#define io_conv16(__x) cpu_to_le16(__x)
> +#define io_conv32(__x) cpu_to_le32(__x)
> +#define io_conv64(__x) cpu_to_le64(__x)
> +#else
> +#define io_conv16(__x) (__x)
> +#define io_conv32(__x) (__x)
> +#define io_conv64(__x) (__x)
> +#endif

No need for these io_convXY() macros. You can directly
use cpu_to_leXY() macros because these macros won't
change byte ordering on a LE system.

> +
>  #define __io_rbr()             do {} while (0)
>  #define __io_rar()             do {} while (0)
>  #define __io_rbw()             do {} while (0)
>  #define __io_raw()             do {} while (0)
>
>  #define readb_relaxed(c)       ({ u8  __v; __io_rbr(); __v = __raw_readb(c); __io_rar(); __v; })
> -#define readw_relaxed(c)       ({ u16 __v; __io_rbr(); __v = __raw_readw(c); __io_rar(); __v; })
> -#define readl_relaxed(c)       ({ u32 __v; __io_rbr(); __v = __raw_readl(c); __io_rar(); __v; })
> +#define readw_relaxed(c)       ({ u16 __v; __io_rbr(); __v = __raw_readw(c); __io_rar(); io_conv16(__v); })
> +#define readl_relaxed(c)       ({ u32 __v; __io_rbr(); __v = __raw_readl(c); __io_rar(); io_conv32(__v); })
>
>  #define writeb_relaxed(v,c)    ({ __io_rbw(); __raw_writeb((v),(c)); __io_raw(); })
> -#define writew_relaxed(v,c)    ({ __io_rbw(); __raw_writew((v),(c)); __io_raw(); })
> -#define writel_relaxed(v,c)    ({ __io_rbw(); __raw_writel((v),(c)); __io_raw(); })
> +#define writew_relaxed(v,c)    ({ __io_rbw(); __raw_writew(io_conv16(v),(c)); __io_raw(); })
> +#define writel_relaxed(v,c)    ({ __io_rbw(); __raw_writel(io_conv32(v),(c)); __io_raw(); })
>
>  #if __riscv_xlen != 32
> -#define readq_relaxed(c)       ({ u64 __v; __io_rbr(); __v = __raw_readq(c); __io_rar(); __v; })
> -#define writeq_relaxed(v,c)    ({ __io_rbw(); __raw_writeq((v),(c)); __io_raw(); })
> +#define readq_relaxed(c)       ({ u64 __v; __io_rbr(); __v = __raw_readq(c); __io_rar(); io_conv64(__v); })
> +#define writeq_relaxed(v,c)    ({ __io_rbw(); __raw_writeq(io_conv64(v),(c)); __io_raw(); })
>  #endif
>
>  #define __io_br()      do {} while (0)
> @@ -97,12 +108,12 @@ static inline u64 __raw_readq(const volatile void *addr)
>  #define __io_aw()      do {} while (0)
>
>  #define readb(c)       ({ u8  __v; __io_br(); __v = __raw_readb(c); __io_ar(); __v; })
> -#define readw(c)       ({ u16 __v; __io_br(); __v = __raw_readw(c); __io_ar(); __v; })
> -#define readl(c)       ({ u32 __v; __io_br(); __v = __raw_readl(c); __io_ar(); __v; })
> +#define readw(c)       ({ u16 __v; __io_br(); __v = __raw_readw(c); __io_ar(); io_conv16(__v); })
> +#define readl(c)       ({ u32 __v; __io_br(); __v = __raw_readl(c); __io_ar(); io_conv32(__v); })
>
>  #define writeb(v,c)    ({ __io_bw(); __raw_writeb((v),(c)); __io_aw(); })
> -#define writew(v,c)    ({ __io_bw(); __raw_writew((v),(c)); __io_aw(); })
> -#define writel(v,c)    ({ __io_bw(); __raw_writel((v),(c)); __io_aw(); })
> +#define writew(v,c)    ({ __io_bw(); __raw_writew(io_conv16(v),(c)); __io_aw(); })
> +#define writel(v,c)    ({ __io_bw(); __raw_writel(io_conv32(v),(c)); __io_aw(); })
>
>  #if __riscv_xlen != 32
>  #define readq(c)       ({ u64 __v; __io_br(); __v = __raw_readq(c); __io_ar(); __v; })
> --
> 2.37.2.352.g3c44437643
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

