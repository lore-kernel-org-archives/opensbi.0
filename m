Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3719CDE01A
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 07:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bEqzcHDyWdZjUP+ZDmIh11fyLJ0zPV1O57pOfe6bx+A=; b=NpC9vpP3mXrMo1
	BiEEaD0MD65AnefQQY0BLewc2QQ3TF8WNwQpbIdL/WSwmF0Hktc23S0Kr7SgAkP4o9nLBCyb7/w/W
	zpk0qxCbI9rF/CbTHIyBPH4IPPlWl4l1XaBYrUMcHGNtRoLmbfoTs4dD2eFTDB4ERRiu7lqbRGILw
	PSFjEvuUXyWGu4BFtwnohaGjcygsAqz3x+OliHp3SXy4LdnH0bDLynN2XGbU73X/cxX8GgwCq0kJ7
	eTzqeXGFmaUQyHvA3C7S5vuzutpzwkx5dW1Eai2gD3sTu/EeKI6hG7BoqdpKT40ctUHhi8RV1JUgc
	9V0xspJ05vOd9/9NQwcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJo0g-0000000BjT4-3i0f;
	Fri, 14 Nov 2025 07:14:18 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJo0e-0000000BjRj-1AqK
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 07:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763104454; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Dnyesz9Tf3HBpJZObAXMDFNi6qzt5ycBb4XTWj4OUbg=;
	b=uMkzQMJ7XZpM318a4gGK0kFZhhKVeTryGr3xtTSP9KeqTeQFT9VLgWUG8JGQyoahXR3wtBafuBFKCjBwUCQCMY0/KWPv0BzBdIPOQUl4j4eidxQgDE9McW9V3jPyy7eMkpJJeXVDISMAIH4i3lAZ2C01wKgLtkL+RD8S9TcGrK8=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WsMEt9A_1763104446 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 14 Nov 2025 15:14:10 +0800
From: cp0613@linux.alibaba.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH v4] lib: sbi: Enable Ssqosid Ext using mstateen0
Date: Fri, 14 Nov 2025 15:13:58 +0800
Message-ID: <20251114071359.1492-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_231416_476852_17DCF338 
X-CRM114-Status: GOOD (  12.02  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

The QoS Identifiers extension (Ssqosid) introduces the srmcfg register,
which configures a hart with two identifiers: a Resource Control ID
(RCID) and a Monitoring Counter ID (MCID). These identifiers accompany
each request issued by the hart to shared resource controllers.

If extension Smstateen is implemented together with Ssqosid, then
Ssqosid also requires the SRMCFG bit in mstateen0 to be implemented. If
mstateen0.SRMCFG is 0, attempts to access srmcfg in privilege modes less
privileged than M-mode raise an illegal-instruction exception. If
mstateen0.SRMCFG is 1 or if extension Smstateen is not implemented,
attempts to access srmcfg when V=1 raise a virtual-instruction exception.

This extension can be found in the RISC-V Instruction Set Manual:
https://github.com/riscv/riscv-isa-manual

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 include/sbi/riscv_encoding.h | 5 +++++
 include/sbi/sbi_hart.h       | 2 ++
 lib/sbi/sbi_domain_context.c | 7 ++++++-
 lib/sbi/sbi_hart.c           | 6 ++++++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 61e4b635..b738e209 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -378,6 +378,9 @@
 #define CSR_SSTATEEN2			0x10E
 #define CSR_SSTATEEN3			0x10F
 
+/* Supervisor Resource Management Configuration CSRs */
+#define CSR_SRMCFG			0x181
+
 /* Machine-Level Control transfer records CSRs */
 #define CSR_MCTRCTL                     0x34e
 
@@ -849,6 +852,8 @@
 #define SMSTATEEN0_FCSR			(_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
 #define SMSTATEEN0_CTR_SHIFT		54
 #define SMSTATEEN0_CTR			(_ULL(1) << SMSTATEEN0_CTR_SHIFT)
+#define SMSTATEEN0_SRMCFG_SHIFT		55
+#define SMSTATEEN0_SRMCFG		(_ULL(1) << SMSTATEEN0_SRMCFG_SHIFT)
 #define SMSTATEEN0_CONTEXT_SHIFT	57
 #define SMSTATEEN0_CONTEXT		(_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
 #define SMSTATEEN0_IMSIC_SHIFT		58
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index e66dd52f..c51b0689 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -79,6 +79,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SMCTR,
 	/** HART has CTR S-mode CSRs */
 	SBI_HART_EXT_SSCTR,
+	/** Hart has Ssqosid extension */
+	SBI_HART_EXT_SSQOSID,
 	/** HART has Ssstateen extension **/
 	SBI_HART_EXT_SSSTATEEN,
 	/** Hart has Xsfcflushdlone extension */
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 74ad25e8..a5b7c530 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -45,6 +45,8 @@ struct hart_context {
 	unsigned long scounteren;
 	/** Supervisor environment configuration register */
 	unsigned long senvcfg;
+	/** Supervisor resource management configuration register */
+	unsigned long srmcfg;
 
 	/** Reference to the owning domain */
 	struct sbi_domain *dom;
@@ -143,8 +145,11 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
-	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
 		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
+			ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
+	}
 
 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index a91703b4..295a6783 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -112,6 +112,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		else
 			mstateen_val &= ~SMSTATEEN0_CTR;
 
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
+			mstateen_val |= SMSTATEEN0_SRMCFG;
+		else
+			mstateen_val &= ~SMSTATEEN0_SRMCFG;
+
 		csr_write64(CSR_MSTATEEN0, mstateen_val);
 		csr_write64(CSR_MSTATEEN1, SMSTATEEN_STATEN);
 		csr_write64(CSR_MSTATEEN2, SMSTATEEN_STATEN);
@@ -685,6 +690,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssdbltrp, SBI_HART_EXT_SSDBLTRP),
 	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
+	__SBI_HART_EXT_DATA(ssqosid, SBI_HART_EXT_SSQOSID),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
 	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
-- 
2.50.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
