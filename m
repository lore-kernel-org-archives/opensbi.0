Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED9BCD342F
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWh+jPLDo1C8OO+ZnKOOeXqj1yuTNKfEZyduju22OV4=; b=45DSamSapJJLc8
	g+XXbF+6NYvqS7XFE6w4d6uTcWqoko+w5j+EFzBSjVzUbDbnafZVbCpJVrDaVKrO7vkqsl22FsBPr
	w7Ocbgyl97ljEftIT/8JFjZxgf5TBgwrdKk1Em9OTxOtX00+XGGewB2+JOpkMOReyw6f65yIPVu3i
	wu5fvtzOqiZu8xn7bbTghfVCowsZ+pq280ToAJ078fIYh3MHS0q3CFuuzGtHs7hOMmHRl3E/40ebG
	0v82B4NuIjr15tWis9qzAQlMh6v7i4ruG+63ctpqv11glfUgVWwTDvQ1rCAtrVF8n9c387hJlWLjY
	VMspUhLV9Ec8QbHECFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwrn-0000000Do1C-0sqb;
	Mon, 04 May 2026 17:13:59 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwrk-0000000Do0P-0vNL
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 17:13:57 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-506a6cf8242so31542781cf.1
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 10:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777914835; x=1778519635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFaMmgwjrsy5U8HvY0ktvxMU7qArSdQGKJmR+y2FugY=;
        b=Thv+djctHCtEzR5SpMI5W+4DXCD/WqYOcml+OYm1HXVUWVzOP8CAZZUWy7Tve3Bk4t
         zZx/IwG9npdtOVKKxtNGLSNY0N/14RzfeYTMf6y9viH6uUsFpdJgcGUQsRf8dj374muX
         GZXo9X7tfzVNCkkz5crmfMtoOK7LdhjhXIiiNuJ+/pgqcTX7EkcNJ+gsv0kqDCLgoUqx
         sAEwqkGjbGA9WKjwuaG8EiB1ASdQUT2nCPUZpXGM0oLGulZK0WbVhZ9dG2pnWFgY2Ura
         O7Fx51RC/dtS7YfvJe745Me73phsFS3okijt5+4Q5d7qiylhtMmooIm49MWzE8JFIw2f
         e0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914835; x=1778519635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFaMmgwjrsy5U8HvY0ktvxMU7qArSdQGKJmR+y2FugY=;
        b=gZQPDPOLzHOTOs0bLSTBlGXWCi83sKLswnwLufJjApLJDA86RxZ+p0YSq9cdr50tPP
         rLqmHHHwiBROnZA2hcyn5ZySdimAD2jTY6qIfaG1XYKR0ywkmR6ggpTb2r74c0ezvdtV
         30MJj6UYZwzN0cFkgu4gIsReDEdeQFXUhVbluL3YEeBY87XWqPZpe0pQOPHoyBq+xk77
         30AiIJsK3XILvrZNAnJRRy6EkliWoSBEGzhSoAlCbXaRh9CJ3rNOob+iVscnxLbj1t3c
         YK08jNC9OgBuAJc6ieq6P3Zzhn3KBnDMTqKMDj4HN0zlk1YK4K9MW3Wn0kjC0vGpde+P
         T7OA==
X-Gm-Message-State: AOJu0YyWrMdbDGtoezNuNL7F/D8ys/m4cujIHYljv95ForVHCNgbA1RC
	4dI31jjMpAjUlpcyTAwe/OwkGUoogSi5vRYRmKfdueNey82unZXVMDiaDpsqMkRJ
X-Gm-Gg: AeBDievG5+T8DkRBp8MmkXuIvy6A8A4MjxwAAFOcakSiXEjlNv0rVMsc58VZY0pxZih
	6eqvSTxlqJFbjBD7OfGtP55Ix64kBmDHz8kC7rG4tAoP4oijZgXyUNjnCjOY9H2YU7WC20vIB/b
	1BAdkFsB2lA1kWueH/kilhy/Vw4Igg6F5o7V76M5eQxsJwu+AKmxuflybHTfCnvbpZKQYfqLtJK
	5y+/O/ZpjfkYV5yiKzXVR3JnJLDf8n8JJnuFfOcAZXz4DysYWm4ohfNQt0W5dKGOclM+rOoJFP4
	n5KKewfJYbzXdxC8nwTX8rm/WLAS5zAeDMxP9SyPM3V3zwrTHUFscd2nP22f0y5wvl+e8Kbw6Nr
	RA8OurZ/tLuAlaBxKAaQkFBlnwUshdil7SKhoTnbN/cC8QVWs7npAi1nWGHgQ9tBwDeW8gRj8e6
	kPvFkGuB871SLsHnHyXFidzdEAvGKHVv7729HCEojA1kyn4QuXYJsB1GbP46qLgP47MGWBdfzQE
	njA7t4O6XrtviwUxsBP0A==
X-Received: by 2002:a05:622a:2608:b0:50e:2b1e:9d14 with SMTP id d75a77b69052e-5104bf0a3d3mr158482811cf.29.1777914834669;
        Mon, 04 May 2026 10:13:54 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040927789sm102332871cf.11.2026.05.04.10.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:13:54 -0700 (PDT)
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
Subject: [PATCH v2 2/3] [NOT-FOR-UPSTREAM] lib: utils: irqchip: add QEMU virt test for APLIC wired IRQs
Date: Mon,  4 May 2026 13:13:41 -0400
Message-Id: <20260504171342.1655882-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260504171342.1655882-1-raymondmaoca@gmail.com>
References: <20260504171342.1655882-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_101356_285408_4B6DD05C 
X-CRM114-Status: GOOD (  16.35  )
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

Add a QEMU virt specific test hook for validating APLIC wired external
interrupt handling.

When APLIC_QEMU_WIRED_TEST is enabled, keep the test path limited to
hwirq 10 and only register it when the current APLIC instance is the
M-mode direct-mode provider and that interrupt is not delegated to a
child domain.
This keeps the test path compatible with the generic APLIC changes
while still allowing a DT overlay to expose an M-mode wired IRQ on
QEMU virt.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 Makefile                  |  3 ++
 lib/utils/irqchip/aplic.c | 62 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/Makefile b/Makefile
index 46541063..418ee1aa 100644
--- a/Makefile
+++ b/Makefile
@@ -399,6 +399,9 @@ CFLAGS		+=	$(GENFLAGS)
 CFLAGS		+=	$(platform-cflags-y)
 CFLAGS		+=	-fPIE -pie
 CFLAGS		+=	$(firmware-cflags-y)
+ifeq ($(APLIC_QEMU_WIRED_TEST),y)
+CFLAGS		+=	-DAPLIC_QEMU_WIRED_TEST
+endif
 
 CPPFLAGS	+=	$(GENFLAGS)
 CPPFLAGS	+=	$(platform-cppflags-y)
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 3f4991b5..82efdb71 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -112,6 +112,7 @@
 #define APLIC_DEFAULT_PRIORITY		1
 #define APLIC_DISABLE_IDELIVERY		0
 #define APLIC_ENABLE_IDELIVERY		1
+#define APLIC_QEMU_TEST_HWIRQ		10
 #define APLIC_DISABLE_ITHRESHOLD	1
 #define APLIC_ENABLE_ITHRESHOLD		0
 
@@ -119,6 +120,41 @@ static SBI_LIST_HEAD(aplic_list);
 static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
 				void *msicfgaddr, void *msicfgaddrH);
 
+#ifdef APLIC_QEMU_WIRED_TEST
+
+#define UART_QEMU_MMIO 0x10000000UL
+
+static void aplic_test_uart_handler(void)
+{
+	volatile u8 *uart = (volatile u8 *)UART_QEMU_MMIO;
+
+	/* Drain RX FIFO to clear the interrupt source */
+	while (uart[0x05] & 0x01) {        /* LSR.DR */
+		u8 ch = uart[0x00];            /* RBR */
+
+		sbi_printf("[APLIC TEST] UART got '%c'(0x%02x)\n",
+			   (ch >= 32 && ch < 127) ? ch : '.', ch);
+	}
+
+	/* (Optional) read IIR to acknowledge on some models */
+	(void)uart[0x02]; /* IIR is at offset 2 when DLAB=0; */
+}
+
+static void aplic_hwirq_test_run(unsigned long aplic_addr)
+{
+	volatile u8 *uart = (volatile u8 *)UART_QEMU_MMIO;
+
+	/* UART: enable RX interrupt */
+	uart[0x02] = 0x07;          /* FCR enable+clear */
+	uart[0x04] |= (1 << 3);     /* MCR.OUT2 */
+	uart[0x01] |= 0x01;         /* IER.ERBFI */
+	while (uart[0x05] & 0x01)   /* drain */
+		(void)uart[0x00];
+
+	sbi_printf("[APLIC TEST] Setup done. Type keys now.\n");
+}
+#endif
+
 static void aplic_init(struct aplic_data *aplic)
 {
 	struct aplic_delegate_data *deleg;
@@ -245,6 +281,20 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 	return 0;
 }
 
+#ifdef APLIC_QEMU_WIRED_TEST
+static int aplic_hwirq_handler(u32 hwirq, void *opaque)
+{
+	(void)opaque;
+
+	sbi_printf("[APLIC] Enter registered hwirq %u raw handler callback\n",
+		   hwirq);
+
+	if (hwirq == 10)
+		aplic_test_uart_handler();
+
+	return SBI_OK;
+}
+#endif
 static inline void *aplic_idc_base(unsigned long aplic_addr, u32 idc_index)
 {
 	return (void *)(aplic_addr + APLIC_IDC_BASE +
@@ -541,6 +591,18 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 
 	/* Attach to the aplic list */
 	sbi_list_add_tail(&aplic->node, &aplic_list);
+#ifdef APLIC_QEMU_WIRED_TEST
+	if (aplic_mmode_direct(aplic) &&
+	    !aplic_hwirq_delegated(aplic, APLIC_QEMU_TEST_HWIRQ)) {
+		rc = sbi_irqchip_register_handler(&aplic->irqchip,
+						  APLIC_QEMU_TEST_HWIRQ, 1,
+						  aplic_hwirq_handler, NULL);
+		if (rc)
+			return rc;
 
+		/* Enable test in M-mode before jumping to any payload */
+		aplic_hwirq_test_run(aplic->addr);
+	}
+#endif
 	return 0;
 }
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
