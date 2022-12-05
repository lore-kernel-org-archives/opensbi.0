From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 5 Dec 2022 23:34:37 +0300
Subject: [PATCH RFC v2 2/2] lib: sbi: add support for debug triggers
In-Reply-To: <57086abe77447357d6f33cc92f713e2c08860c0b.camel@126.com>
References: <20221203213929.206429-1-geomatsi@gmail.com>
 <20221203213929.206429-3-geomatsi@gmail.com>
 <57086abe77447357d6f33cc92f713e2c08860c0b.camel@126.com>
Message-ID: <Y45V3fAIOc9jNGaG@curiosity>
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
> > 
> Missing Signed-off-by

Thanks for catching, will fix.
 
> Compilation preprocessing too much. It is recommended to process register
> fields by defining some masks, and via INSERT_FIELD and EXTRACT_FIELD.

Indeed, current bitfield/union code looks awkward. I'll try to make it
more comprehensible in the next revision. BTW thanks for mentioning
INSERT/EXTRACT  - I missed them when looking for something suitable
bitops header.

Regards,
Sergey

