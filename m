From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 22 Jan 2025 12:14:32 +0530
Subject: [PATCH v2 05/13] lib: sbi: Improve local variable declarations in MPXY framework
In-Reply-To: <20250122064441.272115-1-apatel@ventanamicro.com>
References: <20250122064441.272115-1-apatel@ventanamicro.com>
Message-ID: <20250122064441.272115-6-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The local variable declarations should be at the start of function
and preferrably organized like a inverted pyramid.

Signed-off-by: Anup patel <apatel@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 lib/sbi/sbi_mpxy.c | 65 ++++++++++++++++++----------------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 91b212a6..6a5605ea 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -170,9 +170,8 @@ bool sbi_mpxy_channel_available(void)
 
 static void mpxy_std_attrs_init(struct sbi_mpxy_channel *channel)
 {
+	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 	u32 capability = 0;
-	struct mpxy_state *ms =
-		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 
 	/* Reset values */
 	channel->attrs.msi_control = 0;
@@ -236,6 +235,8 @@ int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
 
 int sbi_mpxy_init(struct sbi_scratch *scratch)
 {
+	struct mpxy_state *ms;
+
 	mpxy_state_offset = sbi_scratch_alloc_type_offset(struct mpxy_state);
 	if (!mpxy_state_offset)
 		return SBI_ENOMEM;
@@ -244,8 +245,7 @@ int sbi_mpxy_init(struct sbi_scratch *scratch)
 	 * TODO: Proper support for checking msi support from platform.
 	 * Currently disable msi and sse and use polling
 	 */
-	struct mpxy_state *ms =
-		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 	ms->msi_avail = false;
 	ms->sse_avail = false;
 
@@ -257,8 +257,7 @@ int sbi_mpxy_init(struct sbi_scratch *scratch)
 int sbi_mpxy_set_shmem(unsigned long shmem_size, unsigned long shmem_phys_lo,
 		       unsigned long shmem_phys_hi, unsigned long flags)
 {
-	struct mpxy_state *ms =
-		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 	unsigned long *ret_buf;
 
 	/** Disable shared memory if both hi and lo have all bit 1s */
@@ -303,15 +302,12 @@ int sbi_mpxy_set_shmem(unsigned long shmem_size, unsigned long shmem_phys_lo,
 
 int sbi_mpxy_get_channel_ids(u32 start_index)
 {
-	u32 node_index = 0, node_ret = 0;
+	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 	u32 remaining, returned, max_channelids;
+	u32 node_index = 0, node_ret = 0;
+	struct sbi_mpxy_channel *channel;
 	u32 channels_count = 0;
 	u32 *shmem_base;
-	struct sbi_mpxy_channel *channel;
-
-	/* Check if the shared memory is being setup or not. */
-	struct mpxy_state *ms =
-		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
@@ -358,13 +354,11 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 
 int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
+	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 	int ret = SBI_SUCCESS;
 	u32 *attr_ptr, end_id;
 	void *shmem_base;
 
-	struct mpxy_state *ms =
-		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
-
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
 
@@ -442,8 +436,8 @@ out:
 static int mpxy_check_write_std_attr(struct sbi_mpxy_channel *channel,
 				     u32 attr_id, u32 attr_val)
 {
-	int ret = SBI_SUCCESS;
 	struct sbi_mpxy_channel_attrs *attrs = &channel->attrs;
+	int ret = SBI_SUCCESS;
 
 	switch(attr_id) {
 	case SBI_MPXY_ATTR_MSI_CONTROL:
@@ -477,9 +471,7 @@ static int mpxy_check_write_std_attr(struct sbi_mpxy_channel *channel,
 static void mpxy_write_std_attr(struct sbi_mpxy_channel *channel, u32 attr_id,
 			        u32 attr_val)
 {
-	struct mpxy_state *ms =
-		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
-
+	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 	struct sbi_mpxy_channel_attrs *attrs = &channel->attrs;
 
 	switch(attr_id) {
@@ -513,17 +505,16 @@ static void mpxy_write_std_attr(struct sbi_mpxy_channel *channel, u32 attr_id,
 
 int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
+	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	u32 *mem_ptr, attr_id, end_id, attr_val;
+	struct sbi_mpxy_channel *channel;
 	int ret, mem_idx;
 	void *shmem_base;
-	u32 *mem_ptr, attr_id, end_id, attr_val;
-
-	struct mpxy_state *ms =
-		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
 
-	struct sbi_mpxy_channel *channel = mpxy_find_channel(channel_id);
+	channel = mpxy_find_channel(channel_id);
 	if (!channel)
 		return SBI_ERR_NOT_SUPPORTED;
 
@@ -604,17 +595,16 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 			  unsigned long msg_data_len,
 			  unsigned long *resp_data_len)
 {
-	int ret;
+	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct sbi_mpxy_channel *channel;
 	void *shmem_base, *resp_buf;
 	u32 resp_bufsize;
-
-	struct mpxy_state *ms =
-		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	int ret;
 
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
 
-	struct sbi_mpxy_channel *channel = mpxy_find_channel(channel_id);
+	channel = mpxy_find_channel(channel_id);
 	if (!channel)
 		return SBI_ERR_NOT_SUPPORTED;
 
@@ -640,8 +630,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 							  resp_buf,
 							  resp_bufsize,
 							  resp_data_len);
-	}
-	else {
+	} else {
 		ret = channel->send_message_without_response(channel, msg_id,
 							     shmem_base,
 							     msg_data_len);
@@ -664,20 +653,16 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 
 int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 {
-	int ret;
+	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct sbi_mpxy_channel *channel;
 	void *eventsbuf, *shmem_base;
-
-	struct mpxy_state *ms =
-		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	int ret;
 
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
 
-	struct sbi_mpxy_channel *channel = mpxy_find_channel(channel_id);
-	if (!channel)
-		return SBI_ERR_NOT_SUPPORTED;
-
-	if (!channel->get_notification_events)
+	channel = mpxy_find_channel(channel_id);
+	if (!channel || !channel->get_notification_events)
 		return SBI_ERR_NOT_SUPPORTED;
 
 	shmem_base = hart_shmem_base(ms);
-- 
2.43.0


