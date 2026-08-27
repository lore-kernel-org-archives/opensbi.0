Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E594C61DC2
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 11:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8N7gQj+inNd9Ob24FhnFxh83webqn2pJ5O3T0jxGurc=; b=fPo0MsBvmjUNrp
	RE4+m8YtWT8wAuXZtA2jsP2s9piF/fxGZnupd301oMYrHyD5dxYtnd2jgGze5hqWxu+E0eqmokCJ9
	dVvB+3VygckJ7475oj5Fkm4htGWeb5FgIt1i+7KVV/phyPehz8uSWvfw+G6swCyfgnc9wJUsLaOa8
	fgzN1uCou3IOY2APrptQswY2JWbqYcDGp7OLilz7IV+e5LG3tV6xVmMcovKGC9RzodIlgWqH6HTzR
	sr1etRvCtErispHUJAWABVMlNWklfTXeQXMQCcxJNeZY6lPBloJKr3NocUn4FOCZk1G/fxRQst5SQ
	3NYysN3cJAkbH7cgiLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYjT-00000003uxZ-3Wfv;
	Thu, 27 Aug 2026 11:57:23 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYjR-00000003uxB-0r9B
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 11:57:22 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowAAHKkMeJpBqm4zJBg--.61346S2;
	Thu, 27 Aug 2026 19:57:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] lib: sbi: reject PMU skip-match counter class mismatches
Date: Thu, 27 Aug 2026 19:57:18 +0800
Message-ID: <20260827115718.50124-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAHKkMeJpBqm4zJBg--.61346S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw17Jw1fJrWkGrW7uFyrCrg_yoW8XrWDpF
	4xKa43Kw4kK3s2yFnxXay5Xry5C3WrKa9xCF9rCr1vyFWSvF1rX345Grn8GrsrGrW8Gry2
	va1UKa47uFZ8ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20260827_045721_614661_0D9AD677 
X-CRM114-Status: UNSURE (   6.96  )
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

SKIP_MATCH selects the first counter in the caller-provided set, but the
current path checks only that the index exists and is active.  A supervisor
can select an active hardware counter for a firmware event.  CLEAR_VALUE or
AUTO_START then indexes firmware-counter state with
ctr_idx - num_hw_ctrs, which underflows.  The inverse mismatch sends a
firmware-counter index to hardware-counter operations.

Reject the selected counter when its hardware/firmware class cannot monitor
the requested event.  Return SBI_ENOTSUPP, matching the PMU specification's
case where the selected counter cannot monitor that event.

Fixes: 13d40f21d588 ("lib: sbi: Add PMU support")

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Base-commit: 4e79fd7de59f1b2899092c1a84ce68c8ebc68f93

 lib/sbi/sbi_pmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a0f6d2f..040db61 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -926,6 +926,12 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 		if (cidx_first >= total_ctrs)
 			return SBI_EINVAL;
 
+		if ((event_type == SBI_PMU_EVENT_TYPE_FW &&
+		     cidx_first < num_hw_ctrs) ||
+		    (event_type != SBI_PMU_EVENT_TYPE_FW &&
+		     cidx_first >= num_hw_ctrs))
+			return SBI_ENOTSUPP;
+
 		if (phs->active_events[cidx_first] == SBI_PMU_EVENT_IDX_INVALID)
 			return SBI_EINVAL;
 		ctr_idx = cidx_first;
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
