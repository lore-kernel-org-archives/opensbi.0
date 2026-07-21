Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D09C44532
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T4gTqLzqe+Zb/pTKt7h1bBFxx6g7dJoumDTWzvDNrGo=; b=GZ4Cm8suEdqMyE
	w+tC+d8QoCdLT/XoG449fb0XBiLMRqXz7BmU1OoyKhmuf+dwS3vfLL5/nd28LZjbJmWKAo/gr4v3Z
	+c/A5aewhDqsUxvD8R0Pp+P3Ccj541ipajXSt9BBtEYqrAb0WKsPCWAGdcttfnKINDv6yt+HQiEQc
	sS4pCWVAyQT+aIqEhAGtcGHa7Uj9HXffbHsKX0ncODe1eFntSxGJopy3bGi1CpeggVIeBO1VGx1Ob
	YPTsOx5IGO8ihoSG/F+Alrd/mEegD51NUwQi87i+vuF+A9IusxD1wVx63Lmwd0GUfvW0s78h/81pS
	6kmQKz5tlNkWpFLiDoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC5k-00000009kWG-127n;
	Tue, 21 Jul 2026 15:09:08 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC5g-00000009kU1-2xHM
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 15:09:07 +0000
Received: from localhost (unknown [122.194.100.180])
	by APP-01 (Coremail) with SMTP id qwCowABHHPCKi19qVw3UAA--.31194S2;
	Tue, 21 Jul 2026 23:08:59 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Xiang W <wangxiang@iscas.ac.cn>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH] platform: generic: sophgo: Move SG2042 timer memregion workaround
Date: Tue, 21 Jul 2026 23:08:44 +0800
Message-ID: <20260721150844.741606-1-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: qwCowABHHPCKi19qVw3UAA--.31194S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4kWw45ZryrCFy8uFW8Crg_yoW8Kr4Dp3
	yrKFsxKr1ktr47Jw4rJF1DXr43Aws5Ka1UtF4kXw4fZ3WkAr1Dt3yYyr1SvFs3GFWkua1Y
	vryxCr4fCFWavaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUUUUU
X-Originating-IP: [122.194.100.180]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_080905_115560_5C1EBA2D 
X-CRM114-Status: UNSURE (   9.28  )
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

Commit 4813a2042096 ("lib: sbi_init: Call hart init and timer init
before platform early init") reordered the cold/warm boot sequence so
that sbi_timer_init() runs before sbi_platform_early_init().

The SG2042 platform workaround that merges the 16 separate timer
regions into a single domain memregion was previously performed in
early_init().  After the reordering the MTIMER driver therefore adds
the individual regions first, defeating the purpose of the combined
region (and wasting PMP entries).

Move the addition of the combined memregion into extensions_init(),
which is invoked from sbi_hart_init() and consequently still executes
before sbi_timer_init().

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 platform/generic/sophgo/sg2042.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
index ac8840e8..81b28376 100644
--- a/platform/generic/sophgo/sg2042.c
+++ b/platform/generic/sophgo/sg2042.c
@@ -31,21 +31,6 @@ static int sophgo_sg2042_early_init(bool cold_boot)
 
 	thead_register_tlb_flush_trap_handler();
 
-	/*
-	 * Sophgo sg2042 soc use separate 16 timers while initiating,
-	 * merge them as a single domain to avoid wasting.
-	 */
-	if (cold_boot)
-		return sbi_domain_root_add_memrange(
-					(ulong)SOPHGO_SG2042_TIMER_BASE,
-					SOPHGO_SG2042_TIMER_SIZE *
-					SOPHGO_SG2042_TIMER_NUM,
-					MTIMER_REGION_ALIGN,
-					(SBI_DOMAIN_MEMREGION_MMIO |
-					 SBI_DOMAIN_MEMREGION_M_READABLE |
-					 SBI_DOMAIN_MEMREGION_M_WRITABLE));
-
-
 	return 0;
 }
 
@@ -57,6 +42,23 @@ static int sophgo_sg2042_extensions_init(bool cold_boot)
 	if (rc)
 		return rc;
 
+	/*
+	 * SG2042 has 16 separate timers. Add one combined region before the
+	 * MTIMER driver adds the individual regions.
+	 */
+	if (cold_boot) {
+		rc = sbi_domain_root_add_memrange(
+				(ulong)SOPHGO_SG2042_TIMER_BASE,
+				SOPHGO_SG2042_TIMER_SIZE *
+				SOPHGO_SG2042_TIMER_NUM,
+				MTIMER_REGION_ALIGN,
+				(SBI_DOMAIN_MEMREGION_MMIO |
+				 SBI_DOMAIN_MEMREGION_M_READABLE |
+				 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+	}
+
 	thead_c9xx_register_pmu_device();
 	return 0;
 }
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
