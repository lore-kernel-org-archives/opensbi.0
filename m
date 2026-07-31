Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001C1C55176
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmiI2ALR94yqicf3jmJUETPdbRP/DUO8pvRcooVBvA8=; b=KN2KMpvmisnTTR
	UWXbMLImqZ6rpUaShEx5ssFq24t/c6qLQ9Dcj87Cgc6gIsF/WbpMsVVdF2+rAj7sSMrbMCB7Rzj5x
	0jkQ0r6wwK2rS6ycTNGXK00QB1I0QvOFupR0Hpgsfb9QCMOFKVFRi1K3VD9hk4ETVBymrXbUtb+ja
	CRhwMgsrErnQALPEJeJCInpyn3oB14zc2NNndUyA8Enne7jNTRT1Ao9ZVhi0EBxfij9k7cNSo+dxk
	wkhjZyaTi/yKfIs3YgN9gjg9sfEy/tMyZuA6ZBWcu4D+I6a31EqKMzJ20WGDq5Vs9Zlq6bYqofR8s
	48VCW6jGhR1kz9xquGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZT-0000000CKN2-2y0j;
	Fri, 31 Jul 2026 10:34:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZS-0000000CKLm-3kh2
	for opensbi@bombadil.infradead.org;
	Fri, 31 Jul 2026 10:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z1lEbK/vaYmcFj0Dz/+hdp+wg/fUqPW8R6IaQmz2PG0=; b=ajtfLDk1wzH3LUYDAOizLbnXSs
	fQLdmHAeW+bj1mwjyXWqzYwTcIP0XkW+cjua4BM9gH9mSrLRmbi9l36o02cfcOufxWODaiK5CxokQ
	ISoW2S7aD72+AQ9o4flcoqq2uSGrsq1mOaxAirFcemaCbjL6KJm3dWLiQqKcb7BVtr/3l4z7DmWfa
	TmyhMmvzzKn3LQx9OqPVChKu2I9pY4E+t8pZbFkS7V3xGacVCDskoKuT87fLyuTQP4Vhe7F3qLtkP
	3eNu5DaLesOpCwlfq9dFMpVzDmjwz6OwZcn8BeReOwwBoUPWGhXdw2VxaRc+PcRgnR2lN8vMo4fxO
	xjgdKs/g==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpkZM-00000007Nu6-2ZIN
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 10:34:29 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADXq+8nemxqJmmDAg--.64576S7;
	Fri, 31 Jul 2026 18:34:16 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Rahul Pathak <rahul@summations.net>,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2 5/6] lib: sbi_sse: fix shared memory double-fetch in sse_write_attrs
Date: Fri, 31 Jul 2026 10:34:04 +0000
Message-Id: <20260731103405.1535818-6-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731103405.1535818-1-liutong@iscas.ac.cn>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXq+8nemxqJmmDAg--.64576S7
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4fWF18tw45Zr4ktF1fZwb_yoW8ZFWxpF
	yrKasIgr4ft3WxKryDZw48Xa4fW348J343WF9Fyr1Ivan8Aa4xX34ak3s0vrW7Kr97AF4U
	Za1UtFy5AFWDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
	owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjaFAJUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_113425_224645_65B11E3B 
X-CRM114-Status: GOOD (  10.65  )
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

Previously sent as [PATCH v2].
Changes in v2:
- Added Fixes tag
- Consolidated into patch series

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
