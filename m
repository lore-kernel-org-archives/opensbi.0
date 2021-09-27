From: Alexandre ghiti <alex@ghiti.fr>
Date: Mon, 27 Sep 2021 17:42:18 +0200
Subject: [PATCH 3/4] lib: utils/gpio: Add minimal SiFive I2C driver
In-Reply-To: <20210924113347.3576-4-nikita.shubin@maquefel.me>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <20210924113347.3576-4-nikita.shubin@maquefel.me>
Message-ID: <7934a90c-32e9-e657-56eb-f61c5ecc6baf@ghiti.fr>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Patch title uses 'gpio' instead of 'i2c'.

On 9/24/21 1:33 PM, Nikita Shubin wrote:
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Minimum SiFive I2C driver to read/send bytes over I2C bus.
>
> This allows querying information and perform operation of onboard PMIC,
> as well as power-off and reset.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>  lib/utils/i2c/fdt_i2c.c        |   3 +
>  lib/utils/i2c/fdt_i2c_sifive.c | 289 +++++++++++++++++++++++++++++++++
>  lib/utils/i2c/objects.mk       |   1 +
>  3 files changed, 293 insertions(+)
>  create mode 100644 lib/utils/i2c/fdt_i2c_sifive.c
>
> diff --git a/lib/utils/i2c/fdt_i2c.c b/lib/utils/i2c/fdt_i2c.c
> index 27e28a4..46434da 100644
> --- a/lib/utils/i2c/fdt_i2c.c
> +++ b/lib/utils/i2c/fdt_i2c.c
> @@ -18,7 +18,10 @@
>  
>  #include <sbi/sbi_console.h>
>  
> +extern struct fdt_i2c_adapter fdt_i2c_adapter_sifive;
> +
>  static struct fdt_i2c_adapter *i2c_adapter_drivers[] = {
> +	&fdt_i2c_adapter_sifive
>  };
>  
>  static struct fdt_i2c_adapter *fdt_i2c_adapter_driver(struct i2c_adapter *adapter)
> diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
> new file mode 100644
> index 0000000..ff294f4
> --- /dev/null
> +++ b/lib/utils/i2c/fdt_i2c_sifive.c
> @@ -0,0 +1,289 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 YADRO
> + *
> + * Authors:
> + *   Nikita Shubin <nshubin@yadro.com>
> + */
> +
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/i2c/fdt_i2c.h>
> +
> +#include <sbi/riscv_asm.h>
> +#include <sbi/riscv_encoding.h>
> +
> +#define SIFIVE_I2C_ADAPTER_MAX	2
> +
> +#define SIFIVE_I2C_PRELO	0x00
> +#define SIFIVE_I2C_PREHI	0x04
> +#define SIFIVE_I2C_CTR		0x08
> +#define SIFIVE_I2C_TXR		0x00c
> +#define SIFIVE_I2C_RXR		SIFIVE_I2C_TXR
> +#define SIFIVE_I2C_CR		0x010
> +#define SIFIVE_I2C_SR		SIFIVE_I2C_CR
> +
> +#define SIFIVE_I2C_CTR_IEN	(1 << 6)
> +#define SIFIVE_I2C_CTR_EN	(1 << 7)
> +
> +#define SIFIVE_I2C_CMD_IACK	(1 << 0)
> +#define SIFIVE_I2C_CMD_ACK	(1 << 3)
> +#define SIFIVE_I2C_CMD_WR	(1 << 4)
> +#define SIFIVE_I2C_CMD_RD	(1 << 5)
> +#define SIFIVE_I2C_CMD_STO	(1 << 6)
> +#define SIFIVE_I2C_CMD_STA	(1 << 7)
> +
> +#define SIFIVE_I2C_STATUS_IF	(1 << 0)
> +#define SIFIVE_I2C_STATUS_TIP	(1 << 1)
> +#define SIFIVE_I2C_STATUS_AL	(1 << 5)
> +#define SIFIVE_I2C_STATUS_BUSY	(1 << 6)
> +#define SIFIVE_I2C_STATUS_RXACK	(1 << 7)
> +
> +#define SIFIVE_I2C_WRITE_BIT	(0 << 0)
> +#define SIFIVE_I2C_READ_BIT	(1 << 0)
> +
> +struct sifive_i2c_adapter {
> +	unsigned long addr;
> +	struct i2c_adapter adapter;
> +};
> +
> +static unsigned int sifive_i2c_adapter_count;
> +static struct sifive_i2c_adapter sifive_i2c_adapter_array[SIFIVE_I2C_ADAPTER_MAX];
> +
> +extern struct fdt_i2c_adapter fdt_i2c_adapter_sifive;
> +
> +static inline void setreg(struct sifive_i2c_adapter *adap, int reg, u8 value)
> +{
> +	writel(value, (volatile void *)adap->addr + reg);
> +}
> +
> +static inline u8 getreg(struct sifive_i2c_adapter *adap, int reg)
> +{
> +	return readl((volatile void *)adap->addr + reg);
> +}


Both functions should be prefixed by "sifive_i2c_", like all other
functions.


> +
> +static int sifive_i2c_adapter_rxack(struct sifive_i2c_adapter *adap)
> +{
> +	uint8_t val = getreg(adap, SIFIVE_I2C_SR);
> +
> +	if (val & SIFIVE_I2C_STATUS_RXACK)
> +		return SBI_EIO;
> +
> +	return 0;
> +}
> +
> +static inline void wait_cycles(unsigned long cycles)
> +{
> +	csr_write(CSR_MCYCLE, 0);
> +	while
> +		(cycles > csr_read_num(CSR_MCYCLE));
> +}


A patch that implements this recently landed in master (or is about to).


> +
> +static int sifive_i2c_adapter_poll(struct sifive_i2c_adapter *adap, uint32_t mask)
> +{
> +	int max_retry = 5;
> +	uint8_t val;
> +
> +	do {
> +		val = getreg(adap, SIFIVE_I2C_SR);
> +		wait_cycles(100000);
> +	} while ((val & mask) && (max_retry--) > 0);
> +
> +	if (max_retry <= 0)
> +		return SBI_ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +#define sifive_i2c_adapter_poll_tip(adap) sifive_i2c_adapter_poll(adap, SIFIVE_I2C_STATUS_TIP)
> +#define sifive_i2c_adapter_poll_busy(adap) sifive_i2c_adapter_poll(adap, SIFIVE_I2C_STATUS_BUSY)
> +
> +static int sifive_i2c_adapter_start(struct sifive_i2c_adapter *adap, uint8_t addr, uint8_t bit)
> +{
> +	uint8_t val = (addr << 1) | bit;
> +
> +	setreg(adap, SIFIVE_I2C_TXR, val);
> +	val = SIFIVE_I2C_CMD_STA | SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK;
> +	setreg(adap, SIFIVE_I2C_CR, val);
> +
> +	return sifive_i2c_adapter_poll_tip(adap);
> +}
> +
> +static int sifive_i2c_adapter_sendb(struct sifive_i2c_adapter *adap, uint8_t addr, uint8_t reg, uint8_t value)
> +{
> +	int rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_WRITE_BIT);
> +
> +	if (rc)
> +		return rc;
> +
> +	rc = sifive_i2c_adapter_rxack(adap);
> +	if (rc)
> +		return rc;
> +
> +	/* set register address */
> +	setreg(adap, SIFIVE_I2C_TXR, reg);
> +	setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK);
> +	rc = sifive_i2c_adapter_poll_tip(adap);
> +	if (rc)
> +		return rc;
> +
> +	rc = sifive_i2c_adapter_rxack(adap);
> +	if (rc)
> +		return rc;
> +
> +	/* set value */
> +	setreg(adap, SIFIVE_I2C_TXR, value);
> +	setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK);
> +
> +	rc = sifive_i2c_adapter_poll_tip(adap);
> +	if (rc)
> +		return rc;
> +
> +	rc = sifive_i2c_adapter_rxack(adap);
> +	if (rc)
> +		return rc;
> +
> +	setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO | SIFIVE_I2C_CMD_IACK);
> +
> +	/* poll BUSY instead of ACK*/
> +	rc = sifive_i2c_adapter_poll_busy(adap);
> +	if (rc)
> +		return rc;
> +
> +	setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
> +
> +	return 0;
> +}
> +
> +static int sifive_i2c_adapter_readb(struct sifive_i2c_adapter *adap, uint8_t addr, uint8_t reg, uint8_t *value)
> +{
> +	int rc;
> +	uint8_t val;
> +
> +	rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_WRITE_BIT);
> +	if (rc)
> +		return rc;
> +
> +	rc = sifive_i2c_adapter_rxack(adap);
> +	if (rc)
> +		return rc;
> +
> +	setreg(adap, SIFIVE_I2C_TXR, reg);
> +	setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK);
> +
> +	rc = sifive_i2c_adapter_poll_tip(adap);
> +	if (rc)
> +		return rc;
> +
> +	rc = sifive_i2c_adapter_rxack(adap);
> +	if (rc)
> +		return rc;
> +
> +	/* setting addr with high 0 bit */
> +	val = (addr << 1) | SIFIVE_I2C_READ_BIT;
> +	setreg(adap, SIFIVE_I2C_TXR, val);
> +	setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STA | SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK);
> +
> +	rc = sifive_i2c_adapter_poll_tip(adap);
> +	if (rc)
> +		return rc;
> +
> +	rc = sifive_i2c_adapter_rxack(adap);
> +	if (rc)
> +		return rc;
> +
> +	setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_ACK | SIFIVE_I2C_CMD_RD | SIFIVE_I2C_CMD_IACK);
> +
> +	rc = sifive_i2c_adapter_poll_tip(adap);
> +	if (rc)
> +		return rc;
> +
> +	*value = getreg(adap, SIFIVE_I2C_RXR);
> +
> +	setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO | SIFIVE_I2C_CMD_IACK);
> +	rc = sifive_i2c_adapter_poll_busy(adap);
> +	if (rc)
> +		return rc;
> +
> +	setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
> +
> +	return 0;
> +}
> +
> +static int sifive_i2c_adapter_send(struct i2c_adapter *ia, uint8_t addr, uint8_t reg, uint8_t value)


This function is limited to sending 1B immediate value (as pointed in a
previous patch review): let's call it sifive_i2c_adapter_send_imm8 or
something similar and make it a helper of the more general function.


> +{
> +	struct sifive_i2c_adapter *adapter =
> +		container_of(ia, struct sifive_i2c_adapter, adapter);
> +
> +	return sifive_i2c_adapter_sendb(adapter, addr, reg, value);
> +}
> +
> +static int sifive_i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr, uint8_t reg, uint8_t *value)

Same here.


> +{
> +	int rc;
> +	uint8_t val;
> +	struct sifive_i2c_adapter *adapter =
> +		container_of(ia, struct sifive_i2c_adapter, adapter);
> +
> +	rc = sifive_i2c_adapter_readb(adapter, addr, reg, &val);
> +	if (rc)
> +		return rc;
> +
> +	if (value)
> +		*value = val;
> +
> +	return 0;
> +}
> +
> +static int sifive_i2c_adapter_configure(struct i2c_adapter *ia)
> +{
> +	struct sifive_i2c_adapter *adap =
> +		container_of(ia, struct sifive_i2c_adapter, adapter);
> +
> +	/* enable controller/disable interrupts */
> +	setreg(adap, SIFIVE_I2C_CTR, SIFIVE_I2C_CTR_EN);
> +
> +	return 0;
> +}
> +
> +static int sifive_i2c_init(void *fdt, int nodeoff,
> +			    const struct fdt_match *match)
> +{
> +	int rc;
> +	struct sifive_i2c_adapter *adapter;
> +	uint64_t addr;
> +
> +	if (sifive_i2c_adapter_count >= SIFIVE_I2C_ADAPTER_MAX)
> +		return SBI_ENOSPC;


It's a bit weird to limit here the number of sifive i2c adapters to
SIFIVE_I2C_ADAPTER_MAX whereas we already have another limit in i2c.c to
I2C_ADAPTER_MAX, that limits the number of sifive adapters to 2 for no
technical reason right?

One thing that could prevent this could be to totally get rid of
sifive_i2c_adapter structure and just put the "addr" field into
i2c_adapter structure "void *data" field (which does not exist yet: this
new field could be used for whatever purpose that serves the i2c adapter
driver). And then adding adapter would be a simple call to
i2c_adapter_add(&fdt_i2c_adapter_sifive, nodeoff,
sifive_i2c_adapter_send, sifive_i2c_adapter_read, (void *)addr).


> +
> +	adapter = &sifive_i2c_adapter_array[sifive_i2c_adapter_count];
> +
> +	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
> +	if (rc)
> +		return rc;
> +
> +	adapter->addr = addr;
> +	adapter->adapter.driver = &fdt_i2c_adapter_sifive;
> +	adapter->adapter.id = nodeoff;
> +	adapter->adapter.send = sifive_i2c_adapter_send;
> +	adapter->adapter.read = sifive_i2c_adapter_read;
> +	adapter->adapter.configure = sifive_i2c_adapter_configure;
> +	rc = i2c_adapter_add(&adapter->adapter);
> +	if (rc)
> +		return rc;
> +
> +	sifive_i2c_adapter_count++;
> +	return 0;
> +}
> +
> +static const struct fdt_match sifive_i2c_match[] = {
> +	{ .compatible = "sifive,i2c0" },
> +	{ },
> +};
> +
> +struct fdt_i2c_adapter fdt_i2c_adapter_sifive = {
> +	.match_table = sifive_i2c_match,
> +	.init = sifive_i2c_init,
> +};
> diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
> index 06baa65..d52ab18 100644
> --- a/lib/utils/i2c/objects.mk
> +++ b/lib/utils/i2c/objects.mk
> @@ -9,3 +9,4 @@
>  
>  libsbiutils-objs-y += i2c/i2c.o
>  libsbiutils-objs-y += i2c/fdt_i2c.o
> +libsbiutils-objs-y += i2c/fdt_i2c_sifive.o

