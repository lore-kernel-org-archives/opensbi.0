From: Xiang W <wxjstz@126.com>
Date: Wed, 15 Nov 2023 22:23:54 +0800
Subject: [PATCH] lib: sbi: Improved atomic bit operations
In-Reply-To: <E77C3F09-3F8F-4196-AAC3-97ECE3B25124@jrtc27.com>
References: <20231115071622.465416-1-wxjstz@126.com>
	 <E77C3F09-3F8F-4196-AAC3-97ECE3B25124@jrtc27.com>
Message-ID: <13f41a66f1e6c220c772298613c65f9633723b8d.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-11-15???? 08:05 +0000?Jessica Clarke???
> On 15 Nov 2023, at 07:15, Xiang W <wxjstz@126.com> wrote:
> > 
> > The previous atomic operation returns the new value.
> 
> Looks to me like they returned the old value? That is, this patch:
The original code return value is old. The function description is
to return a new value. My description here is rather vague.
> 
> (a) Fixes the comments for the functions to document the actual
> semantics
> (b) Replaces the implementations with __atomic intrinsics to avoid the
> need for inline assembly
> 
> These should be separate commits, and the commit message should be
> correct. Unless I?m misunderstanding. Otherwise it sounds like you?re
> Changing the behaviour of existing functions...
Ok!

Regards,
Xiang W
> 
> Jess
> 
> > After setting and
> > clearing, the new value is determined. The value before modification
> > should be returned. The previous code actually returns the word before
> > modification, not the bit value. This patch improves these issues.
> > 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> > include/sbi/riscv_atomic.h |? 8 ++++----
> > lib/sbi/riscv_atomic.c???? | 36 ++++++++----------------------------
> > 2 files changed, 12 insertions(+), 32 deletions(-)
> > 
> > diff --git a/include/sbi/riscv_atomic.h b/include/sbi/riscv_atomic.h
> > index 3972e0b..31dc673 100644
> > --- a/include/sbi/riscv_atomic.h
> > +++ b/include/sbi/riscv_atomic.h
> > @@ -39,14 +39,14 @@ unsigned int atomic_raw_xchg_uint(volatile unsigned int *ptr,
> > unsigned long atomic_raw_xchg_ulong(volatile unsigned long *ptr,
> > ?? unsigned long newval);
> > /**
> > - * Set a bit in an atomic variable and return the new value.
> > + * Set a bit in an atomic variable and return the value of bit before modify.
> > ?* @nr : Bit to set.
> > ?* @atom: atomic variable to modify
> > ?*/
> > int atomic_set_bit(int nr, atomic_t *atom);
> > 
> > /**
> > - * Clear a bit in an atomic variable and return the new value.
> > + * Clear a bit in an atomic variable and return the value of bit before modify.
> > ?* @nr : Bit to set.
> > ?* @atom: atomic variable to modify
> > ?*/
> > @@ -54,14 +54,14 @@ int atomic_set_bit(int nr, atomic_t *atom);
> > int atomic_clear_bit(int nr, atomic_t *atom);
> > 
> > /**
> > - * Set a bit in any address and return the new value .
> > + * Set a bit in any address and return the the value of bit before modify.
> > ?* @nr : Bit to set.
> > ?* @addr: Address to modify
> > ?*/
> > int atomic_raw_set_bit(int nr, volatile unsigned long *addr);
> > 
> > /**
> > - * Clear a bit in any address and return the new value .
> > + * Clear a bit in any address and return the the value of bit before modify.
> > ?* @nr : Bit to set.
> > ?* @addr: Address to modify
> > ?*/
> > diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
> > index 528686f..95c6ff7 100644
> > --- a/lib/sbi/riscv_atomic.c
> > +++ b/lib/sbi/riscv_atomic.c
> > @@ -206,40 +206,20 @@ unsigned long atomic_raw_xchg_ulong(volatile unsigned long *ptr,
> > #endif
> > }
> > 
> > -#if (__SIZEOF_POINTER__ == 8)
> > -#define __AMO(op) "amo" #op ".d"
> > -#elif (__SIZEOF_POINTER__ == 4)
> > -#define __AMO(op) "amo" #op ".w"
> > -#else
> > -#error "Unexpected __SIZEOF_POINTER__"
> > -#endif
> > -
> > -#define __atomic_op_bit_ord(op, mod, nr, addr, ord)????????????????????????? \
> > - ({?????????????????????????????????????????????????????????????????? \
> > - unsigned long __res, __mask;???????????????????????????????? \
> > - __mask = BIT_MASK(nr);?????????????????????????????????????? \
> > - __asm__ __volatile__(__AMO(op) #ord " %0, %2, %1"??????????? \
> > -???? : "=r"(__res), "+A"(addr[BIT_WORD(nr)]) \
> > -???? : "r"(mod(__mask))????????????????????? \
> > -???? : "memory");??????????????????????????? \
> > - __res;?????????????????????????????????????????????????????? \
> > - })
> > -
> > -#define __atomic_op_bit(op, mod, nr, addr) \
> > - __atomic_op_bit_ord(op, mod, nr, addr, .aqrl)
> > -
> > -/* Bitmask modifiers */
> > -#define __NOP(x) (x)
> > -#define __NOT(x) (~(x))
> > -
> > inline int atomic_raw_set_bit(int nr, volatile unsigned long *addr)
> > {
> > - return __atomic_op_bit(or, __NOP, nr, addr);
> > + unsigned long res, mask = BIT_MASK(nr);
> > + volatile unsigned long *ptr = &addr[BIT_WORD(nr)];
> > + res = __atomic_fetch_and(ptr, ~mask, __ATOMIC_ACQ_REL);
> > + return res & mask ? 1 : 0;
> > }
> > 
> > inline int atomic_raw_clear_bit(int nr, volatile unsigned long *addr)
> > {
> > - return __atomic_op_bit(and, __NOT, nr, addr);
> > + unsigned long res, mask = BIT_MASK(nr);
> > + volatile unsigned long *ptr = &addr[BIT_WORD(nr)];
> > + res = __atomic_fetch_or(ptr, mask, __ATOMIC_ACQ_REL);
> > + return res & mask ? 1 : 0;
> > }
> > 
> > inline int atomic_set_bit(int nr, atomic_t *atom)
> > -- 
> > 2.42.0
> > 
> > 
> > -- 
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi


