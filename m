From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 Nov 2024 14:35:35 +0530
Subject: [PATCH 1/1] platform: Add xiangshan platform
In-Reply-To: <47b9aa64-513e-4094-b6b6-ef988212f1cd@dram.page>
References: <49a23408.4723.1929981ba14.Coremail.qinshaoqing@bosc.ac.cn> <47b9aa64-513e-4094-b6b6-ef988212f1cd@dram.page>
Message-ID: <CAAhSdy32UWgTkkLNgwvhxWm8O1bFBD9kbgi47XyHm1Uj2uEsmQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 18, 2024 at 5:19?PM Vivian Wang <uwu@dram.page> wrote:
>
> On 10/17/24 16:04, Shaoqing Qin wrote:
> > platform: Add xiangshan platform
> >
> > Add  the basic configuration for xiangshan platform.
>
> It seems that there are no platform quirks, so there's no need for a
> separate platform. Just use the generic platform and write a devicetree.
> You'll need one for U-Boot or Linux or FreeBSD etc anyway.
>
> If Xiangshan KMH needs extra drivers for whatever "SYSCTL" is, add them
> as, well, drivers.

I agree. Needing a separate platform instead of re-using generic
platform is unnecessary and needs very good justification.

Regards,
Anup

>
> dram
>
> > Signed-off-by: Shaoqing Qin <qinshaoqing@bosc.ac.cn>
> > ---
> >  platform/xiangshan/kmh/Kconfig           |   9 ++
> >  platform/xiangshan/kmh/configs/defconfig |   0
> >  platform/xiangshan/kmh/objects.mk        |  28 ++++++
> >  platform/xiangshan/kmh/platform.c        | 118 +++++++++++++++++++++++
> >  platform/xiangshan/kmh/platform.h        |  37 +++++++
> >  5 files changed, 192 insertions(+)
> >  create mode 100644 platform/xiangshan/kmh/Kconfig
> >  create mode 100644 platform/xiangshan/kmh/configs/defconfig
> >  create mode 100644 platform/xiangshan/kmh/objects.mk
> >  create mode 100644 platform/xiangshan/kmh/platform.c
> >  create mode 100644 platform/xiangshan/kmh/platform.h
> >
> > diff --git a/platform/xiangshan/kmh/Kconfig b/platform/xiangshan/kmh/Kconfig
> > new file mode 100644
> > index 0000000..b6776f3
> > --- /dev/null
> > +++ b/platform/xiangshan/kmh/Kconfig
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: BSD-2-Clause
> > +
> > +config PLATFORM_KMH
> > +     bool
> > +     select FDT
> > +     select IPI_MSWI
> > +     select SERIAL_UART8250
> > +     select TIMER_MTIMER
> > +     default y
> > diff --git a/platform/xiangshan/kmh/configs/defconfig b/platform/xiangshan/kmh/configs/defconfig
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/platform/xiangshan/kmh/objects.mk b/platform/xiangshan/kmh/objects.mk
> > new file mode 100644
> > index 0000000..8f3e7e1
> > --- /dev/null
> > +++ b/platform/xiangshan/kmh/objects.mk
> > @@ -0,0 +1,28 @@
> > +#
> > +# SPDX-License-Identifier: BSD-2-Clause
> > +#
> > +# Copyright (c) 2024 Beijing Institute of Open Source Chip (BOSC).
> > +#
> > +# Authors:
> > +#   Shaoqing Qin <qinshaoqing@bosc.ac.cn>
> > +#
> > +
> > +# Compiler flags
> > +platform-cppflags-y =
> > +platform-cflags-y =
> > +platform-asflags-y =
> > +platform-ldflags-y =
> > +
> > +# Objects to build
> > +platform-objs-y += platform.o
> > +
> > +# Blobs to build
> > +FW_DYNAMIC=y
> > +FW_JUMP=y
> > +# This needs to be 2MB aligned for 64-bit system
> > +FW_JUMP_OFFSET=0x400000
> > +FW_JUMP_FDT_OFFSET=0x200000
> > +FW_PAYLOAD=y
> > +# This needs to be 2MB aligned for 64-bit system
> > +FW_PAYLOAD_OFFSET=0x400000
> > +FW_PAYLOAD_FDT_OFFSET=$(FW_JUMP_FDT_OFFSET)
> > diff --git a/platform/xiangshan/kmh/platform.c b/platform/xiangshan/kmh/platform.c
> > new file mode 100644
> > index 0000000..9ee037e
> > --- /dev/null
> > +++ b/platform/xiangshan/kmh/platform.c
> > @@ -0,0 +1,118 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2024 Beijing Institute of Open Source Chip (BOSC).
> > + *
> > + * Authors:
> > + *   Shaoqing Qin <qinshaoqing@bosc.ac.cn>
> > + */
> > +
> > +#include <sbi/riscv_asm.h>
> > +#include <sbi/riscv_encoding.h>
> > +#include <sbi/sbi_console.h>
> > +#include <sbi/sbi_const.h>
> > +#include <sbi/sbi_platform.h>
> > +#include <sbi/sbi_system.h>
> > +#include <sbi_utils/fdt/fdt_helper.h>
> > +#include <sbi_utils/fdt/fdt_fixup.h>
> > +#include <sbi_utils/ipi/aclint_mswi.h>
> > +#include <sbi_utils/irqchip/plic.h>
> > +#include <sbi_utils/timer/aclint_mtimer.h>
> > +#include <sbi_utils/serial/uart8250.h>
> > +#include "platform.h"
> > +
> > +static u32 generic_hart_index2id[SBI_HARTMASK_MAX_BITS] = {0};
> > +
> > +static struct aclint_mswi_data mswi = {
> > +     .addr = KMH_ACLINT_MSWI_ADDR,
> > +     .size = ACLINT_MSWI_SIZE,
> > +     .first_hartid = 0,
> > +     .hart_count = KMH_HART_COUNT,
> > +};
> > +
> > +static struct aclint_mtimer_data mtimer = {
> > +     .mtime_freq = KMH_ACLINT_MTIMER_FREQ,
> > +     .mtime_addr = KMH_ACLINT_MTIMER_ADDR +
> > +                   ACLINT_DEFAULT_MTIME_OFFSET,
> > +     .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> > +     .mtimecmp_addr = KMH_ACLINT_MTIMER_ADDR +
> > +                      ACLINT_DEFAULT_MTIMECMP_OFFSET,
> > +     .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
> > +     .first_hartid = 0,
> > +     .hart_count = KMH_HART_COUNT,
> > +     .has_64bit_mmio = true,
> > +};
> > +
> > +static int kmh_early_init(bool cold_boot)
> > +{
> > +     if (!cold_boot)
> > +             return 0;
> > +
> > +     return uart8250_init(KMH_UART_ADDR,
> > +                          KMH_UART_FREQ,
> > +                          KMH_UART_BAUDRATE,
> > +                          KMH_UART_REG_SHIFT,
> > +                          KMH_UART_REG_WIDTH,
> > +                          KMH_UART_REG_OFFSET);
> > +}
> > +
> > +static int kmh_final_init(bool cold_boot)
> > +{
> > +     void *fdt;
> > +
> > +     if (!cold_boot)
> > +             return 0;
> > +
> > +     fdt = fdt_get_address_rw();
> > +
> > +     fdt_cpu_fixup(fdt);
> > +     fdt_fixups(fdt);
> > +
> > +     return 0;
> > +}
> > +
> > +
> > +static int kmh_ipi_init(bool cold_boot)
> > +{
> > +     int ret;
> > +
> > +     if (cold_boot) {
> > +             ret = aclint_mswi_cold_init(&mswi);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return aclint_mswi_warm_init();
> > +}
> > +
> > +static int kmh_timer_init(bool cold_boot)
> > +{
> > +     int ret;
> > +
> > +     if (cold_boot) {
> > +             ret = aclint_mtimer_cold_init(&mtimer, NULL);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return aclint_mtimer_warm_init();
> > +}
> > +
> > +const struct sbi_platform_operations platform_ops = {
> > +     .early_init     = kmh_early_init,
> > +     .final_init     = kmh_final_init,
> > +     .ipi_init  = kmh_ipi_init,
> > +     .timer_init        = kmh_timer_init,
> > +};
> > +
> > +const struct sbi_platform platform = {
> > +     .opensbi_version        = OPENSBI_VERSION,
> > +     .platform_version       = SBI_PLATFORM_VERSION(0x0, 0x01),
> > +     .name                   = "kmh",
> > +     .features               = SBI_PLATFORM_DEFAULT_FEATURES,
> > +     .hart_count             = KMH_HART_COUNT,
> > +     .hart_index2id          = generic_hart_index2id,
> > +     .hart_stack_size        = SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
> > +     .heap_size              = SBI_PLATFORM_DEFAULT_HEAP_SIZE(KMH_HART_COUNT),
> > +     .platform_ops_addr      = (unsigned long)&platform_ops
> > +};
> > diff --git a/platform/xiangshan/kmh/platform.h b/platform/xiangshan/kmh/platform.h
> > new file mode 100644
> > index 0000000..86dee85
> > --- /dev/null
> > +++ b/platform/xiangshan/kmh/platform.h
> > @@ -0,0 +1,37 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2024 Beijing Institute of Open Source Chip (BOSC)
> > + *
> > + * Authors:
> > + *   Shaoqing Qin <qinshaoqing@bosc.ac.cn>
> > + */
> > +#ifndef _KMH_PLATFORM_H_
> > +#define _KMH_PLATFORM_H_
> > +
> > +#include <sbi/riscv_io.h>
> > +
> > +#define KMH_HART_COUNT               1
> > +
> > +#define KMH_UART_ADDR          0x310b0000ULL
> > +#define KMH_UART_FREQ          50000000
> > +#define KMH_UART_BAUDRATE  115200
> > +#define KMH_UART_REG_SHIFT                   2
> > +#define KMH_UART_REG_WIDTH                   4
> > +#define KMH_UART_REG_OFFSET                  0
> > +
> > +#define KMH_ACLINT_MTIMER_FREQ       500000
> > +#define KMH_CLK0_FREQ                26000000UL
> > +#define KMH_PLIC_NUM_SOURCES 65
> > +
> > +/* Registers base address */
> > +#define KMH_SYSCTL_BASE_ADDR 0x50440000ULL
> > +#define KMH_CLINT_BASE_ADDR  0x38000000ULL
> > +#define KMH_ACLINT_MSWI_ADDR \
> > +             (KMH_CLINT_BASE_ADDR + CLINT_MSWI_OFFSET)
> > +#define KMH_ACLINT_MTIMER_ADDR \
> > +             (KMH_CLINT_BASE_ADDR + CLINT_MTIMER_OFFSET)
> > +#define KMH_PLIC_BASE_ADDR   0x0C000000ULL
> > +#define KMH_PLIC_BASE_SIZE   (0x200000ULL + (KMH_HART_COUNT * 0x1000))
> > +
> > +#endif /* _KMH_PLATFORM_H_ */
>
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

