Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D2EC55164
	for <opensbi@archiver.kernel.org>; Thu, 30 Jul 2026 16:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1h5G5J7ZB9Mr8e1LSjsXY+PwunJ983xmu1VrGf0PPk=; b=qflWJ5SxxK34tv
	sNmxwgb7oaePSaXEOMHP/dyooT5xKEfxovfu7rUHMjAyJks36fkeYKQGKwP2XAGL4eeNmHkoc5Mr4
	vF9Yt7MWEf17SBHp8QGXZZ+6pvlJXVUVuxw/pOYh5JvfF8e+oppG4sxcSTtYas7KKqGwmN26gRzPR
	RJxTLmKdvzOkE4phOGNtkwhuy2kMAku/OAj+zIHFFw2Fvw7rR1eB4c32gQrRb9P5sNnqq/fjFIRte
	UfGG1pE08rQwqqZKYfz36QC6Ea28KkXLxx6Bjk26h9iJB8hySMMNRW7iWioaPqIsbpFiK+1kiu+g2
	qKc1wvP0J6PbqGiYsxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTIZ-0000000Awq1-0WfT;
	Thu, 30 Jul 2026 16:07:55 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTIU-0000000Awp6-02bF
	for opensbi@lists.infradead.org;
	Thu, 30 Jul 2026 16:07:51 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACXAj3TdmtqcsFWAg--.30486S2;
	Fri, 31 Jul 2026 00:07:47 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2] lib: sbi_sse: fix shared memory double-fetch in sse_write_attrs
Date: Thu, 30 Jul 2026 16:07:36 +0000
Message-Id: <20260730160736.1327916-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260628092110.209040-1-liutong@iscas.ac.cn>
References: <20260628092110.209040-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowACXAj3TdmtqcsFWAg--.30486S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4fWF18tw45Zr4ktF1fZwb_yoW8Zry8pF
	yrKasIgr4ft3WxKryDZw48Xas3W348J34aqF9Fyw1Ivan8Za4xX34a93s0vr17Kr97AF4U
	Za1UtFy5AFWDZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
	4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYwIDUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090750_441084_EFA93062 
X-CRM114-Status: GOOD (  10.87  )
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

This allows S-mode to bypass validation by modifying shared memory
contents between the two passes, potentially setting unauthorized SSE
event attributes in M-mode.

Fix this by snapshotting the shared memory data into a local buffer
and performing both validation and application against that snapshot.

Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Changes in v2:
- Added Fixes tag

 lib/sbi/sbi_sse.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 818afb87..94b333c5 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1064,25 +1064,27 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	unsigned long attr = 0, val;
 	uint32_t id, end_id = base_attr_id + attr_count;
 	unsigned long *attrs = (unsigned long *)input_phys;
+	unsigned long local_attrs[SBI_SSE_ATTR_MAX];
 
 	sbi_hart_protection_map_range(input_phys, sizeof(unsigned long) * attr_count);
 
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
