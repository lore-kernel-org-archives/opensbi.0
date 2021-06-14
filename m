From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:05:07 +0800
Subject: [PATCH 6/6] platform: Replace CLINT library usage with ACLINT
 library
In-Reply-To: <20210612160321.330638-7-anup.patel@wdc.com>
References: <20210612160321.330638-1-anup.patel@wdc.com>
 <20210612160321.330638-7-anup.patel@wdc.com>
Message-ID: <CAEUhbmXE2XP3zVVgaKLEhvi_O7DGO2fxKJwhYFDaRhpd2U=jmA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jun 13, 2021 at 12:04 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The ACLINT devices are backward compatible with SiFive CLINT
> so we replace all CLINT library usage in various platforms
> with ACLINT library. As a result of this replacement, the
> CLINT library is not used by any part of OpenSBI hence we
> remove it.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi_utils/sys/clint.h      |  41 -----
>  lib/utils/sys/clint.c              | 256 -----------------------------
>  lib/utils/sys/objects.mk           |   1 -
>  platform/fpga/ariane/platform.c    |  26 ++-
>  platform/fpga/openpiton/platform.c |  32 +++-
>  platform/kendryte/k210/platform.c  |  23 ++-
>  platform/kendryte/k210/platform.h  |   3 +
>  platform/nuclei/ux600/platform.c   |  27 ++-
>  platform/template/platform.c       |  30 +++-
>  9 files changed, 102 insertions(+), 337 deletions(-)
>  delete mode 100644 include/sbi_utils/sys/clint.h
>  delete mode 100644 lib/utils/sys/clint.c
>
> diff --git a/include/sbi_utils/sys/clint.h b/include/sbi_utils/sys/clint.h
> deleted file mode 100644
> index 1e2b40b..0000000
> --- a/include/sbi_utils/sys/clint.h
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -/*
> - * SPDX-License-Identifier: BSD-2-Clause
> - *
> - * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> - *
> - * Authors:
> - *   Anup Patel <anup.patel@wdc.com>
> - */
> -
> -#ifndef __SYS_CLINT_H__
> -#define __SYS_CLINT_H__
> -
> -#include <sbi/sbi_types.h>
> -
> -struct clint_data {
> -       /* Public details */
> -       unsigned long addr;
> -       u32 first_hartid;
> -       u32 hart_count;
> -       bool has_64bit_mmio;
> -       /* Private details (initialized and used by CLINT library)*/
> -       u32 *ipi;
> -       struct clint_data *time_delta_reference;
> -       unsigned long time_delta_computed;
> -       u64 time_delta;
> -       u64 *time_val;
> -       u64 *time_cmp;
> -       u64 (*time_rd)(volatile u64 *addr);
> -       void (*time_wr)(u64 value, volatile u64 *addr);
> -};
> -
> -int clint_warm_ipi_init(void);
> -
> -int clint_cold_ipi_init(struct clint_data *clint);
> -
> -int clint_warm_timer_init(void);
> -
> -int clint_cold_timer_init(struct clint_data *clint,
> -                         struct clint_data *reference);
> -
> -#endif
> diff --git a/lib/utils/sys/clint.c b/lib/utils/sys/clint.c
> deleted file mode 100644
> index e8c2bd9..0000000
> --- a/lib/utils/sys/clint.c
> +++ /dev/null
> @@ -1,256 +0,0 @@
> -/*
> - * SPDX-License-Identifier: BSD-2-Clause
> - *
> - * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> - *
> - * Authors:
> - *   Anup Patel <anup.patel@wdc.com>
> - */
> -
> -#include <sbi/riscv_asm.h>
> -#include <sbi/riscv_atomic.h>
> -#include <sbi/riscv_io.h>
> -#include <sbi/sbi_domain.h>
> -#include <sbi/sbi_error.h>
> -#include <sbi/sbi_hartmask.h>
> -#include <sbi/sbi_ipi.h>
> -#include <sbi/sbi_timer.h>
> -#include <sbi_utils/sys/clint.h>
> -
> -#define CLINT_IPI_OFF          0
> -#define CLINT_IPI_SIZE         0x4000
> -
> -#define CLINT_TIME_CMP_OFF     0x4000
> -#define CLINT_TIME_CMP_SIZE    0x4000
> -
> -#define CLINT_TIME_VAL_OFF     0xbff8
> -#define CLINT_TIME_VAL_SIZE    0x4000
> -
> -static struct clint_data *clint_ipi_hartid2data[SBI_HARTMASK_MAX_BITS];
> -
> -static void clint_ipi_send(u32 target_hart)
> -{
> -       struct clint_data *clint;
> -
> -       if (SBI_HARTMASK_MAX_BITS <= target_hart)
> -               return;
> -       clint = clint_ipi_hartid2data[target_hart];
> -       if (!clint)
> -               return;
> -
> -       /* Set CLINT IPI */
> -       writel(1, &clint->ipi[target_hart - clint->first_hartid]);
> -}
> -
> -static void clint_ipi_clear(u32 target_hart)
> -{
> -       struct clint_data *clint;
> -
> -       if (SBI_HARTMASK_MAX_BITS <= target_hart)
> -               return;
> -       clint = clint_ipi_hartid2data[target_hart];
> -       if (!clint)
> -               return;
> -
> -       /* Clear CLINT IPI */
> -       writel(0, &clint->ipi[target_hart - clint->first_hartid]);
> -}
> -
> -static struct sbi_ipi_device clint_ipi = {
> -       .name = "clint",
> -       .ipi_send = clint_ipi_send,
> -       .ipi_clear = clint_ipi_clear
> -};
> -
> -int clint_warm_ipi_init(void)
> -{
> -       /* Clear CLINT IPI for current HART */
> -       clint_ipi_clear(current_hartid());
> -
> -       return 0;
> -}
> -
> -int clint_cold_ipi_init(struct clint_data *clint)
> -{
> -       u32 i;
> -       int rc;
> -       struct sbi_domain_memregion reg;
> -
> -       if (!clint)
> -               return SBI_EINVAL;
> -
> -       /* Initialize private data */
> -       clint->ipi = (void *)clint->addr;
> -
> -       /* Update IPI hartid table */
> -       for (i = 0; i < clint->hart_count; i++)
> -               clint_ipi_hartid2data[clint->first_hartid + i] = clint;
> -
> -       /* Add CLINT ipi region to the root domain */
> -       sbi_domain_memregion_init(clint->addr + CLINT_IPI_OFF,
> -                                 CLINT_IPI_SIZE,
> -                                 SBI_DOMAIN_MEMREGION_MMIO, &reg);
> -       rc = sbi_domain_root_add_memregion(&reg);
> -       if (rc)
> -               return rc;
> -
> -       sbi_ipi_set_device(&clint_ipi);
> -
> -       return 0;
> -}
> -
> -static struct clint_data *clint_timer_hartid2data[SBI_HARTMASK_MAX_BITS];
> -
> -#if __riscv_xlen != 32
> -static u64 clint_time_rd64(volatile u64 *addr)
> -{
> -       return readq_relaxed(addr);
> -}
> -
> -static void clint_time_wr64(u64 value, volatile u64 *addr)
> -{
> -       writeq_relaxed(value, addr);
> -}
> -#endif
> -
> -static u64 clint_time_rd32(volatile u64 *addr)
> -{
> -       u32 lo, hi;
> -
> -       do {
> -               hi = readl_relaxed((u32 *)addr + 1);
> -               lo = readl_relaxed((u32 *)addr);
> -       } while (hi != readl_relaxed((u32 *)addr + 1));
> -
> -       return ((u64)hi << 32) | (u64)lo;
> -}
> -
> -static void clint_time_wr32(u64 value, volatile u64 *addr)
> -{
> -       u32 mask = -1U;
> -
> -       writel_relaxed(value & mask, (void *)(addr));
> -       writel_relaxed(value >> 32, (void *)(addr) + 0x04);
> -}
> -
> -static u64 clint_timer_value(void)
> -{
> -       struct clint_data *clint = clint_timer_hartid2data[current_hartid()];
> -
> -       /* Read CLINT Time Value */
> -       return clint->time_rd(clint->time_val) + clint->time_delta;
> -}
> -
> -static void clint_timer_event_stop(void)
> -{
> -       u32 target_hart = current_hartid();
> -       struct clint_data *clint = clint_timer_hartid2data[target_hart];
> -
> -       /* Clear CLINT Time Compare */
> -       clint->time_wr(-1ULL,
> -                       &clint->time_cmp[target_hart - clint->first_hartid]);
> -}
> -
> -static void clint_timer_event_start(u64 next_event)
> -{
> -       u32 target_hart = current_hartid();
> -       struct clint_data *clint = clint_timer_hartid2data[target_hart];
> -
> -       /* Program CLINT Time Compare */
> -       clint->time_wr(next_event - clint->time_delta,
> -                      &clint->time_cmp[target_hart - clint->first_hartid]);
> -}
> -
> -static struct sbi_timer_device clint_timer = {
> -       .name = "clint",
> -       .timer_value = clint_timer_value,
> -       .timer_event_start = clint_timer_event_start,
> -       .timer_event_stop = clint_timer_event_stop
> -};
> -
> -int clint_warm_timer_init(void)
> -{
> -       u64 v1, v2, mv;
> -       u32 target_hart = current_hartid();
> -       struct clint_data *reference;
> -       struct clint_data *clint = clint_timer_hartid2data[target_hart];
> -
> -       if (!clint)
> -               return SBI_ENODEV;
> -
> -       /*
> -        * Compute delta if reference available
> -        *
> -        * We deliberately compute time_delta in warm init so that time_delta
> -        * is computed on a HART which is going to use given CLINT. We use
> -        * atomic flag timer_delta_computed to ensure that only one HART does
> -        * time_delta computation.
> -        */
> -       if (clint->time_delta_reference) {
> -               reference = clint->time_delta_reference;
> -               if (!atomic_raw_xchg_ulong(&clint->time_delta_computed, 1)) {
> -                       v1 = clint->time_rd(clint->time_val);
> -                       mv = reference->time_rd(reference->time_val);
> -                       v2 = clint->time_rd(clint->time_val);
> -                       clint->time_delta = mv - ((v1 / 2) + (v2 / 2));
> -               }
> -       }
> -
> -       /* Clear CLINT Time Compare */
> -       clint->time_wr(-1ULL,
> -                      &clint->time_cmp[target_hart - clint->first_hartid]);
> -
> -       return 0;
> -}
> -
> -int clint_cold_timer_init(struct clint_data *clint,
> -                         struct clint_data *reference)
> -{
> -       u32 i;
> -       int rc;
> -       struct sbi_domain_memregion reg;
> -
> -       if (!clint)
> -               return SBI_EINVAL;
> -
> -       /* Initialize private data */
> -       clint->time_delta_reference = reference;
> -       clint->time_delta_computed = 0;
> -       clint->time_delta = 0;
> -       clint->time_val = (u64 *)((void *)clint->addr + CLINT_TIME_VAL_OFF);
> -       clint->time_cmp = (u64 *)((void *)clint->addr + CLINT_TIME_CMP_OFF);
> -       clint->time_rd = clint_time_rd32;
> -       clint->time_wr = clint_time_wr32;
> -
> -       /* Override read/write accessors for 64bit MMIO */
> -#if __riscv_xlen != 32
> -       if (clint->has_64bit_mmio) {
> -               clint->time_rd = clint_time_rd64;
> -               clint->time_wr = clint_time_wr64;
> -       }
> -#endif
> -
> -       /* Update timer hartid table */
> -       for (i = 0; i < clint->hart_count; i++)
> -               clint_timer_hartid2data[clint->first_hartid + i] = clint;
> -
> -       /* Add CLINT mtime region to the root domain */
> -       sbi_domain_memregion_init(clint->addr + CLINT_TIME_VAL_OFF,
> -                                 CLINT_TIME_VAL_SIZE,
> -                                 SBI_DOMAIN_MEMREGION_MMIO, &reg);
> -       rc = sbi_domain_root_add_memregion(&reg);
> -       if (rc)
> -               return rc;
> -
> -       /* Add CLINT timecmp region to the root domain */
> -       sbi_domain_memregion_init(clint->addr + CLINT_TIME_CMP_OFF,
> -                                 CLINT_TIME_CMP_SIZE,
> -                                 SBI_DOMAIN_MEMREGION_MMIO, &reg);
> -       rc = sbi_domain_root_add_memregion(&reg);
> -       if (rc)
> -               return rc;
> -
> -       sbi_timer_set_device(&clint_timer);
> -
> -       return 0;
> -}
> diff --git a/lib/utils/sys/objects.mk b/lib/utils/sys/objects.mk
> index 7878ca8..06be322 100644
> --- a/lib/utils/sys/objects.mk
> +++ b/lib/utils/sys/objects.mk
> @@ -7,6 +7,5 @@
>  #   Anup Patel <anup.patel@wdc.com>
>  #
>
> -libsbiutils-objs-y += sys/clint.o
>  libsbiutils-objs-y += sys/htif.o
>  libsbiutils-objs-y += sys/sifive_test.o
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index 42e43fa..ec310a4 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -12,9 +12,10 @@
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi_utils/fdt/fdt_fixup.h>
> +#include <sbi_utils/ipi/aclint_mswi.h> +
>  #include <sbi_utils/irqchip/plic.h>
>  #include <sbi_utils/serial/uart8250.h>
> -#include <sbi_utils/sys/clint.h>
> +#include <sbi_utils/timer/aclint_mtimer.h>
>
>  #define ARIANE_UART_ADDR                       0x10000000
>  #define ARIANE_UART_FREQ                       50000000
> @@ -25,14 +26,25 @@
>  #define ARIANE_PLIC_NUM_SOURCES                        3
>  #define ARIANE_HART_COUNT                      1
>  #define ARIANE_CLINT_ADDR                      0x2000000
> +#define ARIANE_ACLINT_MSWI_ADDR                        ARIANE_CLINT_ADDR

nits: for consistency please make this equal to:

(ARIANE_CLINT_ADDR + CLINT_MSWI_OFFSET)

Please do this globally in this patch.

> +#define ARIANE_ACLINT_MTIMER_ADDR              (ARIANE_CLINT_ADDR + \
> +                                                CLINT_MTIMER_OFFSET)
>
>  static struct plic_data plic = {
>         .addr = ARIANE_PLIC_ADDR,
>         .num_src = ARIANE_PLIC_NUM_SOURCES,
>  };
>
> -static struct clint_data clint = {
> -       .addr = ARIANE_CLINT_ADDR,
> +static struct aclint_mswi_data mswi = {
> +       .addr = ARIANE_ACLINT_MSWI_ADDR,
> +       .size = ACLINT_MSWI_SIZE,
> +       .first_hartid = 0,
> +       .hart_count = ARIANE_HART_COUNT,
> +};
> +
> +static struct aclint_mtimer_data mtimer = {
> +       .addr = ARIANE_ACLINT_MTIMER_ADDR,
> +       .size = ACLINT_MTIMER_SIZE,
>         .first_hartid = 0,
>         .hart_count = ARIANE_HART_COUNT,
>         .has_64bit_mmio = TRUE,
> @@ -123,12 +135,12 @@ static int ariane_ipi_init(bool cold_boot)
>         int ret;
>
>         if (cold_boot) {
> -               ret = clint_cold_ipi_init(&clint);
> +               ret = aclint_mswi_cold_init(&mswi);
>                 if (ret)
>                         return ret;
>         }
>
> -       return clint_warm_ipi_init();
> +       return aclint_mswi_warm_init();
>  }
>
>  /*
> @@ -139,12 +151,12 @@ static int ariane_timer_init(bool cold_boot)
>         int ret;
>
>         if (cold_boot) {
> -               ret = clint_cold_timer_init(&clint, NULL);
> +               ret = aclint_mtimer_cold_init(&mtimer, NULL);
>                 if (ret)
>                         return ret;
>         }
>
> -       return clint_warm_timer_init();
> +       return aclint_mtimer_warm_init();
>  }
>

[snip]

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

