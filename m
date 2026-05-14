Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89760CD4F3D
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EuGQFWAqnc/7Jf10cVZj5b6rUkkogK7j1p4v/+nOS4=; b=GZwTfvfNznXMJ6
	t4330WGq7VyEbFHi4tYdpDeFvMrW5OwiQpCD17Cjz4x4wGFpGo4qiA3HWIJTVNGXBF86IPliCgrIy
	82P4cKgaIf2WbSZ71jKZAVnoNx54lOF0IJ1eVCrzQWsRR5SnFiGiCVhP4CvWYwuKB0qkHPFSqKh7r
	LQ5MHk9AoVZMoCVgtY994dUpYs9C7QD5fmoUPAx4NtCwAL+tnnPVdVIW/LgbLWhuvBDCthmx4WGa2
	yHTe0FZx1lUOUmSme/yULrBEWjntVhPSL+8RKlxwC3/IrVlnYuwzBy/8VdQUOvAznkE1B+vMb7LJn
	ic+QtXYYXzOPyBNqCS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0T-00000006lwR-2isg;
	Thu, 14 May 2026 22:58:17 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0Q-00000006lv3-3pIH
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:16 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50e5b55062fso63843911cf.2
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799493; x=1779404293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CBbJXvOHBZl+WiItxp3ug2ZoV9rGXwMa2OdXOZ6TvY=;
        b=kpCVUxmH12S5J1BZDSTl5dOjGnuKUydhQpMQe5OTHoEisVZpITpmsfTr1Cw0k2NStp
         7UAvkROPMHWKyRujUtieM+kMVitt555ZfyQqWONMDrWajeS9tgNwfwo26sbE28Jlu3iJ
         NNOw5VLKFLDOKMOnGFmxuRQ9sfBdbQJLm26ypuWxjcR5ONOCr1wMkLnVpdi6jXX+QR3T
         ozyMAvGT72iLtuleJDX9JQ7ez1lF/OoxEuN6BrlgPOeV1PS1Y7N2Fu3473kUvmMxT5x8
         yXtpXixPyE2HvWVNvrZ3pi3M/6FL7424zmWOJs82626gXop/UV5Hxh+/L2BFhLHgoFud
         6mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799493; x=1779404293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CBbJXvOHBZl+WiItxp3ug2ZoV9rGXwMa2OdXOZ6TvY=;
        b=GTlfukDFIRrfnmAkELyMRy7Fg7T/qWkV5Gc8wKZyJXDZnK5YGnbq1hKsLgqSEV2CSd
         x3q4MbuWxZnjcCSkI0gfOB2FKMpWELIkyf6Hzu+i09UXx7wr5weePLcOp6t9CIJ9mjhm
         foaR8I2PQ/4YBhqi9DXjtsz6MQ9ArNAmat12iCsGWNXY58CQJrLLcnMJ1lVyGibQBv0F
         7geeEky1PmZpDs1ujQrTFGpRK+m4YqCd1mxGsgD74MwyGf0KvpoN/Tj/9T130DypPL0z
         qGHhLbRfLJ0dhvCTnSPy4EKxNB8akTfJn35hJjVyVi3Qg4DPqXcdVme8Y+yNjbILGfKu
         l9YA==
X-Gm-Message-State: AOJu0YyfXjjwrukAGn2OF+TBJE1LJNGENi4gBUnVMPMhNWoNpeWMGpNp
	TyYYF/7CJRvoUMWaLgtvmfB9Ue4afhtOIYiu+aXYLbVki7MYEQHGlFjqDsaxQg==
X-Gm-Gg: Acq92OGgWF3ojcXRAwIf5BAacxvRLZ+G1+tDhqaDNW2WFqXyqpOchMqqC7JKAG+7Ml9
	9ATRbTviqKKqT+PtJPm02LrL0Nf+60VoeVj/MMr0p0EnSwKtMd6sfFek1cf0Z7Dkqwq1yWld++t
	swNl6nTeWRy6dL8XRDWssKJOBpyPYr5Mns2TktvFA12MIMLMFh3RWZBptkTLWnCUtAk+RkPhHNi
	P4m3XkzY0r3dpTzbQiJj4tEDrFXr5LXqlx8r7blna52c9z706AQ/BD0X8OA9GVpl//MRqPTDiMj
	hUdX+H8T1YaZdQ2RBFuLfJijioIlsfKPQ9kmbKnEgbv5AuFYMoPTYcPuP3HBmJnkQMcFqnbnZJh
	Pc9d9fyUKVOJCMfqGsLLEdNNU/CRo1hodEBI1j+O+yIDY88NZUDVNkQXeVlMQSWMlRt/3MxgsF9
	UIH6j1XyDJlnsO91PobtzC07tySKZ9xxTXfOgfyFCzqQdUaikgmae683d8eJleNuNSyC7gJ4MM9
	eSky4+bGM4vj9k1yz6wow==
X-Received: by 2002:ac8:5c92:0:b0:50f:783d:8cb1 with SMTP id d75a77b69052e-5165a29619bmr21015441cf.58.1778799493349;
        Thu, 14 May 2026 15:58:13 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:13 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 01/10] lib: irqchip: add S-mode notification helpers
Date: Thu, 14 May 2026 18:57:47 -0400
Message-Id: <20260514225756.2255758-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155814_959671_6A599A3C 
X-CRM114-Status: GOOD (  10.25  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Add irqchip helpers to set/clear S-mode notification (SEIP-based),
In addition to set/clear, expose a get API to read the current
notification state so upper layers can do edge-triggered notification.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_irqchip.h | 24 ++++++++++++++++++++++++
 lib/sbi/sbi_irqchip.c     | 18 +++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 77b54110..7f23615a 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -110,4 +110,28 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
 /** Exit interrupt controllers */
 void sbi_irqchip_exit(struct sbi_scratch *scratch);
 
+/**
+ * Notify S-mode for a pending virtual interrupt on this hart.
+ *
+ * The irqchip layer abstracts the notification mechanism; on platforms that
+ * use SEIP, this sets mip.SEIP.
+ */
+int sbi_irqchip_notify_smode_set(void);
+
+/**
+ * Clear S-mode notification for virtual interrupts on this hart.
+ *
+ * The irqchip layer abstracts the notification mechanism; on platforms that
+ * use SEIP, this clears mip.SEIP.
+ */
+void sbi_irqchip_notify_smode_clear(void);
+
+/**
+ * Read S-mode notification state for virtual interrupts on this hart.
+ *
+ * The irqchip layer abstracts the notification mechanism; on platforms that
+ * use SEIP, this reads mip.SEIP.
+ */
+bool sbi_irqchip_notify_smode_get(void);
+
 #endif
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index f8599fa6..e022d534 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -122,7 +122,7 @@ int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq)
 	sbi_printf("[IRQCHIP] Calling hwirq %u raw handler callback\n", hwirq);
 	rc = h->callback(hwirq, h->priv);
 
-	if (chip->hwirq_eoi) {
+	if (chip->hwirq_eoi && rc != SBI_EALREADY) {
 		sbi_printf("[IRQCHIP] Calling EOI of hwirq %u\n", hwirq);
 		chip->hwirq_eoi(chip, hwirq);
 	}
@@ -320,3 +320,19 @@ void sbi_irqchip_exit(struct sbi_scratch *scratch)
 	if (hd && hd->chip && hd->chip->process_hwirqs)
 		csr_clear(CSR_MIE, MIP_MEIP);
 }
+
+int sbi_irqchip_notify_smode_set(void)
+{
+	csr_set(CSR_MIP, MIP_SEIP);
+	return 0;
+}
+
+void sbi_irqchip_notify_smode_clear(void)
+{
+	csr_clear(CSR_MIP, MIP_SEIP);
+}
+
+bool sbi_irqchip_notify_smode_get(void)
+{
+	return !!(csr_read(CSR_MIP) & MIP_SEIP);
+}
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
