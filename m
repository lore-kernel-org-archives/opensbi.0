Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C75D34081
	for <opensbi@archiver.kernel.org>; Tue, 27 Jan 2026 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Epkb8g27uQpjC3vQk/BHHJECNRX1vqbPICiNcAeXOw=; b=YjG9ILV5NDXWeY
	/9oQ6VBxsVoht7LH1vfdTevTGFCRthGLuG7T5hPwjAmDSCGixvgS7qEn0hHnVKlGjkEW5njw/u/PH
	FsSPiXVYDbgK1pO0LsgvGKgtSz25+7FdhBvh2XgsETUMH6okqOjlcgRAG73qFcf42PQndowYxykPd
	VXZYYHSmhvGUGbjA6jkPMGYzH8dFnT2TQP7t3KtaQvKF/VJeZwiVE3qPjGpxyQEdLO/BSD9WNuAIp
	5eA9FhN5ekidt+qEu3pXUJYxnnwZfh2wUHD8RI21izzdG/IMIatv4AdbNk0HjU8joUDLJHF7n2lSc
	6MlyFMC/JtSqqmcWUhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkvA-0000000EXjG-1tJW;
	Tue, 27 Jan 2026 15:24:00 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkv7-0000000EXht-45v1
	for opensbi@lists.infradead.org;
	Tue, 27 Jan 2026 15:23:59 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-502a98c66f7so49503831cf.1
        for <opensbi@lists.infradead.org>; Tue, 27 Jan 2026 07:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769527436; x=1770132236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEBzrx2XARYMD62ZOAaYMWKuhU+q4TGpeGKCWVjRu7s=;
        b=WBQdXrqOO0Sh+jc/1XloDlDjp2/qFCHVhVAs64/v1mo6L4f8GbYZyUBqxG57ZPxtxa
         q+iyKGQi61lv20fstzCDJAEY1X+LXVvwZpdd5D+qrX2UV5f5Z8H2ROqSTI8pNErYJYPL
         E0k46AUAaoCnhudJy0xdd8lpr+O+1UcI0vEW6x5tHeTjXAXUNQ1p7ID/iMJl683wQZrc
         ZCIkWdgVQfqr6J4jmkk6TupsoRNUURMiVSepmTpQjlHNfR0RxFeF7HbV0cuG+mIJGvvJ
         cbYnB3o/hLz/gPZmoFCbyl1SCfhuDnAGuBtotMssPTxSYbCdDIZTwoW6A8wDJmsoPfGI
         Us6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527436; x=1770132236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JEBzrx2XARYMD62ZOAaYMWKuhU+q4TGpeGKCWVjRu7s=;
        b=qtkIeT08gOU3iRbnRwHB3eMyk7nMB5MG6Jqh1Aqna4k62gZ4qtdd/hVkbVF1o5j7Vs
         3h47N6MND5SVtULFdjxW7YSyzPJ1MHywfaptxtVOdcSJgDBX4/05x0T+FFeGPnOrLrqj
         bdQQJssgicE03AaDy5IqK1dwVsJZ7czPTehfSOPiAFfo9aDDmWRhkUOVKKt+h+DppO1/
         GMqeP/tJ4qiGuRDCBTe1R9qerjQfbN3KmQvP6vogmVV/ryA/znRkzZxZIPj8g/3MI0dG
         uv/TOGNtBuG/TLgSkMDKv1WETOwTRxf4ajRdiyGNasFzDLl2IuAjKZA3vF5mu5jTlNcP
         T5sA==
X-Gm-Message-State: AOJu0Ywb6SUgoRIcmisbkL36hXQsBTeEVxU6uQCrA8HRNhECsFC8/i8a
	l+mMjatqGBKL/NrqS93bjrUfxUN6139xiAyL45SHcF2lPAeefabE989u1Ulmng==
X-Gm-Gg: AZuq6aLOC1Gv1ay4NxZWSCoHwJHAmlhdsfHVWmTu7K21RNUzBtpocBLy329dBmzSFM8
	s8zj+4S0xlL7y7hMnFcnPgp1Gvy0DO4UM5QDZCrUGMUuZuz/+BY37ExrhoXCtiTJTjtY0ue6qGG
	Gw+ydLW2bG2fnGPOOIWna2Bj/steHBR6pIBcEJxx1j9DgJt6kBF9LTDqiuAfOeA3TJ5+jffBCJh
	1Humon4blCOfPgKJLNQwFbgswH10yzli6OtA1HrXzH1yGsEHGvQyAou4GSYjVh/9i2QRmiAKGzk
	RK/d62Z9Gl780snRNymAyjHhRgsGMPtuWX2E/8RnOnwAGxNoDYBuMe+QO1escaMsi/jmAs4c9xV
	jZkyxG98EQQadh/lIdQVyuR+rXJb5/6HZfHOTdmBRFQX9XLANj4Vl/NO3+Tm4AQmKfhCr5h/0Kn
	Qt4B9D1/TF7GolJ/zTkVzYNi1tr7uSc0UILCj3abGDeu2txHaQkgSXnXstMfVxqNQkcYVozFI=
X-Received: by 2002:a05:622a:115:b0:4ee:ce3:6c9d with SMTP id d75a77b69052e-5032f87cf98mr23703631cf.19.1769527436365;
        Tue, 27 Jan 2026 07:23:56 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5030032c987sm119710161cf.32.2026.01.27.07.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:23:56 -0800 (PST)
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
Subject: [RFC PATCH 2/2] lib: sbi: Add VIRQ layer
Date: Tue, 27 Jan 2026 10:23:42 -0500
Message-Id: <20260127152342.1231995-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260127152342.1231995-1-raymondmaoca@gmail.com>
References: <20260127152342.1231995-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_072358_022393_5ED0AFB9 
X-CRM114-Status: GOOD (  14.56  )
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

Add virtual wired IRQ support on top of INTC with:
- per-(domain,hart) pending IRQ queue
- IRQ state management with courier handler and enqueue/pop/complete
  interface.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 sbi_virq.h | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 sbi_virq.h

diff --git a/sbi_virq.h b/sbi_virq.h
new file mode 100644
index 00000000..7a3d3def
--- /dev/null
+++ b/sbi_virq.h
@@ -0,0 +1,71 @@
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
+/* Enqueue an interrupt (as seen by the generic INTC layer) for a domain. */
+int sbi_virq_enqueue(struct sbi_domain *dom, u32 irq);
+
+/*
+ * Complete a previously couriered irq for the current domain.
+ *
+ * This will unmask the interrupt line at the active INTC provider, allowing
+ * further interrupts once S-mode has cleared the device interrupt source.
+ */
+void sbi_virq_complete_thishart(u32 irq);
+
+/* Pop next pending irq for current domain on this hart. Returns 0 if none. */
+u32 sbi_virq_pop_thishart(void);
+
+/*
+ * Courier handler for wired INTC dispatch.
+ *
+ * Intended usage:
+ *   sbi_intc_set_handler(irq, sbi_virq_courier_handler, dom);
+ *
+ * It will enqueue (irq) for the provided domain and inject SSE on the
+ * current hart to notify S-mode.
+ */
+int sbi_virq_courier_handler(u32 irq, void *priv);
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
+#endif
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
