From: Zong Li <zong.li@sifive.com>
Date: Mon, 23 Sep 2024 11:38:25 +0800
Subject: [PATCH] include: sbi_bitops: add ULL version for BIT and GENMASK
In-Reply-To: <20240830031610.32730-1-zong.li@sifive.com>
References: <20240830031610.32730-1-zong.li@sifive.com>
Message-ID: <CANXhq0qdacTzdoC+yShb3s575ajOrQJJKmDLrGzwejQfG2LxTw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 11:16?AM Zong Li <zong.li@sifive.com> wrote:
>
> Add BIT_ULL and GENMASK_ULL for dealing with 64-bits data on
> 32-bits CPU, then we don't need to separate the operation to
> low part and high part. For instance, the MMIO register is
> 64 bits wide.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  include/sbi/sbi_bitops.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/sbi/sbi_bitops.h b/include/sbi/sbi_bitops.h
> index 7d90334..3ddac77 100644
> --- a/include/sbi/sbi_bitops.h
> +++ b/include/sbi/sbi_bitops.h
> @@ -14,6 +14,8 @@
>
>  #define BITS_PER_LONG          (8 * __SIZEOF_LONG__)
>
> +#define BITS_PER_LONG_LONG     64
> +
>  #define EXTRACT_FIELD(val, which) \
>         (((val) & (which)) / ((which) & ~((which)-1)))
>  #define INSERT_FIELD(val, which, fieldval) \
> @@ -28,9 +30,13 @@
>  #define BIT_WORD_OFFSET(bit)   ((bit) & (BITS_PER_LONG - 1))
>  #define BIT_ALIGN(bit, align)  (((bit) + ((align) - 1)) & ~((align) - 1))
>
> +#define BIT_ULL(nr)            (1ULL << (nr))
> +
>  #define GENMASK(h, l) \
>         (((~0UL) - (1UL << (l)) + 1) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
>
> +#define GENMASK_ULL(h, l) \
> +       (((~0ULL) - (1ULL << (l)) + 1) & (~0ULL >> (BITS_PER_LONG_LONG - 1 - (h))))
>  /**
>   * sbi_ffs - find first (less-significant) set bit in a long word.
>   * @word: The word to search
> --
> 2.17.1
>

Hi Anup,
Could I know if this patch is good for you? Thanks

