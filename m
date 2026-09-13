Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EA7C88E40
	for <opensbi@archiver.kernel.org>; Sun, 13 Sep 2026 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xWCCOaf1YjqF3Y6x7WpnSW9vtf9ZLc0Ppqe+eBBOgpQ=; b=X7ujNAWPqmGTT+
	HEpOxsNkzSCKV1uavIiJnUppGagLexyYpeCOHB1pr5BdiCtiF2AkZqK3dA9Hbl8gl+OCSODah3Bhf
	2vEidCUJxC9qUHunEdmShHGiEZQiVspoKxzPX/RMq5RJcbyW2xEaijLQmJwPFeh63kSrScfuX8/Da
	zaP3yK3f18rEudoyuERvmy5dJVgMTw3OAIj507KUjMkVVSDqHHTxe46pwzd7cojg/MemMkGGeuLD3
	IOY4Md9zsZ9pslGCFOpHlbnuOFhVrCABB/Pr46e6LpTPjVzaKuY0ayTrpQTOy2GOMTHI42IfOqpTn
	CpQCho1pp7ElrrFLu31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5h1o-00000001ZIZ-2T5K;
	Sun, 13 Sep 2026 10:01:40 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5h1k-00000001ZHn-14qo
	for opensbi@lists.infradead.org;
	Sun, 13 Sep 2026 10:01:37 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8520161fdb9so2726594b3a.3
        for <opensbi@lists.infradead.org>; Sun, 13 Sep 2026 03:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789293695; x=1789898495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=InmhdsANio9hQSAHdqAbGQGUXSWcIwAJWfVSCRV41KI=;
        b=cI4q4CcuionVG5OlHiRdVxpmXkb0TC1FsCiyMklcUUJgSNslJo78GAKAccHG6Q9iGI
         K+nR5c1seagKjQ2fm6N1qmtNCrOAUJDnjAi25cgkPzPRxQfAg6lK0n7kqqU9iljX/oU7
         pq7pL802OQ/Gd/nKTtp/NqVdYJhdptfJWhL4b+YL5EoyZyZiKk0Gx9xnHinX56tkcPTc
         P3rUAL2hP7Y/F7XAYPXnuL6FgxRfnuy7KGFf+97elRBy0L7SgJDS1cXLtgiljY9C6FJd
         unpPYP3gfN+AmSQDP1xmtYF2aFkY5gwI7NQ1Kcdl+l6vgX/lpFRjYfhC9sYs9o0W35yS
         z5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789293695; x=1789898495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InmhdsANio9hQSAHdqAbGQGUXSWcIwAJWfVSCRV41KI=;
        b=Cha5noe/F99c6M2lH40bKUeLrSoQLaNm7AKIfrwlkAoWpYLmvw88ZQBFG5o4OiW570
         LMaFM3iW24IuXNobrdTU5xVxR10XL+iBlwd3vKEICH9EK1CHoCKu040D/Z+AmF/rwOHp
         XhT10ElskQv6yL0aYzfp3noFRZVuKiUvQiKq+bjws7zEi96uNitT2z9VWJxT4uFS2Jar
         3lzCIvnHA9y0V9w42xTBXFPxlDrolHJ0DhaMCprgFbD/NakDIyC9j6n3MDgmgSiRuzQW
         Mzu2wrV5jOw6Ay8bvbuGX0o5xvgUIdCVgjU/e/OXaPF8nCJ7EWzVOX7dyhAaZPux30JF
         Em1w==
X-Gm-Message-State: AFuF++k+u2Y8KWaMbxiy2XyLlTn6XlbAdM/Qt5j5rxYHDTaSgvo374dS
	pezlDxxcM8ONbqAlRsexLzpEMOpf4YAQWnwyIWFsaOR4DWVrYuhIgAUyGfC1WSdm
X-Gm-Gg: AYBFou36V1HOyUSOUo1Lt1SBmSuKi9FarqG1NYFIb8NhJFxSs8GJ77PiIq6qU3vYQsf
	GdFJtMBwR0Gx/JzZU31ABhBeBLmiPEpsI9dvMDhvzZk3PIq6xv74bJWJMoKiyjGtuR2AvNYzBCR
	+cGpG+tvE2CYhlGAsoY6wq9f/9hjqTuZpE/8al9WogJMzJlezbIqwnP0aIiols/8K6deM1VVYs0
	mhOIVUgwcZ+YZ8R0qN5iaEEnHkVp6FJ3vgTTy8z3i71wiO4HsVK6h3iSJgYWXguR4ZffLvOcDFd
	dSTQb816NMO/of/yVtLH5N903IIfr0Ju5A2YXE2Zg/JpACV81wGBGPkrFwGLsblUGk3DlVC6isZ
	W8MQvodl2qQ+xo0f5ZiWLAlhHBcEJNljB0T8nhH9ajvkH2Fzj+xU5axl7S/kIuHM7YlTUADyaGW
	LX7S2raroANhgZUFahfVRueFZlIS6JPvUGM+Lual8sjxfa4UsmIDCLRsIRWoIVBm8WzfRRFR0a
X-Received: by 2002:a05:6a00:1da7:b0:869:fe95:c185 with SMTP id d2e1a72fcca58-86b3021d15bmr20754122b3a.11.1789293694656;
        Sun, 13 Sep 2026 03:01:34 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c2775sm3069427b3a.9.2026.09.13.03.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 03:01:34 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	nick.hu@sifive.com,
	troy.mitchell@linux.dev
Cc: anup@brainfault.org,
	zhangmeng.kevin@linux.spacemit.com
Subject: [PATCH] lib: sbi: Refactor sbi_ipi_raw_send/clear interface
Date: Sun, 13 Sep 2026 03:01:28 -0700
Message-Id: <20260913100128.2437-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_030136_310157_3C292511 
X-CRM114-Status: GOOD (  28.43  )
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

Commit 94f0f8465622 ("lib: sbi: Extends sbi_ipi_raw_send() to use all
available IPI devices") changed the `sbi_ipi_raw_send` interface to
allow sending IPI via all registered IPI devices. The intention was to
address specific use cases on some Sifive platforms, where the default
IMSIC IPI device is not usable for hart wakeup in HSM start function.
Sending IPI via all devices does seem to have "fixed" the problem, as
it's utilizing the CLINT as well.

However this approach is problematic:

 a. If a platform has > 1 IPI devices, and all are functional for HSM
    wakups, then multiple IPIs would be triggered for the waking hart.
 b. These IPIs could arrive at the target hart at any time, and later
    ones can even arrive after the hart's fully woken up, initialized
    everything, and returned to the next privilege mode. a call to
    `sbi_ipi_raw_clear(true)` is thus not enough to clear all pending
    IPIs, because others are still in-flight.

It's exactly what we are observing on SpacemiT's K3 platform.
(both IMSIC and ACLINT are available).

To fix the issue without making it too complicated, first, establish
a general rule that there can be only 1 active IPI device for a IPI
user (e.g., HSM) at any given time. If the user of IPI needs sending
IPIs via the non-default device, specify it explicitly, instead of
invoking all devices, and hoping some of them work. Specifically:

 1. Each IPI device is assigned a type tag.
 2. No more sending IPI via all devices. Either use
      `sbi_ipi_raw_send` for the default IPI device, or
      `sbi_ipi_device_raw_send` for the specific type of device
 3. `sbi_ipi_raw_clear(true)` is now `sbi_ipi_raw_clear_all()`

`sbi_ipi_raw_send(hartindex)` pairs with `sbi_ipi_raw_clear()`
`sbi_ipi_device_raw_send(...)` pairs with `sbi_ipi_raw_clear_all()`
There's currently no need for a `sbi_ipi_device_raw_clear`, because
`sbi_ipi_device_raw_send` is intended for special use, such as
HSM. During hart wakeup, it's safe to clear from all IPI devices, as
the hart HSM state hasn't changed to STARTED yet, so no need to worry
about losing IPIs triggered from other users (TLB, SSE...).

Fixes: 94f0f8465622 ("lib: sbi: Extends sbi_ipi_raw_send() to use all available IPI devices")
Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_ipi.h                | 17 +++++-
 lib/sbi/sbi_hsm.c                    |  2 +-
 lib/sbi/sbi_init.c                   |  2 +-
 lib/sbi/sbi_ipi.c                    | 77 +++++++++++++++++-----------
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c |  2 +-
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c  |  5 +-
 lib/utils/ipi/aclint_mswi.c          |  1 +
 lib/utils/ipi/andes_plicsw.c         |  1 +
 lib/utils/irqchip/imsic.c            |  1 +
 platform/generic/eswin/eic770x.c     |  4 +-
 10 files changed, 72 insertions(+), 40 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index 2c231041..7fc88aff 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -18,11 +18,20 @@
 
 /* clang-format on */
 
+enum sbi_ipi_device_type {
+	SBI_IPI_DEVICE_ACLINT,
+	SBI_IPI_DEVICE_IMSIC,
+	SBI_IPI_DEVICE_ANDES_PLICSW,
+};
+
 /** IPI hardware device */
 struct sbi_ipi_device {
 	/** Name of the IPI device */
 	char name[32];
 
+	/** Type of the IPI device */
+	enum sbi_ipi_device_type type;
+
 	/** Ratings of the IPI device (higher is better) */
 	unsigned long rating;
 
@@ -88,9 +97,13 @@ int sbi_ipi_send_halt(ulong hmask, ulong hbase);
 
 void sbi_ipi_process(void);
 
-int sbi_ipi_raw_send(u32 hartindex, bool all_devices);
+int sbi_ipi_raw_send(u32 hartindex);
+
+int sbi_ipi_device_raw_send(enum sbi_ipi_device_type type, u32 hartindex);
+
+void sbi_ipi_raw_clear(void);
 
-void sbi_ipi_raw_clear(bool all_devices);
+void sbi_ipi_raw_clear_all(void);
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void);
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0a355f9c..9b87e632 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -364,7 +364,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
 		rc = hsm_device_hart_start(hartid, scratch->warmboot_addr);
 	} else {
-		rc = sbi_ipi_raw_send(hartindex, true);
+		rc = sbi_ipi_raw_send(hartindex);
 	}
 
 	if (!rc)
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index acd2f8b6..2af69d2f 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -557,7 +557,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 	if (hstate == SBI_HSM_STATE_SUSPENDED) {
 		init_warm_resume(scratch, hartid);
 	} else {
-		sbi_ipi_raw_clear(true);
+		sbi_ipi_raw_clear_all();
 		init_warm_startup(scratch, hartid);
 	}
 }
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index b04a5877..11ddf229 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -88,7 +88,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
 	 */
 	if (!__atomic_fetch_or(&ipi_data->ipi_type,
 				BIT(event), __ATOMIC_RELAXED))
-		ret = sbi_ipi_raw_send(remote_hartindex, false);
+		ret = sbi_ipi_raw_send(remote_hartindex);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
 
@@ -263,7 +263,7 @@ void sbi_ipi_process(void)
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
-	sbi_ipi_raw_clear(false);
+	sbi_ipi_raw_clear();
 
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
@@ -278,13 +278,11 @@ void sbi_ipi_process(void)
 	}
 }
 
-int sbi_ipi_raw_send(u32 hartindex, bool all_devices)
+static int __sbi_ipi_dev_raw_send(const struct sbi_ipi_device *dev,
+				  u32 hartindex)
 {
-	struct sbi_ipi_device_node *entry;
-
-	if (!ipi_dev || !ipi_dev->ipi_send)
+	if (!dev->ipi_send)
 		return SBI_EINVAL;
-
 	/*
 	 * Ensure that memory or MMIO writes done before
 	 * this function are not observed after the memory
@@ -292,35 +290,19 @@ int sbi_ipi_raw_send(u32 hartindex, bool all_devices)
 	 * callback. This also allows the ipi_send() device
 	 * callback to use relaxed MMIO writes.
 	 *
-	 * This pairs with the wmb() in sbi_ipi_raw_clear().
+	 * This pairs with the wmb() in sbi_ipi_dev_raw_clear().
 	 */
 	wmb();
 
-	if (all_devices) {
-		sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
-			if (entry->dev->ipi_send)
-				entry->dev->ipi_send(hartindex);
-		}
-	} else {
-		ipi_dev->ipi_send(hartindex);
-	}
+	dev->ipi_send(hartindex);
 
 	return 0;
 }
 
-void sbi_ipi_raw_clear(bool all_devices)
+static void __sbi_ipi_dev_raw_clear(const struct sbi_ipi_device *dev)
 {
-	struct sbi_ipi_device_node *entry;
-
-	if (all_devices) {
-		sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
-			if (entry->dev->ipi_clear)
-				entry->dev->ipi_clear();
-		}
-	} else {
-		if (ipi_dev && ipi_dev->ipi_clear)
-			ipi_dev->ipi_clear();
-	}
+	if (dev->ipi_clear)
+		dev->ipi_clear();
 
 	/*
 	 * Ensure that memory or MMIO writes after this
@@ -329,11 +311,46 @@ void sbi_ipi_raw_clear(bool all_devices)
 	 * device callback. This also allows ipi_clear()
 	 * device callback to use relaxed MMIO writes.
 	 *
-	 * This pairs with the wmb() in sbi_ipi_raw_send().
+	 * This pairs with the wmb() in sbi_ipi_dev_raw_send().
 	 */
 	wmb();
 }
 
+int sbi_ipi_raw_send(u32 hartindex)
+{
+	if (!ipi_dev)
+		return SBI_ENODEV;
+
+	return __sbi_ipi_dev_raw_send(ipi_dev, hartindex);
+}
+
+int sbi_ipi_device_raw_send(enum sbi_ipi_device_type type, u32 hartindex)
+{
+	struct sbi_ipi_device_node *entry;
+
+	sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
+		if (entry->dev->type == type)
+			return __sbi_ipi_dev_raw_send(entry->dev, hartindex);
+	}
+
+	return SBI_ENODEV;
+}
+
+void sbi_ipi_raw_clear(void)
+{
+	if (ipi_dev)
+		__sbi_ipi_dev_raw_clear(ipi_dev);
+}
+
+void sbi_ipi_raw_clear_all(void)
+{
+	struct sbi_ipi_device_node *entry;
+
+	sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
+		__sbi_ipi_dev_raw_clear(entry->dev);
+	}
+}
+
 const struct sbi_ipi_device *sbi_ipi_get_device(void)
 {
 	return ipi_dev;
@@ -386,7 +403,7 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
 	ipi_data->ipi_type = 0x00;
 
 	/* Clear any pending IPIs for the current hart */
-	sbi_ipi_raw_clear(true);
+	sbi_ipi_raw_clear_all();
 
 	/* Enable software interrupts */
 	csr_set(CSR_MIE, MIP_MSIP);
diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
index 115916d5..5a148c3f 100644
--- a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -126,7 +126,7 @@ static int ae350_hart_start(u32 hartid, ulong saddr)
 	 */
 	if (!sbi_init_count(hartindex) || (is_andes(25) && hartid == 0) ||
 	    sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP)
-		return sbi_ipi_raw_send(hartindex, false);
+		return sbi_ipi_raw_send(hartindex);
 
 	atcsmu_set_command(WAKEUP_CMD, hartid);
 	return 0;
diff --git a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
index 2690a638..d5534c16 100644
--- a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
+++ b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
@@ -259,9 +259,8 @@ static int sifive_tmc0_start(u32 hartid, ulong saddr)
 	 * In system suspend, the IMSIC will be reset in SiFive platform so
 	 * we use the CLINT IPI as the wake event.
 	 */
-	sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid), true);
-
-	return SBI_OK;
+	return sbi_ipi_device_raw_send(SBI_IPI_DEVICE_ACLINT,
+				       sbi_hartid_to_hartindex(hartid));
 }
 
 static int sifive_tmc0_stop(void)
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index d4acacf0..19683cea 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -62,6 +62,7 @@ static void mswi_ipi_clear(void)
 
 static struct sbi_ipi_device aclint_mswi = {
 	.name = "aclint-mswi",
+	.type = SBI_IPI_DEVICE_ACLINT,
 	.rating = 100,
 	.ipi_send = mswi_ipi_send,
 	.ipi_clear = mswi_ipi_clear
diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index 3621e3cb..85b53826 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -61,6 +61,7 @@ static void plicsw_ipi_clear(void)
 
 static struct sbi_ipi_device plicsw_ipi = {
 	.name      = "andes_plicsw",
+	.type      = SBI_IPI_DEVICE_ANDES_PLICSW,
 	.rating    = 200,
 	.ipi_send  = plicsw_ipi_send,
 	.ipi_clear = plicsw_ipi_clear
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index f6da9f7e..a13fc4c6 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -221,6 +221,7 @@ static void imsic_ipi_send(u32 hart_index)
 
 static struct sbi_ipi_device imsic_ipi_device = {
 	.name		= "aia-imsic",
+	.type		= SBI_IPI_DEVICE_IMSIC,
 	.rating		= 300,
 	.ipi_send	= imsic_ipi_send
 };
diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index c71198a8..6cc5c61b 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -32,7 +32,7 @@ static int eic770x_hart_start(u32 hartid, ulong saddr)
 	 * returns, putting the hart in atomic_read(&hdata->state)
 	 * loop in sbi_hsm_hart_wait. We wake it up if it's in wfi()
 	 */
-	return sbi_ipi_raw_send(hartindex, true);
+	return sbi_ipi_raw_send(hartindex);
 }
 
 static int eic770x_hart_stop()
@@ -86,7 +86,7 @@ void eic770x_cease_other_harts(void)
 		 *  3. Given the fence o, r, any previous ipi_clear
 		 *     can't fall-through the read of eic770x_power_down
 		 */
-		sbi_ipi_raw_send(i, false);
+		sbi_ipi_raw_send(i);
 		to_cease[die] |= EIC770X_MC_CEASE_BIT(core);
 	}
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
