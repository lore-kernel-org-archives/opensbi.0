Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D69C61DD3
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5AqMXWgcofsQcKdkHocutqExXEmZiw5v8ug7pwFJS9k=; b=BkhzmTB2AqwUDr
	c0S3vvUZ+81ytYTUV8o65b8foR3WIBCrFoQ5uZ6tXMBLhfhp6qgIpXV5bQX8s2n2997P7FC2FFuHv
	JtPMZDKnEN8yJXx4mG4mLCW7XD07ObxKtsiKXPU3Iyde4y7+YDqMwh35cDR+KrgR7OKknAXYjIKtG
	2fzdTvteyXTg/ycDlmY0KhuDNJ++JvgTowdMkcpWYGKtQxkVKEJzC5LGR3XfPTeaP1mmTs5wtFPRo
	9OJYgFgnp3H1yeEF7Zr7BIY5NlxDOZH7vclgWAbLZqq8clgg7i9X8ytIF3X8RtS6+H5vlQqOzTu5r
	qeUo7AZvYhyVJM1Stjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11kP-00000009Mdd-2jWD;
	Mon, 31 Aug 2026 13:08:25 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11kM-00000009Mcy-2em2
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 13:08:24 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAn__LDfJVq1R7zBg--.3340S2;
	Mon, 31 Aug 2026 21:08:20 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH] lib: sbi_hsm: Validate state before updating start context
Date: Mon, 31 Aug 2026 21:08:17 +0800
Message-ID: <20260831130817.54625-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAn__LDfJVq1R7zBg--.3340S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF45Xr15WrWxWr1fury5XFb_yoW8ZFyxpr
	s7WF9IgrWvkryIv34fuan7W3Z0k3WSvw13uryDJrs2gFWqqa4rCrn5KFyxKF1DXF95t34U
	ur4qy347CF45ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbb_-PUUUU
	U==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_060823_048973_DC78AFEC 
X-CRM114-Status: UNSURE (   9.76  )
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

sbi_hsm_hart_start() acquires the target hart's start ticket, then
writes next_arg1, next_addr and next_mode before checking whether the
target is stopped.

A start request for a non-retentively suspended hart is rejected, but
those writes have already replaced the resume context consumed by
sbi_hsm_hart_resume_finish(). The same ordering also lets other rejected
start requests modify target scratch state.

Check the state immediately after acquiring the start ticket and before
updating the scratch context. The ticket serializes start requests for
the target; retain the cmpxchg as the publication barrier and defensive
state check.

Fixes: e8e9ed3790fe ("lib: sbi: Set the state of a hart to START_PENDING after the hart is ready")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 lib/sbi/sbi_hsm.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0a355f9c..af81e1c2 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -332,6 +332,12 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	if (!hsm_start_ticket_acquire(hdata))
 		return SBI_EINVAL;
 
+	hstate = atomic_read(&hdata->state);
+	if (hstate != SBI_HSM_STATE_STOPPED) {
+		rc = hstate == SBI_HSM_STATE_STARTED ? SBI_EALREADY : SBI_EINVAL;
+		goto err;
+	}
+
 	init_count = sbi_init_count(hartindex);
 	entry_count = sbi_entry_count(hartindex);
 
@@ -346,17 +352,8 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	 */
 	hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOPPED,
 				SBI_HSM_STATE_START_PENDING);
-	if (hstate == SBI_HSM_STATE_STARTED) {
-		rc = SBI_EALREADY;
-		goto err;
-	}
-
-	/**
-	 * if a hart is already transition to start or stop, another start call
-	 * is considered as invalid request.
-	 */
 	if (hstate != SBI_HSM_STATE_STOPPED) {
-		rc = SBI_EINVAL;
+		rc = hstate == SBI_HSM_STATE_STARTED ? SBI_EALREADY : SBI_EINVAL;
 		goto err;
 	}
 
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
