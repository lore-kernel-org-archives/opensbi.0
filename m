Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46B8CCD195
	for <opensbi@archiver.kernel.org>; Fri, 17 Oct 2025 07:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YUKB1KgrVwe2Q12ZQkjFbvsl4rjkD8abI8G84dn7bl0=; b=r7vVZgtd8hpuHc
	HITfPQggtXgNvTguI6Pu9VaKibSS5/si3x9MwBgnuMvFNlHv5cgNqBdUae68PoajpAaU725S8YPjH
	8BA3NZQzNNXVUiOdjzEPii8/fNP8U8NyrBzw75G/dJklw9umhAd+3aTd7XZR0kXbByUswt55mUIrq
	AjackNZpITPGmvxaLWeroJCy2fQXsNX641FNbNB88zqfIGeekeRL6pkIR5n4gOzxXuUvoMsd7G9sa
	vQ6QgXFB4fL0hneuuQVMNCjj4KTtu4oTM71ACb85CTlR+h1C7F5IfgjqDjbC+c/5B0vg9TlcQdGDW
	Lynio46VxYsm2d61jMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fGR-000000070y7-0EeI;
	Fri, 17 Oct 2025 07:52:39 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fGO-000000070xh-0N8c
	for opensbi@lists.infradead.org;
	Fri, 17 Oct 2025 07:52:38 +0000
Received: from iscas.ac.cn (unknown [43.160.207.140])
	by APP-03 (Coremail) with SMTP id rQCowACn8Xu99fFoKE_dDw--.26073S2;
	Fri, 17 Oct 2025 15:52:30 +0800 (CST)
From: Meng Zhuo <mengzhuo@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: hal.feng@starfivetech.com,
	Meng Zhuo <mengzhuo@iscas.ac.cn>
Subject: [PATCH] platform: starfive: jh7110: fix wrong pmic i2c address
Date: Fri, 17 Oct 2025 15:52:27 +0800
Message-ID: <20251017075227.442834-1-mengzhuo@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: rQCowACn8Xu99fFoKE_dDw--.26073S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF1rtw4rXF18tw18Wr1UAwb_yoWxKFg_t3
	y8Xr4kGr18GFyqgw1jywnxCF4xXwn8Wan5uF43G3sIvr18Ka1kt3sxCrZ5AasIqF4UKFyf
	J3ZFgr9xC34akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAm7VW8CwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb92-5UUUUU==
X-Originating-IP: [43.160.207.140]
X-CM-SenderInfo: pphqw6xkxrqxpvfd2hldfou0/1tbiBg0SEmjxm3X8IwABsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_005236_512144_07A18C6F 
X-CRM114-Status: UNSURE (   6.64  )
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

The original address 0x32(50) which is eeprom, not pmic 0x24(36).

Signed-off-by: Meng Zhuo <mengzhuo@iscas.ac.cn>
---
 platform/generic/starfive/jh7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index c132843..07eade0 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -62,7 +62,7 @@ static u32 selected_hartid = -1;
 #define SYSTOP_CPU_PD_MASK		0x3
 
 #define TIMEOUT_COUNT			100000
-#define AXP15060_POWER_REG		0x32
+#define AXP15060_POWER_REG		0x24
 #define AXP15060_POWER_OFF_BIT		BIT(7)
 #define AXP15060_RESET_BIT		BIT(6)
 
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
