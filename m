From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon, 3 Jan 2022 08:56:57 +0100
Subject: [PATCH v2] lib: utils/i2c: update i2c interface
In-Reply-To: <20211230142533.316785-1-wxjstz@126.com>
References: <20211230142533.316785-1-wxjstz@126.com>
Message-ID: <2ce37fe3-cb51-22ed-ef6d-c1cd0e026b13@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/30/21 15:25, Xiang W wrote:
> 1. Remove i2c register related operations
> 2. Simplify the low-level interface
> 3. Add 10bit address support
> 4. Add combination operation
> 5. Update fdt_i2c_sifive.c
> 6. Update sifive_fu740.c
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> Changes since v1:
> 
> * Simplify fdt_i2c_sifive.c
> * Add struct i2c_msg, modify the interface
> 
>   include/sbi_utils/i2c/i2c.h     |  65 ++++++---------
>   lib/utils/i2c/fdt_i2c_sifive.c  | 136 +++++++-------------------------
>   lib/utils/i2c/i2c.c             |  70 +++++++++++-----
>   platform/generic/sifive_fu740.c |  52 ++++++++++--
>   4 files changed, 148 insertions(+), 175 deletions(-)
> 
> diff --git a/include/sbi_utils/i2c/i2c.h b/include/sbi_utils/i2c/i2c.h
> index 5a70364..307fa55 100644
> --- a/include/sbi_utils/i2c/i2c.h
> +++ b/include/sbi_utils/i2c/i2c.h
> @@ -13,6 +13,21 @@
>   #include <sbi/sbi_types.h>
>   #include <sbi/sbi_list.h>
>   
> +struct i2c_msg {
> +	uint16_t addr;
> +	uint16_t flags;
> +#define I2C_M_RD		0x0001
> +#define I2C_M_TEN		0x0010
> +#define I2C_M_RECV_LEN		0x0400 /* Fixup: unclear meaning, currently unused */

This flag is used for SMBUS emulation.

> +#define I2C_M_NO_RD_ACK		0x0800 /* Fixup: unclear meaning, currently unused */
> +#define I2C_M_IGNORE_NAK	0x1000 /* Fixup: unclear meaning, currently unused */
> +#define I2C_M_REV_DIR_ADDR	0x2000 /* Fixup: unclear meaning, currently unused */

Please, have a look at
https://www.kernel.org/doc/Documentation/i2c/i2c-protocol

Best regards

Heinrich

> +#define I2C_M_NOSTART		0x4000
> +#define I2C_M_STOP		0x8000
> +	uint16_t len;
> +	uint8_t *buf;
> +};
> +
>   /** Representation of a I2C adapter */
>   struct i2c_adapter {
>   	/** Pointer to I2C driver owning this I2C adapter */
> @@ -21,21 +36,11 @@ struct i2c_adapter {
>   	/** Unique ID of the I2C adapter assigned by the driver */
>   	int id;
>   
> -	/**
> -	 * Send buffer to given address, register
> -	 *
> -	 * @return 0 on success and negative error code on failure
> -	 */
> -	int (*write)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
> -		    uint8_t *buffer, int len);
> +	int (*write_byte)(struct i2c_adapter *ia, uint8_t byte,
> +			bool send_start, bool send_stop);
>   
> -	/**
> -	 * Read buffer from given address, register
> -	 *
> -	 * @return 0 on success and negative error code on failure
> -	 */
> -	int (*read)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
> -		    uint8_t *buffer, int len);
> +	int (*read_byte)(struct i2c_adapter *ia, uint8_t *byte,
> +			bool nack, bool send_stop);
>   
>   	/** List */
>   	struct sbi_dlist node;
> @@ -55,31 +60,11 @@ int i2c_adapter_add(struct i2c_adapter *ia);
>   /** Un-register I2C adapter */
>   void i2c_adapter_remove(struct i2c_adapter *ia);
>   
> -/** Send to device on I2C adapter bus */
> -int i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
> -		      uint8_t *buffer, int len);
> -
> -/** Read from device on I2C adapter bus */
> -int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
> -		     uint8_t *buffer, int len);
> -
> -static inline int i2c_adapter_reg_write(struct i2c_adapter *ia, uint8_t addr,
> -				 uint8_t reg, uint8_t val)
> -{
> -	return i2c_adapter_write(ia, addr, reg, &val, 1);
> -}
> -
> -static inline int i2c_adapter_reg_read(struct i2c_adapter *ia, uint8_t addr,
> -				       uint8_t reg, uint8_t *val)
> -{
> -	uint8_t buf;
> -	int ret = i2c_adapter_read(ia, addr, reg, &buf, 1);
> -
> -	if (ret)
> -		return ret;
> -
> -	*val = buf;
> -	return 0;
> -}
> +/**
> + * once  message transmission
> + * It can be a complete read or write
> + * can also be used in combination to form a combined transmission
> + */
> +int i2c_adapter_trans(struct i2c_adapter *ia, struct i2c_msg *msg);
>   
>   #endif
> diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
> index 871241a..47d85f3 100644
> --- a/lib/utils/i2c/fdt_i2c_sifive.c
> +++ b/lib/utils/i2c/fdt_i2c_sifive.c
> @@ -101,139 +101,59 @@ static int sifive_i2c_adapter_poll(struct sifive_i2c_adapter *adap,
>   #define sifive_i2c_adapter_poll_busy(adap)	\
>   sifive_i2c_adapter_poll(adap, SIFIVE_I2C_STATUS_BUSY)
>   
> -static int sifive_i2c_adapter_start(struct sifive_i2c_adapter *adap,
> -				    uint8_t addr, uint8_t bit)
> -{
> -	uint8_t val = (addr << 1) | bit;
> -
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, val);
> -	val = SIFIVE_I2C_CMD_STA | SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK;
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, val);
> -
> -	return sifive_i2c_adapter_poll_tip(adap);
> -}
> -
> -static int sifive_i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr,
> -				    uint8_t reg, uint8_t *buffer, int len)
> +static int sifive_i2c_adapter_write_byte(struct i2c_adapter *ia,
> +				uint8_t byte, bool send_start, bool send_stop)
>   {
>   	struct sifive_i2c_adapter *adap =
>   		container_of(ia, struct sifive_i2c_adapter, adapter);
> -	int rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_WRITE_BIT);
> -
> -	if (rc)
> -		return rc;
> -
> -	rc = sifive_i2c_adapter_rxack(adap);
> -	if (rc)
> -		return rc;
> -
> -	/* set register address */
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, reg);
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR |
> -				SIFIVE_I2C_CMD_IACK);
> +	int rc;
> +	uint8_t val;
> +	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, byte);
> +	val = SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK;
> +	if (send_start)
> +		val |= SIFIVE_I2C_CMD_STA;
> +	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, val);
>   	rc = sifive_i2c_adapter_poll_tip(adap);
>   	if (rc)
>   		return rc;
> -
>   	rc = sifive_i2c_adapter_rxack(adap);
>   	if (rc)
>   		return rc;
>   
> -	/* set value */
> -	while (len) {
> -		sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, *buffer);
> -		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR |
> -						       SIFIVE_I2C_CMD_IACK);
> -
> -		rc = sifive_i2c_adapter_poll_tip(adap);
> -		if (rc)
> -			return rc;
> -
> -		rc = sifive_i2c_adapter_rxack(adap);
> +	if (send_stop) {
> +		sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
> +			SIFIVE_I2C_CMD_STO | SIFIVE_I2C_CMD_IACK);
> +		rc = sifive_i2c_adapter_poll_busy(adap);
>   		if (rc)
>   			return rc;
> -
> -		buffer++;
> -		len--;
> +		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
>   	}
> -
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO |
> -					       SIFIVE_I2C_CMD_IACK);
> -
> -	/* poll BUSY instead of ACK*/
> -	rc = sifive_i2c_adapter_poll_busy(adap);
> -	if (rc)
> -		return rc;
> -
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
> -
>   	return 0;
>   }
>   
> -static int sifive_i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr,
> -				   uint8_t reg, uint8_t *buffer, int len)
> +static int sifive_i2c_adapter_read_byte(struct i2c_adapter *ia,
> +				uint8_t *byte, bool nack, bool send_stop)
>   {
>   	struct sifive_i2c_adapter *adap =
>   		container_of(ia, struct sifive_i2c_adapter, adapter);
>   	int rc;
> -
> -	rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_WRITE_BIT);
> -	if (rc)
> -		return rc;
> -
> -	rc = sifive_i2c_adapter_rxack(adap);
> -	if (rc)
> -		return rc;
> -
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, reg);
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR |
> -					       SIFIVE_I2C_CMD_IACK);
> -
> +	uint8_t val = SIFIVE_I2C_CMD_RD | SIFIVE_I2C_CMD_IACK;
> +	if (nack)
> +		val |= SIFIVE_I2C_CMD_ACK;
> +	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, val);
>   	rc = sifive_i2c_adapter_poll_tip(adap);
>   	if (rc)
>   		return rc;
> +	*byte = sifive_i2c_getreg(adap, SIFIVE_I2C_RXR);
>   
> -	rc = sifive_i2c_adapter_rxack(adap);
> -	if (rc)
> -		return rc;
> -
> -	/* setting addr with high 0 bit */
> -	rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_READ_BIT);
> -	if (rc)
> -		return rc;
> -
> -	rc = sifive_i2c_adapter_rxack(adap);
> -	if (rc)
> -		return rc;
> -
> -	while (len) {
> -		if (len == 1)
> -			sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
> -					  SIFIVE_I2C_CMD_ACK |
> -					  SIFIVE_I2C_CMD_RD |
> -					  SIFIVE_I2C_CMD_IACK);
> -		else
> -			sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
> -					  SIFIVE_I2C_CMD_RD |
> -					  SIFIVE_I2C_CMD_IACK);
> -
> -		rc = sifive_i2c_adapter_poll_tip(adap);
> +	if (send_stop) {
> +		sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
> +			SIFIVE_I2C_CMD_STO | SIFIVE_I2C_CMD_IACK);
> +		rc = sifive_i2c_adapter_poll_busy(adap);
>   		if (rc)
>   			return rc;
> -
> -		*buffer = sifive_i2c_getreg(adap, SIFIVE_I2C_RXR);
> -		buffer++;
> -		len--;
> +		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
>   	}
> -
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO |
> -					       SIFIVE_I2C_CMD_IACK);
> -	rc = sifive_i2c_adapter_poll_busy(adap);
> -	if (rc)
> -		return rc;
> -
> -	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
> -
>   	return 0;
>   }
>   
> @@ -256,8 +176,8 @@ static int sifive_i2c_init(void *fdt, int nodeoff,
>   	adapter->addr = addr;
>   	adapter->adapter.driver = &fdt_i2c_adapter_sifive;
>   	adapter->adapter.id = nodeoff;
> -	adapter->adapter.write = sifive_i2c_adapter_write;
> -	adapter->adapter.read = sifive_i2c_adapter_read;
> +	adapter->adapter.write_byte = sifive_i2c_adapter_write_byte;
> +	adapter->adapter.read_byte = sifive_i2c_adapter_read_byte;
>   	rc = i2c_adapter_add(&adapter->adapter);
>   	if (rc)
>   		return rc;
> diff --git a/lib/utils/i2c/i2c.c b/lib/utils/i2c/i2c.c
> index 6be4e24..841756e 100644
> --- a/lib/utils/i2c/i2c.c
> +++ b/lib/utils/i2c/i2c.c
> @@ -12,6 +12,7 @@
>    */
>   
>   #include <sbi/sbi_error.h>
> +#include <sbi/sbi_string.h>
>   #include <sbi_utils/i2c/i2c.h>
>   
>   static SBI_LIST_HEAD(i2c_adapters_list);
> @@ -51,25 +52,56 @@ void i2c_adapter_remove(struct i2c_adapter *ia)
>   	sbi_list_del(&(ia->node));
>   }
>   
> -int i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
> -		     uint8_t *buffer, int len)
> +int i2c_adapter_trans(struct i2c_adapter *ia, struct i2c_msg *msg)
>   {
> -	if (!ia)
> -		return SBI_EINVAL;
> -	if (!ia->write)
> -		return SBI_ENOSYS;
> -
> -	return ia->write(ia, addr, reg, buffer, len);
> -}
> -
> -
> -int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
> -		     uint8_t *buffer, int len)
> -{
> -	if (!ia)
> +	int ret;
> +	uint8_t rw = msg->flags & I2C_M_RD;
> +	uint8_t *buf = msg->buf;
> +	uint16_t len = msg->len;
> +	bool ten = msg->flags & I2C_M_TEN;
> +	bool send_start = !(msg->flags & I2C_M_NOSTART);
> +	bool send_stop = msg->flags & I2C_M_STOP;
> +
> +	if(len == 0)
>   		return SBI_EINVAL;
> -	if (!ia->read)
> -		return SBI_ENOSYS;
>   
> -	return ia->read(ia, addr, reg, buffer, len);
> -}
> +	if (ten) {
> +		uint8_t addr_h = ((msg->addr >> 8) & 3) | 0x7c;
> +		uint8_t addr_l = msg->addr & 0xff;
> +		if (send_start) {
> +			ret = ia->write_byte(ia, (addr_h << 1) | 0, true, false);
> +			if (ret)
> +				return ret;
> +			ret = ia->write_byte(ia, addr_l, false, false);
> +			if (ret)
> +				return ret;
> +			if (rw) {
> +				ret = ia->write_byte(ia, (addr_h << 1) | 1, true, false);
> +				if (ret)
> +					return ret;
> +			}
> +		} else {
> +			ret = ia->write_byte(ia, (addr_h << 1) | rw, false, false);
> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		uint8_t addr = msg->addr & 0x7f;
> +		ret = ia->write_byte(ia, (addr << 1) | rw, send_start, false);
> +		if (ret)
> +			return ret;
> +	}
> +	while (len > 0) {
> +		len--;
> +		bool S = (len == 0) && !send_stop; /* repeated START */
> +		bool P = (len == 0) &&  send_stop; /* STOP */
> +		if (rw)
> +			ret = ia->read_byte(ia, buf, S, P);
> +		else
> +			ret = ia->write_byte(ia, *buf, S, P);
> +		if(ret)
> +			return ret;
> +		buf++;
> +	}
> +	return 0;
> +}
> \ No newline at end of file
> diff --git a/platform/generic/sifive_fu740.c b/platform/generic/sifive_fu740.c
> index 333b3fb..de82041 100644
> --- a/platform/generic/sifive_fu740.c
> +++ b/platform/generic/sifive_fu740.c
> @@ -34,6 +34,42 @@
>   
>   #define PMIC_CHIP_ID_DA9063		0x61
>   
> +static inline int da9063_read_reg(struct i2c_adapter *adap, uint8_t addr,
> +	uint8_t reg, uint8_t *val)
> +{
> +	struct i2c_msg msg1 = {
> +		.addr = addr,
> +		.flags = 0,
> +		.len = 1,
> +		.buf = &reg
> +	};
> +	struct i2c_msg msg2 = {
> +		.addr = addr,
> +		.flags = I2C_M_RD | I2C_M_NOSTART | I2C_M_STOP,
> +		.len = 1,
> +		.buf = val
> +	};
> +	int ret = i2c_adapter_trans(adap, &msg1);
> +	if (ret)
> +		return ret;
> +	return i2c_adapter_trans(adap, &msg2);
> +}
> +
> +static inline int da9063_write_reg(struct i2c_adapter *adap, uint8_t addr,
> +	uint8_t reg, uint8_t val)
> +{
> +	uint8_t buff[2];
> +	buff[0] = reg;
> +	buff[1] = val;
> +	struct i2c_msg msg = {
> +		.addr = addr,
> +		.flags = I2C_M_STOP,
> +		.len = sizeof(buff),
> +		.buf = buff
> +	};
> +	return i2c_adapter_trans(adap, &msg);
> +}
> +
>   static struct {
>   	struct i2c_adapter *adapter;
>   	uint32_t reg;
> @@ -55,13 +91,13 @@ static int da9063_system_reset_check(u32 type, u32 reason)
>   static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
>   {
>   	uint8_t val;
> -	int rc = i2c_adapter_reg_write(adap, reg, DA9063_REG_PAGE_CON, 0x02);
> +	int rc = da9063_write_reg(adap, reg, DA9063_REG_PAGE_CON, 0x02);
>   
>   	if (rc)
>   		return rc;
>   
>   	/* check set page*/
> -	rc = i2c_adapter_reg_read(adap, reg, 0x0, &val);
> +	rc = da9063_read_reg(adap, reg, 0x0, &val);
>   	if (rc)
>   		return rc;
>   
> @@ -69,7 +105,7 @@ static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
>   		return SBI_ENODEV;
>   
>   	/* read and check device id */
> -	rc = i2c_adapter_reg_read(adap, reg, DA9063_REG_DEVICE_ID, &val);
> +	rc = da9063_read_reg(adap, reg, DA9063_REG_DEVICE_ID, &val);
>   	if (rc)
>   		return rc;
>   
> @@ -81,32 +117,32 @@ static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
>   
>   static inline int da9063_shutdown(struct i2c_adapter *adap, uint32_t reg)
>   {
> -	int rc = i2c_adapter_reg_write(adap, da9063.reg,
> +	int rc = da9063_write_reg(adap, da9063.reg,
>   					DA9063_REG_PAGE_CON, 0x00);
>   
>   	if (rc)
>   		return rc;
>   
> -	return i2c_adapter_reg_write(adap, da9063.reg,
> +	return da9063_write_reg(adap, da9063.reg,
>   				     DA9063_REG_CONTROL_F,
>   				     DA9063_CONTROL_F_SHUTDOWN);
>   }
>   
>   static inline int da9063_reset(struct i2c_adapter *adap, uint32_t reg)
>   {
> -	int rc = i2c_adapter_reg_write(adap, da9063.reg,
> +	int rc = da9063_write_reg(adap, da9063.reg,
>   					DA9063_REG_PAGE_CON, 0x00);
>   
>   	if (rc)
>   		return rc;
>   
> -	rc = i2c_adapter_reg_write(adap, da9063.reg,
> +	rc = da9063_write_reg(adap, da9063.reg,
>   				   DA9063_REG_CONTROL_F,
>   				   DA9063_CONTROL_F_WAKEUP);
>   	if (rc)
>   		return rc;
>   
> -	return i2c_adapter_reg_write(adap, da9063.reg,
> +	return da9063_write_reg(adap, da9063.reg,
>   				DA9063_REG_CONTROL_A,
>   				DA9063_CONTROL_A_M_POWER1_EN |
>   				DA9063_CONTROL_A_M_POWER_EN |

