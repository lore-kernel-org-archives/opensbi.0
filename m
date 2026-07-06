Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF8CC43458
	for <opensbi@archiver.kernel.org>; Mon,  6 Jul 2026 06:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t3El8PLFK/Jf/tG4PyYrHhAgBPHGuDunPx2pMYhhuJY=; b=Kj4r3AurxPcgqt
	MoE4UiJsCNjukvzd2usp64n+FYWCbwuRESvKYiU2GJPkuQs7/KJjlim8vXDH50LMsQ5vyC5jR2rCS
	fKDu0P3AYKd5OHEWx1IQAPiaLyWp58TNUtktEc/tbzviPBzwT6ZSKPHxhXOuWEBdlbxLz4xac1o9D
	j/bJx3E2SJZkNOaKyOF06SUokE1I4xM7upiJFX9+bV5mxEH1Z2oxLOy/LwF+Y/HtJhcZq9+XVk/NI
	/7uEJeYFWYYiOr8L6NacooHmlL1yi29LFWtNfqSfrIHh+Gcb4FRTjKjb6TVpgiFraXMntLZFzzgCB
	uxOEKdXAygMBF0Yq02vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdCe-0000000BfKh-0x9z;
	Mon, 06 Jul 2026 06:53:16 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdCb-0000000BfIy-12R0
	for opensbi@lists.infradead.org;
	Mon, 06 Jul 2026 06:53:14 +0000
Received: from 3930813e24e9.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAXudHRUEtqOAXtBA--.34052S2;
	Mon, 06 Jul 2026 14:53:09 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH] lib: sbi_dbtr: use range check for shared memory domain validation
Date: Mon,  6 Jul 2026 14:53:03 +0800
Message-Id: <20260706065303.2871739-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAXudHRUEtqOAXtBA--.34052S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1xWF4Uur45ArWrCryxuFg_yoW8Xrykpr
	4kWF17Xw4Iqr9FyrZrK3Z5Xa40kr48Za1UK398CFnYy3WDZw1xCrWYgw1qgw1xAF95J3Wj
	kF18AFZruF43ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYKZXUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_235313_656582_AF8D5868 
X-CRM114-Status: UNSURE (   7.99  )
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

sbi_dbtr_setup_shmem() validates the shared memory address using
sbi_domain_check_addr(), which only checks a single address. However,
subsequent DBTR operations (install, read, update) access up to
total_trigs * sizeof(sbi_dbtr_shmem_entry) bytes starting from that
address. If the shared memory region spans a domain boundary, accesses
beyond the first byte could violate domain isolation.

Replace the single-address check with sbi_domain_check_addr_range() to
validate the entire shared memory region that DBTR operations will use.

Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 lib/sbi/sbi_dbtr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01047969..983f0f6a 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -304,9 +304,10 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 	if (shmem_phys_hi)
 		return SBI_EINVALID_ADDR;
 
-	if (dom && !sbi_domain_check_addr(dom,
-		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
-		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+	if (dom && !sbi_domain_check_addr_range(dom,
+		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo),
+		  hart_state->total_trigs * sizeof(union sbi_dbtr_shmem_entry),
+		  smode, SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	hart_state->shmem.phys_lo = shmem_phys_lo;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
