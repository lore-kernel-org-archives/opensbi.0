From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 2 Feb 2023 12:24:04 +0300
Subject: [PATCH 1/2] include: Add support for byteorder/endianness
 conversion
In-Reply-To: <CA+Oz1=apLYgi29eDggPZF8GKjYteVr3LQDtuVhOSU6wAi84Q9Q@mail.gmail.com>
References: <20230128074617.1917265-1-rpathak@ventanamicro.com>
 <20230128074617.1917265-2-rpathak@ventanamicro.com>
 <Y9jNHM1dHedBPmAf@curiosity>
 <CA+Oz1=apLYgi29eDggPZF8GKjYteVr3LQDtuVhOSU6wAi84Q9Q@mail.gmail.com>
Message-ID: <Y9uBNKl1yPkVRg/D@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Rahul,

> Using __builtins_bswapX causes weird issues on gcc,
> due to reasons unknown the functions in libfdt_env.h
> like below emit the library call to __bswapdi2
> which causes errors.
> 
> static inline fdt32_t cpu_to_fdt32(uint32_t x)
> {
> return (FDT_FORCE fdt32_t)cpu_to_be32(x);
> }
> 
> Errors -
> fdt_reset_gpio.c:135: undefined reference to `__bswapsi2'
> /fdt_reset_thead.c:77: undefined reference to `__bswapsi2'
> 
> Clang works perfectly
> 
> Did you face such issues?

Right. I see such issues for gcc revisions v10.2, v11.2, v12.1.
Missing references could be be pulled from libgcc, e.g.: 

diff --git a/Makefile b/Makefile
index 8db6eab..8cae625 100644
--- a/Makefile
+++ b/Makefile
@@ -369,7 +369,7 @@ ASFLAGS		+=	$(firmware-asflags-y)
 ARFLAGS		=	rcs
 
 ELFFLAGS	+=	$(USE_LD_FLAG)
-ELFFLAGS	+=	-Wl,--build-id=none -Wl,-N
+ELFFLAGS	+=	-Wl,--build-id=none -Wl,-N -Wl,-lgcc
 ELFFLAGS	+=	$(platform-ldflags-y)
 ELFFLAGS	+=	$(firmware-ldflags-y)


Regards,
Sergey

> On Tue, Jan 31, 2023 at 1:41 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > On Sat, Jan 28, 2023 at 01:16:16PM +0530, Rahul Pathak wrote:
> > > Define macros for general byteorder conversion
> > > Define functions for endianness conversion
> > > using general byteorder conversion macros
> > >
> > > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > > ---
> > >  include/sbi/sbi_byteorder.h | 57 +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > >  create mode 100644 include/sbi/sbi_byteorder.h
> >
> > Reviewed-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> >
> > By the way, is there any advantage of using custom macros instead of
> > compiler builtins ? E.g. see my patch loosely based on FreeBSD code:
> > http://lists.infradead.org/pipermail/opensbi/2022-December/003766.html
> >
> > Regards,
> > Sergey
> >
> >
> > > diff --git a/include/sbi/sbi_byteorder.h b/include/sbi/sbi_byteorder.h
> > > new file mode 100644
> > > index 000000000000..680710fe6d91
> > > --- /dev/null
> > > +++ b/include/sbi/sbi_byteorder.h
> > > @@ -0,0 +1,57 @@
> > > +/*
> > > + * SPDX-License-Identifier: BSD-2-Clause
> > > + *
> > > + * Copyright (c) 2023 Ventana Micro Systems Inc.
> > > + */
> > > +
> > > +#ifndef __SBI_BYTEORDER_H__
> > > +#define __SBI_BYTEORDER_H__
> > > +
> > > +#include <sbi/sbi_types.h>
> > > +
> > > +#define EXTRACT_BYTE(x, n)   ((unsigned long long)((uint8_t *)&x)[n])
> > > +
> > > +#define BSWAP16(x)   ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
> > > +#define BSWAP32(x)   ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
> > > +                      (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
> > > +#define BSWAP64(x)   ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
> > > +                      (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
> > > +                      (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
> > > +                      (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
> > > +
> > > +
> > > +#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__  /* CPU(little-endian) */
> > > +#define cpu_to_be16(x)               ((uint16_t)BSWAP16(x))
> > > +#define cpu_to_be32(x)               ((uint32_t)BSWAP32(x))
> > > +#define cpu_to_be64(x)               ((uint64_t)BSWAP64(x))
> > > +
> > > +#define be16_to_cpu(x)               ((uint16_t)BSWAP16(x))
> > > +#define be32_to_cpu(x)               ((uint32_t)BSWAP32(x))
> > > +#define be64_to_cpu(x)               ((uint64_t)BSWAP64(x))
> > > +
> > > +#define cpu_to_le16(x)               ((uint16_t)(x))
> > > +#define cpu_to_le32(x)               ((uint32_t)(x))
> > > +#define cpu_to_le64(x)               ((uint64_t)(x))
> > > +
> > > +#define le16_to_cpu(x)               ((uint16_t)(x))
> > > +#define le32_to_cpu(x)               ((uint32_t)(x))
> > > +#define le64_to_cpu(x)               ((uint64_t)(x))
> > > +#else /* CPU(big-endian) */
> > > +#define cpu_to_be16(x)               ((uint16_t)(x))
> > > +#define cpu_to_be32(x)               ((uint32_t)(x))
> > > +#define cpu_to_be64(x)               ((uint64_t)(x))
> > > +
> > > +#define be16_to_cpu(x)               ((uint16_t)(x))
> > > +#define be32_to_cpu(x)               ((uint32_t)(x))
> > > +#define be64_to_cpu(x)               ((uint64_t)(x))
> > > +
> > > +#define cpu_to_le16(x)               ((uint16_t)BSWAP16(x))
> > > +#define cpu_to_le32(x)               ((uint32_t)BSWAP32(x))
> > > +#define cpu_to_le64(x)               ((uint64_t)BSWAP64(x))
> > > +
> > > +#define le16_to_cpu(x)               ((uint16_t)BSWAP16(x))
> > > +#define le32_to_cpu(x)               ((uint32_t)BSWAP32(x))
> > > +#define le64_to_cpu(x)               ((uint64_t)BSWAP64(x))
> > > +#endif
> > > +
> > > +#endif /* __SBI_BYTEORDER_H__ */
> > > --
> > > 2.34.1
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 
> 
> -- 
> 
> Thanks
> Rahul Pathak

