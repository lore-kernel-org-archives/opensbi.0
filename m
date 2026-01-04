Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F059C2A069
	for <opensbi@archiver.kernel.org>; Sun,  4 Jan 2026 04:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pKLCAApHm4DEihnwhiqgqCK7q4sOaGQFIFjxPISrklo=; b=NuaMM6+6Ss66S9
	eAMIsdevmbmp7j1TuGs2lR3oiZjDnsY3EOQ68mQ6tLAk5FIBuyXVfy2szIdCvQpFGam8y3CtDLa10
	dMyY3yVFm0SvbHQbHaKswNErr2Bv0eE1NrLvKJ/G/Xgjx749j8Mlu5/9boXaaBtTCBxn1ZJlxxqf4
	KDrHNN3Wc7vg2S/IDxsUHR9/PI/AwvOg0qtjfs311NVrwRCFWfnTuMriBRprb7RizG8sntcE1xaA+
	9v00t9OiM0L8hmhXo02AKPJREiei3OgUaihE2UxkDELYEwj2cngoSLLwFDeiYpNqzmqZncgZ8Wmw7
	fA4srvuNvGaZ+mbSlz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcFPC-0000000A0YN-13yb;
	Sun, 04 Jan 2026 04:07:50 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcFP7-0000000A0Xz-3YrC
	for opensbi@lists.infradead.org;
	Sun, 04 Jan 2026 04:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=GR
	TIHwE6zzOPIE4SOaZZhSTqcZOxCpnxUNQgnvmln6A=; b=VgpMm95S7vGkOzrD0u
	WlXodmQUSvU8jW4d9DBxf/FKMog/BKz/rmUai1QKUe3WWfKIrrmjLNC3z9cGKRbC
	OmWDXFbqecWvJmgxnTUkv/38EFBSxUX+KggWEBOTf+h8XktUcX4O8fRXfwnQ43Wj
	EARRguZQ+utw+6BQxlJhYie00=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD393+B51lpnMcUBQ--.35491S2;
	Sun, 04 Jan 2026 12:07:30 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v3 1/1] firmware: Initialize stack guard via Zkr
Date: Sun,  4 Jan 2026 12:07:23 +0800
Message-ID: <20260104040726.106760-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: _____wD393+B51lpnMcUBQ--.35491S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrWrKFW3JFy5KrW7Gr4rXwb_yoW8Cw17pF
	n5AFWayry0q3WxJry3KF1rZF4Fqr48GFsxKay2grZ8A3W7J3Z5Xrn0qFsIqr18ZF4DA34F
	gFnxJ3409wsFgaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zELvtNUUUUU=
X-Originating-IP: [2408:823c:b211:2b25:ee18:b7b:4892:3815]
X-CM-SenderInfo: pz0m23b26rjloofrz/xtbBpALKBWlZ54K7JAAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_200746_377003_C57E5D95 
X-CRM114-Status: UNSURE (   5.36  )
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
---
 firmware/fw_base.S           | 24 ++++++++++++++++++++++++
 include/sbi/riscv_encoding.h | 10 ++++++++++
 2 files changed, 34 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index bce9e226..16e2e283 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -107,6 +107,30 @@ _bss_zero:
 	add	s4, s4, __SIZEOF_POINTER__
 	blt	s4, s5, _bss_zero
 
+	/* Trying to initialize the stack guard via the Zkr extension */
+	lla	t0, __stack_chk_guard_done
+	csrw	CSR_MTVEC, t0
+	li	t0, 0
+	li	t3, SEED_OPTS_ES16
+	li	t4, SEED_ENTROPY_MASK
+	li	t5, __SIZEOF_POINTER__
+__stack_chk_guard_loop:
+	csrrw	t1, CSR_SEED, x0
+	li	t2, SEED_OPTS_MASK
+	andi	t2, t2, t1
+	bgtu	t2, t3, __stack_chk_guard_done
+	bltu	t2, t3, __stack_chk_guard_loop
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
diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index b5a4ce81..3c1d5256 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -261,6 +261,16 @@
 #define CSR_FRM				0x002
 #define CSR_FCSR			0x003
 
+/* User entropy source */
+#define CSR_SEED			0x015
+#define SEED_OPTS_SHIFT			30
+#define SEED_OPTS_MASK			(_UL(3) << SEED_OPTS_SHIFT)
+#define SEED_OPTS_BIST			(_UL(0) << SEED_OPTS_SHIFT)
+#define SEED_OPTS_WAIT			(_UL(1) << SEED_OPTS_SHIFT)
+#define SEED_OPTS_ES16			(_UL(2) << SEED_OPTS_SHIFT)
+#define SEED_OPTS_DEAD			(_UL(3) << SEED_OPTS_SHIFT)
+#define SEED_ENTROPY_MASK		0xffff
+
 /* User Counters/Timers */
 #define CSR_CYCLE			0xc00
 #define CSR_TIME			0xc01
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
