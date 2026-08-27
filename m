Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070F6C61DC6
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MKzOQrIdmtco2BRsLoUuo3iYAuQNNtcwd0C6G7EhEHo=; b=r7oFLCpwfhYd5Y
	k3akYoCUgjnjFi9NdSdTc6cEIx0cNe60AtEzguxfaI0vI3El6w/FzTL2Kq49eamnyw/AOG7joyoyl
	rK7dCkzv1xmGjziyYsyNhdIzFTjQGzDyInI6lqj11BWiYwqRcGmBnepoDNVOBqDLecBNCW08S6p0Y
	z6pJKY2cizCQ61qrp1n4xcqolyDVU7ZNE2j8iz/CT8yQFZoSv2GDX6Sk+8azWoOPcQi1NstLghUra
	AXVoXKyOrQFYS+RG5HNrWsNumEQICLadE7FZqAVT9ijcVWzufYQ6CD4kcXgpymG1y8xKLFgEmpQQ7
	leBF5j/EA+kqfLqPL3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYki-00000003v83-100m;
	Thu, 27 Aug 2026 11:58:40 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYke-00000003v7a-2k6D
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 11:58:38 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowAA3pT9qJpBqPpDJBg--.64046S2;
	Thu, 27 Aug 2026 19:58:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] lib: sbi: dbtr: validate complete shared memory range
Date: Thu, 27 Aug 2026 19:58:33 +0800
Message-ID: <20260827115833.50735-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3pT9qJpBqPpDJBg--.64046S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1DWrWrGr1UtF15JrWUJwb_yoW5GryrpF
	n7WF1xtr42qr9Fyr92y3WrXryYkrW8AayUK3sxCFnay3WkZr10kr4ag3Wq9a4fZFy8Xa4j
	va18KFWDCa1YvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb3rc3UUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_045837_178075_AD93137A 
X-CRM114-Status: UNSURE (   9.21  )
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

The DBTR shared memory contains total_trigs entries, but setup currently
checks domain access for only its first byte.  A supervisor can place that
base near a domain boundary so later entries extend into inaccessible or
M-mode-only memory.

Validate the complete specification-defined shared-memory extent with
sbi_domain_check_addr_range().  Also reject an install count prohibited by
the DBTR specification before mapping or reading that many entries.

This patch intentionally does not alter sbi_dbtr_read_trig().  Its equality
predicate follows the current DBTR error table even though the surrounding
half-open-range prose is inconsistent; that specification issue is a
separate decision.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Base-commit: 4e79fd7de59f1b2899092c1a84ce68c8ebc68f93

 lib/sbi/sbi_dbtr.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 0104796..41d5e6f 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -263,6 +263,7 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 			 unsigned long shmem_phys_lo,
 			 unsigned long shmem_phys_hi)
 {
+	unsigned long shmem_addr, shmem_size;
 	struct sbi_dbtr_hart_triggers_state *hart_state;
 
 	if (dom && !sbi_domain_is_assigned_hart(dom, current_hartindex())) {
@@ -304,9 +305,13 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 	if (shmem_phys_hi)
 		return SBI_EINVALID_ADDR;
 
-	if (dom && !sbi_domain_check_addr(dom,
-		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
-		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+	shmem_addr = DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo);
+	shmem_size = hart_state->total_trigs *
+		     sizeof(union sbi_dbtr_shmem_entry);
+	if (dom && !sbi_domain_check_addr_range(dom, shmem_addr, shmem_size,
+						smode,
+						SBI_DOMAIN_READ |
+						SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	hart_state->shmem.phys_lo = shmem_phys_lo;
@@ -619,6 +624,9 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
 
+	if (trig_count >= hs->total_trigs)
+		return SBI_ERR_BAD_RANGE;
+
 	shmem_base = hart_shmem_base(hs);
 	sbi_hart_protection_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
