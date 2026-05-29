Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF48CD6E51
	for <opensbi@archiver.kernel.org>; Fri, 29 May 2026 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2e/IWhXB4MeqR87bHKAgCF52p45ysAaOslvO2PyzDRU=; b=kN56bu6ZPL7vvN
	F5+ZQYCZ04gKINShrpuSdhVrjSqTL62anfpu7YMMTnaCZOrRWHagC8ukk43uuYi+6HpYESBYGGJFR
	HMgI0UHHt5Naw+mOiP6+80Aa5unRLEMetBi0kARKk2iKad/122yU2y6Z+KyE032L1QtkMm+Axe+3k
	J6r7UDWKh9XEbbUQ9oSg9v38sGuk8DgoZlIF5XmOcnOwrYCTIHJk+sko+WQoZRPEcvGNFQgnmIy/Y
	q58z1oH431Vt2pYaBiD9TJu8x5D+35BLtSvV59Kce8BYxu7ciwC4ziWsZId7TolekNN+L/61Bf8KZ
	zptSxmlC/rFCR8dUJA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyPw-00000007Xiy-0f10;
	Fri, 29 May 2026 14:42:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyPt-00000007XiF-2vw3
	for opensbi@lists.infradead.org;
	Fri, 29 May 2026 14:42:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 12720441B9;
	Fri, 29 May 2026 14:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5D7021F00898;
	Fri, 29 May 2026 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780065749;
	bh=w63P47uq6Ux3LnJTw3uuOB80xIrXYOiphtD65FQF9q0=;
	h=From:Date:Subject:To:Cc;
	b=Qzwfi+qQVjD/R3vd3eORmNnq9i16iXimgawUCmAAluqN79c/f64oBUrSvX29KLIa1
	 NWZsWBzgpi6PaQoaw9mlejZVXh7o1eMF0kE0c7kq67YrfQW5POwm5uwGWDZu8JxJXd
	 DNRO8/haM+DEGrdR+4BO2e2XvUIKG8rWimnAznE/dKg1OO4JVbTXj32pCue/9a7tBN
	 PlJRcY1FIY0vuqbH9ucywmbnC+tkifJXiJuDvoCR4jdMYntmWIuYpxQOxU1W/2ucOm
	 lAhJTU43ECKPugXhH10pPD/f1XxvXaLUQPNYB5s2QEdEcJ+TDkpLKRBfUBItyeX4ID
	 cBe+TXSdYslJw==
From: Michael Ellerman <mpe@kernel.org>
Date: Sat, 30 May 2026 00:42:18 +1000
Subject: [PATCH] lib: sbi_trap_v_ldst: Redirect unhandled traps
MIME-Version: 1.0
Message-Id: <20260530-trap-redirect-v1-1-45d4d333d8c9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMmlGWoC/x3MQQqAIBBA0avIrBPMSqKrRIvBxpqNySgRhHdPW
 r7F/y9kEqYMi3pB6ObMV2zoOwX+xHiQ5r0ZrLHOTIPRRTBpoZ2FfNEjOheQZsQQoDVJKPDz/9a
 t1g8E0v6sXwAAAA==
X-Change-ID: 20260530-trap-redirect-4a66fae8aaff
To: opensbi@lists.infradead.org
Cc: asrinivasan@oss.tenstorrent.com, Michael Ellerman <mpe@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074229_763453_DB526C79 
X-CRM114-Status: UNSURE (   9.53  )
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

When SBI is built with a compiler that doesn't support vector, the
misaligned vector load/store emulation is not built in, the handlers are
just stubs.

Currently the stubs just return 0, causing sbi_trap_emulate_load() to
return without incrementing mepc, meaning the instruction will just
fault again, an infinite loop.

Fix the stubs to use sbi_trap_redirect(), which forwards the trap to the
previous mode, allowing it to be handled there.

Fixes: c2acc5e5 ("lib: sbi_misaligned_ldst: Add handling of vector load/store")
Signed-off-by: Michael Ellerman <mpe@kernel.org>
---
 lib/sbi/sbi_trap_v_ldst.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
index f4d469dcf28884d0eecb4fdec61eee25895d55a0..1e4336f9db23e7b972d3430cdc52addb0fcdb817 100644
--- a/lib/sbi/sbi_trap_v_ldst.c
+++ b/lib/sbi/sbi_trap_v_ldst.c
@@ -334,11 +334,13 @@ int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
 int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 				 struct sbi_trap_context *tcntx)
 {
-	return 0;
+	/* Unable to emulate, send trap to previous mode. */
+	return sbi_trap_redirect(&tcntx->regs, &tcntx->trap);
 }
 int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
 				 struct sbi_trap_context *tcntx)
 {
-	return 0;
+	/* Unable to emulate, send trap to previous mode. */
+	return sbi_trap_redirect(&tcntx->regs, &tcntx->trap);
 }
 #endif /* OPENSBI_CC_SUPPORT_VECTOR */

---
base-commit: 547a5bbda7c3ec0096a6c87809851f8c2df047d1
change-id: 20260530-trap-redirect-4a66fae8aaff


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
