From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 16:52:01 -0600
Subject: [PATCH 01/12] lib: utils: Split the FDT MPXY RPMI mailbox client
 into two parts
In-Reply-To: <20250116155651.103782-2-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-2-apatel@ventanamicro.com>
Message-ID: <3386f3e5-cd17-4bfe-9107-3054611ccee4@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

A couple of comments on existing issues in the code. Maybe it makes sense to fix
them in this series to avoid conflicts?

On 2025-01-16 9:56 AM, Anup Patel wrote:
> Instead of having one common FDT MPXY RPMI mailbox client drivers
> for various RPMI service groups, split this driver into two parts:
> 1) Common MPXY RPMI mailbox client library
> 2) MPXY driver for RPMI clock service group
> 
> The above split enables having a separate MPXY driver for each
> RPMI clock service group and #1 (above) will allow code sharing
> between various MPXY RPMI drivers.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h |  70 ++++++++
>  lib/utils/mpxy/Kconfig                      |  12 +-
>  lib/utils/mpxy/fdt_mpxy_rpmi_clock.c        |  88 ++++++++++
>  lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 169 +++-----------------
>  lib/utils/mpxy/objects.mk                   |   4 +-
>  platform/generic/configs/defconfig          |   1 +
>  6 files changed, 190 insertions(+), 154 deletions(-)
>  create mode 100644 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
>  create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
> 
> diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> new file mode 100644
> index 00000000..e4ca0151
> --- /dev/null
> +++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> @@ -0,0 +1,70 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2024 Ventana Micro Systems Inc.
> + *
> + * Authors:
> + *   Anup Patel <apatel@ventanamicro.com>
> + */
> +
> +#ifndef __FDT_MPXY_RPMI_MBOX_H__
> +#define __FDT_MPXY_RPMI_MBOX_H__
> +
> +#include <sbi/sbi_types.h>
> +#include <sbi/sbi_mpxy.h>
> +#include <sbi_utils/mailbox/rpmi_msgprot.h>
> +#include <sbi_utils/mpxy/fdt_mpxy.h>
> +
> +#define MPXY_RPMI_MAJOR_VER		(1)
> +#define MPXY_RPMI_MINOR_VER		(0)
> +
> +/** Convert the mpxy attribute ID to attribute array index */
> +#define attr_id2index(attr_id)	(attr_id - SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
> +
> +enum mpxy_msgprot_rpmi_attr_id {
> +	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
> +	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION,
> +	MPXY_MSGPROT_RPMI_ATTR_MAX_ID,
> +};
> +
> +/**
> + * MPXY message protocol attributes for RPMI
> + * Order of attribute fields must follow the
> + * attribute IDs in `enum mpxy_msgprot_rpmi_attr_id`
> + */
> +struct mpxy_rpmi_channel_attrs {
> +	u32 servicegrp_id;
> +	u32 servicegrp_ver;
> +};
> +
> +/** Make sure all attributes are packed for direct memcpy */
> +#define assert_field_offset(field, attr_offset)				\
> +	_Static_assert(							\
> +		((offsetof(struct mpxy_rpmi_channel_attrs, field)) /	\
> +		 sizeof(u32)) == (attr_offset - SBI_MPXY_ATTR_MSGPROTO_ATTR_START),\
> +		"field " #field						\
> +		" from struct mpxy_rpmi_channel_attrs invalid offset, expected " #attr_offset)
> +
> +assert_field_offset(servicegrp_id, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID);

Missing assertion for servicegrp_ver?

> +
> +/** MPXY RPMI service data for each service group */
> +struct mpxy_rpmi_service_data {
> +	u8 id;
> +	u32 min_tx_len;
> +	u32 max_tx_len;
> +	u32 min_rx_len;
> +	u32 max_rx_len;
> +};
> +
> +/** MPXY RPMI mbox data for each service group */
> +struct mpxy_rpmi_mbox_data {
> +	u32 servicegrp_id;
> +	u32 num_services;
> +	u32 notifications_support;
> +	struct mpxy_rpmi_service_data *service_data;
> +};
> +
> +/** Common probe function for MPXY RPMI drivers */
> +int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *match);
> +
> +#endif
> diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
> index 131fb91a..ff88f24f 100644
> --- a/lib/utils/mpxy/Kconfig
> +++ b/lib/utils/mpxy/Kconfig
> @@ -7,11 +7,15 @@ config FDT_MPXY
>  	depends on FDT
>  	default n
>  
> -if FDT_MPXY
> -
>  config FDT_MPXY_RPMI_MBOX
> -	bool "FDT MPXY mailbox client driver"
> -	depends on FDT_MAILBOX
> +	bool "MPXY drivers as RPMI mailbox client"
> +	depends on FDT_MAILBOX && FDT_MPXY
> +	default n
> +
> +if FDT_MPXY_RPMI_MBOX
> +
> +config FDT_MPXY_RPMI_CLOCK
> +	bool "MPXY driver for RPMI clock service group"
>  	default n
>  
>  endif
> diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
> new file mode 100644
> index 00000000..1f5c6e75
> --- /dev/null
> +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
> @@ -0,0 +1,88 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2024 Ventana Micro Systems Inc.
> + *
> + * Authors:
> + *   Rahul Pathak <rpathak@ventanamicro.com>
> + *   Anup Patel <apatel@ventanamicro.com>
> + */
> +
> +#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
> +
> +static struct mpxy_rpmi_service_data clock_services[] = {
> +{
> +	.id = RPMI_CLOCK_SRV_ENABLE_NOTIFICATION,
> +	.min_tx_len = sizeof(struct rpmi_enable_notification_req),
> +	.max_tx_len = sizeof(struct rpmi_enable_notification_req),
> +	.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
> +	.max_rx_len = sizeof(struct rpmi_enable_notification_resp),
> +},
> +{
> +	.id = RPMI_CLOCK_SRV_GET_NUM_CLOCKS,
> +	.min_tx_len = 0,
> +	.max_tx_len = 0,
> +	.min_rx_len = sizeof(struct rpmi_clock_get_num_clocks_resp),
> +	.max_rx_len = sizeof(struct rpmi_clock_get_num_clocks_resp),
> +},
> +{
> +	.id = RPMI_CLOCK_SRV_GET_ATTRIBUTES,
> +	.min_tx_len = sizeof(struct rpmi_clock_get_attributes_req),
> +	.max_tx_len = sizeof(struct rpmi_clock_get_attributes_req),
> +	.min_rx_len = sizeof(struct rpmi_clock_get_attributes_resp),
> +	.max_rx_len = sizeof(struct rpmi_clock_get_attributes_resp),
> +},
> +{
> +	.id = RPMI_CLOCK_SRV_GET_SUPPORTED_RATES,
> +	.min_tx_len = sizeof(struct rpmi_clock_get_supported_rates_req),
> +	.max_tx_len = sizeof(struct rpmi_clock_get_supported_rates_req),
> +	.min_rx_len = sizeof(struct rpmi_clock_get_supported_rates_resp),
> +	.max_rx_len = -1U,
> +},
> +{
> +	.id = RPMI_CLOCK_SRV_SET_CONFIG,
> +	.min_tx_len = sizeof(struct rpmi_clock_set_config_req),
> +	.max_tx_len = sizeof(struct rpmi_clock_set_config_req),
> +	.min_rx_len = sizeof(struct rpmi_clock_set_config_resp),
> +	.max_rx_len = sizeof(struct rpmi_clock_set_config_resp),
> +},
> +{
> +	.id = RPMI_CLOCK_SRV_GET_CONFIG,
> +	.min_tx_len = sizeof(struct rpmi_clock_get_config_req),
> +	.max_tx_len = sizeof(struct rpmi_clock_get_config_req),
> +	.min_rx_len = sizeof(struct rpmi_clock_get_config_resp),
> +	.max_rx_len = sizeof(struct rpmi_clock_get_config_resp),
> +},
> +{
> +	.id = RPMI_CLOCK_SRV_SET_RATE,
> +	.min_tx_len = sizeof(struct rpmi_clock_set_rate_req),
> +	.max_tx_len = sizeof(struct rpmi_clock_set_rate_req),
> +	.min_rx_len = sizeof(struct rpmi_clock_set_rate_resp),
> +	.max_rx_len = sizeof(struct rpmi_clock_set_rate_resp),
> +},
> +{
> +	.id = RPMI_CLOCK_SRV_GET_RATE,
> +	.min_tx_len = sizeof(struct rpmi_clock_get_rate_req),
> +	.max_tx_len = sizeof(struct rpmi_clock_get_rate_req),
> +	.min_rx_len = sizeof(struct rpmi_clock_get_rate_resp),
> +	.max_rx_len = sizeof(struct rpmi_clock_get_rate_resp),
> +},
> +};
> +
> +static struct mpxy_rpmi_mbox_data clock_data = {
> +	.servicegrp_id = RPMI_SRVGRP_CLOCK,
> +	.num_services = RPMI_CLOCK_SRV_MAX_COUNT,
> +	.notifications_support = 1,
> +	.service_data = clock_services,
> +};
> +
> +static const struct fdt_match clock_match[] = {
> +	{ .compatible = "riscv,rpmi-mpxy-clock", .data = &clock_data },
> +	{ },
> +};
> +
> +struct fdt_driver fdt_mpxy_rpmi_clock = {

This structure is required to be `const` both by the carray and the declaration
of fdt_mpxy_drivers.

Regards,
Samuel

> +	.match_table = clock_match,
> +	.init = mpxy_rpmi_mbox_init,
> +	.experimental = true,
> +};
> diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> index 78020eae..0d4fd1fe 100644
> --- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> @@ -11,82 +11,32 @@
>  #include <libfdt.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_heap.h>
> -#include <sbi/sbi_mpxy.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
> -#include <sbi_utils/mpxy/fdt_mpxy.h>
> +#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
>  #include <sbi_utils/mailbox/fdt_mailbox.h>
> -#include <sbi_utils/mailbox/rpmi_msgprot.h>
>  #include <sbi/sbi_console.h>
>  
> -#define RPMI_MAJOR_VER		(1)
> -#define RPMI_MINOR_VER		(0)
> -
> -/** Convert the mpxy attribute ID to attribute array index */
> -#define attr_id2index(attr_id)	(attr_id - SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
> -
> -enum mpxy_msgprot_rpmi_attr_id {
> -	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
> -	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION,
> -	MPXY_MSGPROT_RPMI_ATTR_MAX_ID,
> -};
> -
> -/**
> - * MPXY message protocol attributes for RPMI
> - * Order of attribute fields must follow the
> - * attribute IDs in `enum mpxy_msgprot_rpmi_attr_id`
> - */
> -struct mpxy_rpmi_channel_attrs {
> -	u32 servicegrp_id;
> -	u32 servicegrp_ver;
> -};
> -
> -/* RPMI mbox data per service group */
> -struct mpxy_mbox_data {
> -	u32 servicegrp_id;
> -	u32 num_services;
> -	u32 notifications_support;
> -	void *priv_data;
> -};
> -
> -/* RPMI service data per service group */
> -struct rpmi_service_data {
> -	u8 id;
> -	u32 min_tx_len;
> -	u32 max_tx_len;
> -	u32 min_rx_len;
> -	u32 max_rx_len;
> -};
> -
>  /**
>   * MPXY mbox instance per MPXY channel. This ties
>   * an MPXY channel with an RPMI Service group.
>   */
> -struct mpxy_mbox {
> +struct mpxy_rpmi_mbox {
>  	struct mbox_chan *chan;
> -	struct mpxy_mbox_data *mbox_data;
> +	struct mpxy_rpmi_mbox_data *mbox_data;
>  	struct mpxy_rpmi_channel_attrs msgprot_attrs;
>  	struct sbi_mpxy_channel channel;
>  };
>  
> -/** Make sure all attributes are packed for direct memcpy */
> -#define assert_field_offset(field, attr_offset)				\
> -	_Static_assert(							\
> -		((offsetof(struct mpxy_rpmi_channel_attrs, field)) /	\
> -		 sizeof(u32)) == (attr_offset - SBI_MPXY_ATTR_MSGPROTO_ATTR_START),\
> -		"field " #field						\
> -		" from struct mpxy_rpmi_channel_attrs invalid offset, expected " #attr_offset)
> -
> -assert_field_offset(servicegrp_id, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID);
> -
>  /**
>   * Discover the RPMI service data using message_id
>   * MPXY message_id == RPMI service_id
>   */
> -static struct rpmi_service_data *mpxy_find_rpmi_srvid(u32 message_id,
> -					struct mpxy_mbox_data *mbox_data)
> +static struct mpxy_rpmi_service_data *mpxy_find_rpmi_srvid(u32 message_id,
> +					struct mpxy_rpmi_mbox_data *mbox_data)
>  {
>  	int mid = 0;
> -	struct rpmi_service_data *srv = mbox_data->priv_data;
> +	struct mpxy_rpmi_service_data *srv = mbox_data->service_data;
> +
>  	for (mid = 0; srv[mid].id < mbox_data->num_services; mid++) {
>  		if (srv[mid].id == (u8)message_id)
>  			return &srv[mid];
> @@ -108,9 +58,8 @@ static int mpxy_mbox_read_attributes(struct sbi_mpxy_channel *channel,
>  				     u32 attr_count)
>  {
>  	u32 end_id;
> -	struct mpxy_mbox *rmb =
> -		container_of(channel, struct mpxy_mbox, channel);
> -
> +	struct mpxy_rpmi_mbox *rmb =
> +		container_of(channel, struct mpxy_rpmi_mbox, channel);
>  	u32 *attr_array = (u32 *)&rmb->msgprot_attrs;
>  
>  	end_id = base_attr_id + attr_count - 1;
> @@ -161,8 +110,8 @@ static int mpxy_mbox_write_attributes(struct sbi_mpxy_channel *channel,
>  {
>  	int ret, mem_idx;
>  	u32 end_id, attr_val, idx;
> -	struct mpxy_mbox *rmb =
> -		container_of(channel, struct mpxy_mbox, channel);
> +	struct mpxy_rpmi_mbox *rmb =
> +		container_of(channel, struct mpxy_rpmi_mbox, channel);
>  
>  	end_id = base_attr_id + attr_count - 1;
>  
> @@ -195,9 +144,9 @@ static int __mpxy_mbox_send_message(struct sbi_mpxy_channel *channel,
>  	u32 rx_len = 0;
>  	struct mbox_xfer xfer;
>  	struct rpmi_message_args args = {0};
> -	struct mpxy_mbox *rmb =
> -		container_of(channel, struct mpxy_mbox, channel);
> -	struct rpmi_service_data *srv =
> +	struct mpxy_rpmi_mbox *rmb =
> +		container_of(channel, struct mpxy_rpmi_mbox, channel);
> +	struct mpxy_rpmi_service_data *srv =
>  			mpxy_find_rpmi_srvid(message_id, rmb->mbox_data);
>  	if (!srv)
>  		return SBI_ENOTSUPP;
> @@ -266,15 +215,14 @@ static int mpxy_mbox_get_notifications(struct sbi_mpxy_channel *channel,
>  	return SBI_ENOTSUPP;
>  }
>  
> -static int mpxy_mbox_init(const void *fdt, int nodeoff,
> -			  const struct fdt_match *match)
> +int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *match)
>  {
>  	int rc, len;
>  	const fdt32_t *val;
>  	u32 channel_id;
> -	struct mpxy_mbox *rmb;
>  	struct mbox_chan *chan;
> -	const struct mpxy_mbox_data *data = match->data;
> +	struct mpxy_rpmi_mbox *rmb;
> +	const struct mpxy_rpmi_mbox_data *data = match->data;
>  
>  	/* Allocate context for RPXY mbox client */
>  	rmb = sbi_zalloc(sizeof(*rmb));
> @@ -334,7 +282,7 @@ static int mpxy_mbox_init(const void *fdt, int nodeoff,
>  	rmb->channel.attrs.msg_proto_id = SBI_MPXY_MSGPROTO_RPMI_ID;
>  	/* RPMI Message Protocol Version */
>  	rmb->channel.attrs.msg_proto_version =
> -		SBI_MPXY_MSGPROTO_VERSION(RPMI_MAJOR_VER, RPMI_MINOR_VER);
> +		SBI_MPXY_MSGPROTO_VERSION(MPXY_RPMI_MAJOR_VER, MPXY_RPMI_MINOR_VER);
>  
>  	/* RPMI supported max message data length(bytes), same for
>  	 * all service groups */
> @@ -349,9 +297,9 @@ static int mpxy_mbox_init(const void *fdt, int nodeoff,
>  	/* RPMI message protocol attributes */
>  	rmb->msgprot_attrs.servicegrp_id = data->servicegrp_id;
>  	rmb->msgprot_attrs.servicegrp_ver =
> -			SBI_MPXY_MSGPROTO_VERSION(RPMI_MAJOR_VER, RPMI_MINOR_VER);
> +			SBI_MPXY_MSGPROTO_VERSION(MPXY_RPMI_MAJOR_VER, MPXY_RPMI_MINOR_VER);
>  
> -	rmb->mbox_data = (struct mpxy_mbox_data *)data;
> +	rmb->mbox_data = (struct mpxy_rpmi_mbox_data *)data;
>  	rmb->chan = chan;
>  
>  	/* Register RPXY service group */
> @@ -364,80 +312,3 @@ static int mpxy_mbox_init(const void *fdt, int nodeoff,
>  
>  	return SBI_OK;
>  }
> -
> -static struct rpmi_service_data clock_services[] = {
> -{
> -	.id = RPMI_CLOCK_SRV_ENABLE_NOTIFICATION,
> -	.min_tx_len = sizeof(struct rpmi_enable_notification_req),
> -	.max_tx_len = sizeof(struct rpmi_enable_notification_req),
> -	.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
> -	.max_rx_len = sizeof(struct rpmi_enable_notification_resp),
> -},
> -{
> -	.id = RPMI_CLOCK_SRV_GET_NUM_CLOCKS,
> -	.min_tx_len = 0,
> -	.max_tx_len = 0,
> -	.min_rx_len = sizeof(struct rpmi_clock_get_num_clocks_resp),
> -	.max_rx_len = sizeof(struct rpmi_clock_get_num_clocks_resp),
> -},
> -{
> -	.id = RPMI_CLOCK_SRV_GET_ATTRIBUTES,
> -	.min_tx_len = sizeof(struct rpmi_clock_get_attributes_req),
> -	.max_tx_len = sizeof(struct rpmi_clock_get_attributes_req),
> -	.min_rx_len = sizeof(struct rpmi_clock_get_attributes_resp),
> -	.max_rx_len = sizeof(struct rpmi_clock_get_attributes_resp),
> -},
> -{
> -	.id = RPMI_CLOCK_SRV_GET_SUPPORTED_RATES,
> -	.min_tx_len = sizeof(struct rpmi_clock_get_supported_rates_req),
> -	.max_tx_len = sizeof(struct rpmi_clock_get_supported_rates_req),
> -	.min_rx_len = sizeof(struct rpmi_clock_get_supported_rates_resp),
> -	.max_rx_len = -1U,
> -},
> -{
> -	.id = RPMI_CLOCK_SRV_SET_CONFIG,
> -	.min_tx_len = sizeof(struct rpmi_clock_set_config_req),
> -	.max_tx_len = sizeof(struct rpmi_clock_set_config_req),
> -	.min_rx_len = sizeof(struct rpmi_clock_set_config_resp),
> -	.max_rx_len = sizeof(struct rpmi_clock_set_config_resp),
> -},
> -{
> -	.id = RPMI_CLOCK_SRV_GET_CONFIG,
> -	.min_tx_len = sizeof(struct rpmi_clock_get_config_req),
> -	.max_tx_len = sizeof(struct rpmi_clock_get_config_req),
> -	.min_rx_len = sizeof(struct rpmi_clock_get_config_resp),
> -	.max_rx_len = sizeof(struct rpmi_clock_get_config_resp),
> -},
> -{
> -	.id = RPMI_CLOCK_SRV_SET_RATE,
> -	.min_tx_len = sizeof(struct rpmi_clock_set_rate_req),
> -	.max_tx_len = sizeof(struct rpmi_clock_set_rate_req),
> -	.min_rx_len = sizeof(struct rpmi_clock_set_rate_resp),
> -	.max_rx_len = sizeof(struct rpmi_clock_set_rate_resp),
> -},
> -{
> -	.id = RPMI_CLOCK_SRV_GET_RATE,
> -	.min_tx_len = sizeof(struct rpmi_clock_get_rate_req),
> -	.max_tx_len = sizeof(struct rpmi_clock_get_rate_req),
> -	.min_rx_len = sizeof(struct rpmi_clock_get_rate_resp),
> -	.max_rx_len = sizeof(struct rpmi_clock_get_rate_resp),
> -},
> -};
> -
> -static struct mpxy_mbox_data clock_data = {
> -	.servicegrp_id = RPMI_SRVGRP_CLOCK,
> -	.num_services = RPMI_CLOCK_SRV_MAX_COUNT,
> -	.notifications_support = 1,
> -	.priv_data = clock_services,
> -};
> -
> -static const struct fdt_match mpxy_mbox_match[] = {
> -	{ .compatible = "riscv,rpmi-mpxy-clock", .data = &clock_data },
> -	{ },
> -};
> -
> -struct fdt_driver fdt_mpxy_rpmi_mbox = {
> -	.match_table = mpxy_mbox_match,
> -	.init = mpxy_mbox_init,
> -	.experimental = true,
> -};
> diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
> index ccb28b55..1c9afed9 100644
> --- a/lib/utils/mpxy/objects.mk
> +++ b/lib/utils/mpxy/objects.mk
> @@ -10,5 +10,7 @@
>  libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy.o
>  libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy_drivers.carray.o
>  
> -carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_MBOX) += fdt_mpxy_rpmi_mbox
>  libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MBOX) += mpxy/fdt_mpxy_rpmi_mbox.o
> +
> +carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += fdt_mpxy_rpmi_clock
> +libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += mpxy/fdt_mpxy_rpmi_clock.o
> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
> index e23b38b2..55607a28 100644
> --- a/platform/generic/configs/defconfig
> +++ b/platform/generic/configs/defconfig
> @@ -55,3 +55,4 @@ CONFIG_FDT_TIMER_MTIMER=y
>  CONFIG_FDT_TIMER_PLMT=y
>  CONFIG_FDT_MPXY=y
>  CONFIG_FDT_MPXY_RPMI_MBOX=y
> +CONFIG_FDT_MPXY_RPMI_CLOCK=y


