Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08894C624A4
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 13:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SLcDh+hWwFwAkC2fEltBcuzvrYDBKLW8rmvwA3ivyQM=; b=KAEXWYIuz0lFQB
	ka3IVRbCCsGCgKsmfFJJjjYfBLm8zoSI5V5b7KBLUuOsmgUA80KwY7JIMZdiQhrbVgijzFo1EltBp
	cp+C2jkV0SSAo9VlWGfJhPt5MCWF84+utNfOPKCbYs5vhRmPFzIeLXwMCjgwiEoVUKQAGEkumHLh+
	JSmBG1sOlizKRkOkN09E97ktTxyeODgZFPYp+8+veN9k4CSgTrHJsp5X0/5RSOcCcweKmbpS/M7nm
	NPHF902azpwQMnXu3a4lrZ9dZSuhg1MNk7UmhTmcq6zdN8+fDCrLmFdU655L0rS/2ljXdq4NvQghi
	+tDG76zKBqSDKqVjnCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11h1-00000009MJP-3Va6;
	Mon, 31 Aug 2026 13:04:55 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11gy-00000009MIQ-1SJi
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 13:04:55 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowABnOe3ve5VqgxbzBg--.20645S2;
	Mon, 31 Aug 2026 21:04:47 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Subrahmanya Lingappa <slingappa@ventanamicro.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] lib: utils/mailbox: Reject invalid RPMI queue indices
Date: Mon, 31 Aug 2026 21:04:44 +0800
Message-ID: <20260831130444.53629-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnOe3ve5VqgxbzBg--.20645S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urW7GFykGF4xur13ZF18Krg_yoW8WFWrpF
	4rG3s2q3y0qFW7Was8tw4Fq3Z7ur1kWry3J3s3G34rAwsIqr90vw17Ja4Yqry8XFyvyw4j
	v397u397C3WDXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_060452_750232_1F2BFB37 
X-CRM114-Status: GOOD (  10.37  )
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

The RPMI shared-memory helpers validate a queue index before using it
to select queue_ctx_tbl, but the current comparison accepts queue_id
equal to queue_count.

Only entries 0 through queue_count - 1 are initialized from the device
tree. Accepting queue_count can therefore use an uninitialized queue
context when a protocol operation selects a queue omitted by the
description.

Reject queue_id greater than or equal to queue_count in both transfer
directions.

Fixes: 91f46fb47eef ("lib/utils: Add RPMI messaging protocol and shared memory transport support")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index 521e0673..c9b2c6ef 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -313,7 +313,7 @@ static int smq_rx(struct rpmi_shmem_mbox_controller *mctl,
 	int ret, rxretry = 0;
 	struct smq_queue_ctx *qctx;
 
-	if (mctl->queue_count < queue_id) {
+	if (queue_id >= mctl->queue_count) {
 		sbi_printf("%s: invalid queue_id or service_group_id\n",
 			   __func__);
 		return SBI_EINVAL;
@@ -348,7 +348,7 @@ static int smq_tx(struct rpmi_shmem_mbox_controller *mctl,
 	int ret, txretry = 0;
 	struct smq_queue_ctx *qctx;
 
-	if (mctl->queue_count < queue_id) {
+	if (queue_id >= mctl->queue_count) {
 		sbi_printf("%s: invalid queue_id or service_group_id\n",
 			   __func__);
 		return SBI_EINVAL;
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
