From: Xiang W <wxjstz@126.com>
Date: Thu, 11 Nov 2021 23:09:51 +0800
Subject: [PATCH v4 3/6] lib: utils/i2c: Add generic I2C configuration
 library
In-Reply-To: <CAAhSdy0YOXNrUZ-RoiV-fvcFOU3j+MxKenh_ntKdepxRN0St0A@mail.gmail.com>
References: <20211110094230.5243-1-nikita.shubin@maquefel.me>
 <20211110094230.5243-4-nikita.shubin@maquefel.me>
 <8bef823514bd1af5dbdd9bf4904d79c215ba7f0a.camel@126.com>
 <CAAhSdy2rA4tsQa6Bi_FkrMwMs9CifK=QSGJVmySkvY9y0X2GPA@mail.gmail.com>
 <6c574a3b279871aa85ee8be5da129f5974cb0039.camel@126.com>
 <b0ab570a15162294189673875445a5102f7b1d30.camel@126.com>
 <CAAhSdy0YOXNrUZ-RoiV-fvcFOU3j+MxKenh_ntKdepxRN0St0A@mail.gmail.com>
Message-ID: <ca0fe6b1cc327ac65db2084f34810c59af9e05f7.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-11-11???? 11:46 +0530?Anup Patel???
> On Thu, Nov 11, 2021 at 10:48 AM Xiang W <wxjstz@126.com> wrote:
> > 
> > ? 2021-11-11???? 13:12 +0800?Xiang W???
> > > ? 2021-11-10???? 22:30 +0530?Anup Patel???
> > > > On Wed, Nov 10, 2021 at 6:32 PM Xiang W <wxjstz@126.com> wrote:
> > > > > 
> > > > > ? 2021-11-10???? 12:42 +0300?Nikita Shubin???
> > > > > > From: Nikita Shubin <n.shubin@yadro.com>
> > > > > > 
> > > > > > Helper library to keep track of registered I2C adapters,
> > > > > > identified by dts offset, basic send/read functions and
> > > > > > adapter configuration (enable, set dividers, etc...).
> > > > > > 
> > > > > > Tested-by: Heinrich Schuchardt
> > > > > > <heinrich.schuchardt@canonical.com>
> > > > > > Reviewed-by: Alexandre Ghiti
> > > > > > <alexandre.ghiti@canonical.com>
> > > > > > Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > > > > > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > > > > The i2c bus does not define register-related operations,
> > > > > these
> > > > > interfaces should be renamed smbus
> > > > 
> > > > I disagree with this suggestion, the existing read/write
> > > > interface
> > > > names are generic enough to send/receive an array of bytes.
> > > > These are also suitable for reading EEPROMs or DDR SPD
> > > > data, etc. I don't see why we should explicitly name it SMBUS
> > > > and restrict it's use.
> > > IIC is a particularly flexible bus. The standard only defines how
> > > to
> > > address the device, but does not define how to access the
> > > registers
> > > in
> > > the device. How to operate a device is defined by the device's
> > > data
> > > sheet.
> > > 
> > > For example: 24LC64 EEPROM random read process
> > > S: Start signal
> > > Addr(7bit): address
> > > R/W (1bit): read and write control signal
> > > A/NA(1bit): Acknowledge signal
> > > Data(8bit): data
> > > P: STOP signal
> > > []: Indicates that data is transferred from the device to the
> > > host
> > > 
> > > S Addr R [A] Data [A] Data [A] S Addr R [Data] NA P
> > The previous line is wrong, it should look like this
> > 
> > S Addr W [A] Data [A] Data [A] S Addr R [Data] NA P
> 
> I see your concern about "uint_8 reg" parameter.
> 
> I think this can be broken down into two parameters "uint8_t *cmd"
> and "int cmd_len" but this can be done as separate patch.
> 
> Regards,
> Anup

This is not enough

i2c defines three transmission modes
1. Read: Read data from the device
2. Write: Write data to the device
3. Combined operation. This is the lack of a STOP signal between two
consecutive read and write operations. Both operations can be read or
write, and the data length is not fixed.

You can refer to: https://www.pololu.com/file/0J435/UM10204.pdf

I suggest changing the interface to this:

int i2c_adapter_read(struct i2c_adapter *ia,?
	unsigned addr, unsigned addrlen, 
	unsigned count, uint8_t *buff);
int i2c_adapter_write(struct i2c_adapter *ia,
	unsigned addr, unsigned addrlen, 
	unsigned count, uint8_t *buff);
int i2c_adapter_combined_trans(struct i2c_adapter *ia, 
	unsigned addr, unsigned addrlen, 
	unsigned rw0, unsigned c0, uint8_t *b0,
	unsigned rw1, unsigned c1, uint8_t *b1);

i2c_adapter_smbus_xxx
...

Regards,
Xiang W
> 
> > 
> > > The first two Data are used to pass the address to be accessed,
> > > and
> > > the
> > > latter Data is used to accept the read data
> > > 
> > > The current interface cannot operate 24LC64
> > > 
> > > 
> > > Regards,
> > > Xiang W
> > > > 
> > > > Regards,
> > > > Anup
> > > > 
> > > > > 
> > > > > Regards,
> > > > > Xiang W
> > > > > > ---
> > > > > > v3->v4:
> > > > > > - fixed typo in include/sbi_utils/i2c/i2c.h
> > > > > > - fixed inaccurate configure remove, leaked into patch 0004
> > > > > > ---
> > > > > > ?include/sbi_utils/i2c/i2c.h | 85
> > > > > > +++++++++++++++++++++++++++++++++++++
> > > > > > ?lib/utils/i2c/i2c.c???????? | 75
> > > > > > ++++++++++++++++++++++++++++++++
> > > > > > ?lib/utils/i2c/objects.mk??? | 10 +++++
> > > > > > ?3 files changed, 170 insertions(+)
> > > > > > ?create mode 100644 include/sbi_utils/i2c/i2c.h
> > > > > > ?create mode 100644 lib/utils/i2c/i2c.c
> > > > > > ?create mode 100644 lib/utils/i2c/objects.mk
> > > > > > 
> > > > > > diff --git a/include/sbi_utils/i2c/i2c.h
> > > > > > b/include/sbi_utils/i2c/i2c.h
> > > > > > new file mode 100644
> > > > > > index 0000000..79aeeb5
> > > > > > --- /dev/null
> > > > > > +++ b/include/sbi_utils/i2c/i2c.h
> > > > > > @@ -0,0 +1,85 @@
> > > > > > +/*
> > > > > > + * SPDX-License-Identifier: BSD-2-Clause
> > > > > > + *
> > > > > > + * Copyright (c) 2021 YADRO
> > > > > > + *
> > > > > > + * Authors:
> > > > > > + *?? Nikita Shubin <n.shubin@yadro.com>
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef __I2C_H__
> > > > > > +#define __I2C_H__
> > > > > > +
> > > > > > +#include <sbi/sbi_types.h>
> > > > > > +#include <sbi/sbi_list.h>
> > > > > > +
> > > > > > +/** Representation of a I2C adapter */
> > > > > > +struct i2c_adapter {
> > > > > > +?????? /** Pointer to I2C driver owning this I2C adapter
> > > > > > */
> > > > > > +?????? void *driver;
> > > > > > +
> > > > > > +?????? /** Unique ID of the I2C adapter assigned by the
> > > > > > driver
> > > > > > */
> > > > > > +?????? int id;
> > > > > > +
> > > > > > +?????? /**
> > > > > > +??????? * Send buffer to given address, register
> > > > > > +??????? *
> > > > > > +??????? * @return 0 on success and negative error code on
> > > > > > failure
> > > > > > +??????? */
> > > > > > +?????? int (*write)(struct i2c_adapter *ia, uint8_t addr,
> > > > > > uint8_t
> > > > > > reg,
> > > > > > +?????????????????? uint8_t *buffer, int len);
> > > > > > +
> > > > > > +?????? /**
> > > > > > +??????? * Read buffer from given address, register
> > > > > > +??????? *
> > > > > > +??????? * @return 0 on success and negative error code on
> > > > > > failure
> > > > > > +??????? */
> > > > > > +?????? int (*read)(struct i2c_adapter *ia, uint8_t addr,
> > > > > > uint8_t
> > > > > > reg,
> > > > > > +?????????????????? uint8_t *buffer, int len);
> > > > > > +
> > > > > > +?????? /** List */
> > > > > > +?????? struct sbi_dlist node;
> > > > > > +};
> > > > > > +
> > > > > > +static inline struct i2c_adapter *to_i2c_adapter(struct
> > > > > > sbi_dlist
> > > > > > *node)
> > > > > > +{
> > > > > > +?????? return container_of(node, struct i2c_adapter,
> > > > > > node);
> > > > > > +}
> > > > > > +
> > > > > > +/** Find a registered I2C adapter */
> > > > > > +struct i2c_adapter *i2c_adapter_find(int id);
> > > > > > +
> > > > > > +/** Register I2C adapter */
> > > > > > +int i2c_adapter_add(struct i2c_adapter *ia);
> > > > > > +
> > > > > > +/** Un-register I2C adapter */
> > > > > > +void i2c_adapter_remove(struct i2c_adapter *ia);
> > > > > > +
> > > > > > +/** Send to device on I2C adapter bus */
> > > > > > +int i2c_adapter_write(struct i2c_adapter *ia, uint8_t
> > > > > > addr,
> > > > > > uint8_t
> > > > > > reg,
> > > > > > +???????????????????? uint8_t *buffer, int len);
> > > > > > +
> > > > > > +/** Read from device on I2C adapter bus */
> > > > > > +int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr,
> > > > > > uint8_t
> > > > > > reg,
> > > > > > +??????????????????? uint8_t *buffer, int len);
> > > > > > +
> > > > > > +static inline int i2c_adapter_reg_write(struct i2c_adapter
> > > > > > *ia,
> > > > > > uint8_t addr,
> > > > > > +??????????????????????????????? uint8_t reg, uint8_t val)
> > > > > > +{
> > > > > > +?????? return i2c_adapter_write(ia, addr, reg, &val, 1);
> > > > > > +}
> > > > > > +
> > > > > > +static inline int i2c_adapter_reg_read(struct i2c_adapter
> > > > > > *ia,
> > > > > > uint8_t addr,
> > > > > > +????????????????????????????????????? uint8_t reg, uint8_t
> > > > > > *val)
> > > > > > +{
> > > > > > +?????? uint8_t buf;
> > > > > > +?????? int ret = i2c_adapter_read(ia, addr, reg, &buf, 1);
> > > > > > +
> > > > > > +?????? if (ret)
> > > > > > +?????????????? return ret;
> > > > > > +
> > > > > > +?????? *val = buf;
> > > > > > +?????? return 0;
> > > > > > +}
> > > > > > +
> > > > > > +#endif
> > > > > > diff --git a/lib/utils/i2c/i2c.c b/lib/utils/i2c/i2c.c
> > > > > > new file mode 100644
> > > > > > index 0000000..1f5072c
> > > > > > --- /dev/null
> > > > > > +++ b/lib/utils/i2c/i2c.c
> > > > > > @@ -0,0 +1,75 @@
> > > > > > +/*
> > > > > > + * SPDX-License-Identifier: BSD-2-Clause
> > > > > > + *
> > > > > > + * Copyright (c) 2021 YADRO
> > > > > > + *
> > > > > > + * Authors:
> > > > > > + *?? Nikita Shubin <n.shubin@yadro.com>
> > > > > > + *
> > > > > > + * derivate: lib/utils/gpio/gpio.c
> > > > > > + * Authors:
> > > > > > + *?? Anup Patel <anup.patel@wdc.com>
> > > > > > + */
> > > > > > +
> > > > > > +#include <sbi/sbi_error.h>
> > > > > > +#include <sbi_utils/i2c/i2c.h>
> > > > > > +
> > > > > > +static SBI_LIST_HEAD(i2c_adapters_list);
> > > > > > +
> > > > > > +struct i2c_adapter *i2c_adapter_find(int id)
> > > > > > +{
> > > > > > +?????? struct sbi_dlist *pos;
> > > > > > +
> > > > > > +?????? sbi_list_for_each(pos, &(i2c_adapters_list)) {
> > > > > > +?????????????? struct i2c_adapter *adap =
> > > > > > to_i2c_adapter(pos);
> > > > > > +
> > > > > > +?????????????? if (adap->id == id)
> > > > > > +?????????????????????? return adap;
> > > > > > +?????? }
> > > > > > +
> > > > > > +?????? return NULL;
> > > > > > +}
> > > > > > +
> > > > > > +int i2c_adapter_add(struct i2c_adapter *ia)
> > > > > > +{
> > > > > > +?????? if (!ia)
> > > > > > +?????????????? return SBI_EINVAL;
> > > > > > +
> > > > > > +?????? if (i2c_adapter_find(ia->id))
> > > > > > +?????????????? return SBI_EALREADY;
> > > > > > +
> > > > > > +?????? sbi_list_add(&(ia->node), &(i2c_adapters_list));
> > > > > > +
> > > > > > +?????? return 0;
> > > > > > +}
> > > > > > +
> > > > > > +void i2c_adapter_remove(struct i2c_adapter *ia)
> > > > > > +{
> > > > > > +?????? if (!ia)
> > > > > > +?????????????? return;
> > > > > > +
> > > > > > +?????? sbi_list_del(&(ia->node));
> > > > > > +}
> > > > > > +
> > > > > > +int i2c_adapter_write(struct i2c_adapter *ia, uint8_t
> > > > > > addr,
> > > > > > uint8_t
> > > > > > reg,
> > > > > > +??????????????????? uint8_t *buffer, int len)
> > > > > > +{
> > > > > > +?????? if (!ia)
> > > > > > +?????????????? return SBI_EINVAL;
> > > > > > +?????? if (!ia->write)
> > > > > > +?????????????? return SBI_ENOSYS;
> > > > > > +
> > > > > > +?????? return ia->write(ia, addr, reg, buffer, len);
> > > > > > +}
> > > > > > +
> > > > > > +
> > > > > > +int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr,
> > > > > > uint8_t
> > > > > > reg,
> > > > > > +??????????????????? uint8_t *buffer, int len)
> > > > > > +{
> > > > > > +?????? if (!ia)
> > > > > > +?????????????? return SBI_EINVAL;
> > > > > > +?????? if (!ia->read)
> > > > > > +?????????????? return SBI_ENOSYS;
> > > > > > +
> > > > > > +?????? return ia->read(ia, addr, reg, buffer, len);
> > > > > > +}
> > > > > > diff --git a/lib/utils/i2c/objects.mk
> > > > > > b/lib/utils/i2c/objects.mk
> > > > > > new file mode 100644
> > > > > > index 0000000..16a70da
> > > > > > --- /dev/null
> > > > > > +++ b/lib/utils/i2c/objects.mk
> > > > > > @@ -0,0 +1,10 @@
> > > > > > +#
> > > > > > +# SPDX-License-Identifier: BSD-2-Clause
> > > > > > +#
> > > > > > +# Copyright (c) 2021 YADRO
> > > > > > +#
> > > > > > +# Authors:
> > > > > > +#?? Nikita Shubin <n.shubin@yadro.com>
> > > > > > +#
> > > > > > +
> > > > > > +libsbiutils-objs-y += i2c/i2c.o
> > > > > > --
> > > > > > 2.31.1
> > > > > > 
> > > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > --
> > > > > opensbi mailing list
> > > > > opensbi at lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > > 
> > > 
> > > 
> > 
> > 



