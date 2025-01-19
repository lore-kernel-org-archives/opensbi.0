From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 17:05:15 -0600
Subject: [PATCH 07/12] lib: utils: Improve variable declarations in MPXY
 RPMI mailbox client
In-Reply-To: <20250116155651.103782-8-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-8-apatel@ventanamicro.com>
Message-ID: <45221536-7f45-4054-8e93-3dc8a391bb19@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-01-16 9:56 AM, Anup Patel wrote:
> The local variable declarations should be at the start of function
> and preferrably organized like a inverted pyramid.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c | 31 ++++++++++++-----------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> index 26b9e6a6..27f4c571 100644
> --- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> @@ -34,8 +34,8 @@ struct mpxy_rpmi_mbox {
>  static const struct mpxy_rpmi_service_data *mpxy_find_rpmi_srvid(u32 message_id,
>  					const struct mpxy_rpmi_mbox_data *mbox_data)
>  {
> -	int mid = 0;
>  	const struct mpxy_rpmi_service_data *srv = mbox_data->service_data;
> +	int mid = 0;
>  
>  	for (mid = 0; srv[mid].id < mbox_data->num_services; mid++) {
>  		if (srv[mid].id == (u8)message_id)
> @@ -57,12 +57,10 @@ static int mpxy_mbox_read_attributes(struct sbi_mpxy_channel *channel,
>  				     u32 *outmem, u32 base_attr_id,
>  				     u32 attr_count)
>  {
> -	u32 end_id;
>  	struct mpxy_rpmi_mbox *rmb =
>  		container_of(channel, struct mpxy_rpmi_mbox, channel);
>  	u32 *attr_array = (u32 *)&rmb->msgprot_attrs;
> -
> -	end_id = base_attr_id + attr_count - 1;
> +	u32 end_id = base_attr_id + attr_count - 1;
>  
>  	if (end_id >= MPXY_MSGPROT_RPMI_ATTR_MAX_ID)
>  		return SBI_EBAD_RANGE;
> @@ -108,12 +106,11 @@ static int mpxy_mbox_write_attributes(struct sbi_mpxy_channel *channel,
>  				     u32 *outmem, u32 base_attr_id,
>  				     u32 attr_count)
>  {
> -	int ret, mem_idx;
> -	u32 end_id, attr_val, idx;
>  	struct mpxy_rpmi_mbox *rmb =
>  		container_of(channel, struct mpxy_rpmi_mbox, channel);
> -
> -	end_id = base_attr_id + attr_count - 1;
> +	u32 end_id = base_attr_id + attr_count - 1;
> +	u32 attr_val, idx;
> +	int ret, mem_idx;
>  
>  	if (end_id >= MPXY_MSGPROT_RPMI_ATTR_MAX_ID)
>  		return SBI_EBAD_RANGE;
> @@ -140,15 +137,15 @@ static int __mpxy_mbox_send_message(struct sbi_mpxy_channel *channel,
>  				  void *rx, u32 rx_max_len,
>  				  unsigned long *ack_len)
>  {
> -	int ret;
> -	u32 rx_len = 0;
> -	struct mbox_xfer xfer;
> -	struct rpmi_message_args args = {0};
>  	struct mpxy_rpmi_mbox *rmb =
>  		container_of(channel, struct mpxy_rpmi_mbox, channel);
>  	const struct mpxy_rpmi_mbox_data *data = rmb->mbox_data;
>  	const struct mpxy_rpmi_service_data *srv =
>  		mpxy_find_rpmi_srvid(message_id, data);
> +	struct rpmi_message_args args = {0};
> +	struct mbox_xfer xfer;
> +	u32 rx_len = 0;
> +	int ret;
>  
>  	if (!srv)
>  		return SBI_ENOTSUPP;
> @@ -215,12 +212,12 @@ static int mpxy_mbox_send_message_withoutresp(struct sbi_mpxy_channel *channel,
>  
>  int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *match)
>  {
> -	int rc, len;
> +	const struct mpxy_rpmi_mbox_data *data = match->data;
> +	struct mpxy_rpmi_mbox *rmb;
> +	struct mbox_chan *chan;
>  	const fdt32_t *val;
>  	u32 channel_id;
> -	struct mbox_chan *chan;
> -	struct mpxy_rpmi_mbox *rmb;
> -	const struct mpxy_rpmi_mbox_data *data = match->data;
> +	int rc, len;
>  
>  	/* Allocate context for RPXY mbox client */
>  	rmb = sbi_zalloc(sizeof(*rmb));
> @@ -270,8 +267,6 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
>  					mpxy_mbox_send_message_withresp;
>  	rmb->channel.send_message_without_response =
>  					mpxy_mbox_send_message_withoutresp;
> -	/* No callback to switch events state data */
> -	rmb->channel.switch_eventsstate = NULL;

Does this belong as part of the previous patch? Either way:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  
>  	/* RPMI Message Protocol ID */
>  	rmb->channel.attrs.msg_proto_id = SBI_MPXY_MSGPROTO_RPMI_ID;


