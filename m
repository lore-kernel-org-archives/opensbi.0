From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Feb 2022 11:08:31 +0530
Subject: [PATCH] lib: fix compilation when strings.h is included
In-Reply-To: <CAAhSdy0Ve_gp1MROqMu-Eh+ot-K+2GXk6D7rJdseMT9Ht=aNzw@mail.gmail.com>
References: <CAA5uK6+Utvb5V7wcrPoO5Syvsyvgr6o0C4uM1eMwQndY3xMbhQ@mail.gmail.com>
 <20220128071322.97275-1-petro.karashchenko@gmail.com>
 <CAA5uK6+dh2S3p7mRX5gUP-W-pSCY7shYuXWPq4x8S6pH0YLGpA@mail.gmail.com>
 <CAAhSdy0Ve_gp1MROqMu-Eh+ot-K+2GXk6D7rJdseMT9Ht=aNzw@mail.gmail.com>
Message-ID: <CAAhSdy3SNVHFhdC8eS2maT17GwTGq-wYQfKPnG8kMg45oFdUOA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 1, 2022 at 3:01 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Feb 1, 2022 at 2:51 PM Petro Karashchenko
> <petro.karashchenko@gmail.com> wrote:
> >
> > Hi,
> >
> > What is needed to get this patch merged? I've created
> > https://github.com/riscv-software-src/opensbi/pull/242 additionally to
> > this mailing thread, but maybe I'm missing some processes.
> >
> > Thank you in advance for a reply.
>
> Nothing needed from yourside. This looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> I will merge it sometime this week.
>
> Thanks,
> Anup
>
> >
> > Best regards,
> > Petro
> >
> > ??, 28 ???. 2022 ?. ? 09:14 Petro Karashchenko
> > <petro.karashchenko@gmail.com> ????:
> > >
> > > In a systems that provide strings.h and it is included
> > > together with sbi_bitops.h the compilation error appears.
> > > The ffs() and fls() are provided by strings.h
> > >
> > > Signed-off-by: Petro Karashchenko <petro.karashchenko@gmail.com>
> > > ---
> > >  include/sbi/sbi_bitops.h        | 82 +++------------------------------
> > >  lib/sbi/sbi_bitops.c            | 10 ++--
> > >  lib/sbi/sbi_hart.c              |  8 ++--
> > >  lib/sbi/sbi_pmu.c               |  6 +--
> > >  lib/utils/timer/aclint_mtimer.c |  2 +-
> > >  5 files changed, 19 insertions(+), 89 deletions(-)
> > >
> > > diff --git a/include/sbi/sbi_bitops.h b/include/sbi/sbi_bitops.h
> > > index 879430d..251e4d8 100644
> > > --- a/include/sbi/sbi_bitops.h
> > > +++ b/include/sbi/sbi_bitops.h
> > > @@ -37,47 +37,12 @@
> > >         (((~0UL) - (1UL << (l)) + 1) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
> > >
> > >  /**
> > > - * ffs - Find first bit set
> > > - * @x: the word to search
> > > - *
> > > - * This is defined the same way as
> > > - * the libc and compiler builtin ffs routines, therefore
> > > - * differs in spirit from the above ffz (man ffs).
> > > - */
> > > -static inline int ffs(int x)
> > > -{
> > > -       int r = 1;
> > > -
> > > -       if (!x)
> > > -               return 0;
> > > -       if (!(x & 0xffff)) {
> > > -               x >>= 16;
> > > -               r += 16;
> > > -       }
> > > -       if (!(x & 0xff)) {
> > > -               x >>= 8;
> > > -               r += 8;
> > > -       }
> > > -       if (!(x & 0xf)) {
> > > -               x >>= 4;
> > > -               r += 4;
> > > -       }
> > > -       if (!(x & 3)) {
> > > -               x >>= 2;
> > > -               r += 2;
> > > -       }
> > > -       if (!(x & 1))
> > > -               r += 1;
> > > -       return r;
> > > -}
> > > -
> > > -/**
> > > - * __ffs - find first bit in word.
> > > + * sbi_ffs - find first (less-significant) set bit in a long word.
> > >   * @word: The word to search
> > >   *
> > >   * Undefined if no bit exists, so code should check against 0 first.
> > >   */
> > > -static inline int __ffs(unsigned long word)
> > > +static inline int sbi_ffs(unsigned long word)
> > >  {
> > >         int num = 0;
> > >
> > > @@ -109,55 +74,20 @@ static inline int __ffs(unsigned long word)
> > >  }
> > >
> > >  /*
> > > - * ffz - find first zero in word.
> > > + * sbi_ffz - find first zero in word.
> > >   * @word: The word to search
> > >   *
> > >   * Undefined if no zero exists, so code should check against ~0UL first.
> > >   */
> > > -#define ffz(x) __ffs(~(x))
> > > -
> > > -/**
> > > - * fls - find last (most-significant) bit set
> > > - * @x: the word to search
> > > - *
> > > - * This is defined the same way as ffs.
> > > - * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
> > > - */
> > > -
> > > -static inline int fls(int x)
> > > -{
> > > -       int r = 32;
> > > -
> > > -       if (!x)
> > > -               return 0;
> > > -       if (!(x & 0xffff0000u)) {
> > > -               x <<= 16;
> > > -               r -= 16;
> > > -       }
> > > -       if (!(x & 0xff000000u)) {
> > > -               x <<= 8;
> > > -               r -= 8;
> > > -       }
> > > -       if (!(x & 0xf0000000u)) {
> > > -               x <<= 4;
> > > -               r -= 4;
> > > -       }
> > > -       if (!(x & 0xc0000000u)) {
> > > -               x <<= 2;
> > > -               r -= 2;
> > > -       }
> > > -       if (!(x & 0x80000000u))
> > > -               r -= 1;
> > > -       return r;
> > > -}
> > > +#define sbi_ffz(x) sbi_ffs(~(x))
> > >
> > >  /**
> > > - * __fls - find last (most-significant) set bit in a long word
> > > + * sbi_fls - find last (most-significant) set bit in a long word
> > >   * @word: the word to search
> > >   *
> > >   * Undefined if no set bit exists, so code should check against 0 first.
> > >   */
> > > -static inline unsigned long __fls(unsigned long word)
> > > +static inline unsigned long sbi_fls(unsigned long word)
> > >  {
> > >         int num = BITS_PER_LONG - 1;
> > >
> > > diff --git a/lib/sbi/sbi_bitops.c b/lib/sbi/sbi_bitops.c
> > > index de9d045..becea91 100644
> > > --- a/lib/sbi/sbi_bitops.c
> > > +++ b/lib/sbi/sbi_bitops.c
> > > @@ -39,7 +39,7 @@ unsigned long find_first_bit(const unsigned long *addr,
> > >         if (tmp == 0UL)         /* Are any bits set? */
> > >                 return result + size;   /* Nope. */
> > >  found:
> > > -       return result + __ffs(tmp);
> > > +       return result + sbi_ffs(tmp);
> > >  }
> > >
> > >  /**
> > > @@ -69,7 +69,7 @@ unsigned long find_first_zero_bit(const unsigned long *addr,
> > >         if (tmp == ~0UL)        /* Are any bits zero? */
> > >                 return result + size;   /* Nope. */
> > >  found:
> > > -       return result + ffz(tmp);
> > > +       return result + sbi_ffz(tmp);
> > >  }
> > >
> > >  /**
> > > @@ -100,7 +100,7 @@ unsigned long find_last_bit(const unsigned long *addr,
> > >                 tmp = addr[--words];
> > >                 if (tmp) {
> > >  found:
> > > -                       return words * BITS_PER_LONG + __fls(tmp);
> > > +                       return words * BITS_PER_LONG + sbi_fls(tmp);
> > >                 }
> > >         }
> > >
> > > @@ -150,7 +150,7 @@ found_first:
> > >         if (tmp == 0UL)         /* Are any bits set? */
> > >                 return result + size;   /* Nope. */
> > >  found_middle:
> > > -       return result + __ffs(tmp);
> > > +       return result + sbi_ffs(tmp);
> > >  }
> > >
> > >  /**
> > > @@ -196,5 +196,5 @@ found_first:
> > >         if (tmp == ~0UL)        /* Are any bits zero? */
> > >                 return result + size;   /* Nope. */
> > >  found_middle:
> > > -       return result + ffz(tmp);
> > > +       return result + sbi_ffz(tmp);
> > >  }
> > > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > > index d9a15d9..7975347 100644
> > > --- a/lib/sbi/sbi_hart.c
> > > +++ b/lib/sbi/sbi_hart.c
> > > @@ -368,7 +368,7 @@ static int hart_pmu_get_allowed_bits(void)
> > >                 if (trap.cause)
> > >                         return 0;
> > >         }
> > > -       num_bits = __fls(val) + 1;
> > > +       num_bits = sbi_fls(val) + 1;
> > >  #if __riscv_xlen == 32
> > >         csr_write_allowed(CSR_MHPMCOUNTER3H, (ulong)&trap, val);
> > >         if (!trap.cause) {
> > > @@ -376,7 +376,7 @@ static int hart_pmu_get_allowed_bits(void)
> > >                 if (trap.cause)
> > >                         return num_bits;
> > >         }
> > > -       num_bits += __fls(val) + 1;
> > > +       num_bits += sbi_fls(val) + 1;
> > >
> > >  #endif
> > >
> > > @@ -439,8 +439,8 @@ static void hart_detect_features(struct sbi_scratch *scratch)
> > >          */
> > >         val = hart_pmp_get_allowed_addr();
> > >         if (val) {
> > > -               hfeatures->pmp_gran =  1 << (__ffs(val) + 2);
> > > -               hfeatures->pmp_addr_bits = __fls(val) + 1;
> > > +               hfeatures->pmp_gran =  1 << (sbi_ffs(val) + 2);
> > > +               hfeatures->pmp_addr_bits = sbi_fls(val) + 1;
> > >                 /* Detect number of PMP regions. At least PMPADDR0 should be implemented*/
> > >                 __check_csr_64(CSR_PMPADDR0, 0, val, pmp_count, __pmp_skip);
> > >         }
> > > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > > index 5b845f8..4280834 100644
> > > --- a/lib/sbi/sbi_pmu.c
> > > +++ b/lib/sbi/sbi_pmu.c
> > > @@ -343,7 +343,7 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
> > >         int ret = SBI_EINVAL;
> > >         bool bUpdate = FALSE;
> > >
> > > -       if (__fls(ctr_mask) >= total_ctrs)
> > > +       if (sbi_fls(ctr_mask) >= total_ctrs)
> > >                 return ret;
> > >
> > >         if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
> > > @@ -417,7 +417,7 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
> > >         uint32_t event_code;
> > >         unsigned long ctr_mask = cmask << cbase;
> > >
> > > -       if (__fls(ctr_mask) >= total_ctrs)
> > > +       if (sbi_fls(ctr_mask) >= total_ctrs)
> > >                 return SBI_EINVAL;
> > >
> > >         for_each_set_bit_from(cbase, &ctr_mask, total_ctrs) {
> > > @@ -606,7 +606,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
> > >         unsigned long tmp = cidx_mask << cidx_base;
> > >
> > >         /* Do a basic sanity check of counter base & mask */
> > > -       if (__fls(tmp) >= total_ctrs || event_type >= SBI_PMU_EVENT_TYPE_MAX)
> > > +       if (sbi_fls(tmp) >= total_ctrs || event_type >= SBI_PMU_EVENT_TYPE_MAX)
> > >                 return SBI_EINVAL;
> > >
> > >         if (flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
> > > diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> > > index 2532b63..a957b1c 100644
> > > --- a/lib/utils/timer/aclint_mtimer.c
> > > +++ b/lib/utils/timer/aclint_mtimer.c
> > > @@ -154,7 +154,7 @@ static int aclint_mtimer_add_regions(unsigned long addr, unsigned long size)
> > >         while (pos < end) {
> > >                 rsize = pos & (MTIMER_ADD_REGION_ALIGN - 1);
> > >                 if (rsize)
> > > -                       rsize = 1UL << __ffs(pos);
> > > +                       rsize = 1UL << sbi_ffs(pos);
> > >                 else
> > >                         rsize = ((end - pos) < MTIMER_ADD_REGION_ALIGN) ?
> > >                                 (end - pos) : MTIMER_ADD_REGION_ALIGN;
> > > --
> > > 2.32.0
> > >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

