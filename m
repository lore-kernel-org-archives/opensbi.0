Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9417ECA1007
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zypC15rwwee7xt4DZ/xbrNaP7yfzHif8qyfOo6adiK8=; b=zyMpsQo4uMZaym
	bfXrmXO+YKouDREYspV3UKwn/8zku8dnTXfO9712mPvYkeotasP6dTs7GQXxOtpQHtx384FEMHPxW
	W1PDsZs2kyfMsEQ1TwFUIUT66RXf6G53FZRan1OnPL3LpPUOVrZ5RB7dP17phFWa/aKYeoyYIlbhm
	/M49nKalwTfYLlNG2vIsEdMi2bXHiVyXnFArDXzGTZLTU/A2d9kYsEpEPEkcIgXJ+T5EyIkfcA71k
	N5ZYgAgqdfRK3MWLeNNuhZ+Er8GgEDBhHthAOYLkcHZ7uwvHYQgb9qmcCr2nO1CR5g1zYM2joWbt+
	cJGUegarrx6FzMg7NnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthP3-00000004pym-0XTD;
	Wed, 03 Sep 2025 06:55:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthM7-00000004oFS-2wDX
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 06:52:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-244580523a0so62940835ad.1
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756882351; x=1757487151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwH5r0v6pFA/mb6c68eME3oitCNUCefT4bAE/SL9Z5Y=;
        b=GCNwUfz77D6wykJXrQCBZLMAj45I06jnlIK4pqW/bA9A4T5TWVkx6tQeYfDxMCz/yG
         0wZX29lN/IXzNFAOr0GDisa99m4DuwvoQ6iOJy1pjjg903jlStQTud8RRKfaEUBia/VW
         Y8pT8fyN3ly/Fli2aTwchVrlR8Zuad3I66B0u9RqUiMBlDGv3ZrNa6wDqrXa5ZgJgMSg
         pkAEn+NYhOWAMnv+kvkzAvuxTVUKrrZ32v3Bn8OJD1xoJBq+3S5VECORhrLDb0KQ9oc7
         9Ry6wvw3Zx/A9vCNA61lAxiqSVyct2f8wZFTgzlIAXR/rb5/ThDb8aVrWPdZKQVZWTDI
         /t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882351; x=1757487151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwH5r0v6pFA/mb6c68eME3oitCNUCefT4bAE/SL9Z5Y=;
        b=npS2bfatb/GaAEpN3snFPRZQfOqyC99dQgzMPnownKTLh3MQhipJzFzv9wt0uex5qE
         yJFjiOmN1veF2z6kcOcqhjpxnh9IRJsNjxkgo1Lx5RngX7zlGnmrTdeNEWlvz2amgG5s
         xlwv4440R4WnflejprvCzhRlyYiu/dO5QMWiDzG5DS6g8BNTOehOpKwjyI8YxmbIyPMW
         3tW+0wzAzD6SyzK4azWCh7NO1sC6KEglqu35lxFgqsifhtQGSSrRH5oDAJEitk0bBwCt
         EQegYE9GF4FpvPhSgKO7wzWRqkaR1uvVMa0peX1xH4Qgu8Z9hodL/Qs7xcmohbpwbZQT
         /WBA==
X-Forwarded-Encrypted: i=1; AJvYcCUNQVEDFhBA9KInolGe/XUrSyk+0MzOD8JOCWUPm2LdvQWBPIF4bXKIHNnqi0lsCWV6Rp6m56/0@lists.infradead.org
X-Gm-Message-State: AOJu0YzmvtG1kDGpmqkkCzWKCCTglkQ/u9ePKzsqjHVUyzQ+2fMSVhZ8
	TKBJd4kTTSuSbBhIwgTr9N9GgALAmXNqisaM/fMKHV6eNB9FrDyd4QeN/OqjzVgwsV4=
X-Gm-Gg: ASbGncs0rYTb9I0kwY8wMRqitE02NVAJkMywX6O++wbi7so/cfVfz3cNssR0k9yees7
	NjltcfkaL72jYdqKuala0YhgMtwpNnS7LCPu4Ps435fYKt8DAaC7U+/xWD6s06BiammmfvzYUFc
	PvWNtuqcdaX/T86AyHgcKOpr8Q08XVVJGEmv0xjngQfgzDZFdVopCjI3kuxEM3m7elYOYgld/y/
	a02mgXLmt+/A0RNtU0A3ePAi/e0WHkWIfufyTSl1B6vmpLbRvbhThgQc0eyy20X4kGQfUrB7zMG
	yWuQTxzuDxfh52BQ2Dp7NeGLxH1oehtdyhxBmGkVzfh5juBwQ9fc9SzuGBfS37P4aWDDzAw3bro
	8iPD9eHvbjMueyNZdvKJrKaWUPO3IkQorQpSOmGsNlMf+ps1l2faIMTrW22cGLQ==
X-Google-Smtp-Source: AGHT+IHGHreFPajwoub8idCZNteUKyeUBfpnGuKSAeZsz3Ymz9MsAgSER1jmdVLcTQRkS6bEogI7SA==
X-Received: by 2002:a17:903:380f:b0:246:de71:1839 with SMTP id d9443c01a7336-24944b64760mr187649145ad.50.1756882350731;
        Tue, 02 Sep 2025 23:52:30 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b905689d1sm25984655ad.64.2025.09.02.23.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 23:52:30 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 1/3] lib: sbi: Introduce IPI device rating
Date: Wed,  3 Sep 2025 12:22:18 +0530
Message-ID: <20250903065220.456955-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903065220.456955-1-apatel@ventanamicro.com>
References: <20250903065220.456955-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_235231_743922_2B8F5A29 
X-CRM114-Status: GOOD (  20.49  )
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

A platform can have multiple IPI devices (such as ACLINT MSWI,
AIA IMSIC, etc). Currently, OpenSBI rely on platform calling
the sbi_ipi_set_device() function in correct order and prefer
the first avaiable IPI device which is fragile.

Instead of the above, introdcue IPI device rating and prefer
the highest rated IPI device. This further allows extending
the sbi_ipi_raw_clear() to clear all available IPI devices.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ipi.h        |  5 ++++-
 lib/sbi/sbi_init.c           |  2 +-
 lib/sbi/sbi_ipi.c            | 41 ++++++++++++++++++++++++++++++------
 lib/utils/ipi/aclint_mswi.c  |  1 +
 lib/utils/ipi/andes_plicsw.c |  1 +
 lib/utils/irqchip/imsic.c    |  1 +
 6 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index 62d61304..620a95cf 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -23,6 +23,9 @@ struct sbi_ipi_device {
 	/** Name of the IPI device */
 	char name[32];
 
+	/** Ratings of the IPI device (higher is better) */
+	unsigned long rating;
+
 	/** Send IPI to a target HART index */
 	void (*ipi_send)(u32 hart_index);
 
@@ -87,7 +90,7 @@ void sbi_ipi_process(void);
 
 int sbi_ipi_raw_send(u32 hartindex);
 
-void sbi_ipi_raw_clear(void);
+void sbi_ipi_raw_clear(bool all_devices);
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void);
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 84a63748..663b486b 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -507,7 +507,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 	if (hstate == SBI_HSM_STATE_SUSPENDED) {
 		init_warm_resume(scratch, hartid);
 	} else {
-		sbi_ipi_raw_clear();
+		sbi_ipi_raw_clear(true);
 		init_warm_startup(scratch, hartid);
 	}
 }
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 2de459b0..d7ba1902 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -15,9 +15,11 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_init.h>
 #include <sbi/sbi_ipi.h>
+#include <sbi/sbi_list.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_string.h>
@@ -32,8 +34,14 @@ _Static_assert(
 	"type of sbi_ipi_data.ipi_type has changed, please redefine SBI_IPI_EVENT_MAX"
 	);
 
+struct sbi_ipi_device_node {
+	struct sbi_dlist head;
+	const struct sbi_ipi_device *dev;
+};
+
 static unsigned long ipi_data_off;
 static const struct sbi_ipi_device *ipi_dev = NULL;
+static SBI_LIST_HEAD(ipi_dev_node_list);
 static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
 
 static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
@@ -248,7 +256,7 @@ void sbi_ipi_process(void)
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
-	sbi_ipi_raw_clear();
+	sbi_ipi_raw_clear(false);
 
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
@@ -283,10 +291,19 @@ int sbi_ipi_raw_send(u32 hartindex)
 	return 0;
 }
 
-void sbi_ipi_raw_clear(void)
+void sbi_ipi_raw_clear(bool all_devices)
 {
-	if (ipi_dev && ipi_dev->ipi_clear)
-		ipi_dev->ipi_clear();
+	struct sbi_ipi_device_node *entry;
+
+	if (all_devices) {
+		sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
+			if (entry->dev->ipi_clear)
+				entry->dev->ipi_clear();
+		}
+	} else {
+		if (ipi_dev && ipi_dev->ipi_clear)
+			ipi_dev->ipi_clear();
+	}
 
 	/*
 	 * Ensure that memory or MMIO writes after this
@@ -307,10 +324,20 @@ const struct sbi_ipi_device *sbi_ipi_get_device(void)
 
 void sbi_ipi_set_device(const struct sbi_ipi_device *dev)
 {
-	if (!dev || ipi_dev)
+	struct sbi_ipi_device_node *entry;
+
+	if (!dev)
+		return;
+
+	entry = sbi_zalloc(sizeof(*entry));
+	if (!entry)
 		return;
+	SBI_INIT_LIST_HEAD(&entry->head);
+	entry->dev = dev;
+	sbi_list_add_tail(&entry->head, &ipi_dev_node_list);
 
-	ipi_dev = dev;
+	if (!ipi_dev || ipi_dev->rating < dev->rating)
+		ipi_dev = dev;
 }
 
 int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
@@ -347,7 +374,7 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
 	ipi_data->ipi_type = 0x00;
 
 	/* Clear any pending IPIs for the current hart */
-	sbi_ipi_raw_clear();
+	sbi_ipi_raw_clear(true);
 
 	/* Enable software interrupts */
 	csr_set(CSR_MIE, MIP_MSIP);
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 9e55078a..23510551 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -62,6 +62,7 @@ static void mswi_ipi_clear(void)
 
 static struct sbi_ipi_device aclint_mswi = {
 	.name = "aclint-mswi",
+	.rating = 100,
 	.ipi_send = mswi_ipi_send,
 	.ipi_clear = mswi_ipi_clear
 };
diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index 5d085d85..000fe9fd 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -61,6 +61,7 @@ static void plicsw_ipi_clear(void)
 
 static struct sbi_ipi_device plicsw_ipi = {
 	.name      = "andes_plicsw",
+	.rating    = 200,
 	.ipi_send  = plicsw_ipi_send,
 	.ipi_clear = plicsw_ipi_clear
 };
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 057b9fa7..3c150c37 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -199,6 +199,7 @@ static void imsic_ipi_send(u32 hart_index)
 
 static struct sbi_ipi_device imsic_ipi_device = {
 	.name		= "aia-imsic",
+	.rating		= 300,
 	.ipi_send	= imsic_ipi_send
 };
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
