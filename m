From: Xiang W <wxjstz@126.com>
Date: Sun, 02 Jan 2022 01:13:03 +0800
Subject: [PATCH v2] lib: utils/i2c: update i2c interface
In-Reply-To: <20211231121148.04a0994b@redslave.neermore.group>
References: <20211230142533.316785-1-wxjstz@126.com>
 <20211231121148.04a0994b@redslave.neermore.group>
Message-ID: <6fff6bf22dea18abf74ab340f01de08653f9f40d.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-12-31???? 12:11 +0300?Nikita Shubin???
> Hello Xiang!
> 
> On Thu, 30 Dec 2021 22:25:33 +0800
> Xiang W <wxjstz@126.com> wrote:
> 
> > 1. Remove i2c register related operations
> > 2. Simplify the low-level interface
> > 3. Add 10bit address support
> > 4. Add combination operation
> > 5. Update fdt_i2c_sifive.c
> > 6. Update sifive_fu740.c
> > 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> > Changes since v1:
> > 
> > * Simplify fdt_i2c_sifive.c
> > * Add struct i2c_msg, modify the interface
> 
> I have tried 5 times at least - all attempts fail with:
> da9063_system_reset: chip is not da9063 PMIC

The following is my restart log.

[   41.368396] [1654]: Remounting '/' read-only in with options
'(null)'.
[   41.394126] EXT4-fs (nvme0n1p3): re-mounted. Opts: (null). Quota
mode: none.
[   41.416993] systemd-shutdown[1]: All filesystems unmounted.
[   41.421874] systemd-shutdown[1]: Deactivating swaps.
[   41.427011] systemd-shutdown[1]: All swaps deactivated.
[   41.432041] systemd-shutdown[1]: Detaching loop devices.
[   41.441608] systemd-shutdown[1]: All loop devices detached.
[   41.621746] reboot: Restarting system

U-Boot SPL 2021.07-dirty (Dec 31 2021 - 16:18:44 +0800)
Trying to boot from MMC1

OpenSBI v1.0-1-g95bfa9f
Build time: 2022-01-02 01:04:19 +0800
Build compiler: gcc version 10.2.1 20210110 (Debian 10.2.1-6)
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : SiFive HiFive Unmatched A00
Platform Features         : medeleg
Platform HART Count       : 5
Platform IPI Device       : aclint-mswi
Platform Timer Device     : aclint-mtimer @ 1000000Hz
Platform Console Device   : sifive_uart
Platform HSM Device       : ---
Platform Reboot Device    : da9063-reset
Platform Shutdown Device  : gpio-poweroff
Firmware Base             : 0x80000000
Firmware Size             : 284 KB
Runtime SBI Version       : 0.3

Domain0 Name              : root
Domain0 Boot HART         : 3
Domain0 HARTs             : 0*,1*,2*,3*,4*
Domain0 Region00          : 0x0000000002000000-0x000000000200ffff (I)
Domain0 Region01          : 0x0000000080000000-0x000000008007ffff ()
Domain0 Region02          : 0x0000000000000000-0xffffffffffffffff
(R,W,X)
Domain0 Next Address      : 0x0000000080200000
Domain0 Next Arg1         : 0x0000000080295fc8
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes

Boot HART ID              : 3
Boot HART Domain          : root
Boot HART ISA             : rv64imafdcsu
Boot HART Features        : scounteren,mcounteren
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 4096
Boot HART PMP Address Bits: 36
Boot HART MHPM Count      : 2
Boot HART MIDELEG         : 0x0000000000000222
Boot HART MEDELEG         : 0x000000000000b109


U-Boot 2022.01-rc4-00001-g19f15d870f (Jan 02 2022 - 01:04:29 +0800)

CPU:   rv64imafdc
Model: SiFive HiFive Unmatched A00


> 
> Me, David and Heinrich have tested reboot before v1.0 release, 
> and it works for us, also i never encountered a reboot failure,
> after timing issue was fixed.
> 
> It's best to test this with a I2C analyser hooked up, unfortunate 
> our office is currently closed for holidays.
> 
> What hardware are you using for testing with 10bit addresses and raw
> read/write ?

I don?t have a device with a 10bit address, I implemented it with
reference to the protocol.

https://www.nxp.com/docs/en/user-guide/UM10204.pdf

> 
> If you have some real use - could you please share ?
> 
> Also it seems you missed some comments from my previous email:
> - doesn't we also need the hardware support for 10bit addr ?
> - i think how to read/write is up to driver to decide and we shouldn't
> ? expose it to upper level wich is i2c.c
> 
> > +struct i2c_msg {
> > +???????uint16_t addr;
> > +???????uint16_t flags;
> > +#define I2C_M_RD???????????????0x0001
> > +#define I2C_M_TEN??????????????0x0010
> > +#define I2C_M_RECV_LEN?????????0x0400 /* Fixup: unclear
> > meaning, currently unused */ +#define I2C_M_NO_RD_ACK
> > 0x0800 /* Fixup: unclear meaning, currently unused */ +#define
> > I2C_M_IGNORE_NAK????????0x1000 /* Fixup: unclear meaning, currently
> > unused */ +#define I2C_M_REV_DIR_ADDR???0x2000 /* Fixup: unclear
> > meaning, currently unused */ +#define I2C_M_NOSTART
> > 0x4000 +#define I2C_M_STOP??????????????0x8000
> > +???????uint16_t len;
> > +???????uint8_t *buf;
> > +};
> 
> May be we shouldn't include flags we don't use currently ?
> 
> > +???????int (*write_byte)(struct i2c_adapter *ia, uint8_t byte,
> > +???????????????????????bool send_start, bool send_stop);
> > +???????int (*read_byte)(struct i2c_adapter *ia, uint8_t *byte,
> > +???????????????????????bool nack, bool send_stop);
> 
> With i2c_msg we can wrap it with:
> (struct i2c_adapter *ia, struct i2c_msg *msg)
> 
> Where msg->len = 1, msg->buf[0] = byte, msg->flags = ?I2C_M_STOP |
> ?I2C_M_NOSTART | ?I2C_M_RD;
> 
> And simply leave only trans/xfer function as a common interface for
> transmit.
> 
> i2c_adapter_trans:
> > +???????while (len > 0) {
> > +???????????????len--;
> > +???????????????bool S = (len == 0) && !send_stop; /* repeated START
> > */
> > +???????????????bool P = (len == 0) &&? send_stop; /* STOP */
> > +???????????????if (rw)
> > +???????????????????????ret = ia->read_byte(ia, buf, S, P);
> > +???????????????else
> > +???????????????????????ret = ia->write_byte(ia, *buf, S, P);
> > +???????????????if(ret)
> > +???????????????????????return ret;
> > +???????????????buf++;
> > +???????}
> > +???????return 0;
> > +}
> 
> I don't think we should expose len processing to upper level - i think
> it's up to driver to decide how to deal with actual sending.
> 
> 



