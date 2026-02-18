Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4455EE9A047
	for <opensbi@archiver.kernel.org>; Wed, 18 Feb 2026 02:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jilocwo2J8m8LHrjvjCC9Mz3q+HqY0kP8hlR6wZUV6I=; b=tjFH6VYrJIrXg8
	cEzx9Ght3RVxa/fyk+ECyAAZutiZoQHzaUNfE7CCU77HCfg4rWjENlefGpy9JLaE+GzIEEhbgCnDE
	GI3NSqAEzr1oCeYSXcSVPIn1ss0a5KxmqgeyAMp1dxYHXqPxeHXnRaD0HXIG5IXCm4W/SEweFkKLD
	6Rzm98Eq3k2t3H2rkLoAsUYN/pAPT3Y4oaPFHU1DzRV1J3uzEwigh5bVSCPRr0KSBBrHKkyEnpUk5
	0owWKspBc7ayeq2DEFDbuD2WlqqJ22ikB5kOD58KDlPd1jy3GBA9wLlJtC4c8jdy2NSIT3bPduzQs
	5ig2hmtfYQjgpDz9/wOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsXHi-00000009BeJ-1bTA;
	Wed, 18 Feb 2026 02:27:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsXHf-00000009Bdr-3sb1
	for opensbi@lists.infradead.org;
	Wed, 18 Feb 2026 02:27:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD2F343811;
	Wed, 18 Feb 2026 02:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA15EC4CEF7;
	Wed, 18 Feb 2026 02:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771381642;
	bh=k9cdXTZ89ey653Pi1P8Yh2S9kgTCRzY5PrY3zKs3fxU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tmLm4Iy/Dr5aNa++JSlrf0h2DYfG6IujFytbLFBuGLwFceE02j8pd0jMMgFyC5mIj
	 v/DSmE0ec2MMh6Q4ocjqO85Ziom97MHiFH1QE42OmmIj9n6hwEiViUYIr329QZwlsb
	 iUkwyrxza6trz83FhjI4Et2h1xNd+UqxErqRo/Qc657I8TGx8uNGIROA25zKotRxpo
	 9hV9Wwslfc3xdTMq7qw3LAFnaK/UBsJ5TgQvQa701y/Q3V5ZoQmXP3o5IGrOlWqoTy
	 phAEnFa+8rj2y5MIgpyPiFyKnIsnMzTN3pWTyNflhk6zDa/s0fz2ssOSVMImqVt+0I
	 w69+zuqoGa/HQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DD3E9A041;
	Wed, 18 Feb 2026 02:27:22 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 17 Feb 2026 18:26:52 -0800
Subject: [PATCH] lib: sbi: Use SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI with unknown
 interrupts
MIME-Version: 1.0
Message-Id: <20260217-nmi-v1-1-eb4b4b3ad70e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Nz3bzcTF1DQwMzk8Q0i1QLS3MloMqCotS0zAqwKdGxtbUAeaIgOVU
 AAAA=
X-Change-ID: 20260217-nmi-11064af8e897
To: opensbi@lists.infradead.org
Cc: weidongwd <weidong.wd@bytedance.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771381642; l=1611;
 i=thecharlesjenkins@gmail.com; s=20260127; h=from:subject:message-id;
 bh=wBmA1uCady5afkTbF2Zn1Dnq+RrIayl1Lm/3nWl038Q=;
 b=9oWZXe+Yfn/amm2DXhp3kF3HOgZBAe8Hwc9oMLqyD5njXM9Eq5ov4+IN+1Scx1frH10YGo2BZ
 e7criYzhQCFBtItTpuvSUNzrGqTGfjGKVnA3gZ9huYGl43z/foJ7bwr
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=4AzEw2rmBYSzmHkYTjITwPc2sWIvqjw/Fu3GnQmSMTI=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/20260127
 with auth_id=619
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_182723_993397_21CEF569 
X-CRM114-Status: UNSURE (   8.06  )
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

An mcause of 0 means "unknown cause" according to the riscv priviledged
spec. When this occurs, the interrupt should be forwarded to S-mode
software via SBI_SSE_EVENT_GLOBAL_UNKNOWN_NMI if SSE is enabled.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
This patch builds off of [1] to trigger the UNKNOWN_NMI SSE call. That
patch depends on the SBI spec patch [2].

[1] https://lore.kernel.org/opensbi/20251014055330.59506-1-weidong.wd@bytedance.com/
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/pull/223
---
 include/sbi/riscv_encoding.h | 1 +
 lib/sbi/sbi_trap.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index b5a4ce81..1c634a45 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -90,6 +90,7 @@
 
 #define MCAUSE_IRQ_MASK			(_UL(1) << (__riscv_xlen - 1))
 
+#define IRQ_UNKNOWN			0
 #define IRQ_S_SOFT			1
 #define IRQ_VS_SOFT			2
 #define IRQ_M_SOFT			3
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index f41db4d1..f6576bd9 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -234,6 +234,10 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 static int sbi_trap_nonaia_irq(unsigned long irq)
 {
 	switch (irq) {
+#if defined(CONFIG_SBI_ECALL_SSE)
+	case IRQ_UNKNOWN:
+		return sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI);
+#endif
 	case IRQ_M_TIMER:
 		sbi_timer_process();
 		break;

---
base-commit: b27ecec76b8acfece9c28078d02cbc6bc762135c
change-id: 20260217-nmi-11064af8e897

- Charlie



-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
