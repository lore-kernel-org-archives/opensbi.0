From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 16:19:56 +0530
Subject: [PATCH v2 1/2] lib: sbi: Fix __atomic_op_bit_ord and comments
In-Reply-To: <20231115145929.488427-2-wxjstz@126.com>
References: <20231115145929.488427-1-wxjstz@126.com> <20231115145929.488427-2-wxjstz@126.com>
Message-ID: <CAAhSdy3igwFV7REMOWiZO84xkwuDH53ZUvjRVKTJ8_yPbqGqaw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 15, 2023 at 8:31?PM Xiang W <wxjstz@126.com> wrote:
>
> The original code returns the value of the word before modification.
> When modifying the upper 32 bits under RV64, the value returned via
> int return will have no meaning. Corrected to return the value of the
> bit. And modify the function description.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/riscv_atomic.h | 8 ++++----
>  lib/sbi/riscv_atomic.c     | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/sbi/riscv_atomic.h b/include/sbi/riscv_atomic.h
> index 3972e0b..c5aa05e 100644
> --- a/include/sbi/riscv_atomic.h
> +++ b/include/sbi/riscv_atomic.h
> @@ -39,14 +39,14 @@ unsigned int atomic_raw_xchg_uint(volatile unsigned int *ptr,
>  unsigned long atomic_raw_xchg_ulong(volatile unsigned long *ptr,
>                                     unsigned long newval);
>  /**
> - * Set a bit in an atomic variable and return the new value.
> + * Set a bit in an atomic variable and return the value of bit before modify.
>   * @nr : Bit to set.
>   * @atom: atomic variable to modify
>   */
>  int atomic_set_bit(int nr, atomic_t *atom);
>
>  /**
> - * Clear a bit in an atomic variable and return the new value.
> + * Clear a bit in an atomic variable and return the value of bit before modify.
>   * @nr : Bit to set.
>   * @atom: atomic variable to modify
>   */
> @@ -54,14 +54,14 @@ int atomic_set_bit(int nr, atomic_t *atom);
>  int atomic_clear_bit(int nr, atomic_t *atom);
>
>  /**
> - * Set a bit in any address and return the new value .
> + * Set a bit in any address and return the value of bit before modify.
>   * @nr : Bit to set.
>   * @addr: Address to modify
>   */
>  int atomic_raw_set_bit(int nr, volatile unsigned long *addr);
>
>  /**
> - * Clear a bit in any address and return the new value .
> + * Clear a bit in any address and return the value of bit before modify.
>   * @nr : Bit to set.
>   * @addr: Address to modify
>   */
> diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
> index 528686f..477f709 100644
> --- a/lib/sbi/riscv_atomic.c
> +++ b/lib/sbi/riscv_atomic.c
> @@ -222,7 +222,7 @@ unsigned long atomic_raw_xchg_ulong(volatile unsigned long *ptr,
>                                      : "=r"(__res), "+A"(addr[BIT_WORD(nr)]) \
>                                      : "r"(mod(__mask))                      \
>                                      : "memory");                            \
> -               __res;                                                       \
> +               __res & mask ? 1 : 0;                                        \
>         })
>
>  #define __atomic_op_bit(op, mod, nr, addr) \
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

