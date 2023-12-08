From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Dec 2023 16:29:15 +0530
Subject: [PATCH] lib: sbi: Remove xchg/cmpxchg implemented via lr/sc
In-Reply-To: <20231108032859.159198-1-wxjstz@126.com>
References: <20231108032859.159198-1-wxjstz@126.com>
Message-ID: <CAAhSdy2GuepAZqYmj7_fL56a3V3Niqn8eLAqsDzKk310k3X6xQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 8, 2023 at 9:00?AM Xiang W <wxjstz@126.com> wrote:
>
> lr/sc is part of the A extension. If the A extension is not supported,
> lr/sc cannot be used. So remove xchg/cmpxchg.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/riscv_atomic.c | 106 ++---------------------------------------
>  1 file changed, 4 insertions(+), 102 deletions(-)
>
> diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
> index 528686f..a143218 100644
> --- a/lib/sbi/riscv_atomic.c
> +++ b/lib/sbi/riscv_atomic.c
> @@ -12,6 +12,10 @@
>  #include <sbi/riscv_atomic.h>
>  #include <sbi/riscv_barrier.h>
>
> +#ifndef __riscv_atomic
> +#error "opensbi strongly relies on the A extension of RISC-V"
> +#endif
> +
>  long atomic_read(atomic_t *atom)
>  {
>         long ret = atom->counter;
> @@ -79,131 +83,29 @@ long atomic_sub_return(atomic_t *atom, long value)
>                 (__typeof__(*(ptr))) __axchg((ptr), _x_, sizeof(*(ptr)));       \
>         })
>
> -
> -#define __xchg(ptr, new, size)                                            \
> -       ({                                                                \
> -               __typeof__(ptr) __ptr    = (ptr);                         \
> -               __typeof__(*(ptr)) __new = (new);                         \
> -               __typeof__(*(ptr)) __ret;                                 \
> -               register unsigned int __rc;                               \
> -               switch (size) {                                           \
> -               case 4:                                                   \
> -                       __asm__ __volatile__("0:        lr.w %0, %2\n"    \
> -                                            "  sc.w.rl %1, %z3, %2\n"    \
> -                                            "  bnez %1, 0b\n"            \
> -                                            "  fence rw, rw\n"           \
> -                                            : "=&r"(__ret), "=&r"(__rc), \
> -                                              "+A"(*__ptr)               \
> -                                            : "rJ"(__new)                \
> -                                            : "memory");                 \
> -                       break;                                            \
> -               case 8:                                                   \
> -                       __asm__ __volatile__("0:        lr.d %0, %2\n"    \
> -                                            "  sc.d.rl %1, %z3, %2\n"    \
> -                                            "  bnez %1, 0b\n"            \
> -                                            "  fence rw, rw\n"           \
> -                                            : "=&r"(__ret), "=&r"(__rc), \
> -                                              "+A"(*__ptr)               \
> -                                            : "rJ"(__new)                \
> -                                            : "memory");                 \
> -                       break;                                            \
> -               default:                                                  \
> -                       break;                                            \
> -               }                                                         \
> -               __ret;                                                    \
> -       })
> -
> -#define xchg(ptr, n)                                                     \
> -       ({                                                               \
> -               __typeof__(*(ptr)) _n_ = (n);                            \
> -               (__typeof__(*(ptr))) __xchg((ptr), _n_, sizeof(*(ptr))); \
> -       })
> -
> -#define __cmpxchg(ptr, old, new, size)                                    \
> -       ({                                                                \
> -               __typeof__(ptr) __ptr    = (ptr);                         \
> -               __typeof__(*(ptr)) __old = (old);                         \
> -               __typeof__(*(ptr)) __new = (new);                         \
> -               __typeof__(*(ptr)) __ret;                                 \
> -               register unsigned int __rc;                               \
> -               switch (size) {                                           \
> -               case 4:                                                   \
> -                       __asm__ __volatile__("0:        lr.w %0, %2\n"    \
> -                                            "  bne  %0, %z3, 1f\n"       \
> -                                            "  sc.w.rl %1, %z4, %2\n"    \
> -                                            "  bnez %1, 0b\n"            \
> -                                            "  fence rw, rw\n"           \
> -                                            "1:\n"                       \
> -                                            : "=&r"(__ret), "=&r"(__rc), \
> -                                              "+A"(*__ptr)               \
> -                                            : "rJ"(__old), "rJ"(__new)   \
> -                                            : "memory");                 \
> -                       break;                                            \
> -               case 8:                                                   \
> -                       __asm__ __volatile__("0:        lr.d %0, %2\n"    \
> -                                            "  bne %0, %z3, 1f\n"        \
> -                                            "  sc.d.rl %1, %z4, %2\n"    \
> -                                            "  bnez %1, 0b\n"            \
> -                                            "  fence rw, rw\n"           \
> -                                            "1:\n"                       \
> -                                            : "=&r"(__ret), "=&r"(__rc), \
> -                                              "+A"(*__ptr)               \
> -                                            : "rJ"(__old), "rJ"(__new)   \
> -                                            : "memory");                 \
> -                       break;                                            \
> -               default:                                                  \
> -                       break;                                            \
> -               }                                                         \
> -               __ret;                                                    \
> -       })
> -
> -#define cmpxchg(ptr, o, n)                                          \
> -       ({                                                          \
> -               __typeof__(*(ptr)) _o_ = (o);                       \
> -               __typeof__(*(ptr)) _n_ = (n);                       \
> -               (__typeof__(*(ptr)))                                \
> -                       __cmpxchg((ptr), _o_, _n_, sizeof(*(ptr))); \
> -       })
> -
>  long atomic_cmpxchg(atomic_t *atom, long oldval, long newval)
>  {
> -#ifdef __riscv_atomic
>         return __sync_val_compare_and_swap(&atom->counter, oldval, newval);
> -#else
> -       return cmpxchg(&atom->counter, oldval, newval);
> -#endif
>  }
>
>  long atomic_xchg(atomic_t *atom, long newval)
>  {
>         /* Atomically set new value and return old value. */
> -#ifdef __riscv_atomic
>         return axchg(&atom->counter, newval);
> -#else
> -       return xchg(&atom->counter, newval);
> -#endif
>  }
>
>  unsigned int atomic_raw_xchg_uint(volatile unsigned int *ptr,
>                                   unsigned int newval)
>  {
>         /* Atomically set new value and return old value. */
> -#ifdef __riscv_atomic
>         return axchg(ptr, newval);
> -#else
> -       return xchg(ptr, newval);
> -#endif
>  }
>
>  unsigned long atomic_raw_xchg_ulong(volatile unsigned long *ptr,
>                                     unsigned long newval)
>  {
>         /* Atomically set new value and return old value. */
> -#ifdef __riscv_atomic
>         return axchg(ptr, newval);
> -#else
> -       return xchg(ptr, newval);
> -#endif
>  }
>
>  #if (__SIZEOF_POINTER__ == 8)
> --
> 2.42.0
>

