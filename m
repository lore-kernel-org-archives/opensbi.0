From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Fri, 31 Dec 2021 12:11:48 +0300
Subject: [PATCH v2] lib: utils/i2c: update i2c interface
In-Reply-To: <20211230142533.316785-1-wxjstz@126.com>
References: <20211230142533.316785-1-wxjstz@126.com>
Message-ID: <20211231121148.04a0994b@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Xiang!

On Thu, 30 Dec 2021 22:25:33 +0800
Xiang W <wxjstz@126.com> wrote:

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

I have tried 5 times at least - all attempts fail with:
da9063_system_reset: chip is not da9063 PMIC

Me, David and Heinrich have tested reboot before v1.0 release, 
and it works for us, also i never encountered a reboot failure,
after timing issue was fixed.

It's best to test this with a I2C analyser hooked up, unfortunate 
our office is currently closed for holidays.

What hardware are you using for testing with 10bit addresses and raw
read/write ?

If you have some real use - could you please share ?

Also it seems you missed some comments from my previous email:
- doesn't we also need the hardware support for 10bit addr ?
- i think how to read/write is up to driver to decide and we shouldn't
  expose it to upper level wich is i2c.c

> +struct i2c_msg {
> +	uint16_t addr;
> +	uint16_t flags;
> +#define I2C_M_RD		0x0001
> +#define I2C_M_TEN		0x0010
> +#define I2C_M_RECV_LEN		0x0400 /* Fixup: unclear
> meaning, currently unused */ +#define I2C_M_NO_RD_ACK
> 0x0800 /* Fixup: unclear meaning, currently unused */ +#define
> I2C_M_IGNORE_NAK	0x1000 /* Fixup: unclear meaning, currently
> unused */ +#define I2C_M_REV_DIR_ADDR	0x2000 /* Fixup: unclear
> meaning, currently unused */ +#define I2C_M_NOSTART
> 0x4000 +#define I2C_M_STOP		0x8000
> +	uint16_t len;
> +	uint8_t *buf;
> +};

May be we shouldn't include flags we don't use currently ?

> +	int (*write_byte)(struct i2c_adapter *ia, uint8_t byte,
> +			bool send_start, bool send_stop);
> +	int (*read_byte)(struct i2c_adapter *ia, uint8_t *byte,
> +			bool nack, bool send_stop);

With i2c_msg we can wrap it with:
(struct i2c_adapter *ia, struct i2c_msg *msg)

Where msg->len = 1, msg->buf[0] = byte, msg->flags = ?I2C_M_STOP |
?I2C_M_NOSTART | ?I2C_M_RD;

And simply leave only trans/xfer function as a common interface for
transmit.

i2c_adapter_trans:
> +	while (len > 0) {
> +		len--;
> +		bool S = (len == 0) && !send_stop; /* repeated START
> */
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

I don't think we should expose len processing to upper level - i think
it's up to driver to decide how to deal with actual sending.




