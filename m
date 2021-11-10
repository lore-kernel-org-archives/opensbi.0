From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Wed, 10 Nov 2021 11:12:08 +0300
Subject: [PATCH v3 6/6] platform: sifive_fu740: add platform reset driver
In-Reply-To: <CAAhSdy0fKbQvGmV3O-y3ZqovkuEFsC7SCACYyv4nS19-4_BX8g@mail.gmail.com>
References: <20211109124128.19666-1-nikita.shubin@maquefel.me>
 <20211109124128.19666-7-nikita.shubin@maquefel.me>
 <CAAhSdy0fKbQvGmV3O-y3ZqovkuEFsC7SCACYyv4nS19-4_BX8g@mail.gmail.com>
Message-ID: <20211110111208.6af91f4a@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Anup,

On Wed, 10 Nov 2021 13:35:56 +0530
Anup Patel <anup@brainfault.org> wrote:

> On Tue, Nov 9, 2021 at 6:12 PM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:
> >
> > From: Nikita Shubin <n.shubin@yadro.com>
> >
> > da9063 PMIC can be used to reset/shutdown the
> > Sifive Unmatched board.
> >
> > shutdown is done simply by writing SHUTDOWN bit to
> > DA9063_REG_CONTROL_F register.
> >
> > reset via setting WAKEUP bit in DA9063_REG_CONTROL_F
> > register followed by masking POWER and POWER1 domains
> > and setting STANDBY bit in DA9063_REG_CONTROL_A,
> > originally discovered by Alexandre Ghiti on linux-riscv
> > maillists.
> >
> > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>  
> 
> This separate fdt_reset_da9063.c in platform/generic
> looks odd to me. Since da9063 reset driver is now
> FU740 specific I suggest to move this code in
> generic/sifive_fu740.c and append your copyright
> in generic/sifive_fu740.c
> 

No problem, i'll submit v4 version soon.


> Otherwise, this series looks good.
> 
> Regards,
> Anup
> 
> > ---
> > v2->v3:
> > - moved to platform code
> > - dropped unused defines
> > - dropped configure
> > - dropped separate dts binding
> > - changed priority to hardcoded
> > ---
> >  platform/generic/fdt_reset_da9063.c | 186
> > ++++++++++++++++++++++++++++ platform/generic/objects.mk         |
> >  1 + platform/generic/sifive_fu740.c     |  22 ++++
> >  3 files changed, 209 insertions(+)
> >  create mode 100644 platform/generic/fdt_reset_da9063.c
> >
> > diff --git a/platform/generic/fdt_reset_da9063.c
> > b/platform/generic/fdt_reset_da9063.c new file mode 100644
> > index 0000000..1fe20e2
> > --- /dev/null
> > +++ b/platform/generic/fdt_reset_da9063.c
> > @@ -0,0 +1,186 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 YADRO
> > + *
> > + * Authors:
> > + *   Nikita Shubin <nshubin@yadro.com>
> > + */
> > +
> > +#include <libfdt.h>
> > +#include <sbi/sbi_error.h>
> > +#include <sbi/sbi_console.h>
> > +#include <sbi/sbi_ecall_interface.h>
> > +#include <sbi/sbi_hart.h>
> > +#include <sbi/sbi_system.h>
> > +#include <sbi_utils/fdt/fdt_helper.h>
> > +#include <sbi_utils/i2c/fdt_i2c.h>
> > +#include <sbi_utils/reset/fdt_reset.h>
> > +
> > +#define DA9063_REG_PAGE_CON            0x00
> > +#define DA9063_REG_CONTROL_A           0x0e
> > +#define DA9063_REG_CONTROL_F           0x13
> > +#define DA9063_REG_DEVICE_ID           0x81
> > +
> > +#define DA9063_CONTROL_A_M_POWER1_EN   (1 << 6)
> > +#define DA9063_CONTROL_A_M_POWER_EN    (1 << 5)
> > +#define DA9063_CONTROL_A_STANDBY       (1 << 3)
> > +
> > +#define DA9063_CONTROL_F_WAKEUP                (1 << 2)
> > +#define DA9063_CONTROL_F_SHUTDOWN      (1 << 1)
> > +
> > +#define PMIC_CHIP_ID_DA9063            0x61
> > +
> > +static struct {
> > +       struct i2c_adapter *adapter;
> > +       uint32_t reg;
> > +} da9063;
> > +
> > +static int da9063_system_reset_check(u32 type, u32 reason)
> > +{
> > +       switch (type) {
> > +       case SBI_SRST_RESET_TYPE_SHUTDOWN:
> > +               return 1;
> > +       case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> > +       case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> > +               return 255;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static inline int da9063_sanity_check(struct i2c_adapter *adap,
> > uint32_t reg) +{
> > +       uint8_t val;
> > +       int rc = i2c_adapter_reg_write(adap, reg,
> > DA9063_REG_PAGE_CON, 0x02); +
> > +       if (rc)
> > +               return rc;
> > +
> > +       /* check set page*/
> > +       rc = i2c_adapter_reg_read(adap, reg, 0x0, &val);
> > +       if (rc)
> > +               return rc;
> > +
> > +       if (val != 0x02)
> > +               return SBI_ENODEV;
> > +
> > +       /* read and check device id */
> > +       rc = i2c_adapter_reg_read(adap, reg, DA9063_REG_DEVICE_ID,
> > &val);
> > +       if (rc)
> > +               return rc;
> > +
> > +       if (val != PMIC_CHIP_ID_DA9063)
> > +               return SBI_ENODEV;
> > +
> > +       return 0;
> > +}
> > +
> > +static inline int da9063_shutdown(struct i2c_adapter *adap,
> > uint32_t reg) +{
> > +       int rc = i2c_adapter_reg_write(adap, da9063.reg,
> > DA9063_REG_PAGE_CON, 0x00); +
> > +       if (rc)
> > +               return rc;
> > +
> > +       return i2c_adapter_reg_write(adap, da9063.reg,
> > +                               DA9063_REG_CONTROL_F,
> > DA9063_CONTROL_F_SHUTDOWN); +}
> > +
> > +static inline int da9063_reset(struct i2c_adapter *adap, uint32_t
> > reg) +{
> > +       int rc = i2c_adapter_reg_write(adap, da9063.reg,
> > DA9063_REG_PAGE_CON, 0x00); +
> > +       if (rc)
> > +               return rc;
> > +
> > +       rc = i2c_adapter_reg_write(adap, da9063.reg,
> > +                             DA9063_REG_CONTROL_F,
> > DA9063_CONTROL_F_WAKEUP);
> > +       if (rc)
> > +               return rc;
> > +
> > +       return i2c_adapter_reg_write(adap, da9063.reg,
> > +                               DA9063_REG_CONTROL_A,
> > +                               DA9063_CONTROL_A_M_POWER1_EN |
> > +                               DA9063_CONTROL_A_M_POWER_EN |
> > +                               DA9063_CONTROL_A_STANDBY);
> > +}
> > +
> > +static void da9063_system_reset(u32 type, u32 reason)
> > +{
> > +       struct i2c_adapter *adap = da9063.adapter;
> > +       uint32_t reg = da9063.reg;
> > +       int rc;
> > +
> > +       if (adap) {
> > +               /* sanity check */
> > +               rc = da9063_sanity_check(adap, reg);
> > +               if (rc) {
> > +                       sbi_printf("%s: chip is not da9063 PMIC\n",
> > __func__);
> > +                       goto skip_reset;
> > +               }
> > +
> > +               switch (type) {
> > +               case SBI_SRST_RESET_TYPE_SHUTDOWN:
> > +                       da9063_shutdown(adap, reg);
> > +                       break;
> > +               case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> > +               case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> > +                       da9063_reset(adap, reg);
> > +                       break;
> > +               }
> > +
> > +               while
> > +                       (1);
> > +skip_reset:
> > +       }
> > +
> > +       sbi_hart_hang();
> > +}
> > +
> > +static struct sbi_system_reset_device da9063_reset_i2c = {
> > +       .name = "da9063-reset",
> > +       .system_reset_check = da9063_system_reset_check,
> > +       .system_reset = da9063_system_reset
> > +};
> > +
> > +static int da9063_reset_init(void *fdt, int nodeoff,
> > +                          const struct fdt_match *match)
> > +{
> > +       int rc, i2c_bus;
> > +       struct i2c_adapter *adapter;
> > +       uint64_t addr;
> > +
> > +       /* we are dlg,da9063 node */
> > +       rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
> > +       if (rc)
> > +               return rc;
> > +
> > +       da9063.reg = addr;
> > +
> > +       /* find i2c bus parent node */
> > +       i2c_bus = fdt_parent_offset(fdt, nodeoff);
> > +       if (i2c_bus < 0)
> > +               return i2c_bus;
> > +
> > +       /* i2c adapter get */
> > +       rc = fdt_i2c_adapter_get(fdt, i2c_bus, &adapter);
> > +       if (rc)
> > +               return rc;
> > +
> > +       da9063.adapter = adapter;
> > +
> > +       sbi_system_reset_add_device(&da9063_reset_i2c);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct fdt_match da9063_reset_match[] = {
> > +       { .compatible = "dlg,da9063", .data = (void *)TRUE },
> > +       { },
> > +};
> > +
> > +struct fdt_reset fdt_reset_da9063 = {
> > +       .match_table = da9063_reset_match,
> > +       .init = da9063_reset_init,
> > +};
> > diff --git a/platform/generic/objects.mk
> > b/platform/generic/objects.mk index cb15a18..596b4c9 100644
> > --- a/platform/generic/objects.mk
> > +++ b/platform/generic/objects.mk
> > @@ -10,3 +10,4 @@
> >  platform-objs-y += platform.o
> >  platform-objs-y += sifive_fu540.o
> >  platform-objs-y += sifive_fu740.o
> > +platform-objs-y += fdt_reset_da9063.o
> > diff --git a/platform/generic/sifive_fu740.c
> > b/platform/generic/sifive_fu740.c index c8325d3..f489f40 100644
> > --- a/platform/generic/sifive_fu740.c
> > +++ b/platform/generic/sifive_fu740.c
> > @@ -8,8 +8,14 @@
> >   */
> >
> >  #include <platform_override.h>
> > +#include <sbi/sbi_error.h>
> > +#include <sbi/sbi_system.h>
> > +#include <sbi/sbi_console.h>
> >  #include <sbi_utils/fdt/fdt_helper.h>
> >  #include <sbi_utils/fdt/fdt_fixup.h>
> > +#include <sbi_utils/reset/fdt_reset.h>
> > +
> > +extern struct fdt_reset fdt_reset_da9063;
> >
> >  static u64 sifive_fu740_tlbr_flush_limit(const struct fdt_match
> > *match) {
> > @@ -23,6 +29,21 @@ static u64 sifive_fu740_tlbr_flush_limit(const
> > struct fdt_match *match) return 0;
> >  }
> >
> > +static int sifive_fu740_final_init(bool cold_boot, const struct
> > fdt_match *) +{
> > +       int rc;
> > +       void *fdt = fdt_get_address();
> > +
> > +       if (cold_boot) {
> > +               rc = fdt_reset_driver_init(fdt, &fdt_reset_da9063);
> > +               if (rc)
> > +                       sbi_printf("%s: failed to find da9063 for
> > reset\n",
> > +                                  __func__);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct fdt_match sifive_fu740_match[] = {
> >         { .compatible = "sifive,fu740" },
> >         { .compatible = "sifive,fu740-c000" },
> > @@ -33,4 +54,5 @@ static const struct fdt_match
> > sifive_fu740_match[] = { const struct platform_override
> > sifive_fu740 = { .match_table = sifive_fu740_match,
> >         .tlbr_flush_limit = sifive_fu740_tlbr_flush_limit,
> > +       .final_init = sifive_fu740_final_init,
> >  };
> > --
> > 2.31.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi  


