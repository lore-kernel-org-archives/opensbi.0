Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6B8C43458
	for <opensbi@archiver.kernel.org>; Sun, 28 Jun 2026 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=arqsIQLzLxBFPY4PIE6zbkD3AiCa9g22qm/XRaHQa74=; b=xTjLWN8DFcY3gH
	xPVh8X4HoCkUoAg3HFsIfzsEafz64LHjHICRZlUccyx5Rc3boCJ/wBeo7dj62P0BtbYLP1EKuDfoP
	roi+5sm0mJPJJpD8PwYwPQiWLSrKwPv/5B15/l9s2NQ8XkoxeMZNTC7NWDhXdb89QCqA5x1Szikuv
	O05ayz9x5BqoFvXlhUjs+9yLYCJorQz/yJz1GDt46ESan3DE/R77QEPYEaspM1MOjsvIA104ri4jU
	T5n7j7hNUChY3rVBO2XjuyCiLyp+CRKRgXISaEu/rNWzHLbO/Kadjni9zPrh49IGQ10nuOsiH6cmi
	RxLpK3eNIelWurbTIQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdlRL-0000000D0In-3t7X;
	Sun, 28 Jun 2026 09:04:35 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdlRH-0000000D0IM-3yJs
	for opensbi@lists.infradead.org;
	Sun, 28 Jun 2026 09:04:34 +0000
Received: from 3930813e24e9.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACnuM+T40BqrBkoFg--.16325S2;
	Sun, 28 Jun 2026 17:04:26 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH] lib: sbi_pmu: fix integer overflow and zero-address in event_get_info
Date: Sun, 28 Jun 2026 17:04:21 +0800
Message-Id: <20260628090421.188161-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowACnuM+T40BqrBkoFg--.16325S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWrJF1kKrWkXr13WFW3KFg_yoW8uw1UpF
	4rKa45tr48t342ga93Zw1rXa4rGa1rW3WDKFW7tryFyF4rWr1xZF4qy34YyrWfAryku3W2
	y3yjyF4jkas8XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
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
X-CRM114-CacheID: sfid-20260628_020432_419799_8F7D2A57 
X-CRM114-Status: GOOD (  10.49  )
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
integer overflow. A sufficiently large num_events causes the product
to wrap around, making the domain check pass on a truncated size while
the loop iterates with the original count.

Also reject a zero physical address for the shared memory, which would
cause M-mode to write to address 0 and hang the hart.

Add bounds checking on num_events before the multiplication and reject
zero shmem addresses early.

Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 lib/sbi/sbi_pmu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 480a9723..f7fe79d4 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1050,7 +1050,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys_hi,
 			   unsigned long num_events, unsigned long flags)
 {
-	unsigned long shmem_size = num_events * sizeof(struct sbi_pmu_event_info);
+	unsigned long shmem_size;
 	int i, j, event_type;
 	struct sbi_pmu_event_info *einfo;
 	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
@@ -1065,6 +1065,21 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 	if (!num_events || (shmem_phys_lo & 0xF))
 		return SBI_ERR_INVALID_PARAM;
 
+	/* Reject zero physical address to avoid M-mode writing to address 0 */
+	if (!shmem_phys_lo)
+		return SBI_ERR_INVALID_ADDRESS;
+
+	/*
+	 * Bound num_events to prevent integer overflow in the
+	 * shmem_size computation below. The division ensures
+	 * num_events * sizeof(struct sbi_pmu_event_info) fits in
+	 * an unsigned long.
+	 */
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
