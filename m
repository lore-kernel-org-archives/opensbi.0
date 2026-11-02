Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5570606A32D
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 03:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MVgoTX+7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=GEVd2dVc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t1YUSAFSuCItmNsORCYqwdwPZ5qxEX8pTNDLcdaYq54=; b=MVgoTX+7Q3c0hjLBsA8MDzJ1X6
	N0vZ/IgDqJrI5jZkVdWRHlphkJ6a3FkvY8YnxrQnrqiDr497QzzjmyeUhMulpoyQI+qTb9B8F4qXF
	5vZdnVSuHuXYU3HuKkuh92J8yyzbXZXMH62rm88zExsYdnXKmYgFmasnAXQGA9zDRwg2EwoUpLTSD
	HoUns9Fx9ZTs5+2pgJmq0PHMZF0JC+eqha0v/v1iQkMPTyye+xIFxFJvYGSHIjOYZZef+0WHLIODE
	A4sirF4Nrt2lTszIhP3WUen+sxlpYQmB0uOtNKx2XN/thbAyPER4w6dKuJRsQMNepm7GaumHR0VrX
	iS8oytFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1I-0000000FTDQ-2Ahx;
	Mon, 02 Nov 2026 03:47:40 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1F-0000000FTBk-1Ymz
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 03:47:38 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso222168eec.0
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 19:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793591256; x=1794196056; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Txi3Dr5jpbRMo115xsWSL6qUslQiCmPp/hxxkk6z2Iw=;
        b=GEVd2dVcPeWRORNMLJPL+CQuNKff1epmUhOEBqv6TgwnD3FLfKPxDcUgk60OL1dmdq
         lkv9MwxBzrZyUNJZwTc+WZv/AIZ+jTxX+rHWrUGM3QLzeXU0a5OK3u/2GF4W7aPfUr0W
         ixKnTJA5qbFnS0QFpaEkvnc6Zr1/YVU92X0I3ui9sVOB0ge3yThg58zYNS9+dUcrUzfH
         1kvW7ndTy5TuuoF5M34ib3nlo5CkWdOT8BT4UncjR4CdqTPHh18jO0QZcdID3kJWxMVS
         5E5EXSVJvx/kXfUyhcbMADMU15o6zjSmYY1S62rqtQ0gMeSU+j4VBogxGoZBtyaR9M32
         wtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591256; x=1794196056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Txi3Dr5jpbRMo115xsWSL6qUslQiCmPp/hxxkk6z2Iw=;
        b=Am5qBMvHxFfjh2q8HcWsMVooMzb0XeQOX4LTDwx+rg7oKOmmoY0LIH9nSjne9uqV6q
         g8SqlgOdQMBqECo81El7QQqPxF6+GpJxxwd6OO3ZJWFzucmISXkDxptSjW4ighgr4rLV
         9xRIeAKrs9XaSokAlm57ylNk4o5Vh728cLgAnFrF9ZiYlHEIlBzv5SWQurRQR/p8aKqI
         NWZ96prl4gpAvfXpPtCmlDyJ6OAFUKc9H1Hi1JtbEolPvBKPzQG9GtCZC0pBpoesxVIG
         JdduxeMOp41lAnCQCd29KA0To/N46wDeHNp0L5VaKFQEN0p2eQKzFKAwP3r8MJ8lR6fH
         oscw==
X-Gm-Message-State: APuU4Z8DuzHtinVLm77XAW54kXMGTMoK4E4RHUQCrTVMFLAkLUx2W4Zx
	r3OsXiwOToZnj0nErTnFKOj1K5ld6G9CxwsdD9fgIS3b/ICAJa01V/oAH9NGSl8WSGA=
X-Gm-Gg: AYBFou2PVWayDU8DAAdnlZDQBAIJbKV99esj0IsmJ//93WFVfPiCJhxWKPiX1o1cFKN
	4IZrpr1w/buqH8+WM6bnrg+BqDndnOTqoMTJy2VO0LKTPsGTKOe2GOGEgo1i0crOldLj1C/t2bq
	irp8WW9CwwPc++2Uq+K2nJ6XRgeqRZIa+U5w0OyMSPHB9kxEcHp6OZwEB19sRjmV4MFmgLf0U0m
	e8mCN3ed6/rTic5/tNkaEvmGGckQBSmgiddYV6Gbo14oY5T2pNkyWn+CYIA+qxD2ZESDZdJp9/K
	jWB5tZFv83xxo/3VvvZJ9zf4BJirKaFiCje+GMZJgBAecrGUBxuTlY3YIUd1N4UwVLEhxwea4yh
	cYJFKmnI86d8J67GHLXVHTtX/HZhqWqK1CggsnuVM2WhjIxh9xK0f8clS9Mtvd2vgr7PU1GNYS4
	LU5xLUs4f4pqaRzX9sY+ntgVxGoFQ4PYSebcbd/V2ZtPQmsYe5/h1ut4vQ2i0LYdK6gXTlaTLb/
	ZqWgqeNtmv/TEKsNZy9BSRjA7wJmYNeaoXe3cK3Z5zcKT0WpkoYp9T9qolrNHeqQ8Sh6n0c7ZKO
	xJ40yq8UQeZmX+Jz7IJ3luN6pv2LZLBuT9Trz6XyKq2f3APMX1VniQkvb3NfSSPQUFjJxWk0GDp
	6PdGZY3XvpNLJvrZTlcx2dK33PcHZ
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr13311540eec.6.1793591256141;
        Sun, 01 Nov 2026 19:47:36 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm30308670eec.12.2026.11.01.19.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:47:35 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Sun, 01 Nov 2026 19:47:15 -0800
Subject: [PATCH 1/5] lib: utils/irqchip: Add RPMI system MSI helper library
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261101-dev-nickh-msysmsi-dev-upstream-v1-1-117b2e075be0@sifive.com>
References: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
In-Reply-To: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, greentime.hu@sifive.com, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194737_435328_940D5616 
X-CRM114-Status: GOOD (  24.29  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the RPMI system MSI initialization out of the MPXY RPMI sysmsi
driver and into a new irqchip helper library, rpmi_sysmsi. The helper
reads the P2A doorbell system MSI index from the mailbox channel,
queries the number of system MSIs and the attributes of each MSI from
the RPMI service group, and builds a bitmap of MSIs that must not be
exposed through MPXY: the P2A doorbell MSI and any MSI whose attributes
indicate it is preferred to be handled by privileged (M-mode) software.

rpmi_sysmsi_setup() and rpmi_sysmsi_cleanup() manage one reference
counted struct rpmi_sysmsi_data per mailbox channel. A setup call for a
channel that already has data returns the existing instance, so several
users of the same channel share a single denied bitmap. Convert the MPXY
RPMI sysmsi driver to use these functions instead of keeping its own
copy of the setup and cleanup logic.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi_utils/irqchip/rpmi_sysmsi.h |  23 +++++++
 lib/utils/irqchip/Kconfig               |   5 ++
 lib/utils/irqchip/objects.mk            |   1 +
 lib/utils/irqchip/rpmi_sysmsi.c         | 117 ++++++++++++++++++++++++++++++++
 lib/utils/mpxy/Kconfig                  |   2 +
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c   |  61 ++---------------
 6 files changed, 155 insertions(+), 54 deletions(-)

diff --git a/include/sbi_utils/irqchip/rpmi_sysmsi.h b/include/sbi_utils/irqchip/rpmi_sysmsi.h
new file mode 100644
index 00000000..90825557
--- /dev/null
+++ b/include/sbi_utils/irqchip/rpmi_sysmsi.h
@@ -0,0 +1,23 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+#ifndef __RPMI_SYSMSI_H__
+#define __RPMI_SYSMSI_H__
+
+#include <sbi/sbi_list.h>
+#include <sbi_utils/mailbox/mailbox.h>
+
+struct rpmi_sysmsi_data {
+	struct sbi_dlist node;
+	struct mbox_chan *chan;
+	unsigned long *sys_msi_denied_bmap;
+	u32 sys_num_msi;
+	u32 ref_cnt;
+};
+
+void rpmi_sysmsi_cleanup(struct rpmi_sysmsi_data *data);
+int rpmi_sysmsi_setup(struct mbox_chan *chan, struct rpmi_sysmsi_data **out_data);
+
+#endif
diff --git a/lib/utils/irqchip/Kconfig b/lib/utils/irqchip/Kconfig
index 7a71388c..03f297dc 100644
--- a/lib/utils/irqchip/Kconfig
+++ b/lib/utils/irqchip/Kconfig
@@ -38,4 +38,9 @@ config IRQCHIP_PLIC
 	bool "Platform Level Interrupt Controller (PLIC) support"
 	default n
 
+config RPMI_SYSMSI
+	bool "RPMI SYSTEM MSI support"
+	depends on RPMI_MAILBOX
+	default n
+
 endmenu
diff --git a/lib/utils/irqchip/objects.mk b/lib/utils/irqchip/objects.mk
index a13b384e..3195a273 100644
--- a/lib/utils/irqchip/objects.mk
+++ b/lib/utils/irqchip/objects.mk
@@ -22,3 +22,4 @@ libsbiutils-objs-$(CONFIG_FDT_IRQCHIP_PLIC) += irqchip/fdt_irqchip_plic.o
 libsbiutils-objs-$(CONFIG_IRQCHIP_APLIC) += irqchip/aplic.o
 libsbiutils-objs-$(CONFIG_IRQCHIP_IMSIC) += irqchip/imsic.o
 libsbiutils-objs-$(CONFIG_IRQCHIP_PLIC) += irqchip/plic.o
+libsbiutils-objs-$(CONFIG_RPMI_SYSMSI) += irqchip/rpmi_sysmsi.o
diff --git a/lib/utils/irqchip/rpmi_sysmsi.c b/lib/utils/irqchip/rpmi_sysmsi.c
new file mode 100644
index 00000000..d403ce17
--- /dev/null
+++ b/lib/utils/irqchip/rpmi_sysmsi.c
@@ -0,0 +1,117 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <sbi/sbi_bitmap.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi_utils/irqchip/rpmi_sysmsi.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+
+static SBI_LIST_HEAD(rpmi_sysmsi_list);
+
+static struct rpmi_sysmsi_data *rpmi_sysmsi_find(struct mbox_chan *chan)
+{
+	struct rpmi_sysmsi_data *data;
+
+	if (!chan || sbi_list_empty(&rpmi_sysmsi_list))
+		return NULL;
+
+	sbi_list_for_each_entry(data, &rpmi_sysmsi_list, node) {
+		if (data->chan == chan)
+			return data;
+	}
+
+	return NULL;
+}
+
+void rpmi_sysmsi_cleanup(struct rpmi_sysmsi_data *data)
+{
+	if (!data || --data->ref_cnt)
+		return;
+
+	sbi_list_del(&data->node);
+	sbi_free(data->sys_msi_denied_bmap);
+	sbi_free(data);
+}
+
+int rpmi_sysmsi_setup(struct mbox_chan *chan, struct rpmi_sysmsi_data **out_data)
+{
+	struct rpmi_sysmsi_get_msi_attributes_resp gmaresp;
+	struct rpmi_sysmsi_get_msi_attributes_req gmareq;
+	struct rpmi_sysmsi_get_attributes_resp garesp;
+	struct rpmi_sysmsi_data *data;
+	u32 p2a_db_index, i;
+	int rc;
+
+	if (!out_data)
+		return SBI_EINVAL;
+
+	data = rpmi_sysmsi_find(chan);
+	if (data) {
+		*out_data = data;
+		data->ref_cnt++;
+		return SBI_OK;
+	}
+
+	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_P2A_DOORBELL_SYSMSI_INDEX,
+				     &p2a_db_index);
+	if (rc) {
+		sbi_printf("%s: mbox chan get attribute failed rc=%d\n", __func__, rc);
+		return rc;
+	}
+
+	rc = rpmi_normal_request_with_status(chan, RPMI_SYSMSI_SRV_GET_ATTRIBUTES,
+					     NULL, 0, 0, &garesp, rpmi_u32_count(garesp),
+					     rpmi_u32_count(garesp));
+	if (rc) {
+		sbi_printf("%s: SRV_GET_ATTRIBUTES failed rc=%d\n", __func__, rc);
+		return rc;
+	}
+
+	if (!garesp.sys_num_msi)
+		return SBI_ENODEV;
+
+	data = sbi_zalloc(sizeof(*data));
+	if (!data)
+		return SBI_ENOMEM;
+
+	data->ref_cnt = 1;
+	data->chan = chan;
+	data->sys_num_msi = garesp.sys_num_msi;
+	data->sys_msi_denied_bmap = sbi_zalloc(bitmap_estimate_size(data->sys_num_msi));
+	if (!data->sys_msi_denied_bmap) {
+		rc = SBI_ENOMEM;
+		goto free_data;
+	}
+
+	for (i = 0; i < data->sys_num_msi; i++) {
+		gmareq.sys_msi_index = i;
+		rc = rpmi_normal_request_with_status(chan,
+						     RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES,
+						     &gmareq, rpmi_u32_count(gmareq),
+						     rpmi_u32_count(gmareq),
+						     &gmaresp, rpmi_u32_count(gmaresp),
+						     rpmi_u32_count(gmaresp));
+		if (rc) {
+			sbi_printf("%s: SRV_GET_MSI_ATTRIBUTES failed rc=%d\n", __func__, rc);
+			goto free_denied_bmap;
+		}
+
+		if (i == p2a_db_index || gmaresp.flag0 & RPMI_SYSMSI_MSI_ATTRIBUTES_FLAG0_PREF_PRIV)
+			bitmap_set(data->sys_msi_denied_bmap, i, 1);
+	}
+
+	*out_data = data;
+	sbi_list_add(&data->node, &rpmi_sysmsi_list);
+
+	return SBI_OK;
+free_denied_bmap:
+	sbi_free(data->sys_msi_denied_bmap);
+free_data:
+	sbi_free(data);
+	return rc;
+}
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index a3ed1c22..d53879d8 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -24,6 +24,8 @@ config FDT_MPXY_RPMI_LOGGING
 
 config FDT_MPXY_RPMI_SYSMSI
 	bool "MPXY driver for RPMI system MSI service group"
+	depends on RPMI_MAILBOX
+	select RPMI_SYSMSI
 	default n
 
 config FDT_MPXY_RPMI_VOLTAGE
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
index 1dcc049e..f9ed5de4 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
@@ -7,20 +7,14 @@
 #include <sbi/sbi_bitmap.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_byteorder.h>
-#include <sbi/sbi_heap.h>
-#include <sbi_utils/mailbox/rpmi_mailbox.h>
+#include <sbi_utils/irqchip/rpmi_sysmsi.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
 
-struct mpxy_rpmi_sysmsi {
-	u32 sys_num_msi;
-	unsigned long *sys_msi_denied_bmap;
-};
-
 static int mpxy_rpmi_sysmis_xfer(void *context, struct mbox_chan *chan,
 				 struct mbox_xfer *xfer)
 {
 	struct rpmi_message_args *args = xfer->args;
-	struct mpxy_rpmi_sysmsi *smg = context;
+	struct rpmi_sysmsi_data *smg = context;
 	u64 sys_msi_address;
 	u32 sys_msi_index;
 	int rc = 0;
@@ -77,62 +71,21 @@ static int mpxy_rpmi_sysmis_xfer(void *context, struct mbox_chan *chan,
 
 static void mpxy_rpmi_sysmsi_cleanup(void *context)
 {
-	struct mpxy_rpmi_sysmsi *smg = context;
+	struct rpmi_sysmsi_data *smg = context;
 
-	sbi_free(smg->sys_msi_denied_bmap);
-	sbi_free(smg);
+	rpmi_sysmsi_cleanup(smg);
 }
 
 static int mpxy_rpmi_sysmsi_setup(void **context, struct mbox_chan *chan,
 				  const struct mpxy_rpmi_mbox_data *data)
 {
-	struct rpmi_sysmsi_get_msi_attributes_resp gmaresp;
-	struct rpmi_sysmsi_get_msi_attributes_req gmareq;
-	struct rpmi_sysmsi_get_attributes_resp garesp;
-	struct mpxy_rpmi_sysmsi *smg;
-	u32 p2a_db_index;
-	int rc, i;
-
-	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_P2A_DOORBELL_SYSMSI_INDEX,
-				     &p2a_db_index);
-	if (rc)
-		return rc;
+	struct rpmi_sysmsi_data *smg;
+	int rc;
 
-	rc = rpmi_normal_request_with_status(chan, RPMI_SYSMSI_SRV_GET_ATTRIBUTES,
-					     NULL, 0, 0, &garesp, rpmi_u32_count(garesp),
-					     rpmi_u32_count(garesp));
+	rc = rpmi_sysmsi_setup(chan, &smg);
 	if (rc)
 		return rc;
 
-	smg = sbi_zalloc(sizeof(*smg));
-	if (!smg)
-		return SBI_ENOMEM;
-
-	smg->sys_num_msi = garesp.sys_num_msi;
-	smg->sys_msi_denied_bmap = sbi_zalloc(bitmap_estimate_size(smg->sys_num_msi));
-	if (!smg->sys_msi_denied_bmap) {
-		sbi_free(smg);
-		return SBI_ENOMEM;
-	}
-
-	for (i = 0; i < smg->sys_num_msi; i++) {
-		gmareq.sys_msi_index = i;
-		rc = rpmi_normal_request_with_status(chan,
-						     RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES,
-						     &gmareq, rpmi_u32_count(gmareq),
-						     rpmi_u32_count(gmareq),
-						     &gmaresp, rpmi_u32_count(gmaresp),
-						     rpmi_u32_count(gmaresp));
-		if (rc) {
-			mpxy_rpmi_sysmsi_cleanup(smg);
-			return rc;
-		}
-
-		if (p2a_db_index == i ||
-		    (gmaresp.flag0 & RPMI_SYSMSI_MSI_ATTRIBUTES_FLAG0_PREF_PRIV))
-			bitmap_set(smg->sys_msi_denied_bmap, i, 1);
-	}
-
 	*context = smg;
 	return 0;
 }

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
