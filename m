Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A528BD3C920
	for <opensbi@archiver.kernel.org>; Wed, 10 Dec 2025 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GWahgZMr2O45jXztxgQ07ey1WQ0KDqg/8qCQ/bJSZvY=; b=nWnDPT2avmlQ3s
	pA3BJtwFrokdXWqP1vfYsHi61i/HuXYEcMXJhgpo6x50N9g1KlAhkMPXIn/Vq0Siizj4UbHq3bjUt
	xiLQs0xHgkXVs/jHS2kbh6EjKOUZQDYDGCjuLH9v9PlFUK+1HpoIgdXtGZTBpYXgrYhu6r53mvNdT
	r6p533gBNNY9oq6sxYn3zGLtJRfBZnkEDjbAxFaGD0m0tEsPzcf2jQZintZM9plBWKcSojMqMId9o
	3gIsOmLyJkGxSympzfduOmI3gyLk835c1U7GllOKP7zfcySXPKraNA9cSqteBVuY9iQ/N2fqRkU6D
	REAUOH749MnSaLOumVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLqU-0000000FXnX-0zRl;
	Wed, 10 Dec 2025 15:11:14 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLqP-0000000FXn4-2WGE
	for opensbi@lists.infradead.org;
	Wed, 10 Dec 2025 15:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=IU
	ZclAO3tWOJsRkwVQMs+7bh1C9HW3wYVfp9Sagf7FE=; b=e6V0X6X4kdu6wwqms2
	AmWIOzYgpLDb9aeRkUwYaBsRKYlnCjXj36vtON9jcSTHnhPTbYlQhmBxY38pVKwJ
	jDFmc7s6AggOWNPaQvDhtMxXrQh5ga/zS+QO3qk3CL/YNPy04r5vd7EZ9GfEkVCK
	DS2HGOxmBW8qNqYc5iQPD8ang=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD39yV4jTlp3t5NAA--.34275S2;
	Wed, 10 Dec 2025 23:10:49 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 1/1] firmware: Initialize stack guard via Zkr
Date: Wed, 10 Dec 2025 23:10:45 +0800
Message-ID: <20251210151046.37177-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: _____wD39yV4jTlp3t5NAA--.34275S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry8Jw4kuw1rWrWxJFWxtFb_yoWkCrXEya
	1fCas7uw1YvFWjqF93CFyxCrWrGw48X34v9F1DCw17t3Wag3y8XryDCr1Dtr17Wr17Kr1Y
	ya4DZws3Kr9a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRWq2MJUUUUU==
X-Originating-IP: [61.170.161.214]
X-CM-SenderInfo: pz0m23b26rjloofrz/xtbBshkqZGk5jXmsagAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_071110_073270_4A2479A9 
X-CRM114-Status: UNSURE (   4.35  )
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

Try to initialize stack protection guard via the zkr extension.

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
v2 changes: add '[PATCH]'

 firmware/fw_base.S | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 5300ecf2..953fba95 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -107,6 +107,30 @@ _bss_zero:
 	add	s4, s4, __SIZEOF_POINTER__
 	blt	s4, s5, _bss_zero
 
+	/* Trying to initialize the stack guard via the Zkr extension */
+	lla	t0, __stack_chk_guard_done
+	csrw	CSR_MTVEC, t0
+	li	t0, 0
+	li	t3, 2
+	li	t4, 0xffff
+	li	t5, __SIZEOF_POINTER__
+__stack_chk_guard_loop:
+	csrrw	t1, CSR_SEED, x0
+	srli	t2, t1, 30
+	andi	t2, t2, 3
+	bgt	t2, t3, __stack_chk_guard_done
+	blt	t2, t3, __stack_chk_guard_loop
+	and	t1, t1, t4
+	slli	t0, t0, 16
+	or	t0, t0, t1
+	addi	t5, t5, -2
+	bgtz	t5, __stack_chk_guard_loop
+	lla	t1, __stack_chk_guard
+	REG_S	t0, 0(t1)
+	j	__stack_chk_guard_done
+	.align 3
+__stack_chk_guard_done:
+
 	/* Setup temporary trap handler */
 	lla	s4, _start_hang
 	csrw	CSR_MTVEC, s4
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
