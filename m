From: Alvin Chang <alvinga@andestech.com>
Date: Tue, 25 Feb 2025 09:16:39 +0800
Subject: [PATCH v2 3/4] lib: sbi_mpxy: Convert MPXY state to per-domain data
In-Reply-To: <20250225011640.949660-1-alvinga@andestech.com>
References: <20250225011640.949660-1-alvinga@andestech.com>
Message-ID: <20250225011640.949660-4-alvinga@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now MPXY state is per-domain data. Allocate per-domain and per-hart MPXY
state in sbi_mpxy_init(). Use sbi_domain_mpxy_state_thishart_ptr() to
get pointer to MPXY state of current hart in current domain.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Co-developed-by: Yong Li <yong.li@intel.com>
Signed-off-by: Yong Li <yong.li@intel.com>
Reviewed-by: Alvin Chang <alvinga@andestech.com>
---
 lib/sbi/sbi_mpxy.c | 57 ++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index cf40e83..ebfce3b 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_mpxy.h>
 #include <sbi/sbi_scratch.h>
@@ -22,9 +23,6 @@
 /** Shared memory size across all harts */
 static unsigned long mpxy_shmem_size = PAGE_SIZE;
 
-/** Offset of pointer to MPXY state in scratch space */
-static unsigned long mpxy_state_offset;
-
 /** List of MPXY proxy channels */
 static SBI_LIST_HEAD(mpxy_channel_list);
 
@@ -156,7 +154,7 @@ bool sbi_mpxy_channel_available(void)
 
 static void mpxy_std_attrs_init(struct sbi_mpxy_channel *channel)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	u32 capability = 0;
 
 	/* Reset values */
@@ -227,21 +225,30 @@ int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
 
 int sbi_mpxy_init(struct sbi_scratch *scratch)
 {
+	struct sbi_domain *dom;
 	struct mpxy_state *ms;
-
-	mpxy_state_offset = sbi_scratch_alloc_type_offset(struct mpxy_state);
-	if (!mpxy_state_offset)
-		return SBI_ENOMEM;
-
-	/**
-	 * TODO: Proper support for checking msi support from platform.
-	 * Currently disable msi and sse and use polling
-	 */
-	ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
-	ms->msi_avail = false;
-	ms->sse_avail = false;
-
-	sbi_mpxy_shmem_disable(ms);
+	u32 i;
+
+	/* Loop through each domain to configure its MPXY state */
+	sbi_domain_for_each(dom) {
+		sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+			ms = sbi_zalloc(sizeof(*ms));
+			if (!ms)
+				return SBI_ENOMEM;
+
+			/*
+			 * TODO: Proper support for checking msi support from
+			 * platform. Currently disable msi and sse and use
+			 * polling
+			 */
+			ms->msi_avail = false;
+			ms->sse_avail = false;
+
+			sbi_mpxy_shmem_disable(ms);
+
+			sbi_domain_set_mpxy_state(dom, i, ms);
+		}
+	}
 
 	return sbi_platform_mpxy_init(sbi_platform_ptr(scratch));
 }
@@ -255,7 +262,7 @@ int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
 		       unsigned long shmem_phys_hi,
 		       unsigned long flags)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	unsigned long *ret_buf;
 
 	/** Disable shared memory if both hi and lo have all bit 1s */
@@ -297,7 +304,7 @@ int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
 
 int sbi_mpxy_get_channel_ids(u32 start_index)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	u32 remaining, returned, max_channelids;
 	u32 node_index = 0, node_ret = 0;
 	struct sbi_mpxy_channel *channel;
@@ -348,7 +355,7 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 
 int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	int ret = SBI_SUCCESS;
 	u32 *attr_ptr, end_id;
 	void *shmem_base;
@@ -464,7 +471,7 @@ static int mpxy_check_write_std_attr(struct sbi_mpxy_channel *channel,
 static void mpxy_write_std_attr(struct sbi_mpxy_channel *channel, u32 attr_id,
 			        u32 attr_val)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	struct sbi_mpxy_channel_attrs *attrs = &channel->attrs;
 
 	switch(attr_id) {
@@ -498,7 +505,7 @@ static void mpxy_write_std_attr(struct sbi_mpxy_channel *channel, u32 attr_id,
 
 int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	u32 *mem_ptr, attr_id, end_id, attr_val;
 	struct sbi_mpxy_channel *channel;
 	int ret, mem_idx;
@@ -588,7 +595,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 			  unsigned long msg_data_len,
 			  unsigned long *resp_data_len)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	struct sbi_mpxy_channel *channel;
 	void *shmem_base, *resp_buf;
 	u32 resp_bufsize;
@@ -646,7 +653,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 
 int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	struct sbi_mpxy_channel *channel;
 	void *eventsbuf, *shmem_base;
 	int ret;
-- 
2.34.1


