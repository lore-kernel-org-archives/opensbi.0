Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C3BE7DEF4
	for <opensbi@archiver.kernel.org>; Mon,  2 Feb 2026 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gahjzsEbvzAneAceBVQ5p0I/FVkr8q7+lvzSNiQxQrc=; b=v6n7QgnPjnnT82
	ShoQhUPsXGcufa2wXxQpNar8W17gMNP68rgfpEh5kMEjkF9XsXfvD59MlCK+X/mDZLh3jRCUeg6I3
	awEsOG4kTN7yKSN2sWaT+yQ1bWl3oEWFihf1R81qwUDC6hO6AzOp6YVbcIQvjdN/5bDNWJZllPZVk
	yBfJt2mz0afhWygamXSIYic9RnDdWSUyx3gjiN0GMN7Kjc6E2G8bT5qWUf/8TQQB4mvL/kcj4bpPt
	vjkLqYwu2ZxSmA8MH3DxiABcc58PuRa/lskI0VEOpn2Za6TZMFfwURqYkPkfWRfVVq7JahlAmvDNT
	GCKEz+PEzSN83mRkHaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvRc-0000000599D-48LV;
	Mon, 02 Feb 2026 15:02:28 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvRa-0000000597p-1UL2
	for opensbi@lists.infradead.org;
	Mon, 02 Feb 2026 15:02:27 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-566360cab02so3467620e0c.2
        for <opensbi@lists.infradead.org>; Mon, 02 Feb 2026 07:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770044544; x=1770649344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZWN680lLLqrE1iVGPry9tTZ08Fi989WRUuu2+WAZXk=;
        b=VbO2JF0nfvqD01HdqIx8bXJHun9tUzdBxeowIassB2shRsOS0A+lYT9iIxLIT+b789
         jEjSw9I1qgxFcxJqSUrWOpveJuZvOQ9my27UaUHwzUPlVAEisro5EXl6BOvSa+FzsWJJ
         ntiAE0KYppb+GHP9KRr3/iSJVCCk26Zui+LcxLkC7C1YQNrXy4USI4xge2Dxc3P/5am0
         77EAeu09Pm8KRSF53pnPqYGPuUoSUCwT4WFtfGFM2leZ84t9sBLCXZysUxPJZkMTUzNI
         EHefObCrR/ypdB5PeqEmwo2SmFd4/WMO7U6rJzy7FC5PAJqn+6Af1iEkQI/FmLq/yfx5
         N8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044544; x=1770649344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RZWN680lLLqrE1iVGPry9tTZ08Fi989WRUuu2+WAZXk=;
        b=auIuX1urQaoN+AuldOr3izqIH5I2GRrAgZ5uyy2o45AxCkZwTd5OGr0UiKZIQwWVhq
         XlovQzf4rJ5Dz6fT4qTltWZvZrBNyqtZY9wuxKGMZxStSs/2NT8OKvXF1QK0wDjpPT4l
         b3+maZMB7aQSwdI+alU4DB65AylzLLeZ12dPFyWwmPvi7zcq3zq8IBb6gKM1hCJGMPoa
         GkEfg8+g2ZCXiQSBPEuScoqLXbTYq4jDDSaJgSQmW1N3RRLik7i6c4htrRNs+XxR7G42
         Fxe+B4pSMdSwTAuMrjhzoKBBqSBlOSYjMliQ4t3HMZ6MNRVwHQuBywQOAA2wVNwcsuG1
         3mSA==
X-Gm-Message-State: AOJu0Yw00tqAoGFiuFIxqgSOMoCOM2NCW0Y3NRW8yhYfYFK5vQ0d6Ds+
	NP9xV1w+cpct4poDGwwosHQU8h0e/IhNpC7tdV8vp2hosewa9AwAHR8H2pn7ug==
X-Gm-Gg: AZuq6aLIoCFQJvLexsnCmoqgoCk8GkZAY2KdJIL60eeLjxjoIhzCElnNrOPAAIKXxuc
	gvoRybtK/MymEPgskD+fwpdtgWpYvdJzVCZF6lJJD8bO5iBNJmoK9nY1689SNyNFihAeEiYaz6Q
	o8WifxixTi3+ooo+dKXBUemh4uC0b8AzyS5UyOyUAj61LH8hT1r2fCkPhooOoaO7kvDvHjn7Fzz
	rHjTvRoBiVbdRRhj8xAHhKcrUopZa7/8NJBButYmRS76Qn6S1s052Z0EwHZPmzZdztWiNV/vgx2
	DBoaAjP1cIYmO2BZROpbc7cu+i+ABb/wag5cvreqxL9cAng3fTI8Ou6myzMw/Lrd+t8Hlo69q2j
	9/fR8b3JT1dIFaeHSG+5olg4fy8c59YvjYgmJ5e1KBMHRs+t24Z4/HE11ySAlqSRXxZ7BJFkxdg
	i31cqBtG7cEXLQbGNynHmMkIZtiH5V9xg58ZAUlMNomxVVpcim2t3YVIiqGXcvOA4blJp80jE=
X-Received: by 2002:a05:6122:3d08:b0:557:c6d3:5c0f with SMTP id 71dfb90a1353d-566a00d6cb9mr3519383e0c.13.1770044543096;
        Mon, 02 Feb 2026 07:02:23 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c71b29f796sm1136907485a.22.2026.02.02.07.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:02:22 -0800 (PST)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH v2 1/2] lib: sbi: introduce abstraction for wired interrupt handling
Date: Mon,  2 Feb 2026 10:02:06 -0500
Message-Id: <20260202150207.1331811-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202150207.1331811-1-raymondmaoca@gmail.com>
References: <20260202150207.1331811-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_070226_426990_7033E809 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Add wired interrupt handling abstraction into irqchip.
This introduces a small provider interface based on
claim/complete/mask/unmak semantics, allowing to register a wired
interrupt controller as a provider.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_irqchip.h | 52 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index e0ae12f5..27b88765 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -27,6 +27,38 @@ struct sbi_irqchip_device {
 	int (*irq_handle)(void);
 };
 
+/* Handler for a specified hwirq */
+typedef int (*sbi_irqchip_irq_handler_t)(void *priv);
+
+/* Provider operations */
+struct sbi_irqchip_provider_ops {
+	/*
+	 * Claim a pending wired interrupt on current hart.
+	 * Returns:
+	 *   SBI_OK      : *hwirq is valid
+	 *   SBI_ENOENT  : no pending wired interrupt
+	 *   <0          : error
+	 */
+	int (*claim)(void *ctx, u32 *hwirq);
+
+	/*
+	 * Complete/acknowledge a previously claimed wired interrupt
+	 * (if required by HW).
+	 * Some HW may not require an explicit completion.
+	 */
+	void (*complete)(void *ctx, u32 hwirq);
+
+	/*
+	 * mask/unmask a wired interrupt line.
+	 *
+	 * These are required for reliable couriering of level-triggered device
+	 * interrupts to S-mode: mask in M-mode before enqueueing, and unmask
+	 * after S-mode has cleared the device interrupt source.
+	 */
+	void (*mask)(void *ctx, u32 hwirq);
+	void (*unmask)(void *ctx, u32 hwirq);
+};
+
 /**
  * Process external interrupts
  *
@@ -46,4 +78,24 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
 /** Exit interrupt controllers */
 void sbi_irqchip_exit(struct sbi_scratch *scratch);
 
+/*
+ * Register the active wired interrupt provider.
+ * - max_hwirq specifies the highest valid hwirq ID.
+ */
+int sbi_irqchip_register_provider(const struct sbi_irqchip_provider_ops *ops,
+				  void *ctx, u32 max_hwirq);
+
+u32 sbi_irqchip_get_max_src(void);
+
+/* Set/clear handler for a specified hwirq */
+int sbi_irqchip_set_handler(u32 hwirq, sbi_irqchip_irq_handler_t handler,
+			    void *priv);
+int sbi_irqchip_clear_handler(u32 hwirq);
+
+void sbi_irqchip_mask_irq(u32 hwirq);
+void sbi_irqchip_unmask_irq(u32 hwirq);
+
+/* external interrupt handler (irqchip device hook) */
+int sbi_irqchip_handle_external_irq(void);
+
 #endif
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
