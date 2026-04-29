Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352C0CCFA13
	for <opensbi@archiver.kernel.org>; Wed, 29 Apr 2026 18:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IwsKoYlF/sVMV61hH3fkJkhPCH2Qae1o2syEMU6pEzQ=; b=GEghD9vfLP3b60
	iFdNX5MaSG4AD3OCtaY5pFgYDxGmxqKn0FP5HRzvA/qnAXqkprzv3gDjbsI9QUNqTM/SJ9R3degny
	+qPMjdYO5UTQ8TLAsce/JMPS0BPzEaowGlXFygwL4JLNcAYXDUfseIOI72p64ttz9/AnXC4O9+0to
	ymgkCewJ6jhEOhPS4UsPsfOT5qz4PV/9CWCLJiHYaOqWoJkoglKmSgwGsAVVQ/hBpM6QVO4LBmmOJ
	yslQFdlzng9Lx2msM2iepWS1Uwe40kslvzIcMYzX4j0xSarS/3FDGwKSMBQpTjNPKacV3EHg0qNzk
	7bA0FeksezleAPtBuwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9UG-000000043mm-3OvK;
	Wed, 29 Apr 2026 18:18:16 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9UA-000000043kd-36Xw
	for opensbi@lists.infradead.org;
	Wed, 29 Apr 2026 18:18:15 +0000
Received: from yzs (unknown [115.196.69.181])
	by APP-01 (Coremail) with SMTP id qwCowADnjGhaS_Jpy0W+Dg--.60596S2;
	Thu, 30 Apr 2026 02:18:04 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH] lib: sbi_domain_context: Flush TLB after SATP mode switch
Date: Thu, 30 Apr 2026 02:17:47 +0800
Message-ID: <20260429181747.160033-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnjGhaS_Jpy0W+Dg--.60596S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr18Zw4Dtw1kAr4fZFWkWFg_yoW8WrW7pF
	1DuF9rCr4vqFn7Ka4DCa1Yqr1FkFZ3G3Wjk3s0kwnay34Fvrn8Cr1UZ34jkF17ZFyxXr1Y
	yFsF9r4avF4YvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-Originating-IP: [115.196.69.181]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwMA2nyHa1hlQAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_111811_155686_D682F6CF 
X-CRM114-Status: UNSURE (   7.56  )
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

When switching between domains with different satp.MODE values (e.g.
Sv39 to Sv48), the RISC-V ISA permits hardware to use cached
translations from the old virtual-address width if no SFENCE.VMA
intervenes.  This constrained-unpredictable behavior is clarified in
riscv-isa-manual PR #2219.

Add __sbi_sfence_vma_all() after the csr_swap(CSR_SATP, ...) in
switch_to_next_domain_context() to ensure translations from the new
domain's address width are used.

Link: https://github.com/riscv/riscv-isa-manual/pull/2219
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
 lib/sbi/sbi_domain_context.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 158f4990432e..f47875e48230 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -18,6 +18,7 @@
 #include <sbi/sbi_domain_context.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_tlb.h>
 
 /** Context representation for a hart within a domain */
 struct hart_context {
@@ -136,6 +137,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	ctx->stval	= csr_swap(CSR_STVAL, dom_ctx->stval);
 	ctx->sip	= csr_swap(CSR_SIP, dom_ctx->sip);
 	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
+	__sbi_sfence_vma_all();
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
-- 
2.51.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
