Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEED6CDB479
	for <opensbi@archiver.kernel.org>; Wed, 24 Jun 2026 03:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HJWHLcqw07D01EEWjSj3J/2U3hfMzSR9mhgy9jrdOEI=; b=b+CT9qL/R1bG7b
	zEpapwmfxBuwG5K6DtpXcAa60xm+l4StoCjHENnE6w19M2mUSA0I5T8zgfSZrFdXqBFEAudiI0NqI
	Gy1ZJN2i/UaIw71cVqbBNxATXPCCe3NzpU0J0R8ct4Zswf0WyA7wUZeyw+4b4SwgmiUalDeycDcsa
	POrlFPav6d6hQK/H2iKUv0tG22I8XlMNQ2g0458vvFmy4leKNdHX85rJQAZJtAvWE6gHC+TD8edL+
	l64OOqQhl5XWawVjhMbqUU+2vZlMfqOdH8o69Nxdh6l9bDmFt4u6fhBpBFAjBDCDBYtDMFN5yIFLY
	nqZDi9Z2Xla5YBlJmOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcEdr-000000076Ns-3ctz;
	Wed, 24 Jun 2026 03:51:11 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcEdn-000000076NE-2Y4z
	for opensbi@lists.infradead.org;
	Wed, 24 Jun 2026 03:51:10 +0000
Received: from 3930813e24e9.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAnBp0YVDtq+KqqFQ--.9659S2;
	Wed, 24 Jun 2026 11:51:03 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH] lib: sbi_pmu: fix integer overflow in pmu_ctr_idx_validate and cfg_match skip path
Date: Wed, 24 Jun 2026 11:50:49 +0800
Message-Id: <20260624035049.1753003-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnBp0YVDtq+KqqFQ--.9659S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWfKr1rJFWUWFy7KFWkXrb_yoW8uF17pF
	4fGay3trWxt3s7ta1fZ34UXFy5Ga1vqa9xArW3Gry0yFySqF1rX3y5Kwn8Ar17uryrXFy2
	y3y7ZFnruF17ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbhSdDUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_205108_041943_140D1772 
X-CRM114-Status: GOOD (  10.20  )
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

pmu_ctr_idx_validate() checks whether counter indices are in range
using cbase + sbi_fls(cmask) < total_ctrs.  Both operands are unsigned
long, so a crafted cbase close to ULONG_MAX causes the addition to wrap
around to a small value that passes the comparison.

Once validation is bypassed, sbi_pmu_ctr_cfg_match() with the
SKIP_MATCH flag uses the overflowed index directly as an array subscript
into phs->active_events[], producing an out-of-bounds read in M-mode.
Through the firmware-event code path, the same overflowed index reaches
fw_counters_data[] and fw_counters_started, giving an attacker OOB
write-zero and OOB bit-set primitives in M-mode memory.

Fix pmu_ctr_idx_validate() by checking for unsigned overflow before the
comparison, and add a secondary bounds check on cidx_first in the
SKIP_MATCH path so that even if validation is somehow bypassed in the
future, the array access remains bounded.

Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 lib/sbi/sbi_pmu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 480a9723..1b3e7c9a 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -224,8 +224,16 @@ static int pmu_ctr_validate(struct sbi_pmu_hart_state *phs,

 static bool pmu_ctr_idx_validate(unsigned long cbase, unsigned long cmask)
 {
-	/* Do a basic sanity check of counter base & mask */
-	return cmask && cbase + sbi_fls(cmask) < total_ctrs;
+	unsigned long last;
+
+	if (!cmask)
+		return false;
+
+	last = sbi_fls(cmask);
+	if (cbase > ULONG_MAX - last)
+		return false;
+
+	return (cbase + last) < total_ctrs;
 }

 int sbi_pmu_ctr_fw_read(unsigned long cidx, uint64_t *cval, bool high_bits)
@@ -916,6 +924,9 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 		unsigned long cidx_first = cidx_base + sbi_ffs(cidx_mask);

+		if (cidx_first >= total_ctrs)
+			return SBI_EINVAL;
+
 		if (phs->active_events[cidx_first] == SBI_PMU_EVENT_IDX_INVALID)
 			return SBI_EINVAL;
 		ctr_idx = cidx_first;
--
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
