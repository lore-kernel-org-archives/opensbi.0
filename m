Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6A0CAC5A7
	for <opensbi@archiver.kernel.org>; Tue, 23 Sep 2025 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lIAZh6MrgzDqXpZ5KVtuskuzXqyWm0oZrrzZ7VT3fvw=; b=4P4WlAujE/rpB4
	h9QQ1vPf+TXMV7V30jnr+/YiQKpjbM8TihDV5kZFpwxzKaiWEUNGQy/AVRZKsYEjTRBqZSfdEJrsl
	U+331KqVZFADb+nAysfH7O7kOO9E9xmFd8N14LRpK5KXAOTWMLl0yBTpkB/dyJn1runPB0xf9jyN4
	duRTQM63GUnfH0XS5+xcH6KTZA6fH3Dd+0MD1N0gG2mxcMYmpCV5maBqUB0TAW0VkCSAQm2oxJvMA
	kXyITmoWrEB3DBTc+4iBv8nAV90M5Wkv46VCpbR5AbTPnXKG5xRlvQL7nQgJr7Hz85qsm2zgOIzuP
	AMNbtm6cYvV7nJBC26MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zn0-0000000D0PH-1zgn;
	Tue, 23 Sep 2025 09:58:26 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zmw-0000000D0Ov-1eUv
	for opensbi@lists.infradead.org;
	Tue, 23 Sep 2025 09:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1758621496; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=S7WKhwRjAfKDJuIAzrfnwi1LhCw26fcET/iSw6n3pD4=;
	b=qj1fVSeiEBM0kZ+ImoPOUegzhCPOs6g4hdx/IzIl+6pFipftHfy1wHpNBG4TamZLDA8LtBxETwlaCTztLyxmGrYEG3V6F5ozeRaOtLaV33wFIs+gngarDbL1BkR21Tyf70riKsiH7zCXl3J7dClYRyCMpFiNjQnX5LDXqbQwvgo=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0Woevrr6_1758621490 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 23 Sep 2025 17:58:14 +0800
From: cp0613@linux.alibaba.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] lib: sbi: Enable Ssqosid Ext using mstateen0
Date: Tue, 23 Sep 2025 17:58:02 +0800
Message-ID: <20250923095803.71287-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_025823_159601_EEBE74F2 
X-CRM114-Status: UNSURE (   9.52  )
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
 lib/sbi/sbi_hart.c           | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 40a854e..88d23b9 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -389,6 +389,9 @@
 /* VS-Level Control transfer records CSRs */
 #define CSR_VSCTRCTL                    0x24e
 
+/* Supervisor Resource Management Configuration CSRs */
+#define CSR_SRMCFG			0x181
+
 /* ===== Hypervisor-level CSRs ===== */
 
 /* Hypervisor Trap Setup (H-extension) */
@@ -815,6 +818,8 @@
 #define SMSTATEEN0_FCSR			(_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
 #define SMSTATEEN0_CTR_SHIFT		54
 #define SMSTATEEN0_CTR			(_ULL(1) << SMSTATEEN0_CTR_SHIFT)
+#define SMSTATEEN0_SRMCFG_SHIFT		55
+#define SMSTATEEN0_SRMCFG		(_ULL(1) << SMSTATEEN0_SRMCFG_SHIFT)
 #define SMSTATEEN0_CONTEXT_SHIFT	57
 #define SMSTATEEN0_CONTEXT		(_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
 #define SMSTATEEN0_IMSIC_SHIFT		58
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 82b19dc..ff501f5 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -81,6 +81,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCTR,
 	/** HART has Ssstateen extension **/
 	SBI_HART_EXT_SSSTATEEN,
+	/** Hart has Ssqosid extension */
+	SBI_HART_EXT_SSQOSID,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c085804..aaf922b 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -110,6 +110,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		else
 			mstateen_val &= ~SMSTATEEN0_CTR;
 
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
+			mstateen_val |= (SMSTATEEN0_SRMCFG);
+		else
+			mstateen_val &= ~(SMSTATEEN0_SRMCFG);
+
 		csr_write64(CSR_MSTATEEN0, mstateen_val);
 		csr_write64(CSR_MSTATEEN1, SMSTATEEN_STATEN);
 		csr_write64(CSR_MSTATEEN2, SMSTATEEN_STATEN);
@@ -727,6 +732,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
+	__SBI_HART_EXT_DATA(ssqosid, SBI_HART_EXT_SSQOSID),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
@@ -989,6 +995,9 @@ __pmp_skip:
 	/* Detect if hart supports smcntrpmf */
 	__check_ext_csr(SBI_HART_PRIV_VER_1_12,
 			CSR_MCYCLECFG, SBI_HART_EXT_SMCNTRPMF);
+	/* Detect if hart supports ssqosid */
+	__check_ext_csr(SBI_HART_PRIV_VER_1_12,
+			CSR_SRMCFG, SBI_HART_EXT_SSQOSID);
 	/* Detect if hart support sdtrig (debug triggers) */
 	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
 			CSR_TSELECT, SBI_HART_EXT_SDTRIG);
-- 
2.49.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
