Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A225D358DB
	for <opensbi@archiver.kernel.org>; Thu, 29 Jan 2026 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvPWvyZkK6vuJSY5B6huL41p3jYi0L1o8tz+NnNAYnQ=; b=hx0s9orJRxhPk6
	6ZnPkOjBXuHWGBSQOPZUI6atMA5GLIdKuOPFpR5rrq8mb2Bbhs+eMTpolvMIQH0wFRW/oRbo6gTWH
	xl4pf1oBnra8C4YMa3xln2t4MCvBcWnV8yJ2uislSbMdnY5uQGFHxvB8WmCg0irA/1qajCROfUdeL
	YJeKBRC57c/zUau6OJRCP5j8c4x8vXEIo0/KtHQAYeC/B20HjTcTrcvP8368lsSNGTQB6D3OaSYt5
	TCTMK6328MWhEoPa5/v7pdzLfoaawYO++CrJf/xANfvyrJOQaeqy/pLblcZmosNep47jISq7v1ng9
	cx8WbPzqoSvhxbLc+wPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNA8-0000000HQpb-2R8N;
	Thu, 29 Jan 2026 08:14:00 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNA5-0000000HQoN-3cty
	for opensbi@lists.infradead.org;
	Thu, 29 Jan 2026 08:13:59 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso326888eec.0
        for <opensbi@lists.infradead.org>; Thu, 29 Jan 2026 00:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1769674437; x=1770279237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+H1fiBo2/2JcVvB8TOCwT8kbuhBnpVHas61ojWamMQ=;
        b=Q0atOwIGBYpM9q9yHSuslPh/bOTtEQYU9QuRPHeh4BCiJEmtQ4GHTYgCffLRLskYyZ
         GyZBPVwehmzCzLAOUFkoYxypdCjrjOJQbg96U/LH4/NNSfkFRkxTwp21xI0JhNX1SNiS
         UmQsXATUezq6Yz75oL2YSWm5ftpwM3m/CeMrvodHhDJDM8SuNEcw/a6FseM/NbvhhB1b
         QwYqr+QQAtoZ33erxvihzPjltq84VJJ8lhtZoV8k6QIgskeiMZY7yYcHlDg9yLlZ7yWg
         KUaJgpi6Q3/XGuRfJvY/VwZxaKUt9XTEIHK91gAVv4fuO2Cb8owGqvEEiQltdEtSx989
         bFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674437; x=1770279237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+H1fiBo2/2JcVvB8TOCwT8kbuhBnpVHas61ojWamMQ=;
        b=BwY+SOoIQghw4piMHO4gpb8kiosu6ZhUW3nB7YDyiWnO7NIfMCBbUtR/ZP17CqSnv9
         lTKSvf+LgLqQNlhXYNkEwQ8ga9uJS0mBuCZVUx7wI+Y7gWmQueKtsn/LRc484LP66d34
         nVv2/w5Z7ylGK1MSr0pxGLkhydeFkw1zjEkEcQj+63UURYif803eKWNe6EHYir7cItU4
         5cLeTZG7ryc7FosO14yGbAm9/WyG6t0P38Kahv/CGYMJ2s0gashPZX2HamM88pkN3q/M
         PXfIFvdOXCbONXSElEBL2cC9/fzG/HGnF0D/usSXlh0hcdcyV1eb0gVICrQkiGOatRKz
         ivBg==
X-Gm-Message-State: AOJu0Yx6/arnnAM0HCFVjIkOSlXl3tbkjRYSBqTpZSS0rXCoPML/z47r
	EGYpIS1phQCwMCcHclwKkMWiO02jEC2aKu6qut0/mZM1jcogMz1d7XMdW/kRvkSGvzJyCV9Rtux
	/kYFQbGtOu5EPOq+SidFBW03IjueEh3OquRC5ujyVmRQkxT/VQr3A8eC1fV9VCDMBrjQ1muYZUe
	7SvuaHAfQi/JTUEctfimDfdGKk8pXcH+fHIy0Km56EtuFbMQcpig==
X-Gm-Gg: AZuq6aLq22fxNVLPf9zQlUN9zwY2CckTe+FWvQIJGp9spCyMNt8zRcJDslkpBaKH4zv
	8Nq53BLh3kpGdvtlUSPpNfVHXZkCnoptD18i7dzjdqroWq/LYbcJcMcByUGEyuSoTBSOQei2pGb
	VjiBtdHhKZBNXcUHGbTw4ehG7AMxEs6+XmCuUjD1aqQH+j2czlbz4VPAeBtnrGyiWmVEIj2czj5
	sH1FnhfINCdO/E7/rv4FkV7F0Da14Hg4cf7vrcXFcysg15QSZW25BOkDmndykFejXske9NA7nHE
	5dmAtDhT75icTOdN2ALOpnHH02IRGQnk2xpWBZlFPbjUJec1jnzeiMeYaJWgCRMULnnam2GyueE
	Uj55R/W/2ntxd4q6mHUf306F/VK86rZDdwovT7tj1CQnNpDJ2omVIt87Y1dPCJM5gr+calcnqw5
	267SqFkz6vn+nh1I2zfJs4TIndBXi/wvcr/Hvjpw==
X-Received: by 2002:a05:7300:cc12:b0:2b1:7486:3a6e with SMTP id 5a478bee46e88-2b78d90e3e7mr5064061eec.12.1769674436549;
        Thu, 29 Jan 2026 00:13:56 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm6042480eec.26.2026.01.29.00.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:13:56 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 29 Jan 2026 00:13:43 -0800
Subject: [PATCH 3/3] firmware: fw_base.S: Add common NMI trap handler
MIME-Version: 1.0
Message-Id: <20260129-smrnmi-v3-v1-3-5d297d3e2027@sifive.com>
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
In-Reply-To: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001357_937257_8121E80F 
X-CRM114-Status: GOOD (  14.92  )
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

Add rnmi_handler assembly wrapper and sbi_rnmi_trap_handler default
C handler. The default handler prints diagnostics and hangs the hart.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Nick Hu <nick.hu@sifive.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 firmware/fw_base.S     | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/sbi/sbi_trap.h | 12 ++++++++--
 lib/sbi/sbi_hart.c     |  8 +++++++
 lib/sbi/sbi_trap.c     | 16 +++++++++++++
 4 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index bce9e226..c2b9a5f8 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -643,6 +643,70 @@ memcmp:
 	REG_L	a0, SBI_TRAP_REGS_OFFSET(a0)(a0)
 .endm
 
+.macro RNMI_SAVE_REGS
+	/* Save all general registers except SP (already in MNSCRATCH) */
+	TRAP_SAVE_GENERAL_REGS_EXCEPT_SP_T0
+	/* Also save t0 (TRAP_SAVE_GENERAL_REGS_EXCEPT_SP_T0 doesn't save it) */
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
+.endm
+
+.macro RNMI_RESTORE_REGS
+	/* Restore all general registers except A0 and T0 */
+	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
+	/* Restore A0 and T0 */
+	TRAP_RESTORE_A0_T0
+.endm
+
+/* Smrnmi mnret instruction encoding (0x70200073) */
+.macro MNRET
+	.word 0x70200073
+.endm
+
+	.section .entry, "ax", %progbits
+	.align 4
+	.globl sbi_rnmi_vector
+sbi_rnmi_vector:
+	/* Swap SP with MNSCRATCH */
+	csrrw	sp, CSR_MNSCRATCH, sp
+
+	/* Allocate space for full trap registers structure */
+	addi	sp, sp, -(SBI_TRAP_REGS_SIZE)
+
+	/* Save all general registers */
+	RNMI_SAVE_REGS
+
+	/* Save original SP (currently in MNSCRATCH) */
+	csrr	t0, CSR_MNSCRATCH
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(sp)(sp)
+
+	/* Set up arguments for C RNMI handler */
+	add	a0, sp, zero
+
+	/* Save RNMI MNEPC/MNSTATUS into regs->mepc/mstatus. */
+	csrr	t0, CSR_MNEPC
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
+	csrr	t0, CSR_MNSTATUS
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(mstatus)(a0)
+
+	/* Pass RNMI cause as second argument */
+	csrr	a1, CSR_MNCAUSE
+
+	/* Call the default C RNMI handler directly */
+	call	sbi_rnmi_trap_handler
+
+	/* Restore RNMI stack pointer for future RNMI entries. */
+	addi	t0, sp, SBI_TRAP_REGS_SIZE
+	csrw	CSR_MNSCRATCH, t0
+
+	/* Set A0 to point to saved registers for restore macros */
+	add	a0, sp, zero
+
+	/* Restore all general registers */
+	RNMI_RESTORE_REGS
+
+	/* Return from RNMI with mnret. */
+	MNRET
+
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _trap_handler
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 731a0c98..afd95ad5 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -289,6 +289,14 @@ static inline void sbi_trap_set_context(struct sbi_scratch *scratch,
 
 struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx);
 
-#endif
+/**
+ * Common firmware RNMI trap handler entry in M-mode.
+ *
+ * Platforms program their RNMI trap vector to this address using the
+ * set_rnmi_trap_vector platform operation.
+ */
+void sbi_rnmi_vector(void);
 
-#endif
+#endif /* !__ASSEMBLER__ */
+
+#endif /* __SBI_TRAP_H__ */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index baebc438..7586ee09 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -839,6 +839,7 @@ int sbi_rnmi_vector_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	unsigned long rnmi_sp;
 	void *rnmi_ctx;
+	int ret;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 	const struct sbi_platform_operations *ops =
 		plat ? sbi_platform_ops(plat) : NULL;
@@ -871,6 +872,13 @@ int sbi_rnmi_vector_init(struct sbi_scratch *scratch, bool cold_boot)
 	rnmi_sp  = (unsigned long)rnmi_ctx + SBI_TRAP_REGS_SIZE;
 	csr_write(CSR_MNSCRATCH, rnmi_sp);
 
+	/* Ask the platform to program the RNMI trap vector. */
+	ret = ops->set_rnmi_trap_vector((uintptr_t)sbi_rnmi_vector, cold_boot);
+	if (ret == SBI_ENODEV)
+		return 0;
+	if (ret)
+		return ret;
+
 	/* Enable RNMI now that CSR_MNSCRATCH and the trap vector are set up. */
 	csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
 
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index f41db4d1..940b83d8 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -375,3 +375,19 @@ trap_done:
 	sbi_trap_set_context(scratch, tcntx->prev_context);
 	return tcntx;
 }
+
+/**
+ * Default RNMI trap handler.
+ *
+ * This is the default handler for Resumable Non-Maskable Interrupts (RNMI).
+ * It is invoked directly from the firmware RNMI entry (rnmi_handler)
+ * and prints diagnostic information before hanging the hart.
+ */
+void sbi_rnmi_trap_handler(struct sbi_trap_regs *regs, unsigned long mncause)
+{
+	sbi_printf("mnepc   = 0x%016lx\n", regs->mepc);
+	sbi_printf("mncause = 0x%016lx\n", mncause);
+	sbi_printf("mnstatus= 0x%016lx\n", regs->mstatus);
+
+	sbi_hart_hang();
+}

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
