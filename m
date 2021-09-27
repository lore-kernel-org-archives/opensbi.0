From: Alexandre ghiti <alex@ghiti.fr>
Date: Mon, 27 Sep 2021 17:42:24 +0200
Subject: [PATCH 4/4] lib: utils/reset: Add generic da9063 reset driver
In-Reply-To: <20210924113347.3576-5-nikita.shubin@maquefel.me>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <20210924113347.3576-5-nikita.shubin@maquefel.me>
Message-ID: <ff4dc88f-ff92-4300-29d5-d998c991731a@ghiti.fr>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/24/21 1:33 PM, Nikita Shubin wrote:
> From: Nikita Shubin <n.shubin@yadro.com>
>
> da9063 PMIC can be used to reset/shutdown the
> Sifive Unmatched board.
>
> shutdown is done simply by writing SHUDOWN bit to
> DA9063_REG_CONTROL_F register.


s/SHUDOWN/SHUTDOWN


>
> reset via setting WAKEUP bit in DA9063_REG_CONTROL_F
> register followed by masking POWER and POWER1 domains
> and setting STANDBY bit in DA9063_REG_CONTROL_A,
> originally discovered by Alexandre Ghiti on linux-riscv
> maillists.


Someone from Dialog answered this patch and will get back to us after
talking to the hardware team.


>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>  lib/utils/reset/fdt_reset.c        |   2 +
>  lib/utils/reset/fdt_reset_da9063.c | 203 +++++++++++++++++++++++++++++
>  lib/utils/reset/objects.mk         |   1 +
>  3 files changed, 206 insertions(+)
>  create mode 100644 lib/utils/reset/fdt_reset_da9063.c
>
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index 168bb0c..92f37b0 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -18,6 +18,7 @@ extern struct fdt_reset fdt_reset_htif;
>  extern struct fdt_reset fdt_reset_sifive_test;
>  extern struct fdt_reset fdt_reset_sunxi_wdt;
>  extern struct fdt_reset fdt_reset_thead;
> +extern struct fdt_reset fdt_reset_da9063;
>  
>  static struct fdt_reset *reset_drivers[] = {
>  	&fdt_poweroff_gpio,
> @@ -26,6 +27,7 @@ static struct fdt_reset *reset_drivers[] = {
>  	&fdt_reset_sifive_test,
>  	&fdt_reset_sunxi_wdt,
>  	&fdt_reset_thead,
> +	&fdt_reset_da9063,
>  };
>  
>  int fdt_reset_init(void)
> diff --git a/lib/utils/reset/fdt_reset_da9063.c b/lib/utils/reset/fdt_reset_da9063.c
> new file mode 100644
> index 0000000..6c96968
> --- /dev/null
> +++ b/lib/utils/reset/fdt_reset_da9063.c
> @@ -0,0 +1,203 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 YADRO
> + *
> + * Authors:
> + *   Nikita Shubin <nshubin@yadro.com>
> + */
> +
> +#include <libfdt.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_hart.h>
> +#include <sbi/sbi_system.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/i2c/fdt_i2c.h>
> +#include <sbi_utils/reset/fdt_reset.h>
> +
> +#define DA9063_REG_PAGE_CON		0x00
> +#define DA9063_REG_CONTROL_A		0x0e
> +#define DA9063_REG_CONTROL_C		0x10
> +#define DA9063_REG_CONTROL_F		0x13
> +#define DA9063_REG_DEVICE_ID		0x81
> +
> +#define DA9063_CONTROL_A_CP_EN		(1 << 7)
> +#define DA9063_CONTROL_A_M_POWER1_EN	(1 << 6)
> +#define DA9063_CONTROL_A_M_POWER_EN	(1 << 5)
> +#define DA9063_CONTROL_A_M_SYSTEM_EN	(1 << 4)
> +#define DA9063_CONTROL_A_STANDBY	(1 << 3)
> +#define DA9063_CONTROL_A_POWER1_EN	(1 << 2)
> +#define DA9063_CONTROL_A_POWER_EN	(1 << 1)
> +#define DA9063_CONTROL_A_SYSTEM_EN	(1 << 0)
> +
> +#define DA9063_CONTROL_F_WAKEUP		(1 << 2)
> +#define DA9063_CONTROL_F_SHUTDOWN	(1 << 1)
> +#define DA9063_CONTROL_F_WATCHDOG	(1 << 0)
> +
> +#define DA9063_CONTROL_C_DEF_SUPPLY	(1 << 7)
> +#define DA9063_CONTROL_C_SLEW_RATE	(1 << 4)
> +#define DA9063_CONTROL_C_OTPREAD_EN	(1 << 3)
> +#define DA9063_CONTROL_C_AUTO_BOOT	(1 << 2)
> +#define DA9063_CONTROL_C_DEBOUNCING	(1 << 0)


Not all above defines are used, we should stick to the strict minimum as
the only functionality we exploit from this device is the reset.


> +
> +#define PMIC_CHIP_ID_DA9063		0x61
> +
> +static struct {
> +	struct i2c_adapter *adapter;
> +	uint32_t reg;
> +	int last_error;
> +} da9063;
> +
> +
> +


3 new lines here


> +static int da9063_system_reset_check(u32 type, u32 reason)
> +{
> +	switch (type) {
> +	case SBI_SRST_RESET_TYPE_SHUTDOWN:
> +	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> +	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)


No need for the struct i2c_adapter argument as it is globally accessible.


> +{
> +	uint8_t val;
> +	int rc = i2c_adapter_send(adap, reg, DA9063_REG_PAGE_CON, 0x02);
> +
> +	if (rc)
> +		return rc;
> +
> +	/* check set page*/
> +	rc = i2c_adapter_read(adap, reg, 0x0, &val);
> +	if (rc)
> +		return rc;
> +
> +	if (val != 0x02)
> +		return SBI_ENODEV;
> +
> +	/* read and check device id */
> +	rc = i2c_adapter_read(adap, reg, DA9063_REG_DEVICE_ID, &val);
> +	if (rc)
> +		return rc;
> +
> +	if (val != PMIC_CHIP_ID_DA9063)
> +		return SBI_ENODEV;
> +
> +	return 0;
> +}
> +
> +static inline int da9063_shutdown(struct i2c_adapter *adap, uint32_t reg)


Same here regarding struct i2c_adapter argument.


> +{
> +	int rc = i2c_adapter_send(adap, da9063.reg, DA9063_REG_PAGE_CON, 0x00);
> +
> +	if (rc)
> +		return rc;
> +
> +	return i2c_adapter_send(adap, da9063.reg,
> +				DA9063_REG_CONTROL_F, DA9063_CONTROL_F_SHUTDOWN);
> +}
> +
> +static inline int da9063_reset(struct i2c_adapter *adap, uint32_t reg)


Same here regarding struct i2c_adapter argument.


> +{
> +	int rc = i2c_adapter_send(adap, da9063.reg, DA9063_REG_PAGE_CON, 0x00);
> +
> +	if (rc)
> +		return rc;
> +
> +	rc = i2c_adapter_send(adap, da9063.reg,
> +			      DA9063_REG_CONTROL_F, DA9063_CONTROL_F_WAKEUP);
> +	if (rc)
> +		return rc;
> +
> +	return i2c_adapter_send(adap, da9063.reg,
> +				DA9063_REG_CONTROL_A,
> +				DA9063_CONTROL_A_M_POWER1_EN |
> +				DA9063_CONTROL_A_M_POWER_EN |
> +				DA9063_CONTROL_A_STANDBY);
> +}
> +
> +static void da9063_system_reset(u32 type, u32 reason)
> +{
> +	struct i2c_adapter *adap = da9063.adapter;
> +	uint32_t reg = da9063.reg;
> +	int rc;
> +
> +	if (adap) {
> +		/* may include clock init */
> +		i2c_adapter_configure(adap);


Why should the da9063 device care about the adapter configuration here?
I think It should just rely on an already configured/initialized i2c
controller.


> +
> +		/* sanity check */
> +		rc = da9063_sanity_check(adap, reg);
> +		if (rc) {
> +			sbi_printf("%s: chip is not da9063 PMIC\n", __func__);
> +			goto skip_reset;
> +		}
> +
> +		switch (type) {
> +		case SBI_SRST_RESET_TYPE_SHUTDOWN:
> +			da9063_shutdown(adap, reg);
> +			break;
> +		case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> +		case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> +			da9063_reset(adap, reg);
> +			break;
> +		}
> +
> +		while
> +			(1);
> +
> +skip_reset:
> +		sbi_hart_hang();
> +	}
> +}
> +
> +static struct sbi_system_reset_device da9063_reset_i2c = {
> +	.name = "da9063-reset",
> +	.system_reset_check = da9063_system_reset_check,
> +	.system_reset = da9063_system_reset
> +};
> +
> +static int da9063_reset_init(void *fdt, int nodeoff,
> +			   const struct fdt_match *match)
> +{
> +	int rc, i2c_bus;
> +	struct i2c_adapter *adapter;
> +	uint64_t addr;
> +
> +	/* find i2c bus parent node */
> +	i2c_bus = fdt_parent_offset(fdt, nodeoff);
> +	if (i2c_bus < 0)
> +		return i2c_bus;
> +
> +	/* i2c adapter get */
> +	rc = fdt_i2c_adapter_get(fdt, i2c_bus, &adapter);
> +	if (rc)
> +		return rc;
> +
> +	da9063.adapter = adapter;


Establishing the link between the i2c device and its adapter should
somehow be implicitly done by the i2c library, IMO the device should not
care about its controller.


> +
> +	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
> +	if (rc)
> +		return rc;
> +
> +	da9063.reg = addr;
> +
> +	sbi_system_reset_set_device(&da9063_reset_i2c);
> +
> +	return 0;
> +}
> +
> +static const struct fdt_match da9063_reset_match[] = {
> +	{ .compatible = "dlg,da9063", .data = (void *)TRUE },
> +	{ },
> +};
> +
> +struct fdt_reset fdt_reset_da9063 = {
> +	.match_table = da9063_reset_match,
> +	.init = da9063_reset_init,
> +};
> diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
> index 6c95db3..cfe4c09 100644
> --- a/lib/utils/reset/objects.mk
> +++ b/lib/utils/reset/objects.mk
> @@ -14,3 +14,4 @@ libsbiutils-objs-y += reset/fdt_reset_sifive_test.o
>  libsbiutils-objs-y += reset/fdt_reset_sunxi_wdt.o
>  libsbiutils-objs-y += reset/fdt_reset_thead.o
>  libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
> +libsbiutils-objs-y += reset/fdt_reset_da9063.o

