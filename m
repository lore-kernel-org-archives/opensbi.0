Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926E9606A32A
	for <opensbi@archiver.kernel.org>; Thu, 19 Nov 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vya8n2a9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YNYAXgrZ0efzyAwFPrLRB0qiJkGiEL9bd/2sLUYuE6k=; b=Vya8n2a97KPIwXktBg6PuCGXYE
	CuXe/y4yYz6Tm/hCTMLz0UzeWiSxC07bwgn+Mz/JqKctk1qdXLTtyRvqNGSYHNelK/FDzoKpUoTpM
	lMuT7OpDUHcxJLVQAUCNg2Hp/Bt8fSedev1iouAAEGk2QmCcxdR2jQguProlVLm99261HhaPnJGw3
	RdqGdIPaIkGVSK3z1rV9Kjb5skmA0qHOTTGQ+V8gmTV4PagiWRci/83DNXAEpJmORRgpBiX/2f5Fh
	VRmN/F3mTpga++jev1lO2DQ4ASq6yuoQrF8VDSmhhSM8b5Wp+0Ry7BYFnd+M9GIRTjRMtmKXcmJYZ
	DE/8Wukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4U2-0000000CYEi-3RiP;
	Thu, 19 Nov 2026 15:55:34 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Tz-0000000CYBy-1YLF
	for opensbi@lists.infradead.org;
	Thu, 19 Nov 2026 15:55:33 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXtLntG_9qqWB5AQ--.937S3;
	Thu, 19 Nov 2026 23:55:25 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	himanshu.chauhan@oss.qualcomm.com,
	sebasjosue84@gmail.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH 1/2] lib: sbi: check the result of sbi_hart_protection_temp_map_range()
Date: Thu, 19 Nov 2026 15:55:10 +0000
Message-Id: <20261119155511.1204901-2-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119155511.1204901-1-liutong@iscas.ac.cn>
References: <20261119155511.1204901-1-liutong@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXtLntG_9qqWB5AQ--.937S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WFW3XryDJw17CFy7WrW3ZFb_yoWfJrWkpF
	1xCFZrtr4Iq3srtry7Z3WkX3yUXayxta4xKFW7Kr9YyF4fZr1xJ3yavasYvFyFyrykAFWj
	v3W0gF4UC3W5ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUE-erUUUUU=
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_075531_806072_A26711DE 
X-CRM114-Status: GOOD (  13.83  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

No caller looks at it. The Smepmp backend declines when no NAPOT block
fits the request, and supervisor software can ask for one: a debug
console write with num_bytes = 2^63 passes sbi_domain_check_addr_range()
against the root domain's catch-all region, and the backend then returns
SBI_EFAIL. The entry is not programmed, M-mode has no access to the
buffer under Smepmp, and the access that follows faults and leaves the
hart stopped with no output. The backend also declines, defensively,
when the reserved entry is already in use.

Return instead of touching memory the firmware could not map, with an
error each function is allowed to return: SBI_ERR_INVALID_PARAM for the
debug console, matching the address check above it, SBI_ERR_FAILED for
the debug trigger and message proxy calls, and SBI_ERR_INVALID_ADDRESS
where the neighbouring check already uses it.

Fixes: 0ad866067d78 ("lib: sbi: Map/Unmap debug console shared memory buffers")
Suggested-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 lib/sbi/sbi_dbtr.c       | 18 +++++++++++++-----
 lib/sbi/sbi_ecall_dbcn.c |  3 ++-
 lib/sbi/sbi_mpxy.c       | 24 ++++++++++++++++++------
 lib/sbi/sbi_pmu.c        |  3 ++-
 lib/sbi/sbi_sse.c        | 10 ++++++++--
 5 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index c97e625f..ad1dee5e 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -657,8 +657,10 @@ int sbi_dbtr_read_trig(unsigned long smode,
 
 	shmem_base = hart_shmem_base(hs);
 
-	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
-					   trig_count * sizeof(*entry));
+	if (sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
+					       trig_count * sizeof(*entry)))
+		return SBI_ERR_FAILED;
+
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		xmit = &entry->data;
 		trig = INDEX_TO_TRIGGER((_idx + trig_idx_base));
@@ -702,8 +704,11 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		return SBI_ERR_NO_SHMEM;
 
 	shmem_base = hart_shmem_base(hs);
-	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
-					   trig_count * sizeof(*entry));
+	if (sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
+					       trig_count * sizeof(*entry))) {
+		*out = 0;
+		return SBI_ERR_FAILED;
+	}
 
 	/*
 	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
@@ -885,7 +890,10 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		sbi_hart_protection_temp_map_range((unsigned long)entry, sizeof(*entry));
+		if (sbi_hart_protection_temp_map_range((unsigned long)entry,
+						       sizeof(*entry)))
+			return SBI_ERR_FAILED;
+
 		trig_idx = entry->id.idx;
 
 		if (trig_idx >= hs->total_trigs) {
diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index 76837737..72cbfb2a 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -46,7 +46,8 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 					regs->a1, regs->a0, smode,
 					SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
 			return SBI_ERR_INVALID_PARAM;
-		sbi_hart_protection_temp_map_range(regs->a1, regs->a0);
+		if (sbi_hart_protection_temp_map_range(regs->a1, regs->a0))
+			return SBI_ERR_INVALID_PARAM;
 		if (funcid == SBI_EXT_DBCN_CONSOLE_WRITE)
 			out->value = sbi_nputs((const char *)regs->a1, regs->a0);
 		else
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index a09a09dc..9742304a 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -401,7 +401,9 @@ int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
 	if (flags == SBI_EXT_MPXY_SHMEM_FLAG_OVERWRITE_RETURN) {
 		ret_buf = (unsigned long *)(ulong)SHMEM_PHYS_ADDR(shmem_phys_hi,
 								  shmem_phys_lo);
-		sbi_hart_protection_temp_map_range((unsigned long)ret_buf, mpxy_shmem_size);
+		if (sbi_hart_protection_temp_map_range((unsigned long)ret_buf,
+						       mpxy_shmem_size))
+			return SBI_ERR_INVALID_ADDRESS;
 		ret_buf[0] = cpu_to_lle(ms->shmem.shmem_addr_lo);
 		ret_buf[1] = cpu_to_lle(ms->shmem.shmem_addr_hi);
 		sbi_hart_protection_temp_unmap_range((unsigned long)ret_buf, mpxy_shmem_size);
@@ -436,7 +438,9 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_protection_temp_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	if (sbi_hart_protection_temp_map_range((unsigned long)hart_shmem_base(ms),
+					       mpxy_shmem_size))
+		return SBI_ERR_FAILED;
 
 	/** number of channel ids which can be stored in shmem adjusting
 	 * for remaining and returned fields */
@@ -499,7 +503,9 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	shmem_base = hart_shmem_base(ms);
 	end_id = (u64)base_attr_id + attr_count - 1;
 
-	sbi_hart_protection_temp_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	if (sbi_hart_protection_temp_map_range((unsigned long)hart_shmem_base(ms),
+					       mpxy_shmem_size))
+		return SBI_ERR_FAILED;
 
 	/* Standard attributes range check */
 	if (mpxy_is_std_attr(base_attr_id)) {
@@ -652,7 +658,9 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	shmem_base = hart_shmem_base(ms);
 	end_id = (u64)base_attr_id + attr_count - 1;
 
-	sbi_hart_protection_temp_map_range((unsigned long)shmem_base, mpxy_shmem_size);
+	if (sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
+					       mpxy_shmem_size))
+		return SBI_ERR_FAILED;
 
 	mem_ptr = (u32 *)shmem_base;
 
@@ -742,7 +750,9 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_protection_temp_map_range((unsigned long)shmem_base, mpxy_shmem_size);
+	if (sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
+					       mpxy_shmem_size))
+		return SBI_ERR_FAILED;
 
 	if (resp_data_len) {
 		resp_buf = shmem_base;
@@ -790,7 +800,9 @@ int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 		return SBI_ERR_NOT_SUPPORTED;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_protection_temp_map_range((unsigned long)shmem_base, mpxy_shmem_size);
+	if (sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
+					       mpxy_shmem_size))
+		return SBI_ERR_FAILED;
 	eventsbuf = shmem_base;
 	ret = channel->get_notification_events(channel, eventsbuf,
 					       mpxy_shmem_size,
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index f33238d8..793f2c3f 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1136,7 +1136,8 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
-	sbi_hart_protection_temp_map_range(shmem_phys_lo, shmem_size);
+	if (sbi_hart_protection_temp_map_range(shmem_phys_lo, shmem_size))
+		return SBI_ERR_INVALID_ADDRESS;
 
 	einfo = (struct sbi_pmu_event_info *)(shmem_phys_lo);
 	for (i = 0; i < num_events; i++) {
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 767ea128..5e2437aa 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1022,7 +1022,11 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
 	if (ret)
 		return ret;
 
-	sbi_hart_protection_temp_map_range(output_phys_lo, sizeof(unsigned long) * attr_count);
+	if (sbi_hart_protection_temp_map_range(output_phys_lo,
+					       sizeof(unsigned long) * attr_count)) {
+		sse_event_put(e);
+		return SBI_ERR_INVALID_ADDRESS;
+	}
 
 	/*
 	 * Copy all attributes at once since struct sse_event_attrs is matching
@@ -1050,7 +1054,9 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	uint32_t id, end_id = base_attr_id + attr_count;
 	unsigned long *attrs = (unsigned long *)input_phys;
 
-	sbi_hart_protection_temp_map_range(input_phys, sizeof(unsigned long) * attr_count);
+	if (sbi_hart_protection_temp_map_range(input_phys,
+					       sizeof(unsigned long) * attr_count))
+		return SBI_ERR_INVALID_ADDRESS;
 
 	for (id = base_attr_id; id < end_id; id++) {
 		val = attrs[attr++];
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
