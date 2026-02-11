Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4239ECD6EE
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 22:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ny5JE7PMlfOxlIbx2ZHeN8LYMA8Hvad+eDc63pUL4Lg=; b=Brx2AcUhc/qRGM
	yWEmveCqCPutJ1/6Uw+m35D6DFb/h7Xs4FQnfCrPm6W9LsDMUZ5nhac8FOUfYWCOUv/yDjRwFj3im
	TVy8EESAxETgaqZRBp2ac9CesY5++9nA2u5/AggN6vZROfOidFTqFejP83DQ5SgV4ELVafd5ppV5z
	SKIsTDjjZ2BDVnIZUkzhUB7tFhsiX95xhXnzpNR7+AQfs5W9kcktPpIbUZbY1eXxywoNMp9gfTnWR
	BvJTTwXDB5rs2OU4dMG0TI1ZATyQuA5Q08NT/Mgv6I82LFqtDNSxW/ik5oprpCYRJai8YLs9kaZNb
	cCOTekJWZQZACUyq4MMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIZk-000000017z3-2wHj;
	Wed, 11 Feb 2026 22:20:48 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIZh-000000017xS-2spn
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 22:20:46 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-502b0aa36feso13098981cf.1
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 14:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770848444; x=1771453244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO+nLo11wYgJTO3maeIxIIiwI1yITzUy0ZU2IpQfYLw=;
        b=eayG/RVGpc1q+NRCf8bpDy3a33ykAMHrGZtqr9aljbrwalpzSbBipPdZytVToYXaW0
         8PDgwBdzhpHATAi122ZHm9Ztsb2cf/AuMXBlx4GMLW2vbfiQBf9l74eqZ/7Li4jKbGrM
         G1B6FtVyFvtRG5AbmKvexxzq0EAhYV2OV7Y91iKsstfL0rJDrHOH/9QdwL49M0ceC3jd
         uEL9PgwbDR0yxn0PERelqDs6bEBWWsXof4Iw8B0EydaOhnKzHKRXjKjb21QtprGhcJUu
         am/Jx9CYauENV62+wT7dxMOvvXnH8Qqg4uXa2P2f26MVzOCvxr+RmrMwpMajZQFyGr5Q
         5qNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770848444; x=1771453244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tO+nLo11wYgJTO3maeIxIIiwI1yITzUy0ZU2IpQfYLw=;
        b=eRgYxN/LjHkAkKcYpwq4/hPR5L5Qqe4UxJgCLJwZFB4pn25/KOmo0obsZSj1qrRgsW
         TLBO7AYbkTakrKGhZLSgowPCQm8oW2EGsBip6QAp7+KVIYFA89P4GNZUBmrofZgy7G+V
         09ybQtrtKdAaEy2Zr6VpUzsBgCBoPdhHY0zX08F9jlLZCeks91rFHS35/Su4E0GD+col
         4BowhjhBtSMr+cRypv+aVSuk2iKYkH2iO/DWfh/EYBQtzaDpIdGvIXfacaECmA2nakGT
         Rt0s3Jahmp41ChHkkYJUmNLrxT+cHtMuLkHoogzsVKQ0+MzmnWi+duujbpaQp9ZBnYK3
         THKA==
X-Gm-Message-State: AOJu0YxLdwvq9l1vYqeQsm9Uj7WfGd8r+GQABKvlgRKASB+/aPkTd9M0
	jITQEG+rLMl9KE1aq1WfKP5IMRoAxPoA7K9hmTejiBBE5EuCogzN7hgCSiStQA==
X-Gm-Gg: AZuq6aL3uxjgHzMU3NAV9Aq2CJQPylVgEW17b5cl/VgHDXGvJ3etnfVZGf8P1DnwwV4
	Kvl4ThOyvSnZ9ZwlC3956Jqog32+hmDqTdIrsvIxQduKMYV+bkBtLsGmNQDLQEOEx4kwaPlhDy6
	rUIVBuQdgVyiSvOIe9WFDVaKMNZc3Gk/bhlINpjtodATyucpMYFmNDKXhVYyNtfohgRgKnz8bnQ
	P4v2aKQPTf3CSlFbgRe2UYpgmgXpnn1/oMK9djq3Cd8ZuaK4An5n8To6O3hPoTqvRkkjZfVIk7D
	cKga9k8abTsA0cH1D4xMs0ikTDbVCXuy2KQpntPiKelC0o5ypZtaesjL6kR7KSEoOD42+W6sAT2
	+d+5LxPGaUMagGxdPQEiUhPzgue+3BtdrwGefguZ44ew0GEwvpTb/n04qRY6McRQbTX5FJucWQa
	AGeInzilKvD+soJdGRCSwJlSxU0ZTrBUu/RHxyGaMa49gMLQckuChx4qVMNXyowAYjXz8l3OGJ+
	+3ITPOo6bQ4BTurQkyYZA==
X-Received: by 2002:a05:622a:654:b0:502:ec9e:ded6 with SMTP id d75a77b69052e-506934f4a5cmr7404331cf.38.1770848444276;
        Wed, 11 Feb 2026 14:20:44 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b6b576sm22824291cf.21.2026.02.11.14.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 14:20:44 -0800 (PST)
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
Subject: [PATCH 3/3][NOT-FOR-UPSTREAM] lib: utils: irqchip: add QEMU virt test for APLIC wired IRQs
Date: Wed, 11 Feb 2026 17:20:25 -0500
Message-Id: <20260211222025.2463312-4-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260211222025.2463312-1-raymondmaoca@gmail.com>
References: <20260211222025.2463312-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_142045_737730_69076FC2 
X-CRM114-Status: GOOD (  13.78  )
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

Add a QEMU virt specific test for APLIC wired external interrupt
handling.
When APLIC_QEMU_WIRED_TEST is enabled, this adds a small test hook as
a bring-up aid for validating the wired interrupt path.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 Makefile                  |  3 +++
 lib/utils/irqchip/aplic.c | 44 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

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
index f0ecef42..63697e14 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -119,6 +119,41 @@ static SBI_LIST_HEAD(aplic_list);
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
@@ -245,6 +280,7 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 	return 0;
 }
 
+#ifdef APLIC_QEMU_WIRED_TEST
 static int aplic_hwirq_handler(u32 hwirq, void *opaque)
 {
 	(void)opaque;
@@ -252,8 +288,12 @@ static int aplic_hwirq_handler(u32 hwirq, void *opaque)
 	sbi_printf("[APLIC] Enter registered hwirq %u raw handler callback\n",
 		   hwirq);
 
+	if (hwirq == 10)
+		aplic_test_uart_handler();
+
 	return SBI_OK;
 }
+#endif
 
 static inline void *aplic_idc_base(unsigned long aplic_addr, u32 idc_index)
 {
@@ -501,10 +541,14 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 
 	/* Attach to the aplic list */
 	sbi_list_add_tail(&aplic->node, &aplic_list);
+#ifdef APLIC_QEMU_WIRED_TEST
 	rc = sbi_irqchip_register_handler(&aplic->irqchip, 1, aplic->num_source,
 					  aplic_hwirq_handler, NULL);
 	if (rc)
 		return rc;
 
+	/* Enable test in M-mode before jumping to any payload */
+	aplic_hwirq_test_run(aplic->addr);
+#endif
 	return 0;
 }
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
