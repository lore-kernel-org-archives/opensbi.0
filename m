From: Xiang W <wxjstz@126.com>
Date: Fri, 28 Jul 2023 21:41:25 +0800
Subject: [PATCH 1/6] include: sbi_utils: Remove driver pointer from
 struct i2c_adapter
In-Reply-To: <20230721171010.2572232-2-apatel@ventanamicro.com>
References: <20230721171010.2572232-1-apatel@ventanamicro.com>
	 <20230721171010.2572232-2-apatel@ventanamicro.com>
Message-ID: <9db2e2e7e4d1beadcb8a63c144a958c8730a1281.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-07-21???? 22:40 +0530?Anup Patel???
> The "driver" pointer in struct i2c_adapter is not used anywhere
> so let us remove it.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Look good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?include/sbi_utils/i2c/i2c.h??? | 3 ---
> ?lib/utils/i2c/fdt_i2c_dw.c???? | 3 ---
> ?lib/utils/i2c/fdt_i2c_sifive.c | 3 ---
> ?3 files changed, 9 deletions(-)
> 
> diff --git a/include/sbi_utils/i2c/i2c.h b/include/sbi_utils/i2c/i2c.h
> index 5a70364..93a44f4 100644
> --- a/include/sbi_utils/i2c/i2c.h
> +++ b/include/sbi_utils/i2c/i2c.h
> @@ -15,9 +15,6 @@
> ?
> ?/** Representation of a I2C adapter */
> ?struct i2c_adapter {
> -???????/** Pointer to I2C driver owning this I2C adapter */
> -???????void *driver;
> -
> ????????/** Unique ID of the I2C adapter assigned by the driver */
> ????????int id;
> ?
> diff --git a/lib/utils/i2c/fdt_i2c_dw.c b/lib/utils/i2c/fdt_i2c_dw.c
> index 99b2ddb..358ad3c 100644
> --- a/lib/utils/i2c/fdt_i2c_dw.c
> +++ b/lib/utils/i2c/fdt_i2c_dw.c
> @@ -15,8 +15,6 @@
> ?#include <sbi_utils/i2c/dw_i2c.h>
> ?#include <sbi_utils/i2c/fdt_i2c.h>
> ?
> -extern struct fdt_i2c_adapter fdt_i2c_adapter_dw;
> -
> ?static int fdt_dw_i2c_init(void *fdt, int nodeoff,
> ???????????????????????????? const struct fdt_match *match)
> ?{
> @@ -35,7 +33,6 @@ static int fdt_dw_i2c_init(void *fdt, int nodeoff,
> ????????}
> ?
> ????????adapter->addr = addr;
> -???????adapter->adapter.driver = &fdt_i2c_adapter_dw;
> ?
> ????????rc = dw_i2c_init(&adapter->adapter, nodeoff);
> ????????if (rc) {
> diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
> index b85b245..1174062 100644
> --- a/lib/utils/i2c/fdt_i2c_sifive.c
> +++ b/lib/utils/i2c/fdt_i2c_sifive.c
> @@ -46,8 +46,6 @@ struct sifive_i2c_adapter {
> ????????struct i2c_adapter adapter;
> ?};
> ?
> -extern struct fdt_i2c_adapter fdt_i2c_adapter_sifive;
> -
> ?static inline void sifive_i2c_setreg(struct sifive_i2c_adapter *adap,
> ???????????????????????????????????? uint8_t reg, uint8_t value)
> ?{
> @@ -250,7 +248,6 @@ static int sifive_i2c_init(void *fdt, int nodeoff,
> ????????}
> ?
> ????????adapter->addr = addr;
> -???????adapter->adapter.driver = &fdt_i2c_adapter_sifive;
> ????????adapter->adapter.id = nodeoff;
> ????????adapter->adapter.write = sifive_i2c_adapter_write;
> ????????adapter->adapter.read = sifive_i2c_adapter_read;
> -- 
> 2.34.1
> 
> 

