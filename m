Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F98C55162
	for <opensbi@archiver.kernel.org>; Thu, 30 Jul 2026 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4jo1OK5Tb9XTJ1Cl8X2gQ+EqBEBUHAKmtQKvvXWl08=; b=muwVpIZW5iZG5B
	4N6D1DG3Xp7BHoYI37eRV2kQHpCetN1W+VEu7MJ9M0cYpMivqSkz+m/H1DoD+fIBco01T0r3YWGIN
	1tNQrXr9TC1gymzj5zQVBOkhcLkdPPlSbAWprRXgotcFp4XtKKgo7cwjUR08gK0am+ONOZrlL/cTy
	7qsOiOPuDDB1PKmyVSB5qTcIhJ7lJ680+hR6JBYUD6PoKJQhy/+Y8qIQIT3DADqt6K4cQaVmedCxm
	0zb2/NEpQbzXf33NSK2DJGHJ1JHGbZ8GbxtbbevYLIpHll+nBGeeBb7SLFYX8OM0lH273aEgTIwld
	tOTO0eqa8Xtivjsjsa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTRZ-0000000AyMA-3xOG;
	Thu, 30 Jul 2026 16:17:13 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTRW-0000000AyKw-44Jx
	for opensbi@lists.infradead.org;
	Thu, 30 Jul 2026 16:17:12 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABnlkADeWtqD+5WAg--.50738S2;
	Fri, 31 Jul 2026 00:17:07 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2] lib: sbi_dbtr: use range check for shared memory domain validation
Date: Thu, 30 Jul 2026 16:16:57 +0000
Message-Id: <20260730161657.1331396-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706065303.2871739-1-liutong@iscas.ac.cn>
References: <20260706065303.2871739-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABnlkADeWtqD+5WAg--.50738S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1xWF4Uury7Cr4rJw15twb_yoW8WFWxpr
	4kWF17tw4Iqr9FvFZrK3ZYqFy0kw48Aa1UK398CFnYy3Z8Zw1xCryYgw1q9w1xAF95Ja1j
	kF18AFZruF43ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb4v3UUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_091711_640314_AF37CF61 
X-CRM114-Status: UNSURE (   8.74  )
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
address.

If the shared memory region spans a domain boundary, accesses beyond
the first byte could violate domain isolation, allowing S-mode to
read or write M-mode memory through DBTR operations.

Replace the single-address check with sbi_domain_check_addr_range()
to validate the entire shared memory region that DBTR operations
will use.

Fixes: 23b7badeee3c ("lib: sbi: check incoming dbtr shmem address")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Changes in v2:
- Added Fixes tag

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
