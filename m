From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Wed, 20 Oct 2021 09:41:34 +0300
Subject: [PATCH v2 2/5] lib: utils/i2c: Add generic I2C configuration
 library
In-Reply-To: <CA+zEjCuqpvsM2D839yRZv0g8icoXg2wKKUuBzMv3fQT05gGptg@mail.gmail.com>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <20211015131925.22585-3-nikita.shubin@maquefel.me>
 <CA+zEjCuqpvsM2D839yRZv0g8icoXg2wKKUuBzMv3fQT05gGptg@mail.gmail.com>
Message-ID: <20211020094134.6200acb1@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Alexandre!

On Tue, 19 Oct 2021 14:04:28 +0200
Alexandre Ghiti <alexandre.ghiti@canonical.com> wrote:

> On Fri, Oct 15, 2021 at 3:20 PM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:>
> > From: Nikita Shubin <n.shubin@yadro.com>
> >
> > Helper library to keep track of registered I2C adapters,
> > identified by dts offset, basic send/read functions and
> > adapter configuration (enable, set dividers, etc...).
> >
> > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > ---
> > v1 -> v2:
> > - switch to lists instead of array
> > - rename send to write
> > - use buffers instead of single byte
> > - add single byte read/write
> > ---
> >  include/sbi_utils/i2c/i2c.h | 99
> > +++++++++++++++++++++++++++++++++++++ lib/utils/i2c/i2c.c         |
> > 85 +++++++++++++++++++++++++++++++ lib/utils/i2c/objects.mk    | 10
> > ++++ 3 files changed, 194 insertions(+)
> >  create mode 100644 include/sbi_utils/i2c/i2c.h
> >  create mode 100644 lib/utils/i2c/i2c.c
> >  create mode 100644 lib/utils/i2c/objects.mk
> >
> > diff --git a/include/sbi_utils/i2c/i2c.h
> > b/include/sbi_utils/i2c/i2c.h new file mode 100644
> > index 0000000..76cdb66
> > --- /dev/null
> > +++ b/include/sbi_utils/i2c/i2c.h
> > @@ -0,0 +1,99 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 YADRO
> > + *
> > + * Authors:
> > + *   Nikita Shubin <nshubin@yadro.com>
> > + */
> > +
> > +#ifndef __I2C_H__
> > +#define __I2C_H__
> > +
> > +#include <sbi/sbi_types.h>
> > +#include <sbi/sbi_list.h>
> > +
> > +/** Representation of a I2C adapter */
> > +struct i2c_adapter {
> > +       /** Pointer to I2C driver owning this I2C adapter */
> > +       void *driver;
> > +
> > +       /** Unique ID of the I2C adapter assigned by the driver */
> > +       int id;
> > +
> > +       /**
> > +        * Configure I2C adapter
> > +        *
> > +        * Enable, set dividers, etc...
> > +        *
> > +        * @return 0 on success and negative error code on failure
> > +        */
> > +       int (*configure)(struct i2c_adapter *ia);
> > +
> > +       /**
> > +        * Send buffer to given address, register
> > +        *
> > +        * @return 0 on success and negative error code on failure
> > +        */
> > +       int (*smbus_write)(struct i2c_adapter *ia, uint8_t addr,
> > uint8_t reg,
> > +                   uint8_t *buffer, int len);  
> 
> Why did you rename those functions with smbus prefix? And I would use
> size_t for the len argument.

Cause, i think, actually specifying a register to read/write as a part
of transaction is an smbus thing, as i stated in cover letter, raw
read/write i2c don't use repeated start.

And may be size_t indeed.

> 
> > +
> > +       /**
> > +        * Read buffer from given address, register
> > +        *
> > +        * @return 0 on success and negative error code on failure
> > +        */
> > +       int (*smbus_read)(struct i2c_adapter *ia, uint8_t addr,
> > uint8_t reg,
> > +                   uint8_t *buffer, int len);
> > +
> > +       /** List */
> > +       struct sbi_dlist node;
> > +};
> > +
> > +static inline struct i2c_adapter *to_i2c_adapter(struct sbi_dlist
> > *node) +{
> > +       return container_of(node, struct i2c_adapter, node);
> > +}
> > +
> > +/** Find a registered I2C adapter */
> > +struct i2c_adapter *i2c_adapter_find(int id);
> > +
> > +/** Register I2C adapter */
> > +int i2c_adapter_add(struct i2c_adapter *ia);
> > +
> > +/** Un-register I2C adapter */
> > +void i2c_adapter_remove(struct i2c_adapter *ia);
> > +
> > +/** Configure I2C adapter prior to send/read */
> > +int i2c_adapter_configure(struct i2c_adapter *ia);
> > +
> > +/** Write to device on I2C adapter bus */
> > +int i2c_adapter_smbus_write(struct i2c_adapter *ia, uint8_t addr,
> > +                       uint8_t reg, uint8_t *buffer, int len);
> > +
> > +/** Read from device on I2C adapter bus */
> > +int i2c_adapter_smbus_read(struct i2c_adapter *ia, uint8_t addr,
> > +                       uint8_t reg, uint8_t *buffer, int len);
> > +
> > +/** Write single byte from device on I2C adapter bus */
> > +static inline int i2c_adapter_smbus_reg_write(struct i2c_adapter
> > *ia,
> > +                               uint8_t addr, uint8_t reg, uint8_t
> > val) +{
> > +       return i2c_adapter_smbus_write(ia, addr, reg, &val, 1);
> > +}
> > +
> > +/** Read single byte from device on I2C adapter bus */
> > +static inline int i2c_adapter_smbus_reg_read(struct i2c_adapter
> > *ia,
> > +                               uint8_t addr, uint8_t reg, uint8_t
> > *val) +{
> > +       uint8_t buf;
> > +       int ret = i2c_adapter_smbus_read(ia, addr, reg, &buf, 1);
> > +
> > +       if (ret)
> > +               return ret;
> > +
> > +       *val = buf;
> > +       return 0;
> > +}  
> 
> Nice to add the helpers, though I'm not sure "reg_read" is the right
> suffix as it may not be quite explicit: what about simply read_byte?

I think byte_read/byte_write should be "raw" and omit the
uint8_t reg and have naming like:

i2c_adapter_byte_read
i2c_adapter_byte_write

Without smbus prefix, but that's a bit different story.


> 
> > +
> > +#endif
> > diff --git a/lib/utils/i2c/i2c.c b/lib/utils/i2c/i2c.c
> > new file mode 100644
> > index 0000000..d23ac91
> > --- /dev/null
> > +++ b/lib/utils/i2c/i2c.c
> > @@ -0,0 +1,85 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 YADRO
> > + *
> > + * Authors:
> > + *   Nikita Shubin <nshubin@yadro.com>
> > + *
> > + * derivate: lib/utils/gpio/gpio.c
> > + * Authors:
> > + *   Anup Patel <anup.patel@wdc.com>
> > + */
> > +
> > +#include <sbi/sbi_error.h>
> > +#include <sbi_utils/i2c/i2c.h>
> > +
> > +static SBI_LIST_HEAD(i2c_adapters_list);
> > +
> > +struct i2c_adapter *i2c_adapter_find(int id)
> > +{
> > +       struct sbi_dlist *pos;
> > +
> > +       sbi_list_for_each(pos, &(i2c_adapters_list)) {
> > +               struct i2c_adapter *adap = to_i2c_adapter(pos);
> > +
> > +               if (adap->id == id)
> > +                       return adap;
> > +       }
> > +
> > +       return NULL;
> > +}
> > +
> > +int i2c_adapter_add(struct i2c_adapter *ia)
> > +{
> > +       if (!ia)
> > +               return SBI_EINVAL;
> > +
> > +       if (i2c_adapter_find(ia->id))
> > +               return SBI_EALREADY;
> > +
> > +       sbi_list_add(&(ia->node), &(i2c_adapters_list));
> > +
> > +       return 0;
> > +}
> > +
> > +void i2c_adapter_remove(struct i2c_adapter *ia)
> > +{
> > +       if (!ia)
> > +               return;
> > +
> > +       sbi_list_del(&(ia->node));
> > +}
> > +
> > +int i2c_adapter_configure(struct i2c_adapter *ia)
> > +{
> > +       if (!ia)
> > +               return SBI_EINVAL;
> > +       if (!ia->configure)
> > +               return 0;
> > +
> > +       return ia->configure(ia);
> > +}
> > +
> > +int i2c_adapter_smbus_write(struct i2c_adapter *ia, uint8_t addr,
> > +                       uint8_t reg, uint8_t *buffer, int len)
> > +{
> > +       if (!ia)
> > +               return SBI_EINVAL;
> > +       if (!ia->smbus_write)
> > +               return SBI_ENOSYS;
> > +
> > +       return ia->smbus_write(ia, addr, reg, buffer, len);
> > +}
> > +
> > +
> > +int i2c_adapter_smbus_read(struct i2c_adapter *ia, uint8_t addr,
> > +                    uint8_t reg, uint8_t *buffer, int len)
> > +{
> > +       if (!ia)
> > +               return SBI_EINVAL;
> > +       if (!ia->smbus_read)
> > +               return SBI_ENOSYS;
> > +
> > +       return ia->smbus_read(ia, addr, reg, buffer, len);
> > +}  
> 
> Again, I don't find those helpers really useful, IMO the adapter
> should be hidden from the device, see my previous review. But you can
> convince me we don't need it, I'm open to hearing what you think :)

let's move this to 0 patch disucssion.

> 
> Alex
> 
> 
> > diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
> > new file mode 100644
> > index 0000000..16a70da
> > --- /dev/null
> > +++ b/lib/utils/i2c/objects.mk
> > @@ -0,0 +1,10 @@
> > +#
> > +# SPDX-License-Identifier: BSD-2-Clause
> > +#
> > +# Copyright (c) 2021 YADRO
> > +#
> > +# Authors:
> > +#   Nikita Shubin <nshubin@yadro.com>
> > +#
> > +
> > +libsbiutils-objs-y += i2c/i2c.o
> > --
> > 2.31.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi  


