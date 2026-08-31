Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229FFC624A4
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uDgYEuYiDwA3e4GbXlWG062GGi5FCoRJ7b5HWPQ0kbs=; b=RMxHexe+CbAlxO
	kf0FKMgYRCn8cndA2HNmPPeW0mGiKGxu//CtzPOaUL7h4WQTPWr7emrNB/Dd3F43PzQdKlwmgRUnU
	06Jf4nUda9ZCCrUKtvOvRyGeB//ch0cLuKKqxgiW5P84F/ghNHHBfAFsGZITLv60lgSdrpjF5SvuC
	8VxAr3ywKNvLyUR+KqMtCUMMixQwZ8JB9YorQndW1atlxzZSQdoWILsOkJjDS5ZyzLx/ZqzyAEeNE
	i2bXx/udxTMnuLdza/nWqDNK0VsSPzE12ziB3NGAIBRV4jLJY15myhqRsHBiYa8ROKbYtfwF9OiWt
	giW1lQwuUZNCpzuT4TIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11iu-00000009MSt-0NNb;
	Mon, 31 Aug 2026 13:06:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11in-00000009MST-3odU
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 13:06:49 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPBjfJVqChvzBg--.19237S2;
	Mon, 31 Aug 2026 21:06:43 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] lib: sbi_timer: Restart events from the restart list
Date: Mon, 31 Aug 2026 21:06:41 +0800
Message-ID: <20260831130641.54100-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowACnfPBjfJVqChvzBg--.19237S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1DKF4fKFy7trW5Ar1kZrb_yoW8GFWfpF
	sxWF13Kr48Ar1Igw1rJ3WkGFykJayrXrsxGryfCr4Fyw4fA34xXFyDtF1jvFW3GFWDZrW7
	Z3W0vry5CrW3WaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbWCJPUUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_060648_332017_E58A0E35 
X-CRM114-Status: GOOD (  10.78  )
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

Timer callbacks can request that an expired event be restarted. Such
events are moved to a local restart_list, but the restart loop tests that
list while reading its first entry from tstate->event_list.

If the main event list is empty, the loop treats its list head as a timer
event. Otherwise it repeatedly removes and reinserts the wrong event
while restart_list remains nonempty, so timer processing cannot
complete.

No in-tree callback currently requests a restart, but the timer-event
callback interface exposes this path to OpenSBI library and platform
users.

Read the event from restart_list, matching the loop condition and the
list that owns the entry.

Fixes: b7fa8a246cba ("lib: sbi_timer: Add support for timer events")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 lib/sbi/sbi_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 8abb5e7b..ba60a4e5 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -324,7 +324,7 @@ void sbi_timer_process(void)
 	}
 
 	while (!sbi_list_empty(&restart_list)) {
-		ev = sbi_list_first_entry(&tstate->event_list, struct sbi_timer_event, head);
+		ev = sbi_list_first_entry(&restart_list, struct sbi_timer_event, head);
 		sbi_list_del(&ev->head);
 		__sbi_timer_event_start(tstate, ev, ev->time_stamp);
 	}
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
