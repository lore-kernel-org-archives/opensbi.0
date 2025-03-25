From: Alvin Chang <alvinga@andestech.com>
Date: Tue, 25 Mar 2025 15:13:14 +0800
Subject: [PATCH v4] lib: sbi_mpxy: Change MPXY state as per-domain data
Message-ID: <20250325071314.3113941-1-alvinga@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

OpenSBI supports multiple supervisor domains run on same platform. When
these supervisor domains want to communicate with OpenSBI through MPXY
channels, they will allocate MPXY shared memory from their own memory
regions. Therefore, the MPXY state data structure must be per-domain and
per-hart data structure.

This commit registers per-domain MPXY state data in sbi_mpxy_init(). The
original MPXY state allocated in scratch region is also removed. We also
replace sbi_scratch_thishart_offset_ptr() macro as new
sbi_domain_mpxy_state_thishart_ptr() macro which gets MPXY state from
per-domain data.

Signed-off-by: Alvin Chang <alvinga@andestech.com>
Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes in V4:
    Rebase to master and apply Samuel's suggestions which improves memory usage

Changes in V3:
    Apply Anup's suggestions to merge some of patches and drop unnecessary
    modifications

Changes in V2:
    Rebase to master
---
 include/sbi/sbi_mpxy.h |  16 +++++++
 lib/sbi/sbi_mpxy.c     | 102 +++++++++++++++++++++++++++++++----------
 2 files changed, 95 insertions(+), 23 deletions(-)

diff --git a/include/sbi/sbi_mpxy.h b/include/sbi/sbi_mpxy.h
index 9da2791..169f028 100644
--- a/include/sbi/sbi_mpxy.h
+++ b/include/sbi/sbi_mpxy.h
@@ -12,6 +12,7 @@
 
 #include <sbi/sbi_list.h>
 
+struct sbi_domain;
 struct sbi_scratch;
 
 #define SBI_MPXY_MSGPROTO_VERSION(Major, Minor) ((Major << 16) | Minor)
@@ -182,4 +183,19 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 int sbi_mpxy_get_notification_events(u32 channel_id,
 					unsigned long *events_len);
 
+/**
+ * Get per-domain MPXY state pointer for a given domain and HART index
+ * @param dom pointer to domain
+ * @param hartindex the HART index
+ *
+ * @return per-domain MPXY state pointer for given HART index
+ */
+struct mpxy_state *sbi_domain_get_mpxy_state(struct sbi_domain *dom,
+					     u32 hartindex);
+
+/** Macro to obtain the current hart's MPXY state pointer in current domain */
+#define sbi_domain_mpxy_state_thishart_ptr()			\
+	sbi_domain_get_mpxy_state(sbi_domain_thishart_ptr(),	\
+				  current_hartindex())
+
 #endif
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index c5d9d1b..ab77de6 100644
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
 
@@ -171,7 +169,7 @@ bool sbi_mpxy_channel_available(void)
 
 static void mpxy_std_attrs_init(struct sbi_mpxy_channel *channel)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	u32 capability = 0;
 
 	/* Reset values */
@@ -240,23 +238,81 @@ int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
 	return SBI_OK;
 }
 
-int sbi_mpxy_init(struct sbi_scratch *scratch)
+/** Setup per domain MPXY state data */
+static int domain_mpxy_state_data_setup(struct sbi_domain *dom,
+					struct sbi_domain_data *data,
+					void *data_ptr)
 {
+	struct mpxy_state **dom_hartindex_to_mpxy_state_table = data_ptr;
 	struct mpxy_state *ms;
+	u32 i;
+
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+		ms = sbi_zalloc(sizeof(*ms));
+		if (!ms)
+			return SBI_ENOMEM;
+
+		/*
+		 * TODO: Proper support for checking msi support from
+		 * platform. Currently disable msi and sse and use
+		 * polling
+		 */
+		ms->msi_avail = false;
+		ms->sse_avail = false;
+
+		sbi_mpxy_shmem_disable(ms);
+
+		dom_hartindex_to_mpxy_state_table[i] = ms;
+	}
+
+	return 0;
+}
+
+/** Cleanup per domain MPXY state data */
+static void domain_mpxy_state_data_cleanup(struct sbi_domain *dom,
+					   struct sbi_domain_data *data,
+					   void *data_ptr)
+{
+	struct mpxy_state **dom_hartindex_to_mpxy_state_table = data_ptr;
+	u32 i;
+
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts)
+		sbi_free(dom_hartindex_to_mpxy_state_table[i]);
+}
+
+static struct sbi_domain_data dmspriv = {
+	.data_setup = domain_mpxy_state_data_setup,
+	.data_cleanup = domain_mpxy_state_data_cleanup,
+};
+
+struct mpxy_state *sbi_domain_get_mpxy_state(struct sbi_domain *dom,
+					     u32 hartindex)
+{
+	struct mpxy_state **dom_hartindex_to_mpxy_state_table;
+
+	dom_hartindex_to_mpxy_state_table = sbi_domain_data_ptr(dom, &dmspriv);
+	if (!dom_hartindex_to_mpxy_state_table ||
+	    !sbi_hartindex_valid(hartindex))
+		return NULL;
+
+	return dom_hartindex_to_mpxy_state_table[hartindex];
+}
 
-	mpxy_state_offset = sbi_scratch_alloc_type_offset(struct mpxy_state);
-	if (!mpxy_state_offset)
-		return SBI_ENOMEM;
+int sbi_mpxy_init(struct sbi_scratch *scratch)
+{
+	int ret;
 
 	/**
-	 * TODO: Proper support for checking msi support from platform.
-	 * Currently disable msi and sse and use polling
+	 * Allocate per-domain and per-hart MPXY state data.
+	 * The data type is "struct mpxy_state **" whose memory space will be
+	 * dynamically allocated by domain_setup_data_one() and
+	 * domain_mpxy_state_data_setup(). Calculate needed size of memory space
+	 * here.
 	 */
-	ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
-	ms->msi_avail = false;
-	ms->sse_avail = false;
-
-	sbi_mpxy_shmem_disable(ms);
+	dmspriv.data_size = sizeof(struct mpxy_state *) * sbi_hart_count();
+	ret = sbi_domain_register_data(&dmspriv);
+	if (ret)
+		return ret;
 
 	return sbi_platform_mpxy_init(sbi_platform_ptr(scratch));
 }
@@ -270,7 +326,7 @@ int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
 		       unsigned long shmem_phys_hi,
 		       unsigned long flags)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	unsigned long *ret_buf;
 
 	/** Disable shared memory if both hi and lo have all bit 1s */
@@ -312,7 +368,7 @@ int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
 
 int sbi_mpxy_get_channel_ids(u32 start_index)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	u32 remaining, returned, max_channelids;
 	u32 node_index = 0, node_ret = 0;
 	struct sbi_mpxy_channel *channel;
@@ -363,7 +419,7 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 
 int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	int ret = SBI_SUCCESS;
 	u32 *attr_ptr, end_id;
 	void *shmem_base;
@@ -477,9 +533,9 @@ static int mpxy_check_write_std_attr(struct sbi_mpxy_channel *channel,
  * Write the attribute value
  */
 static void mpxy_write_std_attr(struct sbi_mpxy_channel *channel, u32 attr_id,
-			        u32 attr_val)
+				u32 attr_val)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	struct sbi_mpxy_channel_attrs *attrs = &channel->attrs;
 
 	switch(attr_id) {
@@ -513,7 +569,7 @@ static void mpxy_write_std_attr(struct sbi_mpxy_channel *channel, u32 attr_id,
 
 int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	u32 *mem_ptr, attr_id, end_id, attr_val;
 	struct sbi_mpxy_channel *channel;
 	int ret, mem_idx;
@@ -603,7 +659,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 			  unsigned long msg_data_len,
 			  unsigned long *resp_data_len)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	struct sbi_mpxy_channel *channel;
 	void *shmem_base, *resp_buf;
 	u32 resp_bufsize;
@@ -661,7 +717,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 
 int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 {
-	struct mpxy_state *ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	struct sbi_mpxy_channel *channel;
 	void *eventsbuf, *shmem_base;
 	int ret;
-- 
2.43.0


