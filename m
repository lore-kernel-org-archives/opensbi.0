Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CD5C55164
	for <opensbi@archiver.kernel.org>; Thu, 30 Jul 2026 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3uKH6CjHWeXCPYl4S8Ub29gRda3R/BWnqppAu3ohKE=; b=LBceQ3XaKbeRYl
	QWxraqbH4X8+QaloMQUAsJsTqEmFGko7tA2MfnO+6kKI69Scyz77n5rgoniy4c/6u9OtmAAC6U0U7
	xdyY8NgOrO2nI9kf/YdzbyPuz2mYRfgbMhfJPCKGv6gDrsGP+NlD10+R6t7x1l6Rl+C2lchMda5OX
	1md1oQocJon1ciupqP4OUJYotLdUSTAod8qpODOGXx7JXt3pyYApffO+c0BcYH0yo8cjaUZkR7d/y
	hMaKsaFpOgPdiwHO6IumaS9CUpnKVWVZU3hKCa+RGPQuTYla1a1QRdKrlhwvkLwHT9W+YXmur76HZ
	hCx4BANiszHSI+D5503A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTE0-0000000AvXh-15pZ;
	Thu, 30 Jul 2026 16:03:12 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTDv-0000000AvWe-3wgO
	for opensbi@lists.infradead.org;
	Thu, 30 Jul 2026 16:03:10 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABnlkC2dWtqkqxWAg--.50580S2;
	Fri, 31 Jul 2026 00:03:02 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2] lib: sbi_pmu: fix integer overflow and zero-address in event_get_info
Date: Thu, 30 Jul 2026 16:02:52 +0000
Message-Id: <20260730160252.1325335-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260628090421.188161-1-liutong@iscas.ac.cn>
References: <20260628090421.188161-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABnlkC2dWtqkqxWAg--.50580S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWrJF1kKrWkXw48Zr17Awb_yoW8Zw1xpF
	4rKasxtrW0q342gasrZw1rXa4rJa18G3WDKFW7tryFyF43WF18ZF4qq3sIyr45ArykZFy2
	yayjyF4jka45ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
	4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYDGYDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090308_362105_94F6DCB8 
X-CRM114-Status: GOOD (  10.61  )
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

sbi_pmu_event_get_info() computes the shared memory size as
num_events * sizeof(struct sbi_pmu_event_info) without checking for
integer overflow. A sufficiently large num_events causes the product to
wrap around, making the domain check pass on a truncated size while the
loop iterates with the original count.

This allows S-mode to trigger out-of-bounds writes in M-mode memory.
A zero physical address is also not rejected, which would cause M-mode
to write to address 0 and hang the hart.

Add bounds checking on num_events before the multiplication and reject
zero shmem addresses early.

Fixes: e4345842168b ("lib: sbi_pmu: Implement SBI PMU event info function")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Changes in v2:
- Added Fixes tag

 lib/sbi/sbi_pmu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a0f6d2fa..3a2321cc 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1061,7 +1061,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys_hi,
 			   unsigned long num_events, unsigned long flags)
 {
-	unsigned long shmem_size = num_events * sizeof(struct sbi_pmu_event_info);
+	unsigned long shmem_size;
 	int i, j, event_type;
 	struct sbi_pmu_event_info *einfo;
 	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
@@ -1076,6 +1076,14 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 	if (!num_events || (shmem_phys_lo & 0xF))
 		return SBI_ERR_INVALID_PARAM;
 
+	if (!shmem_phys_lo)
+		return SBI_ERR_INVALID_ADDRESS;
+
+	if (num_events > ((unsigned long)-1) / sizeof(struct sbi_pmu_event_info))
+		return SBI_ERR_INVALID_PARAM;
+
+	shmem_size = num_events * sizeof(struct sbi_pmu_event_info);
+
 	/*
 	 * On RV32, the M-mode can only access the first 4GB of
 	 * the physical address space because M-mode does not have
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
