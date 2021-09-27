From: Alexandre ghiti <alex@ghiti.fr>
Date: Mon, 27 Sep 2021 17:41:18 +0200
Subject: [PATCH 1/4] lib: utils/i2c: Add generic I2C configuration library
In-Reply-To: <20210924113347.3576-2-nikita.shubin@maquefel.me>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <20210924113347.3576-2-nikita.shubin@maquefel.me>
Message-ID: <fabe3560-316c-2f62-6867-f4fc6768d15c@ghiti.fr>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Nikita,

Thanks for jumping in and coming up with this patchset :)

Below my review:

On 9/24/21 1:33 PM, Nikita Shubin wrote:
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Helper library to keep track of registered I2C adapters,
> identified by dts offset, basic send/read functions and
> adapter configuration (enable, set dividers, etc...).
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>  include/sbi_utils/i2c/i2c.h |  65 +++++++++++++++++++++++
>  lib/utils/i2c/i2c.c         | 102 ++++++++++++++++++++++++++++++++++++
>  lib/utils/i2c/objects.mk    |  10 ++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 include/sbi_utils/i2c/i2c.h
>  create mode 100644 lib/utils/i2c/i2c.c
>  create mode 100644 lib/utils/i2c/objects.mk
>
> diff --git a/include/sbi_utils/i2c/i2c.h b/include/sbi_utils/i2c/i2c.h
> new file mode 100644
> index 0000000..86dd582
> --- /dev/null
> +++ b/include/sbi_utils/i2c/i2c.h
> @@ -0,0 +1,65 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 YADRO
> + *
> + * Authors:
> + *   Nikita Shubin <nshubin@yadro.com>
> + */
> +
> +#ifndef __I2C_H__
> +#define __I2C_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +/** Representation of a I2C adapter */
> +struct i2c_adapter {
> +	/** Pointer to I2C driver owning this I2C adapter */
> +	void *driver;
> +
> +	/** Uniquie ID of the I2C adapter assigned by the driver */


s/Uniquie/Unique


> +	int id;
> +
> +	/**
> +	 * Configure I2C adapter
> +	 *
> +	 * Enable, set dividers, etc...
> +	 *
> +	 * @return 0 on success and negative error code on failure
> +	 */
> +	int (*configure)(struct i2c_adapter *ia);
> +
> +	/**
> +	 * Send byte to given address, register
> +	 *
> +	 * @return 0 on success and negative error code on failure
> +	 */
> +	int (*send)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg, uint8_t value);


send is limited to sending only 1B value? Shouldn't we handle an array
of bytes with a size?


> +
> +	/**
> +	 * Read byte from given address, register
> +	 *
> +	 * @return 0 on success and negative error code on failure
> +	 */
> +	int (*read)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg, uint8_t *value);


Same here.


> +};


The API should be symmetrical i2c_send/i2c_recv or i2c_read/i2c_write
and what about describing the arguments?


> +
> +/** Find a registered I2C adapter */
> +struct i2c_adapter *i2c_adapter_find(int id);
> +
> +/** Register I2C adapter */
> +int i2c_adapter_add(struct i2c_adapter *ia);
> +
> +/** Un-register I2C adapter */
> +void i2c_adapter_remove(struct i2c_adapter *ia);
> +
> +/** Configure I2C adapter prior to send/read */
> +int i2c_adapter_configure(struct i2c_adapter *ia);
> +
> +/** Send to device on I2C adapter bus */
> +int i2c_adapter_send(struct i2c_adapter *ia, uint8_t addr, uint8_t reg, uint8_t value);
> +
> +/** Read from device on I2C adapter bus */
> +int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr, uint8_t reg, uint8_t *value);
> +
> +#endif
> diff --git a/lib/utils/i2c/i2c.c b/lib/utils/i2c/i2c.c
> new file mode 100644
> index 0000000..9bcb129
> --- /dev/null
> +++ b/lib/utils/i2c/i2c.c
> @@ -0,0 +1,102 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 YADRO
> + *
> + * Authors:
> + *   Nikita Shubin <nshubin@yadro.com>
> + *
> + * derivate: lib/utils/gpio/gpio.c
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>
> + */
> +
> +#include <sbi/sbi_error.h>
> +#include <sbi_utils/i2c/i2c.h>
> +
> +#define I2C_ADAPTER_MAX		16
> +
> +static struct i2c_adapter *i2c_array[I2C_ADAPTER_MAX];
> +
> +struct i2c_adapter *i2c_adapter_find(int id)
> +{
> +	unsigned int i;
> +	struct i2c_adapter *ret = NULL;
> +
> +	for (i = 0; i < I2C_ADAPTER_MAX; i++) {
> +		if (i2c_array[i] && i2c_array[i]->id == id) {
> +			ret = i2c_array[i];
> +			break;


I would have returned directly here: return i2c_array(i].


> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +int i2c_adapter_add(struct i2c_adapter *ia)
> +{
> +	int i, ret = SBI_ENOSPC;
> +
> +	if (!ia)
> +		return SBI_EINVAL;
> +	if (i2c_adapter_find(ia->id))
> +		return SBI_EALREADY;
> +
> +	for (i = 0; i < I2C_ADAPTER_MAX; i++) {
> +		if (!i2c_array[i]) {
> +			i2c_array[i] = ia;
> +			ret = 0;
> +			break;


Same here.


> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +void i2c_adapter_remove(struct i2c_adapter *ia)
> +{
> +	int i;
> +
> +	if (!ia)
> +		return;
> +
> +	for (i = 0; i < I2C_ADAPTER_MAX; i++) {
> +		if (i2c_array[i] == ia) {
> +			i2c_array[i] = NULL;
> +			break;


Same here.


> +		}
> +	}
> +}
> +
> +int i2c_adapter_configure(struct i2c_adapter *ia)
> +{
> +	if (!ia)
> +		return SBI_EINVAL;
> +	if (!ia->configure)
> +		return 0;
> +
> +	return ia->configure(ia);
> +}
> +
> +int i2c_adapter_send(struct i2c_adapter *ia, uint8_t addr,
> +		     uint8_t reg, uint8_t value)
> +{
> +	if (!ia)
> +		return SBI_EINVAL;
> +	if (!ia->send)
> +		return SBI_ENOSYS;
> +
> +	return ia->send(ia, addr, reg, value);
> +}
> +
> +


?2 new lines.


> +int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr,
> +		     uint8_t reg, uint8_t *value)
> +{
> +	if (!ia)
> +		return SBI_EINVAL;
> +	if (!ia->read)
> +		return SBI_ENOSYS;
> +
> +	return ia->read(ia, addr, reg, value);
> +}


IMO, those helpers are not very helpful. I would have imagined an API
more "device-centric":

int i2c_send(struct i2c_device *dev, uint8_t reg, uint8_t *value)

{

??? return dev->i2c_adapter->send(dev->address, reg, value);

}

And I don't think the configure callback is even needed: it should be
done at the initialization of the adapter, in its own driver, I don't
think the device should care about that.


> diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
> new file mode 100644
> index 0000000..16a70da
> --- /dev/null
> +++ b/lib/utils/i2c/objects.mk
> @@ -0,0 +1,10 @@
> +#
> +# SPDX-License-Identifier: BSD-2-Clause
> +#
> +# Copyright (c) 2021 YADRO
> +#
> +# Authors:
> +#   Nikita Shubin <nshubin@yadro.com>
> +#
> +
> +libsbiutils-objs-y += i2c/i2c.o

