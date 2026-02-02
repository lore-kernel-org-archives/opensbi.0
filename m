Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33104E7DEF3
	for <opensbi@archiver.kernel.org>; Mon,  2 Feb 2026 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XedUzdEJubOy8rVlUxP/N7K6eq4yB5whj8sSD44yrHk=; b=2CAqRt1b39O2bc
	fQA5CUGCw4M/Tj2FWpYVcJF7wLYDNxmYV3TRf4JBkBcCM9QR7uSe8ZvqCg4BSaFly8/P9OeSfkdy9
	W3kMvcZRwOahgSQsLRyc9ZThcuGcCrXGNHY8PJFDq3ByPXO4JcWhJTdiK4I+rL+xdyxwARagi6zZp
	DiAgFb+ZNl8KSZSRwIJtX8B6pZ95MzfusZ7UCK1j6RKlYv/B2gKQgA77rv2wDJ1Z132t+iR//CIaw
	6HDm4090ObR4kkCf3r8T/5l8twKN1/U4FeEhoIHesh3/X9xXa1geHK1Nadh4eCe/SpuvNACCZb/ej
	dJ7glmtHAxB2RrbL1Ueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvRd-0000000599k-2w2s;
	Mon, 02 Feb 2026 15:02:29 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvRb-0000000598X-1xpH
	for opensbi@lists.infradead.org;
	Mon, 02 Feb 2026 15:02:28 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8c52c67f64cso422343285a.0
        for <opensbi@lists.infradead.org>; Mon, 02 Feb 2026 07:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770044546; x=1770649346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96fx/if3KBdNkYNngC/x3gbZIUymJ+QehFRt/VrY2YA=;
        b=iaKzHUch48cF8gx+XIX3kL00AKouUPPXt+jf0S/SohjIgDWZF8pGHQfIxVu2wE2FAm
         u1VeWKjnNCDkWopy3VIwuo4dNUCpfcXTlqY3E8yqW+yHM+Pd1iTYOuH3byQszQQwlbG0
         Xecl1sVwDI7Ocxhm45Vuf+OxwijncgLT3zIzutjzIpmQaadB8wO4zTUnQBHcBbHPhyxW
         HhZTMFeYLzQuEpRy5HXamS2zTk++QRhkqf9ALU5rUGTi2cDdzJTXlQJ320oLv4ZFJ/0o
         UPt5eB2jPRml0ffEGlZRPIUTqU0Hn+oTS4RVuz+q1t8ZuKdpNvn/Ulw005CQtPL/G4V8
         FFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044546; x=1770649346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96fx/if3KBdNkYNngC/x3gbZIUymJ+QehFRt/VrY2YA=;
        b=TbXQJ6kaHQYHXl6mdOLUg5Sj05b56wVC8LERGZXsWS9t19b8NsrueV1SJ+sSan8Nwv
         Vew0EBpqtMkqgQCKZ3QBTpkHxrI6h/xy7Gvp7asCwMOzZ1C4ETI1U3/uDnM180n4T37W
         +iyTqZhPudNdnCT6bBRQxhMXDPUoc/btXLNXv4rYf7CSm5EVVoUABaPmoy+zj0A79At2
         xOnHvfL2+1mhJCKrirtu6APO69+fQtADg61LoM1u7eqA3oasaJzhz38Aoh3EtT534caX
         S6PSueZ5ObBjqdMAVOD/5t1UusS8toWseVi3A69myp0aK/M8C0YLFA4eKzWv6F1tCUzu
         92gg==
X-Gm-Message-State: AOJu0YyqRR1EuS2kfHN/tcSAhQbSvzgLkSqP2lbbnPiua2MCUIZbrm7p
	7lG+M1BegYa5cRoSIQbzsCxvnl9kTB7+NFNHznq+/6kDyLAdT3rytr4q0l89TQ==
X-Gm-Gg: AZuq6aLyP6Fu9dYpEBAqHtNq8YP6SZYq1KbvnLcAg1uPQjoDNCzwdk68LcpN/7knNtO
	nMj4yK7G0i193lEzNlvbmvaLwHVCNTYgbhA90PFtxVT014GH5ex/eTYtsnGF6v1jvUWhPJvyAPB
	lTGx2ePq4lO4eWO+4hgOVjQ9rzlAT3NwM+JOowL9kR/Pi3p82eKRIz4RKPPFe6kat5gnlkcFcH9
	ZIpdKc+fzVeiBst9s+3l8Ed01YsHY2WvQswQNoka1+sk5vsrECoAUdfHNLPswXqwInPpPwjeqKz
	aMvGY8jg90dJLWJRaOa9ADjfQQcUf99b+oK4TDss8X/Ho5ckT5MdRfm42JLb/FHHE0diMU/UtHm
	cV7XWCz/3A/TFRHW9uMUq70g56YlnonePZ3UyXHsgpnTfGr42HPrPNT6rUEjFy3/xt7OG9GMWmt
	/N6ptJXGpYk8mWPZKr9so2qQTqTkEDnwMJgiC8raWXCp74HMLVknQbshHMZCibnyRoeNCuBd6LB
	e72vm8k9w==
X-Received: by 2002:a05:620a:1a8c:b0:8c5:3574:90a7 with SMTP id af79cd13be357-8c9eb338bd5mr1448039685a.80.1770044545505;
        Mon, 02 Feb 2026 07:02:25 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c71b29f796sm1136907485a.22.2026.02.02.07.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:02:25 -0800 (PST)
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
Subject: [PATCH v2 2/2] lib: sbi: Add VIRQ interrupt abstraction
Date: Mon,  2 Feb 2026 10:02:07 -0500
Message-Id: <20260202150207.1331811-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202150207.1331811-1-raymondmaoca@gmail.com>
References: <20260202150207.1331811-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_070227_547410_B4B1AA6B 
X-CRM114-Status: GOOD (  15.31  )
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

VIRQ (Virtual IRQ) layer is on top of irqchip, providing IRQ state
management via per-(domain,hart) IRQ pending queue, with courier
dispatching and interface to enqueue/pop/complete an IRQ.
It dispatches claimed wired interrupts to S-Mode domains via SSE
injection on current hart.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_virq.h | 90 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 include/sbi/sbi_virq.h

diff --git a/include/sbi/sbi_virq.h b/include/sbi/sbi_virq.h
new file mode 100644
index 00000000..1760d9b5
--- /dev/null
+++ b/include/sbi/sbi_virq.h
@@ -0,0 +1,90 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __SBI_VIRQ_H__
+#define __SBI_VIRQ_H__
+
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_types.h>
+
+/*
+ * Keep the queue small for bring-up. If it overflows, we drop and warn.
+ */
+#define SBI_VIRQ_QSIZE  32
+
+/* per-(domain,hart) IRQ state */
+struct sbi_domain_virq_state {
+	spinlock_t lock;
+	u32 head;
+	u32 tail;
+	/* pending IRQ queue */
+	u32 q[SBI_VIRQ_QSIZE];
+};
+
+/* Per-domain VIRQ context */
+struct sbi_domain_virq_priv {
+	/* harts number of the domain */
+	u32 nharts;
+	/* IRQ states of all harts of the domain */
+	struct sbi_domain_virq_state st[];
+};
+
+struct sbi_virq_courier_priv {
+	struct sbi_domain *dom;
+	u32 virq;
+};
+
+/* Enqueue an interrupt (as seen by the generic irqchip layer) for a domain. */
+int sbi_virq_enqueue(struct sbi_domain *dom, u32 irq);
+
+/*
+ * Complete a previously couriered irq for the current domain.
+ *
+ * This will unmask the interrupt line at the active irqchip provider, allowing
+ * further interrupts once S-mode has cleared the device interrupt source.
+ */
+void sbi_virq_complete_thishart(u32 irq);
+
+/* Pop next pending irq for current domain on this hart. Returns 0 if none. */
+u32 sbi_virq_pop_thishart(void);
+
+/*
+ * Courier handler for wired irqchip dispatch.
+ *
+ * Intended usage:
+ *   sbi_irqchip_set_handler(hwirq, sbi_virq_courier_handler, dom);
+ *
+ * It will enqueue (irq) for the provided domain and inject SSE on the
+ * current hart to notify S-mode.
+ */
+int sbi_virq_courier_handler(void *priv);
+
+/*
+ * Bind helper function: bind a given irq and register the courier handler
+ * for a domain.
+ */
+int sbi_virq_bind_irq_to_domain(u32 irq, struct sbi_domain *dom);
+
+/* Initialize per-domain virq state (alloc + lock init). */
+int sbi_virq_domain_init(struct sbi_domain *dom);
+
+
+/*
+ * Optional: map a virtual IRQ number (virq) to a hardware wired IRQ (hwirq).
+ *
+ * If no explicit mapping exists, 'virq==hwirq' is assumed.
+ *
+ * This allows upper layers (e.g. VIRQ courier/emulation) to use stable virq
+ * identifiers without exposing the wired controller's hwirq numbering.
+ */
+int sbi_virq_map_irq(u32 virq, u32 hwirq);
+int sbi_virq_unmap_irq(u32 virq);
+u32 sbi_virq_irq_to_hwirq(u32 virq);
+u32 sbi_virq_hwirq_to_irq(u32 hwirq);
+
+#endif
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
