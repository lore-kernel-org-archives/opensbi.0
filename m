Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF77CA101C
	for <opensbi@archiver.kernel.org>; Thu,  4 Sep 2025 05:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPGlYf4mcSVMp0Rl9nzqH+6mjlHYNQVDuW1n49CWPaU=; b=mAFw2VqZAdDvMN
	Qt9e77L4wHbWbHJGKI5D1RZpR4MTRvsh9zw7yahOjIjAwAFnFs/MOr4ELoUsT+ZWy6Ehxv4kyOUh4
	REqM+8jDk80wiSQ4aFzip0reODAQf43eW1iajEZ5M3VlG2d7AWeOHP+3/B70Vk6VpSQhx0ihFSGm9
	AIl6gH0f1xv/GHFqv4tFWvtY+HX7eEl8mJetnafICgQ9cFCrVYFJDoWYhdGK/OPDrzbahHY2zoPbJ
	8Lr+QAHIKaLXOzSz0w8qh4fqQLZZpT0G9ETuZuHEFSFKLpDecKVR/DT1NnKuBujcMEIQK/3u9XaZD
	N4SNXMm30fr4TO2o7+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2SP-00000009Dtu-2S3B;
	Thu, 04 Sep 2025 05:24:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2SM-00000009DsR-30Ka
	for opensbi@lists.infradead.org;
	Thu, 04 Sep 2025 05:24:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-772679eb358so614067b3a.1
        for <opensbi@lists.infradead.org>; Wed, 03 Sep 2025 22:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756963462; x=1757568262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj24UV6ZAS4pTm3Tt2UGKIDWHrZxVrgyqAgBpDASKB0=;
        b=oBzNQktoQ4Rrwq4eFovgBEq7BVbSoFAl9DYnNWbcpwPtz/3EJXBXMsyoL7ysr0vbpN
         Ez/QCG5UfFSkdhe3Q4ipbRxkUZgdUhUVJhhMZhlIw6/TnFDX9P803nguSsQS7AYdUFeA
         oUOsdA7yI/X3uOcoYODS6kkdYTjmUoaaPxUNaRL81isw9LZE2cGRBHWDSdzwHxY3Ux1t
         hEcve40Ipef4htsTCAuIjaMEg+XHQyuofVVUJh1jWtgIdJ1BwHneYF3dnKaQtNRUY35Q
         TQjiLELw4Gp+kKYXGB/Y2Bs7/T1gvYcBNLkvpKEDNeMsJRqa3nk7WW1APBTxfXJ+S4N/
         u9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756963462; x=1757568262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gj24UV6ZAS4pTm3Tt2UGKIDWHrZxVrgyqAgBpDASKB0=;
        b=FGbZgeOk5+Kddy3wt4kjL+aA36eDOU3HS/YtcMVL/WdTpgtH/Oq2zp5FCl/V+SlRjt
         8Z7AAU3UoOj3Fq82tvgHpgNeP+Y/03TIrvYy53K14QU26OTmBQCyg78ufrpgXpJr+Wv3
         +NQ1OxiS6vEF/xPn//cH2lq98jtqc3Hi58pE2xjShycnAn568M5wS0isSGzGut+qrdTx
         essTpzIF887QGEFI4wVorcU6jEcxJ10ln95Q1kVozxp8iSoVGoCyqov3mCOZfQ2FjIB9
         Dym5ea+5DpEklDw+OBZeRnmCNeMTyHCc6WZbwMHMbtAikbYewwjFHdtCSEVbECNBdH2n
         B+dA==
X-Forwarded-Encrypted: i=1; AJvYcCW/BdwV+XwPjK2xK0qb3QFyx8fBhYt2UsANorsg8GK5rIwqp4uWTFSwXSL5l6NMQv1Jt2MMcf5E@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdip5LoK/Ialwt75VmmpsVPQ8/9rSr76fMYhYdL6OJOws2W8vG
	3XvYMRvnadL1cpUxSeHQVi7ggIXodkDmfxBLbavgMPw/617oANZdd/qq9iccteosVo4=
X-Gm-Gg: ASbGncvgTFfR7TcRyF+iIHknHvW2F0ry0Cnan+6XmGCemZS4VWtKNsZTygzguNWihk2
	LbthwGbSCKXBWFsxoo9FPOzvacCOlhxi8Iq+ndx14twml+N9cXX2KyyOL0NhCx4vaFoMzrlPbh7
	JkSFEj+XFvAvBhSGbPX80/KTf31jj3yeASi1GboP5jgjkJ2hC73Jgq7Yzqm+Ucl3+/2rD/vcPEf
	msfkRJHIcMgU4mkgiZ9XviOCBmqsy9WgnGe0dwK/dSqueKCEouLK9wKYLpv8/9ODj77MWbij8k2
	Ob+nbj285TrC8pX4RXP8t585uUOCJzRVcwDx82KWnPJ6ngXKCFBCqrKApqlAI+yjRgvqOA+XclK
	2dNz55GhSgGXP0c9oBnfI4iT3Q4KeYLkq5FBQrtfEjC92W6xI737NI2E/wpuYpKD+VkeaPa3j
X-Google-Smtp-Source: AGHT+IEowDDW4DDFSz3zjLGzULIzfhLoHpH70nAmgz5odtLyjObH8fKi7i2oiTm45yh0oN+23VjJBw==
X-Received: by 2002:a05:6a00:39a9:b0:771:58e:5b10 with SMTP id d2e1a72fcca58-7723e2534acmr17771709b3a.8.1756963461812;
        Wed, 03 Sep 2025 22:24:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772447058dbsm14251524b3a.38.2025.09.03.22.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:24:21 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>,
	Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v3 1/3] lib: sbi: Introduce IPI device rating
Date: Thu,  4 Sep 2025 10:54:08 +0530
Message-ID: <20250904052410.546818-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904052410.546818-1-apatel@ventanamicro.com>
References: <20250904052410.546818-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_222422_755075_C8A00281 
X-CRM114-Status: GOOD (  19.42  )
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

Instead of the above, introduce IPI device rating and prefer
the highest rated IPI device. This further allows extending
the sbi_ipi_raw_clear() to clear all available IPI devices.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Tested-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_ipi.h        |  7 ++++--
 lib/sbi/sbi_init.c           |  2 +-
 lib/sbi/sbi_ipi.c            | 43 +++++++++++++++++++++++++++++-------
 lib/utils/ipi/aclint_mswi.c  |  3 ++-
 lib/utils/ipi/andes_plicsw.c |  3 ++-
 lib/utils/irqchip/imsic.c    |  3 ++-
 6 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index 62d61304..26d1b66b 100644
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
 
@@ -87,11 +90,11 @@ void sbi_ipi_process(void);
 
 int sbi_ipi_raw_send(u32 hartindex);
 
-void sbi_ipi_raw_clear(void);
+void sbi_ipi_raw_clear(bool all_devices);
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void);
 
-void sbi_ipi_set_device(const struct sbi_ipi_device *dev);
+void sbi_ipi_add_device(const struct sbi_ipi_device *dev);
 
 int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot);
 
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
index 2de459b0..93018fe6 100644
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
@@ -305,12 +322,22 @@ const struct sbi_ipi_device *sbi_ipi_get_device(void)
 	return ipi_dev;
 }
 
-void sbi_ipi_set_device(const struct sbi_ipi_device *dev)
+void sbi_ipi_add_device(const struct sbi_ipi_device *dev)
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
index 9e55078a..d4acacf0 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -62,6 +62,7 @@ static void mswi_ipi_clear(void)
 
 static struct sbi_ipi_device aclint_mswi = {
 	.name = "aclint-mswi",
+	.rating = 100,
 	.ipi_send = mswi_ipi_send,
 	.ipi_clear = mswi_ipi_clear
 };
@@ -106,7 +107,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 	if (rc)
 		return rc;
 
-	sbi_ipi_set_device(&aclint_mswi);
+	sbi_ipi_add_device(&aclint_mswi);
 
 	return 0;
 }
diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index 5d085d85..3621e3cb 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -61,6 +61,7 @@ static void plicsw_ipi_clear(void)
 
 static struct sbi_ipi_device plicsw_ipi = {
 	.name      = "andes_plicsw",
+	.rating    = 200,
 	.ipi_send  = plicsw_ipi_send,
 	.ipi_clear = plicsw_ipi_clear
 };
@@ -99,7 +100,7 @@ int plicsw_cold_ipi_init(struct plicsw_data *plicsw)
 	if (rc)
 		return rc;
 
-	sbi_ipi_set_device(&plicsw_ipi);
+	sbi_ipi_add_device(&plicsw_ipi);
 
 	return 0;
 }
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 057b9fa7..d72ef794 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -199,6 +199,7 @@ static void imsic_ipi_send(u32 hart_index)
 
 static struct sbi_ipi_device imsic_ipi_device = {
 	.name		= "aia-imsic",
+	.rating		= 300,
 	.ipi_send	= imsic_ipi_send
 };
 
@@ -393,7 +394,7 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 	sbi_irqchip_add_device(&imsic_device);
 
 	/* Register IPI device */
-	sbi_ipi_set_device(&imsic_ipi_device);
+	sbi_ipi_add_device(&imsic_ipi_device);
 
 	return 0;
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
