From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 22 Jan 2025 12:14:40 +0530
Subject: [PATCH v2 13/13] lib: sbi: Update MPXY framework and SBI extension as per latest spec
In-Reply-To: <20250122064441.272115-1-apatel@ventanamicro.com>
References: <20250122064441.272115-1-apatel@ventanamicro.com>
Message-ID: <20250122064441.272115-14-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest SBI 3.0 spec defines a new sbi_mpxy_get_shmem_size()
function and simplifies sbi_mpxy_set_shmem() function so update
the MPXY framework and SBI extension accordingly.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ecall_interface.h | 15 ++++----
 include/sbi/sbi_mpxy.h            | 12 +++---
 lib/sbi/sbi_ecall_mpxy.c          |  7 +++-
 lib/sbi/sbi_mpxy.c                | 62 +++++++++++++++++--------------
 4 files changed, 55 insertions(+), 41 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 0b6b5714..46a813e8 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -423,13 +423,14 @@ enum sbi_sse_state {
 #define SBI_SSE_EVENT_PLATFORM_BIT		(1 << 14)
 
 /* SBI function IDs for MPXY extension */
-#define SBI_EXT_MPXY_SET_SHMEM			0x0
-#define SBI_EXT_MPXY_GET_CHANNEL_IDS		0x1
-#define SBI_EXT_MPXY_READ_ATTRS			0x2
-#define SBI_EXT_MPXY_WRITE_ATTRS		0x3
-#define SBI_EXT_MPXY_SEND_MSG_WITH_RESP		0x4
-#define SBI_EXT_MPXY_SEND_MSG_NO_RESP		0x5
-#define SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS	0x6
+#define SBI_EXT_MPXY_GET_SHMEM_SIZE		0x0
+#define SBI_EXT_MPXY_SET_SHMEM			0x1
+#define SBI_EXT_MPXY_GET_CHANNEL_IDS		0x2
+#define SBI_EXT_MPXY_READ_ATTRS			0x3
+#define SBI_EXT_MPXY_WRITE_ATTRS		0x4
+#define SBI_EXT_MPXY_SEND_MSG_WITH_RESP		0x5
+#define SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP	0x6
+#define SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS	0x7
 
 /* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
diff --git a/include/sbi/sbi_mpxy.h b/include/sbi/sbi_mpxy.h
index e30a17d1..9da2791e 100644
--- a/include/sbi/sbi_mpxy.h
+++ b/include/sbi/sbi_mpxy.h
@@ -153,11 +153,13 @@ int sbi_mpxy_init(struct sbi_scratch *scratch);
 /** Check if some Message proxy channel is available */
 bool sbi_mpxy_channel_available(void);
 
-/** Set Message proxy shared memory on the calling HART */
-int sbi_mpxy_set_shmem(unsigned long shmem_size,
-			unsigned long shmem_phys_lo,
-			unsigned long shmem_phys_hi,
-			unsigned long flags);
+/** Get message proxy shared memory size */
+unsigned long sbi_mpxy_get_shmem_size(void);
+
+/** Set message proxy shared memory on the calling HART */
+int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
+		       unsigned long shmem_phys_hi,
+		       unsigned long flags);
 
 /** Get channel IDs list */
 int sbi_mpxy_get_channel_ids(u32 start_index);
diff --git a/lib/sbi/sbi_ecall_mpxy.c b/lib/sbi/sbi_ecall_mpxy.c
index 09705cce..03ac71b2 100644
--- a/lib/sbi/sbi_ecall_mpxy.c
+++ b/lib/sbi/sbi_ecall_mpxy.c
@@ -20,8 +20,11 @@ static int sbi_ecall_mpxy_handler(unsigned long extid, unsigned long funcid,
 	int ret = 0;
 
 	switch (funcid) {
+	case SBI_EXT_MPXY_GET_SHMEM_SIZE:
+		out->value = sbi_mpxy_get_shmem_size();
+		break;
 	case SBI_EXT_MPXY_SET_SHMEM:
-		ret = sbi_mpxy_set_shmem(regs->a0, regs->a1, regs->a2, regs->a3);
+		ret = sbi_mpxy_set_shmem(regs->a0, regs->a1, regs->a2);
 		break;
 	case SBI_EXT_MPXY_GET_CHANNEL_IDS:
 		ret = sbi_mpxy_get_channel_ids(regs->a0);
@@ -36,7 +39,7 @@ static int sbi_ecall_mpxy_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_mpxy_send_message(regs->a0, regs->a1,
 					    regs->a2, &out->value);
 		break;
-	case SBI_EXT_MPXY_SEND_MSG_NO_RESP:
+	case SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP:
 		ret = sbi_mpxy_send_message(regs->a0, regs->a1, regs->a2,
 					    NULL);
 		break;
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 6a5605ea..c5d9d1bb 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -19,6 +19,9 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_byteorder.h>
 
+/** Shared memory size across all harts */
+static unsigned long mpxy_shmem_size = PAGE_SIZE;
+
 /** Offset of pointer to MPXY state in scratch space */
 static unsigned long mpxy_state_offset;
 
@@ -73,7 +76,6 @@ static SBI_LIST_HEAD(mpxy_channel_list);
 
 /** Per hart shared memory */
 struct mpxy_shmem {
-	unsigned long shmem_size;
 	unsigned long shmem_addr_lo;
 	unsigned long shmem_addr_hi;
 };
@@ -90,7 +92,6 @@ struct mpxy_state {
 /** Disable hart shared memory */
 static inline void sbi_mpxy_shmem_disable(struct mpxy_state *ms)
 {
-	ms->shmem.shmem_size = 0;
 	ms->shmem.shmem_addr_lo = INVALID_ADDR;
 	ms->shmem.shmem_addr_hi = INVALID_ADDR;
 }
@@ -227,6 +228,12 @@ int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
 	/* Initialize channel specific attributes */
 	mpxy_std_attrs_init(channel);
 
+	/* Update shared memory size if required */
+	if (mpxy_shmem_size < channel->attrs.msg_data_maxlen) {
+		mpxy_shmem_size = channel->attrs.msg_data_maxlen;
+		mpxy_shmem_size = (mpxy_shmem_size + (PAGE_SIZE - 1)) / PAGE_SIZE;
+	}
+
 	SBI_INIT_LIST_HEAD(&channel->head);
 	sbi_list_add_tail(&channel->head, &mpxy_channel_list);
 
@@ -254,8 +261,14 @@ int sbi_mpxy_init(struct sbi_scratch *scratch)
 	return sbi_platform_mpxy_init(sbi_platform_ptr(scratch));
 }
 
-int sbi_mpxy_set_shmem(unsigned long shmem_size, unsigned long shmem_phys_lo,
-		       unsigned long shmem_phys_hi, unsigned long flags)
+unsigned long sbi_mpxy_get_shmem_size(void)
+{
+	return mpxy_shmem_size;
+}
+
+int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
+		       unsigned long shmem_phys_hi,
+		       unsigned long flags)
 {
 	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
 	unsigned long *ret_buf;
@@ -271,13 +284,12 @@ int sbi_mpxy_set_shmem(unsigned long shmem_size, unsigned long shmem_phys_lo,
 		return SBI_ERR_INVALID_PARAM;
 
 	/** Check shared memory size and address aligned to 4K Page */
-	if (!shmem_size || (shmem_size & ~PAGE_MASK) ||
-	    (shmem_phys_lo & ~PAGE_MASK))
+	if (shmem_phys_lo & ~PAGE_MASK)
 		return SBI_ERR_INVALID_PARAM;
 
 	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
 				SHMEM_PHYS_ADDR(shmem_phys_hi, shmem_phys_lo),
-				shmem_size, PRV_S,
+				mpxy_shmem_size, PRV_S,
 				SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
@@ -285,15 +297,13 @@ int sbi_mpxy_set_shmem(unsigned long shmem_size, unsigned long shmem_phys_lo,
 	if (flags == SBI_EXT_MPXY_SHMEM_FLAG_OVERWRITE_RETURN) {
 		ret_buf = (unsigned long *)(ulong)SHMEM_PHYS_ADDR(shmem_phys_hi,
 								  shmem_phys_lo);
-		sbi_hart_map_saddr((unsigned long)ret_buf, shmem_size);
-		ret_buf[0] = cpu_to_lle(ms->shmem.shmem_size);
-		ret_buf[1] = cpu_to_lle(ms->shmem.shmem_addr_lo);
-		ret_buf[2] = cpu_to_lle(ms->shmem.shmem_addr_hi);
+		sbi_hart_map_saddr((unsigned long)ret_buf, mpxy_shmem_size);
+		ret_buf[0] = cpu_to_lle(ms->shmem.shmem_addr_lo);
+		ret_buf[1] = cpu_to_lle(ms->shmem.shmem_addr_hi);
 		sbi_hart_unmap_saddr();
 	}
 
 	/** Setup the new shared memory */
-	ms->shmem.shmem_size	= shmem_size;
 	ms->shmem.shmem_addr_lo = shmem_phys_lo;
 	ms->shmem.shmem_addr_hi = shmem_phys_hi;
 
@@ -319,12 +329,11 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_map_saddr((unsigned long)hart_shmem_base(ms),
-				ms->shmem.shmem_size);
+	sbi_hart_map_saddr((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	/** number of channel ids which can be stored in shmem adjusting
 	 * for remaining and returned fields */
-	max_channelids = (ms->shmem.shmem_size / sizeof(u32)) - 2;
+	max_channelids = (mpxy_shmem_size / sizeof(u32)) - 2;
 	/* total remaining from the start index */
 	remaining = channels_count - start_index;
 	/* how many can be returned */
@@ -372,14 +381,13 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 		return SBI_ERR_INVALID_PARAM;
 
 	/* Sanity check for base_attr_id and attr_count */
-	if (!attr_count || (attr_count > (ms->shmem.shmem_size / ATTR_SIZE)))
+	if (!attr_count || (attr_count > (mpxy_shmem_size / ATTR_SIZE)))
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
 	end_id = base_attr_id + attr_count - 1;
 
-	sbi_hart_map_saddr((unsigned long)hart_shmem_base(ms),
-				ms->shmem.shmem_size);
+	sbi_hart_map_saddr((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	/* Standard attributes range check */
 	if (mpxy_is_std_attr(base_attr_id)) {
@@ -524,13 +532,13 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 		return SBI_ERR_INVALID_PARAM;
 
 	/* Sanity check for base_attr_id and attr_count */
-	if (!attr_count || (attr_count > (ms->shmem.shmem_size / ATTR_SIZE)))
+	if (!attr_count || (attr_count > (mpxy_shmem_size / ATTR_SIZE)))
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
 	end_id = base_attr_id + attr_count - 1;
 
-	sbi_hart_map_saddr((unsigned long)shmem_base, ms->shmem.shmem_size);
+	sbi_hart_map_saddr((unsigned long)shmem_base, mpxy_shmem_size);
 
 	mem_ptr = (u32 *)shmem_base;
 
@@ -614,16 +622,16 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 	if (!resp_data_len && !channel->send_message_without_response)
 		return SBI_ERR_NOT_SUPPORTED;
 
-	if (msg_data_len > ms->shmem.shmem_size ||
+	if (msg_data_len > mpxy_shmem_size ||
 		msg_data_len > channel->attrs.msg_data_maxlen)
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_map_saddr((unsigned long)shmem_base, ms->shmem.shmem_size);
+	sbi_hart_map_saddr((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (resp_data_len) {
 		resp_buf = shmem_base;
-		resp_bufsize = ms->shmem.shmem_size;
+		resp_bufsize = mpxy_shmem_size;
 		ret = channel->send_message_with_response(channel, msg_id,
 							  shmem_base,
 							  msg_data_len,
@@ -644,7 +652,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 		return SBI_ERR_FAILED;
 
 	if (resp_data_len &&
-	    (*resp_data_len > ms->shmem.shmem_size ||
+	    (*resp_data_len > mpxy_shmem_size ||
 	     *resp_data_len > channel->attrs.msg_data_maxlen))
 		return SBI_ERR_FAILED;
 
@@ -666,17 +674,17 @@ int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 		return SBI_ERR_NOT_SUPPORTED;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_map_saddr((unsigned long)shmem_base, ms->shmem.shmem_size);
+	sbi_hart_map_saddr((unsigned long)shmem_base, mpxy_shmem_size);
 	eventsbuf = shmem_base;
 	ret = channel->get_notification_events(channel, eventsbuf,
-					       ms->shmem.shmem_size,
+					       mpxy_shmem_size,
 					       events_len);
 	sbi_hart_unmap_saddr();
 
 	if (ret)
 		return ret;
 
-	if (*events_len > ms->shmem.shmem_size)
+	if (*events_len > (mpxy_shmem_size - 16))
 		return SBI_ERR_FAILED;
 
 	return SBI_SUCCESS;
-- 
2.43.0


