Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43555D25931
	for <opensbi@archiver.kernel.org>; Tue, 27 Jan 2026 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ya1g5osavMdreCLsyUu+IYexq3QHOJRjwe8Dzb09jDY=; b=Lnh2Oddc+uXcW6
	flozlteo4IqxPmrkvj5UknA6vjm2+HVUZXWkiUunZmWh6VIrHx56v3X3Hsc34Kt7g4yZxmfmUpbQc
	EdgSe5Qnve3n77r8I9lFpGuOCzPPV7prad2bwtXZYvwIQRLzj1b4rovKButHYRyNYOU2aUhqHvr0L
	l638hnV5rKySeL+y5cSIVEndihmlwmdimYPllxn4my1HVdg0rTyLjAR4j2EnkQdqSQxAuCjCdbPId
	nw3swiMT+MiA9sqVm+QxrNr2DdRpou1XIyCIxaCpum7cjptHg+8C3iBOADKGDrIr4lf8aP5xfX8HL
	5ETpRUbj1VQFCRZM8+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkv9-0000000EXiq-0hup;
	Tue, 27 Jan 2026 15:23:59 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkv5-0000000EXhp-2rNc
	for opensbi@lists.infradead.org;
	Tue, 27 Jan 2026 15:23:58 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-502a98c66f7so49503531cf.1
        for <opensbi@lists.infradead.org>; Tue, 27 Jan 2026 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769527434; x=1770132234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wefSTQTtJzfTEe2lMGTmRz6tY5Lq5kAFTvFK8C0yKdE=;
        b=SjHr8oi9ZfRj/vPFY6fp8T1VcwqO7nmf1J2oZaQIePLKPeGSfN288Qtrf1VWFr5q1R
         nB1svZwmw5yBNWOVtWixCbx4W6Rxbvx2moznmRKSCWQJfx/CUASt1Wgxcjn9MesdyoTY
         V9Fprs18evMi+oKqa1msevAACW4TJR+zF1VsxjxNmUpPocv1phrWc0oOlOxuqbZLvslo
         sRDQxUueI92NQuKv3sLl2nHRZiOLnBUi4si9UOnvHf4zPtdjkEqzBFg9EopPw17L1uZn
         c73Bxb1Bc0edudb+1sr8ZL92JtpVxsuJraF53R2qy3WMau4e54FY77jIw06qWk6Tf+Yf
         fqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527434; x=1770132234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wefSTQTtJzfTEe2lMGTmRz6tY5Lq5kAFTvFK8C0yKdE=;
        b=kA3DyopmsE1mx1NzlLmpbzXorwjnyf3vjlwVwW/ieD6Hz81Ij9z+UHOhDbsbKXvfo5
         Ugcrj92cg4rTEWv3y/3Wh+d5D4cexPjcHkfSdA6nu6BTS/p73dSfODLoNpGP/TmJgfym
         MPnFJUUCnAaHyUJ05JgmWac1KfybTP9wPoJuHlzHdPdeq3UwUuA68ek6YjXWnWQfp0+z
         DZBpxlpBD1HUDz9VYt/xy+mgelLRne7wdlRcpWVGs+1xQcYpsjoneg/GUhvpJt/dSvrd
         YLM20I0kV62J55UCFXCFdqOjac0ptVBNYinJKFbPfeKPuKMPCrkOLBVF6Ex7WD2HElEP
         fHbw==
X-Gm-Message-State: AOJu0Yx2l+RAVte0kzEPDR1phFb5u8SwgkPnNzl0m4Et+ZJClIG6lwYS
	MMKtKdl7cUtGI3JSYiMzacMXyVpK3jzpkmQrS9ZeeIDHnb/TXoQyYmLdooaUcA==
X-Gm-Gg: AZuq6aJzZ0wxVBdmzczeLA3zHxijBK9AGQCP88pTgVeFTgG6qlL7QaqiEn0Op4++EcU
	0Rxg1GOCd2NbA4ImsGTAafTC0qR5sMBqGp8CH/NJi9LoJECfkA9ky4o3cHW+CQ5JGkT2fsvtrDF
	3JpM7JiRhkcNvbgOHeNMHcgssokVOvkC/E8FjWWkExzKUvLNv5BF4pOYeUBJTWfKZHavX8m2ptX
	nzC8RnOwL0j2zQik97rJM68yKf/i90OArq6I/kBP0GmCKx9Y4Z7+AZTdigjf2D17nQjI5QTt1Vf
	OETybvw15o4dCKrlxq0b+nzQ01bbxVLpZuIIbboSWfthktzWjRfvt0yGYSFKF4HkXuDVnpOyVPW
	C2nGH1EsYTBuwZkK0g2khDk6ln7/dom0pu4l4rEiV0b/PzRBi6XEH7u929TTAGkGmn2eUXybqLZ
	/RS7bVwTCFdEQIzGWWo1YT62lRK8MSncce4+paYC+1wghefEm7giH2TsBHDxXuTQAvaHS6dGw=
X-Received: by 2002:a05:622a:110f:b0:4f0:24e2:8de6 with SMTP id d75a77b69052e-5032fb1b0e0mr25403331cf.64.1769527434105;
        Tue, 27 Jan 2026 07:23:54 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5030032c987sm119710161cf.32.2026.01.27.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:23:53 -0800 (PST)
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
Subject: [RFC PATCH 1/2] lib: sbi: introduce INTC abstraction for wired interrupts
Date: Tue, 27 Jan 2026 10:23:41 -0500
Message-Id: <20260127152342.1231995-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260127152342.1231995-1-raymondmaoca@gmail.com>
References: <20260127152342.1231995-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_072357_468389_961E68F5 
X-CRM114-Status: GOOD (  14.27  )
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

Add a wired interrupt-controller (INTC) abstraction to OpenSBI.
This introduces a small provider interface based on
claim/complete/mask/unmak semantics, allowing to register a wired
interrupt controller as a provider.
Plus, add virtual IRQ number mapping to avoid exposure of hwirq.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 sbi_intc.h | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 sbi_intc.h

diff --git a/sbi_intc.h b/sbi_intc.h
new file mode 100644
index 00000000..f51974c9
--- /dev/null
+++ b/sbi_intc.h
@@ -0,0 +1,99 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __SBI_INTC_H__
+#define __SBI_INTC_H__
+
+#include <sbi/sbi_types.h>
+
+/* Handler for a specified IRQ number */
+typedef int (*sbi_intc_irq_handler_t)(u32 irq, void *priv);
+
+/*
+ * Provider capabilities, at the moment it contains the maximum valid source ID
+ * but extensible in the future
+ */
+struct sbi_intc_provider_caps {
+	/*
+	 * Maximum supported wired source ID for this provider.
+	 *
+	 * For APLIC this corresponds to the highest valid source ID (1..N).
+	 * The INTC core treats this as an abstract provider source ID space.
+	 */
+	u32 max_src;
+};
+
+/* Provider operations */
+struct sbi_intc_provider_ops {
+	/*
+	 * Query provider capabilities.
+	 *
+	 * This avoids exposing provider-specific limits (such as APLIC
+	 * num_source) through the registration API.
+	 */
+	int (*get_caps)(void *ctx, struct sbi_intc_provider_caps *caps);
+
+	/*
+	 * Claim a pending wired interrupt on current hart.
+	 * Returns:
+	 *   SBI_OK      : *hwirq is valid
+	 *   SBI_ENOENT  : no pending wired interrupt
+	 *   <0          : error
+	 */
+	int (*claim)(void *ctx, u32 *irq);
+
+	/*
+	 * Complete/acknowledge a previously claimed wired interrupt
+	 * (if required by HW).
+	 * Some HW may not require an explicit completion.
+	 */
+	void (*complete)(void *ctx, u32 irq);
+
+	/*
+	 * mask/unmask a wired interrupt line.
+	 *
+	 * These are required for reliable couriering of level-triggered device
+	 * interrupts to S-mode: mask in M-mode before enqueueing, and unmask
+	 * after S-mode has cleared the device interrupt source.
+	 */
+	void (*mask)(void *ctx, u32 irq);
+	void (*unmask)(void *ctx, u32 irq);
+};
+
+/* Register the active wired interrupt provider, e.g. APLIC, via ops and ctx */
+int sbi_intc_register_provider(const struct sbi_intc_provider_ops *ops,
+			       void *ctx);
+
+/*
+ * Optional: map a IRQ number (irq) to a hardware wired IRQ (hwirq).
+ *
+ * If no explicit mapping exists, 'irq==hwirq' is assumed.
+ *
+ * This allows upper layers (e.g. VIRQ courier/emulation) to use stable irq
+ * identifiers without exposing the wired controller's hwirq numbering.
+ */
+int sbi_intc_map_irq(u32 irq, u32 hwirq);
+int sbi_intc_unmap_irq(u32 irq);
+u32 sbi_intc_irq_to_hwirq(u32 irq);
+u32 sbi_intc_hwirq_to_irq(u32 hwirq);
+
+/* Set/clear handler for a specified IRQ number */
+int sbi_intc_set_handler(u32 irq, sbi_intc_irq_handler_t handler, void *priv);
+int sbi_intc_clear_handler(u32 irq);
+
+/*
+ * Platform independent mask/unmak wrappers on top of platform registered
+ * mask/unmask ops functions.
+ */
+void sbi_intc_mask_irq(u32 irq);
+void sbi_intc_unmask_irq(u32 irq);
+
+/* External interrupt handler (for irqchip device hook 'irqchip.irq_handle') */
+int sbi_intc_handle_external_irq(void);
+
+#endif
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
