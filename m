From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 20 Oct 2021 10:11:56 +0200
Subject: [PATCH v2 0/5] I2C framework, reboot Unmatched via PMIC
In-Reply-To: <20211020102609.683006bc@redslave.neermore.group>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <CA+zEjCvAEjfZaQ4P21=y_yLP15pFVm+znGUGrPMPxH7TCGq-RA@mail.gmail.com>
 <20211020102609.683006bc@redslave.neermore.group>
Message-ID: <CA+zEjCvUMDf=tY5WgD-C45tmiU+kLRh=0ySimdEu82V6jB0ubA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 20, 2021 at 9:26 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> On Tue, 19 Oct 2021 13:57:35 +0200
> Alexandre Ghiti <alexandre.ghiti@canonical.com> wrote:
>
> > On Fri, Oct 15, 2021 at 3:20 PM Nikita Shubin
> > <nikita.shubin@maquefel.me> wrote:
> > >
> > > From: Nikita Shubin <n.shubin@yadro.com>
> > >
> > > This series introduce rebooting via i2c da9063 PMIC, currently on
> > > SiFive Unmatched board.
> > >
> > > "gpio-poweroff" remains with default priority of 128 - default
> > > priority, da9063 is 1 by default the least priority.
> > >
> > > da9063-reset {
> > >         compatible = "da9063-reset";
> > >         priority = <1>;
> > > };
> > >
> > > Is required to be added as a child node of PMIC.
> > >
> > > tested via Linux and U-Boot with reset extension:
> > >
> > > OpenSBI:
> > > Platform Reboot Device    : da9063-reset
> > > Platform Shutdown Device  : gpio-reset
> > >
> > > v1 -> v2:
> > > Added:
> > > lib: sbi: add priority for reset handler
> > >
> > > Renamed read/write to smbus_write/smbus_read, as actually this
> > > is not a "raw" read/write but a one with a register address
> > > provided, later a "raw" version will be need but currently i don't
> > > have anything to test it.
> > >
> > > To Xiang W:
> > > I have analized your proposal of switching to sbi_list,
> > > and switched i2c adapters array to list. Unfortunately
> > > to switch drivers we require "init" functions.
> > >
> >
> > This also has the merit of getting rid of this limit of 16 i2c
> > adapters, that's nice. Maybe you could use that in the gpio library
> > too?
>
> Indeed, but it's not a part of this patch series.
>
> >
> > > to Alexander Ghiti:
> > >
> > > > No need for the struct i2c_adapter argument as it is globally
> > > > accessible.
> > >
> > > It looks like a more clean and reusable way to me, let's here more
> > > opinions
> > > > Why should the da9063 device care about the adapter configuration
> > > > here? I think It should just rely on an already
> > > > configured/initialized i2c controller.
> > >
> > > With clocks init added to sifive_i2c configure it can become usable
> > > even if nobody cared about controller initialization.
> >
> > I don't understand what you mean here. IMO, the device driver should
> > only take care of the communication with the device, not the
> > controller. That can be done in the init function of the controller
> > driver, which in addition would simplify the callbacks and the device
> > driver code.
>
> Well to make use of I2C you should enable it togather with clocks, see
> u-boot/arch/riscv/dts/fu740-c000.dtsi for example:
>
> i2c0: i2c at 10030000 {
> ...
> clocks = <&prci PRCI_CLK_PCLK>;
> ...
>
> It part of driver responsibility to enable clocks it requires, cause if
> not is required nobody will enable them.

I understand that but why couldn't this configuration be done in the
adapter driver instead of the da9063 driver? At the initialization of
the adapter driver, or at each beginning of a write sequence...etc.

>
> >
> > >
> > > > Establishing the link between the i2c device and its adapter
> > > > should somehow be implicitly done by the i2c library, IMO the
> > > > device should not care about its controller.
> > >
> > > And how do you think it will look like ? In out case it's not a
> > > separate driver/client entity but all togather for simplicity.
> >
> > In  fdt_i2c_adapter_get, instead of passing a pointer to a struct
> > i2c_adapter, we could pass a i2c_device structure which would get
> > filled automatically with its adapter chip. But that implies
> > introducing this i2c_device like I mentioned in the previous review :)
> > In addition, I took a look at the gpio library and they did it this
> > way too.
> >
> > Again, I don't see why the driver developer should care about its
> > adapter since everything could be done behind the scenes for him.
>
> Are you suggesting to separate the da9063_reset into client/driver
> parts ? Don't you think that it will add unnecessary complicity if our
> case ?

To make sure we understand each other, find below a diff of what it
would look like the way I imagine it. It just makes the notion of
adapter disappear from the i2c device driver, that's all. This is what
is done in openSBI with gpio_pin structure, in Linux here
https://www.kernel.org/doc/html/latest/i2c/writing-clients.html#smbus-communication.

diff --git a/include/sbi_utils/i2c/i2c.h b/include/sbi_utils/i2c/i2c.h
index 76cdb66..0f1671e 100644
--- a/include/sbi_utils/i2c/i2c.h
+++ b/include/sbi_utils/i2c/i2c.h
@@ -50,6 +50,10 @@ struct i2c_adapter {
        struct sbi_dlist node;
 };

+struct i2c_device {
+       struct i2c_adapter *adap;
+};
+
 static inline struct i2c_adapter *to_i2c_adapter(struct sbi_dlist *node)
 {
        return container_of(node, struct i2c_adapter, node);
diff --git a/lib/utils/i2c/i2c.c b/lib/utils/i2c/i2c.c
index d23ac91..9c64d09 100644
--- a/lib/utils/i2c/i2c.c
+++ b/lib/utils/i2c/i2c.c
@@ -61,25 +61,25 @@ int i2c_adapter_configure(struct i2c_adapter *ia)
        return ia->configure(ia);
 }

-int i2c_adapter_smbus_write(struct i2c_adapter *ia, uint8_t addr,
+int i2c_smbus_write(struct i2c_device *dev, uint8_t addr,
                        uint8_t reg, uint8_t *buffer, int len)
 {
-       if (!ia)
+       if (!dev)
                return SBI_EINVAL;
-       if (!ia->smbus_write)
+       if (!dev->adap || !dev->adap->smbus_write)
                return SBI_ENOSYS;

-       return ia->smbus_write(ia, addr, reg, buffer, len);
+       return dev->adap->smbus_write(dev, addr, reg, buffer, len);
 }


-int i2c_adapter_smbus_read(struct i2c_adapter *ia, uint8_t addr,
+int i2c_smbus_read(struct i2c_device *dev, uint8_t addr,
                     uint8_t reg, uint8_t *buffer, int len)
 {
-       if (!ia)
+       if (!dev)
                return SBI_EINVAL;
-       if (!ia->smbus_read)
+       if (!dev->adap || !dev->adap->smbus_read)
                return SBI_ENOSYS;

-       return ia->smbus_read(ia, addr, reg, buffer, len);
+       return dev->adap->smbus_read(dev, addr, reg, buffer, len);
 }
diff --git a/lib/utils/reset/fdt_reset_da9063.c
b/lib/utils/reset/fdt_reset_da9063.c
index e3c9ced..a14d941 100644
--- a/lib/utils/reset/fdt_reset_da9063.c
+++ b/lib/utils/reset/fdt_reset_da9063.c
@@ -45,7 +45,7 @@
 #define PMIC_CHIP_ID_DA9063            0x61

 static struct {
-       struct i2c_adapter *adapter;
+       struct i2c_device *dev;
        uint32_t reg;
        u8 priority;
 } da9063 = {
@@ -103,20 +103,20 @@ static inline int da9063_shutdown(struct
i2c_adapter *adap, uint32_t reg)
                                DA9063_REG_CONTROL_F,
DA9063_CONTROL_F_SHUTDOWN);
 }

-static inline int da9063_reset(struct i2c_adapter *adap, uint32_t reg)
+static inline int da9063_reset(struct i2c_device *dev, uint32_t reg)
 {
-       int rc = i2c_adapter_smbus_reg_write(adap, da9063.reg,
+       int rc = i2c_smbus_reg_write(dev, da9063.reg,
                                        DA9063_REG_PAGE_CON, 0x00);

        if (rc)
                return rc;

-       rc = i2c_adapter_smbus_reg_write(adap, da9063.reg,
+       rc = i2c_smbus_reg_write(dev, da9063.reg,
                              DA9063_REG_CONTROL_F, DA9063_CONTROL_F_WAKEUP);
        if (rc)
                return rc;

-       return i2c_adapter_smbus_reg_write(adap, da9063.reg,
+       return i2c_smbus_reg_write(dev, da9063.reg,
                                DA9063_REG_CONTROL_A,
                                DA9063_CONTROL_A_M_POWER1_EN |
                                DA9063_CONTROL_A_M_POWER_EN |
@@ -169,7 +169,6 @@ static int da9063_reset_init(void *fdt, int nodeoff,
 {
        int rc, i2c_dev, i2c_bus, len;
        const fdt32_t *val;
-       struct i2c_adapter *adapter;
        uint64_t addr;

        /* find dlg,da9063 parent node */
@@ -192,12 +191,10 @@ static int da9063_reset_init(void *fdt, int nodeoff,
                return i2c_bus;

        /* i2c adapter get */
-       rc = fdt_i2c_adapter_get(fdt, i2c_bus, &adapter);
+       rc = fdt_i2c_adapter_get(fdt, i2c_bus, &da9063.dev);
        if (rc)
                return rc;

-       da9063.adapter = adapter;
-
        sbi_system_reset_add_device(&da9063_reset_i2c);

        return 0;


>
> Linux i2c_client has a reference to the adapter it's sitting on:
> https://elixir.bootlin.com/linux/v5.15-rc6/source/include/linux/i2c.h#L336
>
> u-boot is relying on some "default" i2c adapter/bus ideed, but if we
> look on:
>
> https://elixir.bootlin.com/u-boot/latest/source/include/i2c.h#L718
>
> We see it's rather complex and hard to understand.
>
>
>
> >
> > >
> > > Nikita Shubin (5):
> > >   lib: utils/reset: add priority to gpio reset
> > >   lib: utils/i2c: Add generic I2C configuration library
> > >   lib: utils/i2c: Add simple FDT based I2C framework
> > >   lib: utils/i2c: Add minimal SiFive I2C driver
> > >   lib: utils/reset: Add generic da9063 reset driver
> > >
> > >  include/sbi_utils/i2c/fdt_i2c.h    |  26 +++
> > >  include/sbi_utils/i2c/i2c.h        |  99 +++++++++++
> > >  lib/utils/i2c/fdt_i2c.c            | 111 ++++++++++++
> > >  lib/utils/i2c/fdt_i2c_sifive.c     | 271
> > > +++++++++++++++++++++++++++++ lib/utils/i2c/i2c.c                |
> > > 85 +++++++++ lib/utils/i2c/objects.mk           |  12 ++
> > >  lib/utils/reset/fdt_reset.c        |   2 +
> > >  lib/utils/reset/fdt_reset_da9063.c | 214 +++++++++++++++++++++++
> > >  lib/utils/reset/fdt_reset_gpio.c   |  18 +-
> > >  lib/utils/reset/objects.mk         |   1 +
> > >  10 files changed, 836 insertions(+), 3 deletions(-)
> > >  create mode 100644 include/sbi_utils/i2c/fdt_i2c.h
> > >  create mode 100644 include/sbi_utils/i2c/i2c.h
> > >  create mode 100644 lib/utils/i2c/fdt_i2c.c
> > >  create mode 100644 lib/utils/i2c/fdt_i2c_sifive.c
> > >  create mode 100644 lib/utils/i2c/i2c.c
> > >  create mode 100644 lib/utils/i2c/objects.mk
> > >  create mode 100644 lib/utils/reset/fdt_reset_da9063.c
> > >
> > > --
> > > 2.31.1
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
>

