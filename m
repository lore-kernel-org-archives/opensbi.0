From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Jan 2025 10:19:06 +0530
Subject: [PATCH 01/12] lib: utils: Split the FDT MPXY RPMI mailbox client
 into two parts
In-Reply-To: <3386f3e5-cd17-4bfe-9107-3054611ccee4@sifive.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-2-apatel@ventanamicro.com> <3386f3e5-cd17-4bfe-9107-3054611ccee4@sifive.com>
Message-ID: <CAK9=C2Wd+HK_Bwme340TdgKjBdV-U3U6+md5VgWa82Q4keEYLg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 20, 2025 at 4:22?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Anup,
>
> A couple of comments on existing issues in the code. Maybe it makes sense to fix
> them in this series to avoid conflicts?
>
> On 2025-01-16 9:56 AM, Anup Patel wrote:
> > Instead of having one common FDT MPXY RPMI mailbox client drivers
> > for various RPMI service groups, split this driver into two parts:
> > 1) Common MPXY RPMI mailbox client library
> > 2) MPXY driver for RPMI clock service group
> >
> > The above split enables having a separate MPXY driver for each
> > RPMI clock service group and #1 (above) will allow code sharing
> > between various MPXY RPMI drivers.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h |  70 ++++++++
> >  lib/utils/mpxy/Kconfig                      |  12 +-
> >  lib/utils/mpxy/fdt_mpxy_rpmi_clock.c        |  88 ++++++++++
> >  lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 169 +++-----------------
> >  lib/utils/mpxy/objects.mk                   |   4 +-
> >  platform/generic/configs/defconfig          |   1 +
> >  6 files changed, 190 insertions(+), 154 deletions(-)
> >  create mode 100644 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> >  create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
> >
> > diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> > new file mode 100644
> > index 00000000..e4ca0151
> > --- /dev/null
> > +++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> > @@ -0,0 +1,70 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2024 Ventana Micro Systems Inc.
> > + *
> > + * Authors:
> > + *   Anup Patel <apatel@ventanamicro.com>
> > + */
> > +
> > +#ifndef __FDT_MPXY_RPMI_MBOX_H__
> > +#define __FDT_MPXY_RPMI_MBOX_H__
> > +
> > +#include <sbi/sbi_types.h>
> > +#include <sbi/sbi_mpxy.h>
> > +#include <sbi_utils/mailbox/rpmi_msgprot.h>
> > +#include <sbi_utils/mpxy/fdt_mpxy.h>
> > +
> > +#define MPXY_RPMI_MAJOR_VER          (1)
> > +#define MPXY_RPMI_MINOR_VER          (0)
> > +
> > +/** Convert the mpxy attribute ID to attribute array index */
> > +#define attr_id2index(attr_id)       (attr_id - SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
> > +
> > +enum mpxy_msgprot_rpmi_attr_id {
> > +     MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
> > +     MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION,
> > +     MPXY_MSGPROT_RPMI_ATTR_MAX_ID,
> > +};
> > +
> > +/**
> > + * MPXY message protocol attributes for RPMI
> > + * Order of attribute fields must follow the
> > + * attribute IDs in `enum mpxy_msgprot_rpmi_attr_id`
> > + */
> > +struct mpxy_rpmi_channel_attrs {
> > +     u32 servicegrp_id;
> > +     u32 servicegrp_ver;
> > +};
> > +
> > +/** Make sure all attributes are packed for direct memcpy */
> > +#define assert_field_offset(field, attr_offset)                              \
> > +     _Static_assert(                                                 \
> > +             ((offsetof(struct mpxy_rpmi_channel_attrs, field)) /    \
> > +              sizeof(u32)) == (attr_offset - SBI_MPXY_ATTR_MSGPROTO_ATTR_START),\
> > +             "field " #field                                         \
> > +             " from struct mpxy_rpmi_channel_attrs invalid offset, expected " #attr_offset)
> > +
> > +assert_field_offset(servicegrp_id, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID);
>
> Missing assertion for servicegrp_ver?

Okay, I will add the missing assertion.

>
> > +
> > +/** MPXY RPMI service data for each service group */
> > +struct mpxy_rpmi_service_data {
> > +     u8 id;
> > +     u32 min_tx_len;
> > +     u32 max_tx_len;
> > +     u32 min_rx_len;
> > +     u32 max_rx_len;
> > +};
> > +
> > +/** MPXY RPMI mbox data for each service group */
> > +struct mpxy_rpmi_mbox_data {
> > +     u32 servicegrp_id;
> > +     u32 num_services;
> > +     u32 notifications_support;
> > +     struct mpxy_rpmi_service_data *service_data;
> > +};
> > +
> > +/** Common probe function for MPXY RPMI drivers */
> > +int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *match);
> > +
> > +#endif
> > diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
> > index 131fb91a..ff88f24f 100644
> > --- a/lib/utils/mpxy/Kconfig
> > +++ b/lib/utils/mpxy/Kconfig
> > @@ -7,11 +7,15 @@ config FDT_MPXY
> >       depends on FDT
> >       default n
> >
> > -if FDT_MPXY
> > -
> >  config FDT_MPXY_RPMI_MBOX
> > -     bool "FDT MPXY mailbox client driver"
> > -     depends on FDT_MAILBOX
> > +     bool "MPXY drivers as RPMI mailbox client"
> > +     depends on FDT_MAILBOX && FDT_MPXY
> > +     default n
> > +
> > +if FDT_MPXY_RPMI_MBOX
> > +
> > +config FDT_MPXY_RPMI_CLOCK
> > +     bool "MPXY driver for RPMI clock service group"
> >       default n
> >
> >  endif
> > diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
> > new file mode 100644
> > index 00000000..1f5c6e75
> > --- /dev/null
> > +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
> > @@ -0,0 +1,88 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2024 Ventana Micro Systems Inc.
> > + *
> > + * Authors:
> > + *   Rahul Pathak <rpathak@ventanamicro.com>
> > + *   Anup Patel <apatel@ventanamicro.com>
> > + */
> > +
> > +#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
> > +
> > +static struct mpxy_rpmi_service_data clock_services[] = {
> > +{
> > +     .id = RPMI_CLOCK_SRV_ENABLE_NOTIFICATION,
> > +     .min_tx_len = sizeof(struct rpmi_enable_notification_req),
> > +     .max_tx_len = sizeof(struct rpmi_enable_notification_req),
> > +     .min_rx_len = sizeof(struct rpmi_enable_notification_resp),
> > +     .max_rx_len = sizeof(struct rpmi_enable_notification_resp),
> > +},
> > +{
> > +     .id = RPMI_CLOCK_SRV_GET_NUM_CLOCKS,
> > +     .min_tx_len = 0,
> > +     .max_tx_len = 0,
> > +     .min_rx_len = sizeof(struct rpmi_clock_get_num_clocks_resp),
> > +     .max_rx_len = sizeof(struct rpmi_clock_get_num_clocks_resp),
> > +},
> > +{
> > +     .id = RPMI_CLOCK_SRV_GET_ATTRIBUTES,
> > +     .min_tx_len = sizeof(struct rpmi_clock_get_attributes_req),
> > +     .max_tx_len = sizeof(struct rpmi_clock_get_attributes_req),
> > +     .min_rx_len = sizeof(struct rpmi_clock_get_attributes_resp),
> > +     .max_rx_len = sizeof(struct rpmi_clock_get_attributes_resp),
> > +},
> > +{
> > +     .id = RPMI_CLOCK_SRV_GET_SUPPORTED_RATES,
> > +     .min_tx_len = sizeof(struct rpmi_clock_get_supported_rates_req),
> > +     .max_tx_len = sizeof(struct rpmi_clock_get_supported_rates_req),
> > +     .min_rx_len = sizeof(struct rpmi_clock_get_supported_rates_resp),
> > +     .max_rx_len = -1U,
> > +},
> > +{
> > +     .id = RPMI_CLOCK_SRV_SET_CONFIG,
> > +     .min_tx_len = sizeof(struct rpmi_clock_set_config_req),
> > +     .max_tx_len = sizeof(struct rpmi_clock_set_config_req),
> > +     .min_rx_len = sizeof(struct rpmi_clock_set_config_resp),
> > +     .max_rx_len = sizeof(struct rpmi_clock_set_config_resp),
> > +},
> > +{
> > +     .id = RPMI_CLOCK_SRV_GET_CONFIG,
> > +     .min_tx_len = sizeof(struct rpmi_clock_get_config_req),
> > +     .max_tx_len = sizeof(struct rpmi_clock_get_config_req),
> > +     .min_rx_len = sizeof(struct rpmi_clock_get_config_resp),
> > +     .max_rx_len = sizeof(struct rpmi_clock_get_config_resp),
> > +},
> > +{
> > +     .id = RPMI_CLOCK_SRV_SET_RATE,
> > +     .min_tx_len = sizeof(struct rpmi_clock_set_rate_req),
> > +     .max_tx_len = sizeof(struct rpmi_clock_set_rate_req),
> > +     .min_rx_len = sizeof(struct rpmi_clock_set_rate_resp),
> > +     .max_rx_len = sizeof(struct rpmi_clock_set_rate_resp),
> > +},
> > +{
> > +     .id = RPMI_CLOCK_SRV_GET_RATE,
> > +     .min_tx_len = sizeof(struct rpmi_clock_get_rate_req),
> > +     .max_tx_len = sizeof(struct rpmi_clock_get_rate_req),
> > +     .min_rx_len = sizeof(struct rpmi_clock_get_rate_resp),
> > +     .max_rx_len = sizeof(struct rpmi_clock_get_rate_resp),
> > +},
> > +};
> > +
> > +static struct mpxy_rpmi_mbox_data clock_data = {
> > +     .servicegrp_id = RPMI_SRVGRP_CLOCK,
> > +     .num_services = RPMI_CLOCK_SRV_MAX_COUNT,
> > +     .notifications_support = 1,
> > +     .service_data = clock_services,
> > +};
> > +
> > +static const struct fdt_match clock_match[] = {
> > +     { .compatible = "riscv,rpmi-mpxy-clock", .data = &clock_data },
> > +     { },
> > +};
> > +
> > +struct fdt_driver fdt_mpxy_rpmi_clock = {
>
> This structure is required to be `const` both by the carray and the declaration
> of fdt_mpxy_drivers.

Okay, I will update.

Regards,
Anup

