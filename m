From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 10 Dec 2022 23:42:22 +0300
Subject: [PATCH RFC v2 2/2] lib: sbi: add support for debug triggers
In-Reply-To: <20221208124904.qi5n6b6k7tamt22t@archlinux>
References: <20221203213929.206429-1-geomatsi@gmail.com>
 <20221203213929.206429-3-geomatsi@gmail.com>
 <20221208124904.qi5n6b6k7tamt22t@archlinux>
Message-ID: <Y5TvLphl1IZj/k9r@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > RISC-V Debug specification includes Sdtrig ISA extension.
> > This extension describes Trigger Module. Triggers can cause
> > a breakpoint exception, entry into Debug Mode, or a trace
> > action without having to execute a special instruction. For
> > native debugging triggers can be used to implement hardware
> > breakpoints and watchpoints.
> > 
> > Software support for triggers consists of the following
> > major components:
> > - U-mode: gdb
> > - S-mode: hardware breakpoints framework in Linux kernel
> > - M-mode: SBI firmware code to handle triggers
> > 
> > SBI Debug Trigger extension proposal has been posted by
> > Anup Patel to lists.riscv.org tech-debug mailing list:
> > https://lists.riscv.org/g/tech-debug/topic/92375492
> > 
> > This patch provides initial implementation of SBI Debug
> > Trigger Extension in OpenSBI library based on the
> > suggested extension proposal.
> > 
> > Initial implementation has the following limitations:
> > - supported triggers: mcontrol, mcontrol6
> > - no support for chained triggers
> > - only build test for RV32

... [snip]

> > +union riscv_dbtr_tdata1 {
> > +	unsigned long value;
> > +	struct {
> > +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> > +		unsigned long type:4;
> > +		unsigned long dmode:1;
> > +#if __riscv_xlen == 64
> > +		unsigned long data:59;
> > +#elif __riscv_xlen == 32
> > +		unsigned long data:27;
> > +#else
> > +#error "Unexpected __riscv_xlen"
> > +#endif
> > +#elif __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> > +#if __riscv_xlen == 64
> > +		unsigned long data:59;
> > +#elif __riscv_xlen == 32
> > +		unsigned long data:27;
> > +#else
> > +#error "Unexpected __riscv_xlen"
> > +#endif
> > +		unsigned long dmode:1;
> > +		unsigned long type:4;
> > +#else
> > +#error "Unexpected endianness"
> > +#endif
> > +	};
> > +};
> 
> Since, RISC-V implementations can allow a combination of different endianness for
> M-mode and S-mode software. I am wondering how would this be handled if S-mode
> software is actually different endianess?

This approach is not suitable for universal binaries that will work
on both LE and BE hardware. This is a build-time approach when you
know the target platform that you are building for. SBI Debug Trigger
extension requires LE word format in messages passed between S-mode
software and M-mode SBI firmware. That is handled by endiannes
conversion macros added in the previous patch in this series.

IIUC the initial discussion around endianness has been inspired by heavy
use of bitfields in this patch. I probably should replace them by
something less controversial )

However if there is a serious intention to move towards proper LE/BE
support in OpenSBI (including different M/S endianness combinations),
then it should be done separately from these SBI debug extension
patches.

> > +
> > +union riscv_dbtr_tdata1_mcontrol {
> > +	unsigned long value;
> > +	struct {
> > +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> > +		unsigned long type:4;
> > +		unsigned long dmode:1;
> > +		unsigned long maskmax:6;
> > +#if __riscv_xlen >= 64
> > +		unsigned long _res1:30;
> > +		unsigned long sizehi:2;
> > +#endif
> > +		unsigned long hit:1;
> > +		unsigned long select:1;
> > +		unsigned long timing:1;
> > +		unsigned long sizelo:2;
> > +		unsigned long action:4;
> > +		unsigned long chain:1;
> > +		unsigned long match:4;
> > +		unsigned long m:1;
> > +		unsigned long _res2:1;
> > +		unsigned long s:1;
> > +		unsigned long u:1;
> > +		unsigned long execute:1;
> > +		unsigned long store:1;
> > +		unsigned long load:1;
> > +#elif __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> > +		unsigned long load:1;
> > +		unsigned long store:1;
> > +		unsigned long execute:1;
> > +		unsigned long u:1;
> > +		unsigned long s:1;
> > +		unsigned long _res2:1;
> > +		unsigned long m:1;
> > +		unsigned long match:4;
> > +		unsigned long chain:1;
> > +		unsigned long action:4;
> > +		unsigned long sizelo:2;
> > +		unsigned long timing:1;
> > +		unsigned long select:1;
> > +		unsigned long hit:1;
> > +#if __riscv_xlen >= 64
> > +		unsigned long sizehi:2;
> > +		unsigned long _res1:30;
> > +#endif
> > +		unsigned long maskmax:6;
> > +		unsigned long dmode:1;
> > +		unsigned long type:4;
> > +#else
> > +#error "Unexpected endianness"
> > +#endif
> > +	};
> > +};
> > +
> > +#define MCONTROL_U_OFFSET	3
> > +#define MCONTROL_S_OFFSET	4
> > +#define MCONTROL_M_OFFSET	6
> > +
> > +union riscv_dbtr_tdata1_mcontrol6 {
> > +	unsigned long value;
> > +	struct {
> > +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> > +		unsigned long type:4;
> > +		unsigned long dmode:1;
> > +#if __riscv_xlen == 64
> > +		unsigned long _res1:34;
> > +#elif __riscv_xlen == 32
> > +		unsigned long _res1:2;
> > +#else
> > +#error "Unexpected __riscv_xlen"
> > +#endif
> > +		unsigned long vs:1;
> > +		unsigned long vu:1;
> > +		unsigned long hit:1;
> > +		unsigned long select:1;
> > +		unsigned long timing:1;
> > +		unsigned long size:4;
> > +		unsigned long action:4;
> > +		unsigned long chain:1;
> > +		unsigned long match:4;
> > +		unsigned long m:1;
> > +		unsigned long _res2:1;
> > +		unsigned long s:1;
> > +		unsigned long u:1;
> > +		unsigned long execute:1;
> > +		unsigned long store:1;
> > +		unsigned long load:1;
> > +#elif __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> > +		unsigned long load:1;
> > +		unsigned long store:1;
> > +		unsigned long execute:1;
> > +		unsigned long u:1;
> > +		unsigned long s:1;
> > +		unsigned long _res2:1;
> > +		unsigned long m:1;
> > +		unsigned long match:4;
> > +		unsigned long chain:1;
> > +		unsigned long action:4;
> > +		unsigned long size:4;
> > +		unsigned long timing:1;
> > +		unsigned long select:1;
> > +		unsigned long hit:1;
> > +		unsigned long vu:1;
> > +		unsigned long vs:1;
> > +#if __riscv_xlen == 64
> > +		unsigned long _res1:34;
> > +#elif __riscv_xlen == 32
> > +		unsigned long _res1:2;
> > +#else
> > +#error "Unexpected __riscv_xlen"
> > +#endif
> > +		unsigned long dmode:1;
> > +		unsigned long type:4;
> > +#else
> > +#error "Unexpected endianness"
> > +#endif
> > +	};
> > +};
> Also, IMHO, these definitions defined under aren't maintenance friendly.

I assume that if Debug spec v1.0.0 is frozen and ratified,
then those definitions will not need a lot of changes.
So could you please clarify your concern ?

 
> > +
> > +#define MCONTROL6_U_OFFSET	3
> > +#define MCONTROL6_S_OFFSET	4
> > +#define MCONTROL6_M_OFFSET	6
> > +#define MCONTROL6_VU_OFFSET	23
> > +#define MCONTROL6_VS_OFFSET	24
> > +
> > +#endif /* __RISCV_DBTR_H__ */

Regards,
Sergey

