From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 16:58:08 -0600
Subject: [PATCH 03/12] lib: utils: Introduce optional MPXY RPMI service
 group operations
In-Reply-To: <20250116155651.103782-4-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-4-apatel@ventanamicro.com>
Message-ID: <f92204d2-5803-42eb-8abc-f6498dee4f08@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On 2025-01-16 9:56 AM, Anup Patel wrote:
> Some of the RPMI service groups may additional contex and special
> handling when transfering message to underlying mailbox channel

typos: context, transferring

> so introduce optional MPXY RPMI service group operations for this
> purpose.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h | 18 ++++++++++++++++
>  lib/utils/mpxy/fdt_mpxy_rpmi_clock.c        |  4 ++++
>  lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 24 +++++++++++++++++----
>  3 files changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> index e4ca0151..08b32a0a 100644
> --- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> +++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> @@ -12,6 +12,7 @@
>  
>  #include <sbi/sbi_types.h>
>  #include <sbi/sbi_mpxy.h>
> +#include <sbi_utils/mailbox/fdt_mailbox.h>
>  #include <sbi_utils/mailbox/rpmi_msgprot.h>
>  #include <sbi_utils/mpxy/fdt_mpxy.h>
>  
> @@ -56,12 +57,29 @@ struct mpxy_rpmi_service_data {
>  	u32 max_rx_len;
>  };
>  
> +struct mpxy_rpmi_mbox_data;
> +
> +/** MPXY RPMI service group operations */
> +struct mpxy_rpmi_service_group_ops {
> +	/** Transfer RPMI service group message */
> +	int (*xfer_group)(void *context, struct mbox_chan *chan,
> +			  struct mbox_xfer *xfer);
> +
> +	/** Setup RPMI service group context for MPXY */
> +	int (*setup_group)(void **context, struct mbox_chan *chan,
> +			   const struct mpxy_rpmi_mbox_data *data);
> +
> +	/** Cleanup RPMI service group context for MPXY */
> +	void (*cleanup_group)(void *context);
> +};
> +
>  /** MPXY RPMI mbox data for each service group */
>  struct mpxy_rpmi_mbox_data {
>  	u32 servicegrp_id;
>  	u32 num_services;
>  	u32 notifications_support;
>  	struct mpxy_rpmi_service_data *service_data;
> +	struct mpxy_rpmi_service_group_ops *group_ops;

Do you expect several service groups to share a mpxy_rpmi_service_group_ops? If
not, I would suggest to reduce pointer chasing by putting the function pointers
directly in mpxy_rpmi_mbox_data.

If you do keep it as a pointer, it should be a pointer to const.

Regards,
Samuel

>  };
>  
>  /** Common probe function for MPXY RPMI drivers */
> diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
> index 1f5c6e75..3d275cd8 100644
> --- a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
> +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
> @@ -10,6 +10,9 @@
>  
>  #include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
>  
> +static struct mpxy_rpmi_service_group_ops clock_ops = {
> +};
> +
>  static struct mpxy_rpmi_service_data clock_services[] = {
>  {
>  	.id = RPMI_CLOCK_SRV_ENABLE_NOTIFICATION,
> @@ -74,6 +77,7 @@ static struct mpxy_rpmi_mbox_data clock_data = {
>  	.num_services = RPMI_CLOCK_SRV_MAX_COUNT,
>  	.notifications_support = 1,
>  	.service_data = clock_services,
> +	.group_ops = &clock_ops,
>  };
>  
>  static const struct fdt_match clock_match[] = {
> diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> index 7034fb9e..8d892cef 100644
> --- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> @@ -13,7 +13,6 @@
>  #include <sbi/sbi_heap.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
> -#include <sbi_utils/mailbox/fdt_mailbox.h>
>  #include <sbi/sbi_console.h>
>  
>  /**
> @@ -25,6 +24,7 @@ struct mpxy_rpmi_mbox {
>  	const struct mpxy_rpmi_mbox_data *mbox_data;
>  	struct mpxy_rpmi_channel_attrs msgprot_attrs;
>  	struct sbi_mpxy_channel channel;
> +	void *group_context;
>  };
>  
>  /**
> @@ -146,8 +146,9 @@ static int __mpxy_mbox_send_message(struct sbi_mpxy_channel *channel,
>  	struct rpmi_message_args args = {0};
>  	struct mpxy_rpmi_mbox *rmb =
>  		container_of(channel, struct mpxy_rpmi_mbox, channel);
> +	const struct mpxy_rpmi_mbox_data *data = rmb->mbox_data;
>  	const struct mpxy_rpmi_service_data *srv =
> -		mpxy_find_rpmi_srvid(message_id, rmb->mbox_data);
> +		mpxy_find_rpmi_srvid(message_id, data);
>  
>  	if (!srv)
>  		return SBI_ENOTSUPP;
> @@ -183,7 +184,10 @@ static int __mpxy_mbox_send_message(struct sbi_mpxy_channel *channel,
>  				  tx, tx_len, RPMI_DEF_TX_TIMEOUT);
>  	}
>  
> -	ret = mbox_chan_xfer(rmb->chan, &xfer);
> +	if (data->group_ops->xfer_group)
> +		ret = data->group_ops->xfer_group(rmb->group_context, rmb->chan, &xfer);
> +	else
> +		ret = mbox_chan_xfer(rmb->chan, &xfer);
>  	if (ret)
>  		return ret;
>  
> @@ -303,9 +307,21 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
>  	rmb->mbox_data = data;
>  	rmb->chan = chan;
>  
> -	/* Register RPXY service group */
> +	/* Setup RPMI service group context */
> +	if (data->group_ops->setup_group) {
> +		rc = data->group_ops->setup_group(&rmb->group_context, chan, data);
> +		if (rc) {
> +			mbox_controller_free_chan(chan);
> +			sbi_free(rmb);
> +			return rc;
> +		}
> +	}
> +
> +	/* Register RPMI service group */
>  	rc = sbi_mpxy_register_channel(&rmb->channel);
>  	if (rc) {
> +		if (data->group_ops->cleanup_group)
> +			data->group_ops->cleanup_group(rmb->group_context);
>  		mbox_controller_free_chan(chan);
>  		sbi_free(rmb);
>  		return rc;


