From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 16:23:20 +0530
Subject: [PATCH v2 2/2] lib: sbi: Replace __atomic_op_bit_ord with
 __atomic intrinsics
In-Reply-To: <20231115145929.488427-3-wxjstz@126.com>
References: <20231115145929.488427-1-wxjstz@126.com> <20231115145929.488427-3-wxjstz@126.com>
Message-ID: <CAAhSdy2qrQDha_dT1184LcFaiuhYe6QS4Uhcn7ot++NKkiHxig@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 15, 2023 at 8:30?PM Xiang W <wxjstz@126.com> wrote:
>
> Simplify atomic-related bit operations through __atomic intrinsics.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/riscv_atomic.c | 40 ++++++++++++----------------------------
>  1 file changed, 12 insertions(+), 28 deletions(-)
>
> diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
> index 477f709..1c852a1 100644
> --- a/lib/sbi/riscv_atomic.c
> +++ b/lib/sbi/riscv_atomic.c
> @@ -206,40 +206,24 @@ unsigned long atomic_raw_xchg_ulong(volatile unsigned long *ptr,
>  #endif
>  }
>
> -#if (__SIZEOF_POINTER__ == 8)
> -#define __AMO(op) "amo" #op ".d"
> -#elif (__SIZEOF_POINTER__ == 4)
> -#define __AMO(op) "amo" #op ".w"
> -#else
> -#error "Unexpected __SIZEOF_POINTER__"
> -#endif
> -
> -#define __atomic_op_bit_ord(op, mod, nr, addr, ord)                          \
> -       ({                                                                   \
> -               unsigned long __res, __mask;                                 \
> -               __mask = BIT_MASK(nr);                                       \
> -               __asm__ __volatile__(__AMO(op) #ord " %0, %2, %1"            \
> -                                    : "=r"(__res), "+A"(addr[BIT_WORD(nr)]) \
> -                                    : "r"(mod(__mask))                      \
> -                                    : "memory");                            \
> -               __res & mask ? 1 : 0;                                        \
> -       })
> -
> -#define __atomic_op_bit(op, mod, nr, addr) \
> -       __atomic_op_bit_ord(op, mod, nr, addr, .aqrl)
> -
> -/* Bitmask modifiers */
> -#define __NOP(x) (x)
> -#define __NOT(x) (~(x))
> -
>  inline int atomic_raw_set_bit(int nr, volatile unsigned long *addr)
>  {
> -       return __atomic_op_bit(or, __NOP, nr, addr);
> +       volatile unsigned long *ptr;
> +       unsigned long res, mask;
> +       mask = BIT_MASK(nr);
> +       ptr = &addr[BIT_WORD(nr)];
> +       res = __atomic_fetch_or(ptr, mask, __ATOMIC_ACQ_REL);
> +       return res & mask ? 1 : 0;
>  }
>
>  inline int atomic_raw_clear_bit(int nr, volatile unsigned long *addr)
>  {
> -       return __atomic_op_bit(and, __NOT, nr, addr);
> +       volatile unsigned long *ptr;
> +       unsigned long res, mask;
> +       mask = BIT_MASK(nr);
> +       ptr = &addr[BIT_WORD(nr)];
> +       res = __atomic_fetch_and(ptr, ~mask, __ATOMIC_ACQ_REL);
> +       return res & mask ? 1 : 0;
>  }
>
>  inline int atomic_set_bit(int nr, atomic_t *atom)
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

