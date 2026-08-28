Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EF9C61DBD
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yd7P91pus2XtXTdAhOvmkEjDplhLHuzk2CwSQg2+h6U=; b=XCasUDAiz2lv2G
	fafqdGNtRacSyEJHhVMrPWDVD+00vfzhYeOKeBROVi7BZ+u+NlRwS2xWNmucT+1WqpbUVfgsOZtb7
	1+Ey8Kt6ZCjDCRtLsqpi5VqACB+lmpzrvml5vUZ2+Pz84ZglTzR/KFiXHTnG/PXl7DvXOXYPS+bkl
	a5iVoReItl4N6OE2jQtQ9zjtPDLuzuyJEDE25MlwH35C7PWFhoWVZPaJgtHsgQdxaVEFpYK2TkSaU
	8Rf1UnvQ1H9jSFaMohn1K3VHMieG3UnJGJpwp4mhIVbDmNj2GVt7sc5/bLwBIu9MSq3E5VmHLO189
	zIZ/K2PnvWLH5znQyQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxWK-00000005ye5-2nSG;
	Fri, 28 Aug 2026 14:25:28 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxWH-00000005yd5-3cOY
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 14:25:27 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowADnvPBTmpFqcGnABg--.42912S2;
	Fri, 28 Aug 2026 22:25:23 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Subrahmanya Lingappa <slingappa@ventanamicro.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] lib: utils/mailbox: reject undersized RPMI shmem queues
Date: Fri, 28 Aug 2026 22:25:01 +0800
Message-ID: <20260828142521.14267-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnvPBTmpFqcGnABg--.42912S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF13XF1UtF13Jr47GF4kWFg_yoW5GryrpF
	45G34Sq348XFZxWFyktrs5ZwsrAF9YqFWYgr9ayry8Wws2qry5tFWYy34jqryrKFWkAw4U
	Z39YvrZ5GwsFvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUIfO7UUU
	UU=
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_072526_269585_AC8DE285 
X-CRM114-Status: GOOD (  10.25  )
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

The RPMI shared-memory mailbox transport derives qctx->num_slots from the
device-tree queue window size and the riscv,slot-size property. The current
initialization only checks that the queue window is nonzero before
subtracting the two RPMI header slots.

Reject queue windows that cannot provide the two header slots plus at least
two data ring slots. A zero data-slot count would later be used as a modulo
divisor, and a one-slot ring is also unusable with the current full/empty
convention because one empty slot is reserved to distinguish the two
states.

Also reject data-slot counts that cannot be represented by qctx->num_slots.

Fixes: 91f46fb47eef ("lib/utils: Add RPMI messaging protocol and shared memory transport support")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index 521e0673..4457617a 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -589,6 +589,7 @@ static int rpmi_shmem_transport_init(struct rpmi_shmem_mbox_controller *mctl,
 	const fdt32_t *prop;
 	int count, len, ret, qid;
 	uint64_t reg_addr, reg_size;
+	u64 total_slots;
 	struct smq_queue_ctx *qctx;
 
 	ret = fdt_node_check_compatible(fdt, nodeoff,
@@ -638,6 +639,14 @@ static int rpmi_shmem_transport_init(struct rpmi_shmem_mbox_controller *mctl,
 		if (ret < 0 || !reg_addr || !reg_size)
 			return SBI_ENOENT;
 
+		/* calculate number of slots in each queue */
+		total_slots = reg_size / mctl->slot_size;
+		if (total_slots < RPMI_QUEUE_HEADER_SLOTS + 2 ||
+		    total_slots - RPMI_QUEUE_HEADER_SLOTS > (u32)-1)
+			return SBI_EINVAL;
+
+		qctx->num_slots = total_slots - RPMI_QUEUE_HEADER_SLOTS;
+
 		ret = sbi_domain_root_add_memrange(reg_addr, reg_size, reg_size,
 						   (SBI_DOMAIN_MEMREGION_MMIO |
 						    SBI_DOMAIN_MEMREGION_M_READABLE |
@@ -645,10 +654,6 @@ static int rpmi_shmem_transport_init(struct rpmi_shmem_mbox_controller *mctl,
 		if (ret)
 			return ret;
 
-		/* calculate number of slots in each queue */
-		qctx->num_slots =
-			(reg_size - (mctl->slot_size * RPMI_QUEUE_HEADER_SLOTS)) / mctl->slot_size;
-
 		/* setup queue pointers */
 		qctx->headptr = ((void *)(unsigned long)reg_addr) +
 				RPMI_QUEUE_HEAD_SLOT * mctl->slot_size;

base-commit: 4e79fd7de59f1b2899092c1a84ce68c8ebc68f93
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
