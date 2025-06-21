Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E1AC7EE2A
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IofyJ+PwvbRnDi+ctPdmnFqoy6u/mSZVESWPjJ2Ff8I=; b=nmWkzPCCo2zZx7
	xqsnTsY5c1Z1+Pi5RdyCNn+h9dNxe1g7nsADfOOjL44b1j2TZvb6sN5c3Q0as6rxpNuK4dDo7MFA4
	x9xcBRrinsTKupA8wMQYVGvPMqjWz9r3rncAa1Ic4fj0O+qpTfkh/mhvmDIhSTtXMt/91ketOEh8O
	Li34U9K7InnIm3F0yCKy4+JDlLwt1LUwKzQEgNgf3NCfvySxIwf/vn0VMm2vWxhnPxZ18gW3tOGeQ
	yXea0KI0hM/khyKWbkCYVcrn/th0H4udOpG7+3P9OLatwkOxtJcB+Z8p9Eow8l/dDP+8vd6QKmn3c
	zPQW7YzyRQEhQ7AC+cNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpyh-0000000H5yY-3WHL;
	Sat, 21 Jun 2025 04:37:19 +0000
Received: from m16.mail.126.com ([220.197.31.8])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpl9-0000000H4zl-28G2
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Pm
	aOe9PTBvZhLDBxIu3msNlkTIywXRI8okbbDVh+AFA=; b=hCSDc5/CwhgTk/WTLl
	mYX6x0R0Vz04fqdWYuZcLCEeU1GUWgTwfxJTvfTOJr/Z6gcFOf8JR3Y8pQucKUJq
	a+eHb4VXHjURGFDXHfbb2AWqQ3GLlUQZdRIm3TF2vlgX62GZeCS/8pyQc8vaDRRz
	gHZJ7ZRxVfhWZglL0ICIPyozE=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S7;
	Sat, 21 Jun 2025 12:23:10 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 5/9] lib: sbi: Initialize as much as possible on non-coldboot HART
Date: Sat, 21 Jun 2025 12:22:53 +0800
Message-ID: <20250621042302.160802-6-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621042302.160802-1-wxjstz@126.com>
References: <20250621042302.160802-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kCrW5JFW3JrWDJrWrKrg_yoWrKrWUpF
	y7KF9Fyr409rykK34xWa17Zr1fGayvgw13Gry8GryvvrWjyF1rXr1xKw13ta4DKFZ8t3W3
	Zw4vvry8GF1UXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRbzV8UUUUU=
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFwBzOmhWKJSMwgADsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212319_860301_ACD1424A 
X-CRM114-Status: GOOD (  11.34  )
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

Separate sbi_hsm_hart_wait from sbi_hsm_init to allow the secondary
Hart to perform more initialization.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_hsm.h |  3 ++-
 lib/sbi/sbi_hsm.c     | 49 ++++++++++++++++++-------------------------
 lib/sbi/sbi_init.c    | 15 ++++++-------
 3 files changed, 28 insertions(+), 39 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index 38f90516..3be08654 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -63,7 +63,8 @@ const struct sbi_hsm_device *sbi_hsm_get_device(void);
 
 void sbi_hsm_set_device(const struct sbi_hsm_device *dev);
 
-int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot);
+int sbi_hsm_init(struct sbi_scratch *scratch);
+void sbi_hsm_hart_wait(struct sbi_scratch *scratch);
 void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch);
 
 int sbi_hsm_hart_start(struct sbi_scratch *scratch,
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 557ab131..f32212d8 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -159,7 +159,7 @@ void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
 	sbi_hart_switch_mode(hartid, next_arg1, next_addr, next_mode, false);
 }
 
-static void sbi_hsm_hart_wait(struct sbi_scratch *scratch)
+void sbi_hsm_hart_wait(struct sbi_scratch *scratch)
 {
 	unsigned long saved_mie;
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
@@ -183,14 +183,10 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch)
 
 		wfi();
 	}
+	sbi_ipi_raw_clear();
 
 	/* Restore MIE CSR */
 	csr_write(CSR_MIE, saved_mie);
-
-	/*
-	 * No need to clear IPI here because the sbi_ipi_init() will
-	 * clear it for current HART.
-	 */
 }
 
 const struct sbi_hsm_device *sbi_hsm_get_device(void)
@@ -247,34 +243,29 @@ static void hsm_device_hart_resume(void)
 		hsm_dev->hart_resume();
 }
 
-int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot)
+int sbi_hsm_init(struct sbi_scratch *scratch)
 {
 	struct sbi_scratch *rscratch;
 	struct sbi_hsm_data *hdata;
 
-	if (cold_boot) {
-		hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata));
-		if (!hart_data_offset)
-			return SBI_ENOMEM;
-
-		/* Initialize hart state data for every hart */
-		sbi_for_each_hartindex(i) {
-			rscratch = sbi_hartindex_to_scratch(i);
-			if (!rscratch)
-				continue;
-
-			hdata = sbi_scratch_offset_ptr(rscratch,
-						       hart_data_offset);
-			ATOMIC_INIT(&hdata->state,
-				    (i == current_hartindex()) ?
-				    SBI_HSM_STATE_START_PENDING :
-				    SBI_HSM_STATE_STOPPED);
-			ATOMIC_INIT(&hdata->start_ticket, 0);
-		}
-	} else {
-		sbi_hsm_hart_wait(scratch);
+	hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata));
+	if (!hart_data_offset)
+		return SBI_ENOMEM;
+
+	/* Initialize hart state data for every hart */
+	sbi_for_each_hartindex(i) {
+		rscratch = sbi_hartindex_to_scratch(i);
+		if (!rscratch)
+			continue;
+
+		hdata = sbi_scratch_offset_ptr(rscratch,
+					       hart_data_offset);
+		ATOMIC_INIT(&hdata->state,
+			    (i == current_hartindex()) ?
+			    SBI_HSM_STATE_START_PENDING :
+			    SBI_HSM_STATE_STOPPED);
+		ATOMIC_INIT(&hdata->start_ticket, 0);
 	}
-
 	return 0;
 }
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 4c55b3dc..5c017cda 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -223,6 +223,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	rc = sbi_hsm_init(scratch);
+	if (rc)
+		sbi_hart_hang();
+
 	entry_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
 	if (!entry_count_offset)
 		sbi_hart_hang();
@@ -234,10 +238,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
 	(*count)++;
 
-	rc = sbi_hsm_init(scratch, true);
-	if (rc)
-		sbi_hart_hang();
-
 	/*
 	 * All non-coldboot HARTs do HSM initialization (i.e. enter HSM state
 	 * machine) at the start of the warmboot path so it is wasteful to
@@ -400,11 +400,6 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
 	(*count)++;
 
-	/* Note: This has to be first thing in warmboot init sequence */
-	rc = sbi_hsm_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
 	rc = sbi_platform_early_init(plat, false);
 	if (rc)
 		sbi_hart_hang();
@@ -457,6 +452,8 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
+	sbi_hsm_hart_wait(scratch);
+
 	count = sbi_scratch_offset_ptr(scratch, init_count_offset);
 	(*count)++;
 
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
