Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7148AC43458
	for <opensbi@archiver.kernel.org>; Sun, 28 Jun 2026 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=09YRZc539c0+uhaFVVL6zHZO3tojCHUtTet2D8WQRWM=; b=hyy7W0khfdOBuC
	bGz5oX140em0ohJhyi5lwxS9xmK6rGeRzFQSmW6+dX2Bep2tfTBcP+MKZMz12L18sQmW8Ns0le9Kl
	i9BVKk1bomfDWDe/+CG0rVDquRAS5ob+0ax5zX3g8iG1qX8kiIpmHzjr/nzZYHpckWkj2EsiZVoTB
	0p2wgeqfivd1EfoDW85O1AKqtjzszsfX60dbgZOAj+x/5iSO5Ky0avuycPTIc1F7jQ7ifzMtb0tU7
	SnaLlcXRTu6yaDafqaD+jIt+0XZhLavqYPFUakPmQZmNB2ZuRZNQGIR4OBIyWSNSmZAq25K5MUKja
	FaClQZGO0hi/jjljYvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdqTq-0000000D8pU-1IdS;
	Sun, 28 Jun 2026 14:27:30 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdqTm-0000000D8p1-3zYK
	for opensbi@lists.infradead.org;
	Sun, 28 Jun 2026 14:27:28 +0000
Received: from 3930813e24e9.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABXO+JAL0FqDgQwFg--.18356S2;
	Sun, 28 Jun 2026 22:27:23 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH] lib: sbi_mpxy: fix integer overflow in attribute range endpoint
Date: Sun, 28 Jun 2026 22:27:15 +0800
Message-Id: <20260628142715.370970-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXO+JAL0FqDgQwFg--.18356S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1xZr4Dur17ZF15Wr17Jrb_yoWrJr1xpF
	yDKayqgr4xJanaywnFyw4DJa1IgrW8t3W3KryDK34jyF1UXrn2y348Ja90gF1YyFZ7AF4U
	t3WvgryUuF4j9F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUym14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUPGYLUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_072727_423159_20C68C69 
X-CRM114-Status: GOOD (  11.58  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

sbi_mpxy_read_attrs() and sbi_mpxy_write_attrs() compute the attribute
range endpoint as:

  u32 end_id = base_attr_id + attr_count - 1;

When base_attr_id is close to UINT32_MAX (e.g. 0xFFFFFFFF with
attr_count=2) the addition wraps around to a small value. The
subsequent range check for the message protocol path compares
end_id > SBI_MPXY_ATTR_MSGPROTO_ATTR_END (0xFFFFFFFF), which is
always false for a u32 variable and therefore dead code.

The wrapped end_id then passes through to the RPMI mailbox read
callback, where attr_id2index() computes a large index
(base_attr_id - 0x80000000), causing an out-of-bounds read from
M-mode memory into S-mode shared memory.

Fix by widening end_id to u64 before the arithmetic, consistent with
the approach used in sbi_sse_attr_check(). Apply the same fix to the
RPMI mailbox callbacks for defense in depth.

Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 lib/sbi/sbi_mpxy.c                  | 10 ++++++----
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 8daeb83d..01e7da17 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -444,7 +444,8 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
 	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	int ret = SBI_SUCCESS;
-	u32 *attr_ptr, end_id;
+	u32 *attr_ptr;
+	u64 end_id;
 	void *shmem_base;
 
 	if (!mpxy_shmem_enabled(ms))
@@ -464,7 +465,7 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	end_id = base_attr_id + attr_count - 1;
+	end_id = (u64)base_attr_id + attr_count - 1;
 
 	sbi_hart_protection_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
@@ -593,7 +594,8 @@ static void mpxy_write_std_attr(struct sbi_mpxy_channel *channel, u32 attr_id,
 int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
 	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
-	u32 *mem_ptr, attr_id, end_id, attr_val;
+	u32 *mem_ptr, attr_id, attr_val;
+	u64 end_id;
 	struct sbi_mpxy_channel *channel;
 	int ret, mem_idx;
 	void *shmem_base;
@@ -615,7 +617,7 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	end_id = base_attr_id + attr_count - 1;
+	end_id = (u64)base_attr_id + attr_count - 1;
 
 	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
index 84b7a67d..5e27b61c 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -60,7 +60,7 @@ static int mpxy_mbox_read_attributes(struct sbi_mpxy_channel *channel,
 	struct mpxy_rpmi_mbox *rmb =
 		container_of(channel, struct mpxy_rpmi_mbox, channel);
 	u32 *attr_array = (u32 *)&rmb->msgprot_attrs;
-	u32 end_id = base_attr_id + attr_count - 1;
+	u64 end_id = (u64)base_attr_id + attr_count - 1;
 
 	if (end_id >= MPXY_MSGPROT_RPMI_ATTR_MAX_ID)
 		return SBI_EBAD_RANGE;
@@ -108,7 +108,7 @@ static int mpxy_mbox_write_attributes(struct sbi_mpxy_channel *channel,
 {
 	struct mpxy_rpmi_mbox *rmb =
 		container_of(channel, struct mpxy_rpmi_mbox, channel);
-	u32 end_id = base_attr_id + attr_count - 1;
+	u64 end_id = (u64)base_attr_id + attr_count - 1;
 	u32 attr_val, idx;
 	int ret, mem_idx;
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
