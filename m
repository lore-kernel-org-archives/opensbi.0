From: Guo Ren <guoren@kernel.org>
Date: Sat, 17 Apr 2021 22:12:57 +0800
Subject: [PATCH 2/2] lib: utils: reset: Add T-HEAD sample platform reset
 driver
In-Reply-To: <DM6PR04MB62012E67639F4261853EF5648D4B9@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <1618285442-84580-1-git-send-email-guoren@kernel.org>
 <1618285442-84580-2-git-send-email-guoren@kernel.org>
 <DM6PR04MB62012E67639F4261853EF5648D4B9@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <CAJF2gTST0oyvo=Q+b6yCQwmdcmSjuzJhJuC+NSOqY5ON3TPUkw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thx Anup,

On Sat, Apr 17, 2021 at 7:35 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: guoren at kernel.org <guoren@kernel.org>
> > Sent: 13 April 2021 09:14
> > To: guoren at kernel.org; Alistair Francis <Alistair.Francis@wdc.com>;
> > anup at brainfault.org
> > Cc: opensbi at lists.infradead.org; Guo Ren <guoren@linux.alibaba.com>;
> > Anup Patel <Anup.Patel@wdc.com>; Atish Patra <Atish.Patra@wdc.com>;
> > Xiang W <wxjstz@126.com>; Bin Meng <bmeng.cn@gmail.com>
> > Subject: [PATCH 2/2] lib: utils: reset: Add T-HEAD sample platform reset
> > driver
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This driver is for T-HEAD test chip, fpga. It could work with all T-HEAD riscv
> > processors: C9xx series.
> >
> > example1: (Using io-regs for reset)
> > reset: reset-sample {
> >       compatible = "thead,reset-sample";
> >       plic-delegate = <0xff 0xd81ffffc>;
> >       entry-reg = <0xff 0xff019050>;
> >       entry-cnt = <4>;
> >       control-reg = <0xff 0xff015004>;
> >       control-val = <0x1c>;
> >       csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>; };
> >
> > example2: (Using csr-regs for reset)
> > reset: reset-sample {
> >       compatible = "thead,reset-sample";
> >       plic-delegate = <0xff 0xd81ffffc>;
> >       using-csr-reset;
> >       csr-copy = <0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc
> >                   0x3b0 0x3b1 0x3b2 0x3b3
> >                   0x3b4 0x3b5 0x3b6 0x3b7
> >                   0x3a0>;
> > };
> >
> > example3: (Only delegate plic enable to S-mode)
> > reset: reset-sample {
> >       compatible = "thead,reset-sample";
> >       plic-delegate = <0xff 0xd81ffffc>;
> > };
> >
> > After this patch, all T-HEAD c9xx would use platform/generic with
> > fw_dynamic as default:
> >
> > CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic FW_PIC=y
> > /usr/bin/make
> >
> > dts full example:
> >       cpus {
> >               #address-cells = <1>;
> >               #size-cells = <0>;
> >               timebase-frequency = <0x2dc6c0>;
> >               cpu at 0 {
> >                       device_type = "cpu";
> >                       reg = <0>;
> >                       status = "okay";
> >                       compatible = "riscv";
> >                       riscv,isa = "rv64imafdcsu";
> >                       mmu-type = "riscv,sv39";
> >                       cpu0_intc: interrupt-controller {
> >                               #interrupt-cells = <1>;
> >                               compatible = "riscv,cpu-intc";
> >                               interrupt-controller;
> >                       };
> >               };
> >               cpu at 1 {
> >                       device_type = "cpu";
> >                       reg = <1>;
> >                       status = "fail";
> >                       compatible = "riscv";
> >                       riscv,isa = "rv64imafdcsu";
> >                       mmu-type = "riscv,sv39";
> >                       cpu1_intc: interrupt-controller {
> >                               #interrupt-cells = <1>;
> >                               compatible = "riscv,cpu-intc";
> >                               interrupt-controller;
> >                       };
> >               };
> >               cpu at 2 {
> >                       device_type = "cpu";
> >                       reg = <2>;
> >                       status = "fail";
> >                       compatible = "riscv";
> >                       riscv,isa = "rv64imafdcsu";
> >                       mmu-type = "riscv,sv39";
> >                       cpu2_intc: interrupt-controller {
> >                               #interrupt-cells = <1>;
> >                               compatible = "riscv,cpu-intc";
> >                               interrupt-controller;
> >                       };
> >               };
> >               cpu at 3 {
> >                       device_type = "cpu";
> >                       reg = <3>;
> >                       status = "fail";
> >                       compatible = "riscv";
> >                       riscv,isa = "rv64imafdcsu";
> >                       mmu-type = "riscv,sv39";
> >                       cpu3_intc: interrupt-controller {
> >                               #interrupt-cells = <1>;
> >                               compatible = "riscv,cpu-intc";
> >                               interrupt-controller;
> >                       };
> >               };
> >       };
> >
> >       soc {
> >               #address-cells = <2>;
> >               #size-cells = <2>;
> >               compatible = "simple-bus";
> >               ranges;
> >
> >               reset: reset-sample {
> >                       compatible = "thead,reset-sample";
> >                       plic-delegate = <0xff 0xd81ffffc>;
> >                       using-csr-reset;
> >                       csr-copy = <
> >                               0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc
> >                               0x3b0 0x3b1 0x3b2 0x3b3
> >                               0x3b4 0x3b5 0x3b6 0x3b7
> >                               0x3a0
> >                               >;
> >               };
> >
> >               clint0: clint at ffdc000000 {
> >                       compatible = "riscv,clint0";
> >                       interrupts-extended = <
> >                               &cpu0_intc  3 &cpu0_intc  7
> >                               &cpu1_intc  3 &cpu1_intc  7
> >                               &cpu2_intc  3 &cpu2_intc  7
> >                               &cpu3_intc  3 &cpu3_intc  7
> >                               &cpu4_intc  3 &cpu4_intc  7
> >                               >;
> >                       reg = <0xff 0xdc000000 0x0 0x04000000>;
> >                       clint,has-no-64bit-mmio;
> >               };
> >
> >               intc: interrupt-controller at ffd8000000 {
> >                       #interrupt-cells = <1>;
> >                       compatible = "riscv,plic0";
> >                       interrupt-controller;
> >                       interrupts-extended = <
> >                               &cpu0_intc  0xffffffff &cpu0_intc  9
> >                               &cpu1_intc  0xffffffff &cpu1_intc  9
> >                               &cpu2_intc  0xffffffff &cpu2_intc  9
> >                               &cpu3_intc  0xffffffff &cpu3_intc  9
> >                               >;
> >                       reg = <0xff 0xd8000000 0x0 0x04000000>;
> >                       reg-names = "control";
> >                       riscv,max-priority = <7>;
> >                       riscv,ndev = <80>;
> >               };
> >       }
> >
> > The platform/thead will be deprecated.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > Cc: Xiang W <wxjstz@126.com>
> > Cc: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >  lib/utils/reset/fdt_reset.c           |   2 +
> >  lib/utils/reset/fdt_reset_thead.c     | 117
> > ++++++++++++++++++++++++++++++++++
> >  lib/utils/reset/fdt_reset_thead.h     |  25 ++++++++
> >  lib/utils/reset/fdt_reset_thead_asm.S |  47 ++++++++++++++
> >  lib/utils/reset/objects.mk            |   2 +
> >  5 files changed, 193 insertions(+)
> >  create mode 100644 lib/utils/reset/fdt_reset_thead.c  create mode 100644
> > lib/utils/reset/fdt_reset_thead.h  create mode 100644
> > lib/utils/reset/fdt_reset_thead_asm.S
> >
> > diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c index
> > dead8a3..82532c2 100644
> > --- a/lib/utils/reset/fdt_reset.c
> > +++ b/lib/utils/reset/fdt_reset.c
> > @@ -13,10 +13,12 @@
> >
> >  extern struct fdt_reset fdt_reset_sifive;  extern struct fdt_reset
> > fdt_reset_htif;
> > +extern struct fdt_reset fdt_reset_thead;
> >
> >  static struct fdt_reset *reset_drivers[] = {
> >       &fdt_reset_sifive,
> >       &fdt_reset_htif,
> > +     &fdt_reset_thead,
> >  };
> >
> >  static struct fdt_reset *current_driver = NULL; diff --git
> > a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
> > new file mode 100644
> > index 0000000..12eb1fc
> > --- /dev/null
> > +++ b/lib/utils/reset/fdt_reset_thead.c
> > @@ -0,0 +1,117 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause  */
> > +
>
> Move most of the includes from fdt_reset_thead.h to here.
>
> Keep includes in fdt_reset_thead.h to minimum.
Okay

>
> > +#include "fdt_reset_thead.h"
> > +
> > +struct custom_csr custom_csr[MAX_CUSTOM_CSR];
> > +
> > +#define CSR_OPCODE 0x39073
> > +static void clone_csrs(int cnt)
> > +{
> > +     unsigned long i;
> > +
> > +     for (i = 0; i < cnt; i++) {
> > +             /* Write csr BIT[31 - 20] to stub */
> > +             __reset_thead_csr_stub[3*i + 1] =
> > +                             CSR_OPCODE | (custom_csr[i].index << 20);
> > +
> > +             /* Mask csr BIT[31 - 20] */
> > +             *(u32 *)&__fdt_reset_thead_csrr &= BIT(20) - 1;
> > +             smp_mb();
> > +
> > +             /* Write csr BIT[31 - 20] to __fdt_reset_thead_csrr */
> > +             *(u32 *)&__fdt_reset_thead_csrr |= custom_csr[i].index <<
> > 20;
> > +             smp_mb();
> > +
> > +             __asm__ __volatile__("fence.i\n":::"memory");
>
> Please add macro in sbi/riscv_barrier.h for this and use it here.
Okay

>
> > +
> > +             custom_csr[i].value = __fdt_reset_thead_csrr();
> > +     }
> > +}
> > +
> > +extern void __thead_pre_start_warm(void); static int
> > +thead_reset_init(void *fdt, int nodeoff,
> > +                              const struct fdt_match *match)
> > +{
> > +     void *p;
> > +     const fdt64_t *val;
> > +     const fdt32_t *val_w;
> > +     int len, i, cnt;
> > +     u32 tmp = 0;
> > +
> > +     /* Prepare clone csrs */
> > +     val_w = fdt_getprop(fdt, nodeoff, "csr-copy", &len);
> > +     if (len > 0 && val_w) {
> > +             cnt = len / sizeof(fdt32_t);
> > +
> > +             if (cnt > MAX_CUSTOM_CSR)
> > +                     sbi_hart_hang();
> > +
> > +             for (i = 0; i < cnt; i++) {
> > +                     custom_csr[i].index = fdt32_to_cpu(val_w[i]);
> > +             }
> > +     }
> > +
> > +     if (cnt)
> > +             clone_csrs(cnt);
> > +
> > +     /* Delegate plic enable regs for S-mode */
> > +     val = fdt_getprop(fdt, nodeoff, "plic-delegate", &len);
> > +     if (len > 0 && val) {
> > +             p = (void *)fdt64_to_cpu(*val);
> > +             writel(BIT(0), p);
> > +     }
> > +
> > +     /* Old reset method for secondary harts */
> > +     if (fdt_getprop(fdt, nodeoff, "using-csr-reset", &len)) {
> > +             csr_write(0x7c7, (u64)&__thead_pre_start_warm);
> > +             csr_write(0x7c6, -1);
> > +     }
> > +
> > +     /* Custom reset method for secondary harts */
> > +     val = fdt_getprop(fdt, nodeoff, "entry-reg", &len);
> > +     if (len > 0 && val) {
> > +             p = (void *)fdt64_to_cpu(*val);
> > +
> > +             val_w = fdt_getprop(fdt, nodeoff, "entry-cnt", &len);
> > +             if (len > 0 && val_w) {
> > +                     tmp = fdt32_to_cpu(*val_w);
> > +
> > +                     for (i = 0; i < tmp; i++) {
> > +                             writel((u64)(&__thead_pre_start_warm), p +
> > 8*i);
> > +                             writel((u64)(&__thead_pre_start_warm) >>
> > 32, p + 8*i + 4);
> > +                     }
> > +             }
> > +
> > +             val = fdt_getprop(fdt, nodeoff, "control-reg", &len);
> > +             if (len > 0 && val) {
> > +                     p = (void *)fdt64_to_cpu(*val);
> > +
> > +                     val_w = fdt_getprop(fdt, nodeoff, "control-val",
> > &len);
> > +                     if (len > 0 && val_w) {
> > +                             tmp = fdt32_to_cpu(*val_w);
> > +                             tmp |= readl(p);
> > +                             writel(tmp, p);
> > +                     }
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +void thead_system_reset(u32 type, u32 reason) {
> > +     __asm__ __volatile__("ebreak\n");
>
> Add a macro in sbi/riscv_asm.h for "ebreak" and use it here.
Okay

>
> > +}
> > +
> > +static const struct fdt_match thead_reset_match[] = {
> > +     { .compatible = "thead,reset-sample" },
> > +     { },
> > +};
> > +
> > +struct fdt_reset fdt_reset_thead = {
> > +     .match_table = thead_reset_match,
> > +     .init = thead_reset_init,
> > +     .system_reset = thead_system_reset
>
> We need system_reset_check() callback to be implemented here otherwise
> your system_reset() callback will not be called.
>
> > +};
> > diff --git a/lib/utils/reset/fdt_reset_thead.h
> > b/lib/utils/reset/fdt_reset_thead.h
> > new file mode 100644
> > index 0000000..dbd76ad
> > --- /dev/null
> > +++ b/lib/utils/reset/fdt_reset_thead.h
> > @@ -0,0 +1,25 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause  */
>
> Need header protection defines here.
>
> #ifndef __FDT_RESET_THEAD__
> #define __FDT_RESET_THEAD__
>
> And one extra "#endif" at end of the file.
Yes, I'll correct it.

>
> > +
> > +#define MAX_CUSTOM_CSR       32
> > +
> > +#ifndef __ASSEMBLER__
> > +#include <libfdt.h>
> > +#include <sbi/riscv_io.h>
> > +#include <sbi/sbi_bitops.h>
> > +#include <sbi/sbi_hart.h>
> > +#include <sbi/sbi_scratch.h>
> > +#include <sbi_utils/fdt/fdt_helper.h>
> > +#include <sbi_utils/reset/fdt_reset.h>
> > +
> > +struct custom_csr {
> > +     unsigned long index;
> > +     unsigned long value;
> > +};
> > +
> > +u64  __fdt_reset_thead_csrr(void);
> > +
> > +extern struct custom_csr custom_csr[MAX_CUSTOM_CSR]; extern u32
> > +__reset_thead_csr_stub[]; #endif
> > diff --git a/lib/utils/reset/fdt_reset_thead_asm.S
> > b/lib/utils/reset/fdt_reset_thead_asm.S
> > new file mode 100644
> > index 0000000..8237951
> > --- /dev/null
> > +++ b/lib/utils/reset/fdt_reset_thead_asm.S
> > @@ -0,0 +1,47 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause  */
> > +
> > +#include <sbi/riscv_asm.h>
> > +#include "fdt_reset_thead.h"
> > +
> > +/*
> > + * csrrs rd, csr, rs1
> > + * |31   20|19   15|14   12|11  7|6       0|
> > + *    csr     rs1     010     rd   1110011
> > + */
> > +#define CSR_STUB     addi    x0, x0, 0
> > +
> > +     .option norvc
> > +     .align 3
> > +     .global __fdt_reset_thead_csrr
> > +__fdt_reset_thead_csrr:
> > +     csrrs a0, 0, x0
> > +     ret
> > +
> > +     .align 3
> > +     .global __thead_pre_start_warm
> > +__thead_pre_start_warm:
> > +     /*
> > +      * Clear L1 cache & BTB & BHT ...
> > +      */
> > +     li      t1, 0x70013
> > +     csrw    0x7c2, t1
> > +     fence rw,rw
> > +
> > +     lla     t1, custom_csr
> > +
> > +     .global __reset_thead_csr_stub
> > +__reset_thead_csr_stub:
> > +.rept        MAX_CUSTOM_CSR
> > +     REG_L   t2, 8(t1)
> > +     CSR_STUB
> > +     addi    t1, t1, 16
> > +.endr
> > +     /*
> > +      * Clear L1 cache & BTB & BHT ...
> > +      */
> > +     li      t1, 0x70013
> > +     csrw    0x7c2, t1
> > +     fence rw,rw
> > +     j _start_warm
> > diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk index
> > b447261..b6619f4 100644
> > --- a/lib/utils/reset/objects.mk
> > +++ b/lib/utils/reset/objects.mk
> > @@ -10,3 +10,5 @@
> >  libsbiutils-objs-y += reset/fdt_reset.o  libsbiutils-objs-y +=
> > reset/fdt_reset_htif.o  libsbiutils-objs-y += reset/fdt_reset_sifive.o
> > +libsbiutils-objs-y += reset/fdt_reset_thead.o libsbiutils-objs-y +=
> > +reset/fdt_reset_thead_asm.o
> > --
> > 2.7.4
>
> Regards,
> Anup
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

