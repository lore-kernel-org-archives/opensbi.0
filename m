From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 8 Jul 2021 18:05:34 +0100
Subject: [PATCH 2/2] Drop dependency on libgcc by importing part of
 FreeBSD's libquad
In-Reply-To: <84b1e3af6cbd36aab758568022c4d854593e7f70.camel@126.com>
References: <20210703175607.92532-1-jrtc27@jrtc27.com>
 <20210703175607.92532-3-jrtc27@jrtc27.com>
 <84b1e3af6cbd36aab758568022c4d854593e7f70.camel@126.com>
Message-ID: <719E28EB-5533-4CE0-8C0A-9F8E7EB2E33F@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8 Jul 2021, at 10:02, Xiang W <wxjstz@126.com> wrote:
> 
> ? 2021-07-03???? 18:56 +0100?Jessica Clarke???
>> We only need libgcc for 64-bit division on RV32. Whilst GCC
>> toolchains
>> bundle libgcc, Clang toolchains tend not to ship libclang_rt.builtins
>> given every compiler is a cross-compiler for every target and so you
>> would need a silly number of builds of it, with only the native
>> library
>> available; only vendor-provided Clang toolchains specifically for
>> bare
>> metal cross-compiling are likely to provide it.
>> 
>> Thus, import part of FreeBSD's implementation of the division support
>> functions needed and stop linking against libgcc.
>> 
>> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
>> ---
>>  Makefile                              |   2 +-
>>  lib/utils/libquad/divdi3.c            |  64 ++++++
>>  lib/utils/libquad/include/limits.h    |  12 ++
>>  lib/utils/libquad/include/sys/cdefs.h |  12 ++
>>  lib/utils/libquad/include/sys/types.h |  25 +++
>>  lib/utils/libquad/moddi3.c            |  66 ++++++
>>  lib/utils/libquad/objects.mk          |  14 ++
>>  lib/utils/libquad/qdivrem.c           | 278
>> ++++++++++++++++++++++++++
>>  lib/utils/libquad/quad.h              | 105 ++++++++++
>>  lib/utils/libquad/udivdi3.c           |  52 +++++
>>  lib/utils/libquad/umoddi3.c           |  54 +++++
>>  11 files changed, 683 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Makefile b/Makefile
>> index 40bcab6..bc4429a 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -259,7 +259,7 @@ ASFLAGS             +=      $(firmware-asflags-y)
>>  
>>  ARFLAGS                =       rcs
>>  
>> -ELFFLAGS       +=      -Wl,--build-id=none -Wl,-N -static-libgcc -
>> lgcc
>> +ELFFLAGS       +=      -Wl,--build-id=none -Wl,-N
>>  ELFFLAGS       +=      $(platform-ldflags-y)
>>  ELFFLAGS       +=      $(firmware-ldflags-y)
>>  
>> diff --git a/lib/utils/libquad/divdi3.c b/lib/utils/libquad/divdi3.c
>> new file mode 100644
>> index 0000000..c5b4a37
>> --- /dev/null
>> +++ b/lib/utils/libquad/divdi3.c
>> @@ -0,0 +1,64 @@
>> +/*-
>> + * SPDX-License-Identifier: BSD-3-Clause
>> + *
>> + * Copyright (c) 1992, 1993
>> + *     The Regents of the University of California.  All rights
>> reserved.
>> + *
>> + * This software was developed by the Computer Systems Engineering
>> group
>> + * at Lawrence Berkeley Laboratory under DARPA contract BG 91-66 and
>> + * contributed to Berkeley.
>> + *
>> + * Redistribution and use in source and binary forms, with or
>> without
>> + * modification, are permitted provided that the following
>> conditions
>> + * are met:
>> + * 1. Redistributions of source code must retain the above copyright
>> + *    notice, this list of conditions and the following disclaimer.
>> + * 2. Redistributions in binary form must reproduce the above
>> copyright
>> + *    notice, this list of conditions and the following disclaimer
>> in the
>> + *    documentation and/or other materials provided with the
>> distribution.
>> + * 3. Neither the name of the University nor the names of its
>> contributors
>> + *    may be used to endorse or promote products derived from this
>> software
>> + *    without specific prior written permission.
>> + *
>> + * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS
>> IS'' AND
>> + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
>> THE
>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
>> PARTICULAR PURPOSE
>> + * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE
>> LIABLE
>> + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>> CONSEQUENTIAL
>> + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
>> GOODS
>> + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>> INTERRUPTION)
>> + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>> CONTRACT, STRICT
>> + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
>> ANY WAY
>> + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
>> POSSIBILITY OF
>> + * SUCH DAMAGE.
>> + */
>> +
>> +#if defined(LIBC_SCCS) && !defined(lint)
>> +static char sccsid[] = "@(#)divdi3.c   8.1 (Berkeley) 6/4/93";
>> +#endif /* LIBC_SCCS and not lint */
>> +#include <sys/cdefs.h>
>> +__FBSDID("$FreeBSD$");
>> +
>> +#include "quad.h"
>> +
>> +/*
>> + * Divide two signed quads.
>> + * ??? if -1/2 should produce -1 on this machine, this code is wrong
>> + */
>> +quad_t
>> +__divdi3(quad_t a, quad_t b)
>> +{
>> +       u_quad_t ua, ub, uq;
>> +       int neg;
>> +
>> +       if (a < 0)
>> +               ua = -(u_quad_t)a, neg = 1;
>> +       else
>> +               ua = a, neg = 0;
>> +       if (b < 0)
>> +               ub = -(u_quad_t)b, neg ^= 1;
>> +       else
>> +               ub = b;
>> +       uq = __qdivrem(ua, ub, (u_quad_t *)0);
>> +       return (neg ? -uq : uq);
>> +}
>> diff --git a/lib/utils/libquad/include/limits.h
>> b/lib/utils/libquad/include/limits.h
>> new file mode 100644
>> index 0000000..9c69d27
>> --- /dev/null
>> +++ b/lib/utils/libquad/include/limits.h
>> @@ -0,0 +1,12 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Copyright (c) 2021 Jessica Clarke <jrtc27@jrtc27.com>
>> + */
>> +
>> +#ifndef __LIMITS_H__
>> +#define __LIMITS_H__
>> +
>> +#define CHAR_BIT 8
>> +
>> +#endif
>> diff --git a/lib/utils/libquad/include/sys/cdefs.h
>> b/lib/utils/libquad/include/sys/cdefs.h
>> new file mode 100644
>> index 0000000..e8d6faa
>> --- /dev/null
>> +++ b/lib/utils/libquad/include/sys/cdefs.h
>> @@ -0,0 +1,12 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Copyright (c) 2021 Jessica Clarke <jrtc27@jrtc27.com>
>> + */
>> +
>> +#ifndef __SYS_CDEFS_H__
>> +#define __SYS_CDEFS_H__
>> +
>> +#define __FBSDID(s) struct __hack
>> +
>> +#endif
>> diff --git a/lib/utils/libquad/include/sys/types.h
>> b/lib/utils/libquad/include/sys/types.h
>> new file mode 100644
>> index 0000000..e372437
>> --- /dev/null
>> +++ b/lib/utils/libquad/include/sys/types.h
>> @@ -0,0 +1,25 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Copyright (c) 2021 Jessica Clarke <jrtc27@jrtc27.com>
>> + */
>> +
>> +#ifndef __SYS_TYPES_H__
>> +#define __SYS_TYPES_H__
>> +
>> +#include <sbi/sbi_types.h>
>> +
>> +typedef unsigned long u_long;
>> +
>> +typedef int64_t quad_t;
>> +typedef uint64_t u_quad_t;
>> +
>> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
>> +#define _QUAD_LOWWORD 1
>> +#define _QUAD_HIGHWORD 0
>> +#else
>> +#define _QUAD_LOWWORD 0
>> +#define _QUAD_HIGHWORD 1
>> +#endif
>> +
>> +#endif
>> diff --git a/lib/utils/libquad/moddi3.c b/lib/utils/libquad/moddi3.c
>> new file mode 100644
>> index 0000000..fc13b4d
>> --- /dev/null
>> +++ b/lib/utils/libquad/moddi3.c
>> @@ -0,0 +1,66 @@
>> +/*-
>> + * SPDX-License-Identifier: BSD-3-Clause
>> + *
>> + * Copyright (c) 1992, 1993
>> + *     The Regents of the University of California.  All rights
>> reserved.
>> + *
>> + * This software was developed by the Computer Systems Engineering
>> group
>> + * at Lawrence Berkeley Laboratory under DARPA contract BG 91-66 and
>> + * contributed to Berkeley.
>> + *
>> + * Redistribution and use in source and binary forms, with or
>> without
>> + * modification, are permitted provided that the following
>> conditions
>> + * are met:
>> + * 1. Redistributions of source code must retain the above copyright
>> + *    notice, this list of conditions and the following disclaimer.
>> + * 2. Redistributions in binary form must reproduce the above
>> copyright
>> + *    notice, this list of conditions and the following disclaimer
>> in the
>> + *    documentation and/or other materials provided with the
>> distribution.
>> + * 3. Neither the name of the University nor the names of its
>> contributors
>> + *    may be used to endorse or promote products derived from this
>> software
>> + *    without specific prior written permission.
>> + *
>> + * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS
>> IS'' AND
>> + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
>> THE
>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
>> PARTICULAR PURPOSE
>> + * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE
>> LIABLE
>> + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>> CONSEQUENTIAL
>> + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
>> GOODS
>> + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>> INTERRUPTION)
>> + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>> CONTRACT, STRICT
>> + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
>> ANY WAY
>> + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
>> POSSIBILITY OF
>> + * SUCH DAMAGE.
>> + */
>> +
>> +#if defined(LIBC_SCCS) && !defined(lint)
>> +static char sccsid[] = "@(#)moddi3.c   8.1 (Berkeley) 6/4/93";
>> +#endif /* LIBC_SCCS and not lint */
>> +#include <sys/cdefs.h>
>> +__FBSDID("$FreeBSD$");
>> +
>> +#include "quad.h"
>> +
>> +/*
>> + * Return remainder after dividing two signed quads.
>> + *
>> + * XXX
>> + * If -1/2 should produce -1 on this machine, this code is wrong.
>> + */
>> +quad_t
>> +__moddi3(quad_t a, quad_t b)
>> +{
>> +       u_quad_t ua, ub, ur;
>> +       int neg;
>> +
>> +       if (a < 0)
>> +               ua = -(u_quad_t)a, neg = 1;
>> +       else
>> +               ua = a, neg = 0;
>> +       if (b < 0)
>> +               ub = -(u_quad_t)b;
>> +       else
>> +               ub = b;
>> +       (void)__qdivrem(ua, ub, &ur);
>> +       return (neg ? -ur : ur);
>> +}
>> diff --git a/lib/utils/libquad/objects.mk
>> b/lib/utils/libquad/objects.mk
>> new file mode 100644
>> index 0000000..5e53cd0
>> --- /dev/null
>> +++ b/lib/utils/libquad/objects.mk
>> @@ -0,0 +1,14 @@
>> +#
>> +# SPDX-License-Identifier: BSD-2-Clause
>> +#
>> +# Copyright (c) 2021 Jessica Clarke <jrtc27@jrtc27.com>
>> +#
>> +
>> +ifeq ($(PLATFORM_RISCV_XLEN),32)
>> +libsbiutils-objs-y += libquad/divdi3.o
>> +libsbiutils-objs-y += libquad/moddi3.o
>> +libsbiutils-objs-y += libquad/qdivrem.o
>> +libsbiutils-objs-y += libquad/udivdi3.o
>> +libsbiutils-objs-y += libquad/umoddi3.o
>> +libsbiutils-genflags-y += -I$(libsbiutils_dir)/libquad/include
>> +endif
>> diff --git a/lib/utils/libquad/qdivrem.c
>> b/lib/utils/libquad/qdivrem.c
>> new file mode 100644
>> index 0000000..ea09e7f
>> --- /dev/null
>> +++ b/lib/utils/libquad/qdivrem.c
>> @@ -0,0 +1,278 @@
>> +/*-
>> + * SPDX-License-Identifier: BSD-3-Clause
>> + *
>> + * Copyright (c) 1992, 1993
>> + *     The Regents of the University of California.  All rights
>> reserved.
>> + *
>> + * This software was developed by the Computer Systems Engineering
>> group
>> + * at Lawrence Berkeley Laboratory under DARPA contract BG 91-66 and
>> + * contributed to Berkeley.
>> + *
>> + * Redistribution and use in source and binary forms, with or
>> without
>> + * modification, are permitted provided that the following
>> conditions
>> + * are met:
>> + * 1. Redistributions of source code must retain the above copyright
>> + *    notice, this list of conditions and the following disclaimer.
>> + * 2. Redistributions in binary form must reproduce the above
>> copyright
>> + *    notice, this list of conditions and the following disclaimer
>> in the
>> + *    documentation and/or other materials provided with the
>> distribution.
>> + * 3. Neither the name of the University nor the names of its
>> contributors
>> + *    may be used to endorse or promote products derived from this
>> software
>> + *    without specific prior written permission.
>> + *
>> + * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS
>> IS'' AND
>> + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
>> THE
>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
>> PARTICULAR PURPOSE
>> + * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE
>> LIABLE
>> + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>> CONSEQUENTIAL
>> + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
>> GOODS
>> + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>> INTERRUPTION)
>> + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>> CONTRACT, STRICT
>> + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
>> ANY WAY
>> + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
>> POSSIBILITY OF
>> + * SUCH DAMAGE.
>> + */
>> +
>> +#if defined(LIBC_SCCS) && !defined(lint)
>> +static char sccsid[] = "@(#)qdivrem.c  8.1 (Berkeley) 6/4/93";
>> +#endif /* LIBC_SCCS and not lint */
>> +#include <sys/cdefs.h>
>> +__FBSDID("$FreeBSD$");
>> +
>> +/*
>> + * Multiprecision divide.  This algorithm is from Knuth vol. 2 (2nd
>> ed),
>> + * section 4.3.1, pp. 257--259.
>> + */
>> +
>> +#include "quad.h"
>> +
>> +#define        B       (1L << HALF_BITS)       /* digit base */
>> +
>> +/* Combine two `digits' to make a single two-digit number. */
>> +#define        COMBINE(a, b) (((u_long)(a) << HALF_BITS) | (b))
>> +
>> +/* select a type for digits in base B: use unsigned short if they
>> fit */
>> +#if ULONG_MAX == 0xffffffff && USHRT_MAX >= 0xffff
>> +typedef unsigned short digit;
>> +#else
>> +typedef u_long digit;
>> +#endif
>> +
>> +/*
>> + * Shift p[0]..p[len] left `sh' bits, ignoring any bits that
>> + * `fall out' the left (there never will be any such anyway).
>> + * We may assume len >= 0.  NOTE THAT THIS WRITES len+1 DIGITS.
>> + */
>> +static void
>> +shl(digit *p, int len, int sh)
>> +{
>> +       int i;
>> +
>> +       for (i = 0; i < len; i++)
>> +               p[i] = LHALF(p[i] << sh) | (p[i + 1] >> (HALF_BITS -
>> sh));
>> +       p[i] = LHALF(p[i] << sh);
>> +}
>> +
>> +/*
>> + * __qdivrem(u, v, rem) returns u/v and, optionally, sets *rem to
>> u%v.
>> + *
>> + * We do this in base 2-sup-HALF_BITS, so that all intermediate
>> products
>> + * fit within u_long.  As a consequence, the maximum length dividend
>> and
>> + * divisor are 4 `digits' in this base (they are shorter if they
>> have
>> + * leading zeros).
>> + */
>> +u_quad_t
>> +__qdivrem(u_quad_t uq, u_quad_t vq, u_quad_t *arq)
>> +{
>> +       union uu tmp;
>> +       digit *u, *v, *q;
>> +       digit v1, v2;
>> +       u_long qhat, rhat, t;
>> +       int m, n, d, j, i;
>> +       digit uspace[5], vspace[5], qspace[5];
>> +
>> +       /*
>> +        * Take care of special cases: divide by zero, and u < v.
>> +        */
>> +       if (vq == 0) {
>> +               /* divide by zero. */
>> +               static volatile const unsigned int zero = 0;
>> +
>> +               tmp.ul[H] = tmp.ul[L] = 1 / zero;
>> +               if (arq)
>> +                       *arq = uq;
>> +               return (tmp.q);
>> +       }
>> +       if (uq < vq) {
>> +               if (arq)
>> +                       *arq = uq;
>> +               return (0);
>> +       }
>> +       u = &uspace[0];
>> +       v = &vspace[0];
>> +       q = &qspace[0];
>> +
>> +       /*
>> +        * Break dividend and divisor into digits in base B, then
>> +        * count leading zeros to determine m and n.  When done, we
>> +        * will have:
>> +        *      u = (u[1]u[2]...u[m+n]) sub B
>> +        *      v = (v[1]v[2]...v[n]) sub B
>> +        *      v[1] != 0
>> +        *      1 < n <= 4 (if n = 1, we use a different division
>> algorithm)
>> +        *      m >= 0 (otherwise u < v, which we already checked)
>> +        *      m + n = 4
>> +        * and thus
>> +        *      m = 4 - n <= 2
>> +        */
>> +       tmp.uq = uq;
>> +       u[0] = 0;
>> +       u[1] = HHALF(tmp.ul[H]);
>> +       u[2] = LHALF(tmp.ul[H]);
>> +       u[3] = HHALF(tmp.ul[L]);
>> +       u[4] = LHALF(tmp.ul[L]);
>> +       tmp.uq = vq;
>> +       v[1] = HHALF(tmp.ul[H]);
>> +       v[2] = LHALF(tmp.ul[H]);
>> +       v[3] = HHALF(tmp.ul[L]);
>> +       v[4] = LHALF(tmp.ul[L]);
>> +       for (n = 4; v[1] == 0; v++) {
>> +               if (--n == 1) {
>> +                       u_long rbj;     /* r*B+u[j] (not root boy
>> jim) */
>> +                       digit q1, q2, q3, q4;
>> +
>> +                       /*
>> +                        * Change of plan, per exercise 16.
>> +                        *      r = 0;
>> +                        *      for j = 1..4:
>> +                        *              q[j] = floor((r*B + u[j]) /
>> v),
>> +                        *              r = (r*B + u[j]) % v;
>> +                        * We unroll this completely here.
>> +                        */
>> +                       t = v[2];       /* nonzero, by definition */
>> +                       q1 = u[1] / t;
>> +                       rbj = COMBINE(u[1] % t, u[2]);
>> +                       q2 = rbj / t;
>> +                       rbj = COMBINE(rbj % t, u[3]);
>> +                       q3 = rbj / t;
>> +                       rbj = COMBINE(rbj % t, u[4]);
>> +                       q4 = rbj / t;
>> +                       if (arq)
>> +                               *arq = rbj % t;
>> +                       tmp.ul[H] = COMBINE(q1, q2);
>> +                       tmp.ul[L] = COMBINE(q3, q4);
>> +                       return (tmp.q);
>> +               }
>> +       }
>> +
>> +       /*
>> +        * By adjusting q once we determine m, we can guarantee that
>> +        * there is a complete four-digit quotient at &qspace[1] when
>> +        * we finally stop.
>> +        */
>> +       for (m = 4 - n; u[1] == 0; u++)
>> +               m--;
>> +       for (i = 4 - m; --i >= 0;)
>> +               q[i] = 0;
>> +       q += 4 - m;
>> +
>> +       /*
>> +        * Here we run Program D, translated from MIX to C and
>> acquiring
>> +        * a few minor changes.
>> +        *
>> +        * D1: choose multiplier 1 << d to ensure v[1] >= B/2.
>> +        */
>> +       d = 0;
>> +       for (t = v[1]; t < B / 2; t <<= 1)
>> +               d++;
>> +       if (d > 0) {
>> +               shl(&u[0], m + n, d);           /* u <<= d */
>> +               shl(&v[1], n - 1, d);           /* v <<= d */
>> +       }
>> +       /*
>> +        * D2: j = 0.
>> +        */
>> +       j = 0;
>> +       v1 = v[1];      /* for D3 -- note that v[1..n] are constant
>> */
>> +       v2 = v[2];      /* for D3 */
>> +       do {
>> +               digit uj0, uj1, uj2;
>> +
>> +               /*
>> +                * D3: Calculate qhat (\^q, in TeX notation).
>> +                * Let qhat = min((u[j]*B + u[j+1])/v[1], B-1), and
>> +                * let rhat = (u[j]*B + u[j+1]) mod v[1].
>> +                * While rhat < B and v[2]*qhat > rhat*B+u[j+2],
>> +                * decrement qhat and increase rhat correspondingly.
>> +                * Note that if rhat >= B, v[2]*qhat < rhat*B.
>> +                */
>> +               uj0 = u[j + 0]; /* for D3 only -- note that u[j+...]
>> change */
>> +               uj1 = u[j + 1]; /* for D3 only */
>> +               uj2 = u[j + 2]; /* for D3 only */
>> +               if (uj0 == v1) {
>> +                       qhat = B;
>> +                       rhat = uj1;
>> +                       goto qhat_too_big;
>> +               } else {
>> +                       u_long n = COMBINE(uj0, uj1);
>> +                       qhat = n / v1;
>> +                       rhat = n % v1;
>> +               }
>> +               while (v2 * qhat > COMBINE(rhat, uj2)) {
>> +       qhat_too_big:
>> +                       qhat--;
>> +                       if ((rhat += v1) >= B)
>> +                               break;
>> +               }
>> +               /*
>> +                * D4: Multiply and subtract.
>> +                * The variable `t' holds any borrows across the
>> loop.
>> +                * We split this up so that we do not require v[0] =
>> 0,
>> +                * and to eliminate a final special case.
>> +                */
>> +               for (t = 0, i = n; i > 0; i--) {
>> +                       t = u[i + j] - v[i] * qhat - t;
>> +                       u[i + j] = LHALF(t);
>> +                       t = (B - HHALF(t)) & (B - 1);
>> +               }
>> +               t = u[j] - t;
>> +               u[j] = LHALF(t);
>> +               /*
>> +                * D5: test remainder.
>> +                * There is a borrow if and only if HHALF(t) is
>> nonzero;
>> +                * in that (rare) case, qhat was too large (by
>> exactly 1).
>> +                * Fix it by adding v[1..n] to u[j..j+n].
>> +                */
>> +               if (HHALF(t)) {
>> +                       qhat--;
>> +                       for (t = 0, i = n; i > 0; i--) { /* D6: add
>> back. */
>> +                               t += u[i + j] + v[i];
>> +                               u[i + j] = LHALF(t);
>> +                               t = HHALF(t);
>> +                       }
>> +                       u[j] = LHALF(u[j] + t);
>> +               }
>> +               q[j] = qhat;
>> +       } while (++j <= m);             /* D7: loop on j. */
>> +
>> +       /*
>> +        * If caller wants the remainder, we have to calculate it as
>> +        * u[m..m+n] >> d (this is at most n digits and thus fits in
>> +        * u[m+1..m+n], but we may need more source digits).
>> +        */
>> +       if (arq) {
>> +               if (d) {
>> +                       for (i = m + n; i > m; --i)
>> +                               u[i] = (u[i] >> d) |
>> +                                   LHALF(u[i - 1] << (HALF_BITS -
>> d));
>> +                       u[i] = 0;
>> +               }
>> +               tmp.ul[H] = COMBINE(uspace[1], uspace[2]);
>> +               tmp.ul[L] = COMBINE(uspace[3], uspace[4]);
>> +               *arq = tmp.q;
>> +       }
>> +
>> +       tmp.ul[H] = COMBINE(qspace[1], qspace[2]);
>> +       tmp.ul[L] = COMBINE(qspace[3], qspace[4]);
>> +       return (tmp.q);
>> +}
>> diff --git a/lib/utils/libquad/quad.h b/lib/utils/libquad/quad.h
>> new file mode 100644
>> index 0000000..a9f8447
>> --- /dev/null
>> +++ b/lib/utils/libquad/quad.h
>> @@ -0,0 +1,105 @@
>> +/*-
>> + * SPDX-License-Identifier: BSD-3-Clause
>> + *
>> + * Copyright (c) 1992, 1993
>> + *     The Regents of the University of California.  All rights
>> reserved.
>> + *
>> + * This software was developed by the Computer Systems Engineering
>> group
>> + * at Lawrence Berkeley Laboratory under DARPA contract BG 91-66 and
>> + * contributed to Berkeley.
>> + *
>> + * Redistribution and use in source and binary forms, with or
>> without
>> + * modification, are permitted provided that the following
>> conditions
>> + * are met:
>> + * 1. Redistributions of source code must retain the above copyright
>> + *    notice, this list of conditions and the following disclaimer.
>> + * 2. Redistributions in binary form must reproduce the above
>> copyright
>> + *    notice, this list of conditions and the following disclaimer
>> in the
>> + *    documentation and/or other materials provided with the
>> distribution.
>> + * 3. Neither the name of the University nor the names of its
>> contributors
>> + *    may be used to endorse or promote products derived from this
>> software
>> + *    without specific prior written permission.
>> + *
>> + * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS
>> IS'' AND
>> + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
>> THE
>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
>> PARTICULAR PURPOSE
>> + * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE
>> LIABLE
>> + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>> CONSEQUENTIAL
>> + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
>> GOODS
>> + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>> INTERRUPTION)
>> + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>> CONTRACT, STRICT
>> + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
>> ANY WAY
>> + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
>> POSSIBILITY OF
>> + * SUCH DAMAGE.
>> + *
>> + *     @(#)quad.h      8.1 (Berkeley) 6/4/93
>> + * $FreeBSD$
>> + */
>> +
>> +/*
>> + * Quad arithmetic.
>> + *
>> + * This library makes the following assumptions:
>> + *
>> + *  - The type long long (aka quad_t) exists.
>> + *
>> + *  - A quad variable is exactly twice as long as `long'.
>> + *
>> + *  - The machine's arithmetic is two's complement.
>> + *
>> + * This library can provide 128-bit arithmetic on a machine with
>> 128-bit
>> + * quads and 64-bit longs, for instance, or 96-bit arithmetic on
>> machines
>> + * with 48-bit longs.
>> + */
>> +
>> +#include <sys/types.h>
>> +#include <limits.h>
>> +
>> +/*
>> + * Depending on the desired operation, we view a `long long' (aka
>> quad_t) in
>> + * one or more of the following formats.
>> + */
>> +union uu {
>> +       quad_t  q;              /* as a (signed) quad */
>> +       quad_t  uq;             /* as an unsigned quad */
>> +       long    sl[2];          /* as two signed longs */
>> +       u_long  ul[2];          /* as two unsigned longs */
>> +};
>> +
>> +/*
>> + * Define high and low longwords.
>> + */
>> +#define        H               _QUAD_HIGHWORD
>> +#define        L               _QUAD_LOWWORD
>> +
>> +/*
>> + * Total number of bits in a quad_t and in the pieces that make it
>> up.
>> + * These are used for shifting, and also below for halfword
>> extraction
>> + * and assembly.
>> + */
>> +#define        QUAD_BITS       (sizeof(quad_t) * CHAR_BIT)
>> +#define        LONG_BITS       (sizeof(long) * CHAR_BIT)
>> +#define        HALF_BITS       (sizeof(long) * CHAR_BIT / 2)
>> +
>> +/*
>> + * Extract high and low shortwords from longword, and move low
>> shortword of
>> + * longword to upper half of long, i.e., produce the upper longword
>> of
>> + * ((quad_t)(x) << (number_of_bits_in_long/2)).  (`x' must actually
>> be u_long.)
>> + *
>> + * These are used in the multiply code, to split a longword into
>> upper
>> + * and lower halves, and to reassemble a product as a quad_t,
>> shifted left
>> + * (sizeof(long)*CHAR_BIT/2).
>> + */
>> +#define        HHALF(x)        ((x) >> HALF_BITS)
>> +#define        LHALF(x)        ((x) & ((1L << HALF_BITS) - 1))
>> +#define        LHUP(x)         ((x) << HALF_BITS)
>> +
>> +int            __cmpdi2(quad_t a, quad_t b);
> 
> Is this function used to compare two 64-bit variables? I tested the
> comparison operation with gcc/clang, and the comparison operation does
> not call any functions. And this function is not defined, this
> declaration can be removed.
> 
>> +quad_t         __divdi3(quad_t a, quad_t b);
>> +quad_t         __moddi3(quad_t a, quad_t b);
>> +u_quad_t       __qdivrem(u_quad_t u, u_quad_t v, u_quad_t *rem);
>> +int            __ucmpdi2(u_quad_t a, u_quad_t b);
> 
> Here the same as above.

They do no harm to have, the headers are only included by the files
inside libquad themselves, they?re not used by opensbi itself. Removing
them would require modifying the source compared with upstream, which
makes it more awkward to pull in newer versions. I have deliberately
left the files entirely unmodified compared to the upstream versions.

Jess


