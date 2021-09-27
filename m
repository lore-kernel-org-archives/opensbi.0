From: Alexandre ghiti <alex@ghiti.fr>
Date: Mon, 27 Sep 2021 17:42:06 +0200
Subject: [PATCH 2/4] lib: utils/gpio: Add simple FDT based I2C framework
In-Reply-To: <20210924113347.3576-3-nikita.shubin@maquefel.me>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <20210924113347.3576-3-nikita.shubin@maquefel.me>
Message-ID: <1d77c913-2fc6-06cb-bbac-42f006e08653@ghiti.fr>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Patch title uses 'gpio' instead of 'i2c'.

On 9/24/21 1:33 PM, Nikita Shubin wrote:
> From: Nikita Shubin <n.shubin@yadro.com>
>
> FDT based I2C framework on the top of I2C library.
>
> The drivers are probed on demand by fdt_i2c_adapter_get
> function.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>  include/sbi_utils/i2c/fdt_i2c.h |  26 ++++++++
>  lib/utils/i2c/fdt_i2c.c         | 107 ++++++++++++++++++++++++++++++++
>  lib/utils/i2c/objects.mk        |   1 +
>  3 files changed, 134 insertions(+)
>  create mode 100644 include/sbi_utils/i2c/fdt_i2c.h
>  create mode 100644 lib/utils/i2c/fdt_i2c.c
>
> diff --git a/include/sbi_utils/i2c/fdt_i2c.h b/include/sbi_utils/i2c/fdt_i2c.h
> new file mode 100644
> index 0000000..1f41a0f
> --- /dev/null
> +++ b/include/sbi_utils/i2c/fdt_i2c.h
> @@ -0,0 +1,26 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 YADRO
> + *
> + * Authors:
> + *   Nikita Shubin <nshubin@yadro.com>
> + */
> +
> +#ifndef __FDT_I2C_H__
> +#define __FDT_I2C_H__
> +
> +#include <sbi_utils/i2c/i2c.h>
> +
> +/** FDT based I2C adapter driver */
> +struct fdt_i2c_adapter {
> +	const struct fdt_match *match_table;
> +	int (*init)(void *fdt, int nodeoff,
> +		    const struct fdt_match *match);
> +};


This structure name could contain "driver", because we don't really know
what it is as is.


> +
> +/** Get I2C adapter identified by nodeoff */
> +int fdt_i2c_adapter_get(void *fdt, int nodeoff,
> +			struct i2c_adapter **out_adapter);
> +
> +#endif
> diff --git a/lib/utils/i2c/fdt_i2c.c b/lib/utils/i2c/fdt_i2c.c
> new file mode 100644
> index 0000000..27e28a4
> --- /dev/null
> +++ b/lib/utils/i2c/fdt_i2c.c
> @@ -0,0 +1,107 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 YADRO
> + *
> + * Authors:
> + *   Nikita Shubin <nshubin@yadro.com>
> + *
> + * derivate: lib/utils/gpio/fdt_gpio.c
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>
> + */
> +
> +#include <libfdt.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/i2c/fdt_i2c.h>
> +
> +#include <sbi/sbi_console.h>
> +
> +static struct fdt_i2c_adapter *i2c_adapter_drivers[] = {
> +};
> +
> +static struct fdt_i2c_adapter *fdt_i2c_adapter_driver(struct i2c_adapter *adapter)
> +{
> +	int pos;
> +
> +	if (!adapter)
> +		return NULL;
> +
> +	for (pos = 0; pos < array_size(i2c_adapter_drivers); pos++) {
> +		if (adapter->driver == i2c_adapter_drivers[pos])
> +			return i2c_adapter_drivers[pos];
> +	}
> +
> +	return NULL;
> +}


Ok I may be missing something here, but isn't it the same as a simple
return adapter->driver?


> +
> +static int fdt_i2c_adapter_init(void *fdt, int nodeoff)
> +{
> +	int pos, rc;
> +	struct fdt_i2c_adapter *drv;
> +	const struct fdt_match *match;
> +
> +	/* Try all I2C drivers one-by-one */
> +	for (pos = 0; pos < array_size(i2c_adapter_drivers); pos++) {
> +		drv = i2c_adapter_drivers[pos];
> +		match = fdt_match_node(fdt, nodeoff, drv->match_table);
> +		if (match && drv->init) {
> +			rc = drv->init(fdt, nodeoff, match);
> +			if (rc == SBI_ENODEV)
> +				continue;
> +			if (rc)
> +				return rc;
> +			return 0;
> +		}
> +	}
> +
> +	return SBI_ENOSYS;
> +}
> +
> +static int fdt_i2c_adapter_find(void *fdt, int nodeoff,
> +				struct i2c_adapter **out_adapter)
> +{
> +	int rc;
> +	struct i2c_adapter *adapter = i2c_adapter_find(nodeoff);
> +
> +	if (!adapter) {
> +		/* I2C adapter not found so initialize matching driver */
> +		rc = fdt_i2c_adapter_init(fdt, nodeoff);
> +		if (rc)
> +			return rc;
> +
> +		/* Try to find I2C adapter again */
> +		adapter = i2c_adapter_find(nodeoff);
> +		if (!adapter)
> +			return SBI_ENOSYS;
> +	}
> +
> +	if (out_adapter)
> +		*out_adapter = adapter;
> +
> +	return 0;
> +}
> +
> +int fdt_i2c_adapter_get(void *fdt, int nodeoff,
> +			struct i2c_adapter **out_adapter)
> +{
> +	int rc;
> +	struct i2c_adapter *adapter;
> +	struct fdt_i2c_adapter *drv;
> +
> +	if (!fdt || (nodeoff < 0) || !out_adapter)
> +		return SBI_EINVAL;
> +
> +	rc = fdt_i2c_adapter_find(fdt, nodeoff, &adapter);
> +	if (rc)
> +		return rc;
> +
> +	drv = fdt_i2c_adapter_driver(adapter);
> +	if (!drv)
> +		return SBI_ENOSYS;
> +
> +	*out_adapter = adapter;
> +
> +	return 0;
> +}
> diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
> index 16a70da..06baa65 100644
> --- a/lib/utils/i2c/objects.mk
> +++ b/lib/utils/i2c/objects.mk
> @@ -8,3 +8,4 @@
>  #
>  
>  libsbiutils-objs-y += i2c/i2c.o
> +libsbiutils-objs-y += i2c/fdt_i2c.o

