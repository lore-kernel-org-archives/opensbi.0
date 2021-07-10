From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 10 Jul 2021 05:07:17 +0000
Subject: [PATCH v2 2/6] lib: utils/gpio: Add generic GPIO configuration
 library
In-Reply-To: <CAOnJCUKEuKyJxrrHKXQEyPPcZqm5t2jshH4X666R-Lh+hwv=0g@mail.gmail.com>
References: <20210709131059.1502293-1-anup.patel@wdc.com>
 <20210709131059.1502293-3-anup.patel@wdc.com>
 <CAOnJCUKEuKyJxrrHKXQEyPPcZqm5t2jshH4X666R-Lh+hwv=0g@mail.gmail.com>
Message-ID: <2CAB5D7E-41BF-4272-8874-3EB19D4EE628@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 10/07/21, 12:25 AM, "Atish Patra" <atishp@atishpatra.org> wrote:

    On Fri, Jul 9, 2021 at 6:11 AM Anup Patel <anup.patel@wdc.com> wrote:
    >
    > We add generic GPIO configuration library which is independent of
    > hardware description format (FDT or ACPI). The OpenSBI platform
    > support or GPIO drivers can register GPIO chip instances which
    > can be discovered and used by different GPIO clients. Each GPIO
    > chip instance has a unique ID which can be used by GPIO clients
    > to lookup GPIO chip instance.
    >
    > Signed-off-by: Anup Patel <anup.patel@wdc.com>
    > ---
    >  include/sbi_utils/gpio/gpio.h |  99 +++++++++++++++++++++++++++++
    >  lib/utils/gpio/gpio.c         | 116 ++++++++++++++++++++++++++++++++++
    >  lib/utils/gpio/objects.mk     |  10 +++
    >  3 files changed, 225 insertions(+)
    >  create mode 100644 include/sbi_utils/gpio/gpio.h
    >  create mode 100644 lib/utils/gpio/gpio.c
    >  create mode 100644 lib/utils/gpio/objects.mk
    >
    > diff --git a/include/sbi_utils/gpio/gpio.h b/include/sbi_utils/gpio/gpio.h
    > new file mode 100644
    > index 0000000..167d11a
    > --- /dev/null
    > +++ b/include/sbi_utils/gpio/gpio.h
    > @@ -0,0 +1,99 @@
    > +/*
    > + * SPDX-License-Identifier: BSD-2-Clause
    > + *
    > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
    > + *
    > + * Authors:
    > + *   Anup Patel <anup.patel@wdc.com>
    > + */
    > +
    > +#ifndef __GPIO_H__
    > +#define __GPIO_H__
    > +
    > +#include <sbi/sbi_types.h>
    > +
    > +#define GPIO_LINE_DIRECTION_IN 1
    > +#define GPIO_LINE_DIRECTION_OUT        0
    > +
    > +/** Representation of a GPIO pin */
    > +struct gpio_pin {
    > +       /** Pointer to the GPIO chip */
    > +       struct gpio_chip *chip;
    > +       /** Identification of GPIO pin within GPIO chip */
    > +       unsigned int offset;
    > +       /**
    > +        * Additional configuration flags of the GPIO pin desired
    > +        * by GPIO clients.
    > +        *
    > +        * NOTE: GPIO chip can have custom configuration flags.
    > +        */
    > +       unsigned int flags;
    > +#define GPIO_FLAG_ACTIVE_LOW   0x1
    > +#define GPIO_FLAG_SINGLE_ENDED 0x2
    > +#define GPIO_FLAG_OPEN_DRAIN   0x4
    > +#define GPIO_FLAG_TRANSITORY   0x8
    > +#define GPIO_FLAG_PULL_UP      0x10
    > +#define GPIO_FLAG_PULL_DOWN    0x20
    > +};
    > +
    > +/** Representation of a GPIO chip */
    > +struct gpio_chip {
    > +       /** Pointer to GPIO driver owning this GPIO chip */
    > +       void *driver;
    > +       /** Uniquie ID of the GPIO chip assigned by the driver */
    > +       unsigned int id;
    > +       /** Number of GPIOs supported by the GPIO chip */
    > +       unsigned int ngpio;
    > +       /**
    > +        * Get current direction of GPIO pin
    > +        *
    > +        * @return 0=output, 1=input, or negative error
    > +        */
    > +       int (*get_direction)(struct gpio_pin *gp);
    > +       /**
    > +        * Set input direction of GPIO pin
    > +        *
    > +        * @return 0 on success and negative error code on failure
    > +        */
    > +       int (*direction_input)(struct gpio_pin *gp);
    > +       /**
    > +        * Set output direction of GPIO pin with given output value
    > +        *
    > +        * @return 0 on success and negative error code on failure
    > +        */
    > +       int (*direction_output)(struct gpio_pin *gp, int value);
    > +       /**
    > +        * Get current value of GPIO pin
    > +        *
    > +        * @return 0=low, 1=high, or negative error
    > +        */
    > +       int (*get)(struct gpio_pin *gp);
    > +       /** Set output value for GPIO pin */
    > +       void (*set)(struct gpio_pin *gp, int value);
    > +};
    > +

    Is there a reason not to add an "addr" property here ?
    We don't have to define sifive_gpio_chip in that case. We can get rid
    of the static allocation of sifive_gpio_chip_array as well.

Yes, not having any GPIO controller specific details in "struct gpio_chip"
is intentional. The "struct gpio_chip" is only an interface (or base class)
whereas each GPIO controller driver will implemented a struct which
extends "struct gpio_chip" so GPIO controller specific details in the
struct introduced by GPIO controller driver.

Further, the generic gpio/gpio.c only has an array of "struct gpio_chip *"
(i.e. pointer array) so the GPIO controller driver will anyway have to
create an instance of "struct gpio_chip" for registering it with generic
gpio/gpio.c


    > +/** Find a registered GPIO chip */
    > +struct gpio_chip *gpio_chip_find(unsigned int id);
    > +
    > +/** Register GPIO chip */
    > +int gpio_chip_add(struct gpio_chip *gc);
    > +
    > +/** Un-register GPIO chip */
    > +void gpio_chip_remove(struct gpio_chip *gc);
    > +
    > +/** Get current direction of GPIO pin */
    > +int gpio_get_direction(struct gpio_pin *gp);
    > +
    > +/** Set input direction of GPIO pin */
    > +int gpio_direction_input(struct gpio_pin *gp);
    > +
    > +/** Set output direction of GPIO pin */
    > +int gpio_direction_output(struct gpio_pin *gp, int value);
    > +
    > +/** Get current value of GPIO pin */
    > +int gpio_get(struct gpio_pin *gp);
    > +
    > +/** Set output value of GPIO pin */
    > +int gpio_set(struct gpio_pin *gp, int value);
    > +
    > +#endif
    > diff --git a/lib/utils/gpio/gpio.c b/lib/utils/gpio/gpio.c
    > new file mode 100644
    > index 0000000..fb30c0f
    > --- /dev/null
    > +++ b/lib/utils/gpio/gpio.c
    > @@ -0,0 +1,116 @@
    > +/*
    > + * SPDX-License-Identifier: BSD-2-Clause
    > + *
    > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
    > + *
    > + * Authors:
    > + *   Anup Patel <anup.patel@wdc.com>
    > + */
    > +
    > +#include <sbi/sbi_error.h>
    > +#include <sbi_utils/gpio/gpio.h>
    > +
    > +#define GPIO_CHIP_MAX          16
    > +
    > +static struct gpio_chip *gc_array[GPIO_CHIP_MAX];
    > +
    > +struct gpio_chip *gpio_chip_find(unsigned int id)
    > +{
    > +       unsigned int i;
    > +       struct gpio_chip *ret = NULL;
    > +
    > +       for (i = 0; i < GPIO_CHIP_MAX; i++) {
    > +               if (gc_array[i] && gc_array[i]->id == id) {
    > +                       ret = gc_array[i];
    > +                       break;
    > +               }
    > +       }
    > +
    > +       return ret;
    > +}
    > +
    > +int gpio_chip_add(struct gpio_chip *gc)
    > +{
    > +       int i, ret = SBI_ENOSPC;
    > +
    > +       if (!gc)
    > +               return SBI_EINVAL;
    > +       if (gpio_chip_find(gc->id))
    > +               return SBI_EALREADY;
    > +
    > +       for (i = 0; i < GPIO_CHIP_MAX; i++) {
    > +               if (!gc_array[i]) {
    > +                       gc_array[i] = gc;
    > +                       ret = 0;
    > +                       break;
    > +               }
    > +       }
    > +
    > +       return ret;
    > +}
    > +
    > +void gpio_chip_remove(struct gpio_chip *gc)
    > +{
    > +       int i;
    > +
    > +       if (!gc)
    > +               return;
    > +
    > +       for (i = 0; i < GPIO_CHIP_MAX; i++) {
    > +               if (gc_array[i] == gc) {
    > +                       gc_array[i] = NULL;
    > +                       break;
    > +               }
    > +       }
    > +}
    > +
    > +int gpio_get_direction(struct gpio_pin *gp)
    > +{
    > +       if (!gp || !gp->chip || (gp->chip->ngpio <= gp->offset))
    > +               return SBI_EINVAL;
    > +       if (!gp->chip->get_direction)
    > +               return SBI_ENOSYS;
    > +
    > +       return gp->chip->get_direction(gp);
    > +}
    > +
    > +int gpio_direction_input(struct gpio_pin *gp)
    > +{
    > +       if (!gp || !gp->chip || (gp->chip->ngpio <= gp->offset))
    > +               return SBI_EINVAL;
    > +       if (!gp->chip->direction_input)
    > +               return SBI_ENOSYS;
    > +
    > +       return gp->chip->direction_input(gp);
    > +}
    > +
    > +int gpio_direction_output(struct gpio_pin *gp, int value)
    > +{
    > +       if (!gp || !gp->chip || (gp->chip->ngpio <= gp->offset))
    > +               return SBI_EINVAL;
    > +       if (!gp->chip->direction_output)
    > +               return SBI_ENOSYS;
    > +
    > +       return gp->chip->direction_output(gp, value);
    > +}
    > +
    > +int gpio_get(struct gpio_pin *gp)
    > +{
    > +       if (!gp || !gp->chip || (gp->chip->ngpio <= gp->offset))
    > +               return SBI_EINVAL;
    > +       if (!gp->chip->get)
    > +               return SBI_ENOSYS;
    > +
    > +       return gp->chip->get(gp);
    > +}
    > +
    > +int gpio_set(struct gpio_pin *gp, int value)
    > +{
    > +       if (!gp || !gp->chip || (gp->chip->ngpio <= gp->offset))
    > +               return SBI_EINVAL;
    > +       if (!gp->chip->set)
    > +               return SBI_ENOSYS;
    > +
    > +       gp->chip->set(gp, value);
    > +       return 0;
    > +}
    > diff --git a/lib/utils/gpio/objects.mk b/lib/utils/gpio/objects.mk
    > new file mode 100644
    > index 0000000..e99a895
    > --- /dev/null
    > +++ b/lib/utils/gpio/objects.mk
    > @@ -0,0 +1,10 @@
    > +#
    > +# SPDX-License-Identifier: BSD-2-Clause
    > +#
    > +# Copyright (c) 2021 Western Digital Corporation or its affiliates.
    > +#
    > +# Authors:
    > +#   Anup Patel <anup.patel@wdc.com>
    > +#
    > +
    > +libsbiutils-objs-y += gpio/gpio.o
    > --
    > 2.25.1
    >
    >
    > --
    > opensbi mailing list
    > opensbi at lists.infradead.org
    > http://lists.infradead.org/mailman/listinfo/opensbi



    -- 
    Regards,
    Atish

Regards,
Anup

