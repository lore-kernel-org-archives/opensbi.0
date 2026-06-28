Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB57C43458
	for <opensbi@archiver.kernel.org>; Sun, 28 Jun 2026 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ABTpKNKGKLhTT03gIOpxuZc0pudHUgdHloxMWnje6z0=; b=qeWcJDX/DdsLHh
	TSTpSEcSqn9MiBBWT+XTiiGZDDB7OBJhnRLzu+/hu/8zKC7jf3MliOTEgUmgH82p6nTXWB8MsFCdn
	vAxvMHQ/YZ9335W05jDS1RNKl4ASfZy11nf0nxS8b66lEy+QngxQzOP/xBSvNr2OQxy07ErCr8TcI
	StPCC1u9bpr5AIXD5OqZSLA5lXc0DPM+nDPi40Noek1RqKNddJGwr/wETI18AtaKm3pR3hnDDKIbf
	qOfEAl+cF0U0CEcgeGNz9uBxscp8T3ZFxF/5wDZC4cTWzp5iQe8ON5EXpHpSRU7L52Burp0QDv6Bv
	lvhXB4oj1jaipD4UJrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdpq4-0000000D7fr-3Uwj;
	Sun, 28 Jun 2026 13:46:24 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdpq1-0000000D7fW-3ZBb
	for opensbi@lists.infradead.org;
	Sun, 28 Jun 2026 13:46:23 +0000
Received: from 3930813e24e9.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAHn8ecJUFqHJa7Aw--.11764S2;
	Sun, 28 Jun 2026 21:46:19 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH] lib: sbi_sse: fix shared memory double-fetch in sse_write_attrs
Date: Sun, 28 Jun 2026 21:46:05 +0800
Message-Id: <20260628134605.321251-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHn8ecJUFqHJa7Aw--.11764S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4fWrWkWw4UXw15AFWxCrg_yoW8ArW7pF
	yrKasIgr4ft3WxKr98Zw48X3Z8WaykG34agF9Fyw1IvanxZFyxX342k3s0vr42kr9rAF47
	Za1UtFy5ZF4DZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20260628_064622_270740_152CC864 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

sse_write_attrs() reads attribute values from S-mode shared memory in
two passes: first to validate, then to apply. Since the shared memory
remains writable by S-mode between the two reads, the values used for
application may differ from what was validated.

Fix this by snapshotting the shared memory data into a local buffer
and performing both validation and application against that snapshot.

Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 lib/sbi/sbi_sse.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 818afb87..0a6505b7 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1064,25 +1064,28 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	unsigned long attr = 0, val;
 	uint32_t id, end_id = base_attr_id + attr_count;
 	unsigned long *attrs = (unsigned long *)input_phys;
+	unsigned long local_attrs[SBI_SSE_ATTR_MAX];
 
 	sbi_hart_protection_map_range(input_phys, sizeof(unsigned long) * attr_count);
 
+	/* Snapshot shared memory into a local buffer to prevent TOCTOU */
+	copy_attrs(local_attrs, attrs, attr_count);
+
+	sbi_hart_protection_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
+
 	for (id = base_attr_id; id < end_id; id++) {
-		val = attrs[attr++];
+		val = local_attrs[attr++];
 		ret = sse_event_set_attr_check(e, id, val);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	attr = 0;
 	for (id = base_attr_id; id < end_id; id++) {
-		val = attrs[attr++];
+		val = local_attrs[attr++];
 		sse_event_set_attr(e, id, val);
 	}
 
-out:
-	sbi_hart_protection_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
-
 	return ret;
 }
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
