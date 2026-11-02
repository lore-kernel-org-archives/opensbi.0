Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D12606A333
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 03:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=omKj8jI2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=kpIdIKvO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9VyeN2D0jdWIxzCsBTnCVMo5G2nvOZ7iGkknvy+beJc=; b=omKj8jI2up966pjmjY6mhEKp/A
	jdCuJDKruGA2/UQI0xFcDoRJ7xnBVHs0KSHEkmBk+wNHVbGGJAD9mGgwJ0UXzka+g9SSr6vwVOsSs
	uvoBv92IxKfwPqe3RRENj2qVa1st064t5hqJfQ0Vr0I+7JAKBoQRu3PW6lJDi77vbba/6/4ocqcc0
	d5Rbe683SIE/oZYZyeAimRl0obTH3OU/iLn2mvfvf7rxuKAB6JsEz9EXq/IzohXRS9RKAiNo0s2v1
	xdwYbkiqT6FzvQ8Z7WTNUt/r6yCvweeeB9RKwBh8TF14XQ/q4KDEg+F/3urWVQ//6iSaAPoRy1hRc
	wvPfpgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1N-0000000FTG8-0Onu;
	Mon, 02 Nov 2026 03:47:45 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1I-0000000FTDK-3A45
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 03:47:43 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3698030eec.0
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 19:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793591260; x=1794196060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+71kFN+KKN/GikiF7lgn6sCYkDlVVeEntbUJTij6GqU=;
        b=kpIdIKvO42TD8tdyuZmItLqa+in86f7MsBoPmnU/8l2gKvxlGd2VKX44cQksF0GW4Q
         BNl4ENsmiG7uSXeLbFnk/jVTYFeUgpVEyAQk5KCjK+bGmcY6HWXWrzsLwdu9XT90cOhD
         pvd5GJNfsOeoVZETlisaaUAQBGcJ5bSWWQAJCSv0x06Iu6PCcxPEbhGG8yjTGcOxCcnm
         eX5Ef8BXiz4AWQKQvNOAeHj7NW8W257kc5sk16y2diTCntcNswYzadMgqqImSskHfJ5a
         ICTAIqF1Eyauccg6ZxuxWHbdybMKyR0tdp4292PixWXeftLT3WsKmjo8TnD3CVMxmk/2
         Zxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591260; x=1794196060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+71kFN+KKN/GikiF7lgn6sCYkDlVVeEntbUJTij6GqU=;
        b=0u1VYnBXTJ7WYYZfEeVKXBWKCBgA13TPmL0PqWmzgS160lAqzOBs7fr/e57uNtQ13/
         GfYOenykflgr6xTQj/aZT+0b/MRyb14j6WYkPZPQVaYcS5wWpNUspJ59cQmHQ4WnOylm
         0VK1N/yalqVbgmgyWRQVq4sVaSwdes+mynCo1ass2ygsArPQkhTht6NT0sJTg7aC6agZ
         Hgy3WyJ9cnQ+pbdFmtTXlbk6rupIk8VXjNpnUOHY8r9Pd8rqLeXaV/JQn0OCQoPiXcWi
         DjCj3Pseeac193ibE6sdQUw9M37sunC7UVISjtcL2zZfaXhCIPau7YNMuS+xk2EFElec
         ROZQ==
X-Gm-Message-State: AFq9FYJ+hWQYLSqGYp3nEb6C0quMoOi53k9VZbafipJdJ5JsOp+IdEQJ
	rByGtOOJSVvIH3+bVjwZuWqw0iWDfaDzMA6Oezo878fkguX3/AWmT35QHuE/xehW4w4=
X-Gm-Gg: AYBFou3Hdg74SY2ONkmWnOimIbE08Tq7sxdDEFZgZlEV+nSjfgeDEXO3bxMhFZNEyl2
	F2dczvgHbRKe+WOaBQoM+dyDEMVvbEKe2zmdSN5Bz+olgkQautyeGTn6qFdrulhZFPzl/0rKu/2
	XxqpCLG+brksYkt/F3FA9grAR9vrwh6daqRdiy1EF5ci4b6y2mXXL59DDK+bgGF3/+cc/KfnI5l
	qML4vVPY9JtluvZiPEMf21U1YgUBzMht9pxqTfkrEy2GuERM1KqD3Du6GcCihwxJt4D6wUEyXhn
	ghoOlEY8gF8GTyQez9TDy4f7h+tBiOF2G1KbMfE+qeYv0BbXOBPhyW/w3d1SKtBz5OvVifTPjo0
	Vit0A5qh8GPvOovyJFQFSFpFCTNlww1isbMYSA28Fr3qKW9XQwyBQlZizgkxbv/91ZxZ56fhqyw
	yA2W1/Lrl0jnBYsVTkU2fcA7N2Lgo8qurOSMFtJNlPdcHPacDEMNgVx3AjuKzc8XfWxc5mUz6yr
	A8WTlrfS/ctSpeRV/cymQpWlJ2kCi+7KRYe1zpPp99ETof9sFc/rN6eu96pAJDnrSgMQJx9QiUj
	f7D4J9PhSuHQ4k3IM5FcMxCzVf9jy0B4zfjupGsKxBvHU9W8DAJeNMlEnxcCe9tlRpoSRwwMzKU
	iuZpwdRMhGrDhTQU7bj84E/xT/DjTAGKYYK+/1iLE0rPAOhEC
X-Received: by 2002:a05:7022:2522:b0:185:b157:f271 with SMTP id a92af1059eb24-1ac5d2c58cfmr17931225c88.23.1793591259415;
        Sun, 01 Nov 2026 19:47:39 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm30308670eec.12.2026.11.01.19.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:47:38 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Sun, 01 Nov 2026 19:47:19 -0800
Subject: [PATCH 5/5] lib: utils/irqchip: Add RPMI system MSI driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261101-dev-nickh-msysmsi-dev-upstream-v1-5-117b2e075be0@sifive.com>
References: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
In-Reply-To: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, greentime.hu@sifive.com, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194740_829183_03AF7D02 
X-CRM114-Status: GOOD (  27.11  )
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

Add an irqchip driver for the RPMI System MSI service group. The
platform microcontroller exposes system MSI sources, and this driver
routes them to the M-mode IMSIC as regular MSIs so they can be handled
through the generic sbi_irqchip framework.

For each system MSI hwirq that is set up, the driver:
 - allocates an MSI vector on the parent IMSIC and, once the IMSIC
   composes the MSI message, programs it into the microcontroller with
   SYSMSI_SRV_SET_MSI_TARGET,
 - forwards affinity changes to the parent IMSIC,
 - masks/unmasks both the parent IMSIC vector and the RPMI MSI state
   with SYSMSI_SRV_SET_MSI_STATE,
 - marks the hwirq as denied in the shared bitmap so it is no longer
   exposed through MPXY, restoring the previous state on cleanup.

The P2A doorbell index reported by the service group is saved in
rpmi_sysmsi_data, and setup requests for it are rejected currently.

Also add an FDT driver matching "riscv,rpmi-system-msi". It looks up
the IMSIC through "msi-parent" and only claims the node if that IMSIC
targets M-mode. In that case it requests the mailbox channel, registers
the irqchip, and registers an FDT fixup that disables the node in the
DT passed to the next boot stage. The driver is selected by the new
FDT_IRQCHIP_RPMI_SYSMSI Kconfig option, which is enabled in the generic
platform defconfig. A new SBI_IRQCHIP_CAPS_RPMI_SYSMSI capability bit
identifies this irqchip type.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_irqchip.h                   |   1 +
 include/sbi_utils/irqchip/rpmi_sysmsi.h     |   2 +
 lib/utils/irqchip/Kconfig                   |   6 +
 lib/utils/irqchip/fdt_irqchip_rpmi_sysmsi.c | 119 +++++++++++++
 lib/utils/irqchip/objects.mk                |   3 +
 lib/utils/irqchip/rpmi_sysmsi.c             | 263 ++++++++++++++++++++++++++++
 platform/generic/configs/defconfig          |   1 +
 7 files changed, 395 insertions(+)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index f5dbf1c7..5d585f24 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -40,6 +40,7 @@ struct sbi_irqchip_device {
 	/** Capabilities of this irqchip */
 #define SBI_IRQCHIP_CAPS_WIRED		BIT(0)
 #define SBI_IRQCHIP_CAPS_MSI		BIT(1)
+#define SBI_IRQCHIP_CAPS_RPMI_SYSMSI	BIT(2)
 	unsigned long caps;
 
 	/** Number of hardware IRQs of this irqchip */
diff --git a/include/sbi_utils/irqchip/rpmi_sysmsi.h b/include/sbi_utils/irqchip/rpmi_sysmsi.h
index 90825557..e1d10e50 100644
--- a/include/sbi_utils/irqchip/rpmi_sysmsi.h
+++ b/include/sbi_utils/irqchip/rpmi_sysmsi.h
@@ -15,9 +15,11 @@ struct rpmi_sysmsi_data {
 	unsigned long *sys_msi_denied_bmap;
 	u32 sys_num_msi;
 	u32 ref_cnt;
+	u32 p2a_db_index;
 };
 
 void rpmi_sysmsi_cleanup(struct rpmi_sysmsi_data *data);
 int rpmi_sysmsi_setup(struct mbox_chan *chan, struct rpmi_sysmsi_data **out_data);
+int irqchip_rpmi_sysmsi_setup(struct mbox_chan *chan, u32 id, u32 imsic_id);
 
 #endif
diff --git a/lib/utils/irqchip/Kconfig b/lib/utils/irqchip/Kconfig
index 03f297dc..152dcc6e 100644
--- a/lib/utils/irqchip/Kconfig
+++ b/lib/utils/irqchip/Kconfig
@@ -24,6 +24,12 @@ config FDT_IRQCHIP_PLIC
 	select IRQCHIP_PLIC
 	default n
 
+config FDT_IRQCHIP_RPMI_SYSMSI
+	bool "RPMI SYSMSI Interrupt Controller (RPMI SYSMSI) FDT driver"
+	depends on FDT_MAILBOX && FDT_IRQCHIP_IMSIC && RPMI_MAILBOX
+	select RPMI_SYSMSI
+	default n
+
 endif
 
 config IRQCHIP_APLIC
diff --git a/lib/utils/irqchip/fdt_irqchip_rpmi_sysmsi.c b/lib/utils/irqchip/fdt_irqchip_rpmi_sysmsi.c
new file mode 100644
index 00000000..7e4ac394
--- /dev/null
+++ b/lib/utils/irqchip/fdt_irqchip_rpmi_sysmsi.c
@@ -0,0 +1,119 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ * Authors:
+ *   Nick Hu <nick.hu@sifive.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/irqchip/imsic.h>
+#include <sbi_utils/irqchip/rpmi_sysmsi.h>
+#include <sbi_utils/mailbox/fdt_mailbox.h>
+#include <sbi_utils/mailbox/rpmi_msgprot.h>
+
+static int fdt_rpmi_sysmsi_find_imsic(const void *fdt, int nodeoff, struct imsic_data *imsic)
+{
+	const fdt32_t *val;
+	int noff, len;
+
+	val = fdt_getprop(fdt, nodeoff, "msi-parent", &len);
+	if (!val || len < sizeof(fdt32_t))
+		return SBI_ENODEV;
+
+	noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+	if (noff < 0)
+		return SBI_ENODEV;
+
+	return fdt_parse_imsic_node(fdt, noff, imsic);
+}
+
+static void fdt_rpmi_sysmsi_do_fixup(struct fdt_general_fixup *f, void *fdt)
+{
+	const int status_size = sizeof(struct fdt_property) +
+				ROUNDUP(sizeof("disabled"), FDT_TAGSIZE) +
+				sizeof("status");
+	struct imsic_data imsic;
+	int noff = -1, rc;
+
+	while ((noff = fdt_node_offset_by_compatible(fdt, noff, "riscv,rpmi-system-msi")) >= 0) {
+
+		if (!fdt_node_is_enabled(fdt, noff))
+			continue;
+		if (fdt_rpmi_sysmsi_find_imsic(fdt, noff, &imsic))
+			continue;
+		if (!imsic.targets_mmode)
+			continue;
+
+		rc = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + status_size);
+		if (rc < 0)
+			return;
+
+		rc = fdt_setprop_string(fdt, noff, "status", "disabled");
+		if (rc)
+			sbi_printf("%s: failed to disable %s (%d)\n",
+				   __func__, fdt_get_name(fdt, noff, NULL), rc);
+	}
+}
+
+static struct fdt_general_fixup rpmi_sysmsi_fixup = {
+	.name = "rpmi-sysmsi-fixup",
+	.do_fixup = fdt_rpmi_sysmsi_do_fixup,
+};
+
+static int fdt_rpmi_sysmsi_cold_init(const void *fdt, int nodeoff,
+				     const struct fdt_match *match)
+{
+	struct imsic_data imsic;
+	struct mbox_chan *chan;
+	int rc;
+
+	rc = fdt_rpmi_sysmsi_find_imsic(fdt, nodeoff, &imsic);
+	if (rc)
+		return rc;
+
+	if (!imsic.targets_mmode)
+		return 0;
+
+	rc = imsic_data_check(&imsic);
+	if (rc)
+		return rc;
+
+	rc = fdt_register_general_fixup(&rpmi_sysmsi_fixup);
+	if (rc && rc != SBI_EALREADY)
+		return rc;
+
+	rc = fdt_mailbox_request_chan(fdt, nodeoff, 0, &chan);
+	if (rc)
+		return SBI_ENODEV;
+
+	if (chan->chan_args[0] != RPMI_SRVGRP_SYSTEM_MSI) {
+		rc = SBI_EINVAL;
+		goto free_chan;
+	}
+
+	rc = irqchip_rpmi_sysmsi_setup(chan, nodeoff, imsic.unique_id);
+	if (rc)
+		goto free_chan;
+
+	return SBI_OK;
+
+free_chan:
+	mbox_controller_free_chan(chan);
+	return rc;
+}
+
+static const struct fdt_match irqchip_rpmi_sysmsi_match[] = {
+	{ .compatible = "riscv,rpmi-system-msi" },
+	{ },
+};
+
+const struct fdt_driver fdt_irqchip_rpmi_sysmsi = {
+	.match_table = irqchip_rpmi_sysmsi_match,
+	.init = fdt_rpmi_sysmsi_cold_init,
+};
diff --git a/lib/utils/irqchip/objects.mk b/lib/utils/irqchip/objects.mk
index 3195a273..0e77c460 100644
--- a/lib/utils/irqchip/objects.mk
+++ b/lib/utils/irqchip/objects.mk
@@ -19,6 +19,9 @@ libsbiutils-objs-$(CONFIG_FDT_IRQCHIP_IMSIC) += irqchip/fdt_irqchip_imsic.o
 carray-fdt_irqchip_drivers-$(CONFIG_FDT_IRQCHIP_PLIC) += fdt_irqchip_plic
 libsbiutils-objs-$(CONFIG_FDT_IRQCHIP_PLIC) += irqchip/fdt_irqchip_plic.o
 
+carray-fdt_irqchip_drivers-$(CONFIG_FDT_IRQCHIP_RPMI_SYSMSI) += fdt_irqchip_rpmi_sysmsi
+libsbiutils-objs-$(CONFIG_FDT_IRQCHIP_RPMI_SYSMSI) += irqchip/fdt_irqchip_rpmi_sysmsi.o
+
 libsbiutils-objs-$(CONFIG_IRQCHIP_APLIC) += irqchip/aplic.o
 libsbiutils-objs-$(CONFIG_IRQCHIP_IMSIC) += irqchip/imsic.o
 libsbiutils-objs-$(CONFIG_IRQCHIP_PLIC) += irqchip/plic.o
diff --git a/lib/utils/irqchip/rpmi_sysmsi.c b/lib/utils/irqchip/rpmi_sysmsi.c
index d403ce17..67483deb 100644
--- a/lib/utils/irqchip/rpmi_sysmsi.c
+++ b/lib/utils/irqchip/rpmi_sysmsi.c
@@ -8,6 +8,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_irqchip.h>
 #include <sbi_utils/irqchip/rpmi_sysmsi.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
 
@@ -81,6 +82,7 @@ int rpmi_sysmsi_setup(struct mbox_chan *chan, struct rpmi_sysmsi_data **out_data
 
 	data->ref_cnt = 1;
 	data->chan = chan;
+	data->p2a_db_index = p2a_db_index;
 	data->sys_num_msi = garesp.sys_num_msi;
 	data->sys_msi_denied_bmap = sbi_zalloc(bitmap_estimate_size(data->sys_num_msi));
 	if (!data->sys_msi_denied_bmap) {
@@ -115,3 +117,264 @@ free_data:
 	sbi_free(data);
 	return rc;
 }
+
+struct irqchip_rpmi_sysmsi {
+	struct sbi_irqchip_device irqchip;
+	struct rpmi_sysmsi_data *data;
+	u32 imsic_id;
+};
+
+struct sysmsi_hwirq_data {
+	struct irqchip_rpmi_sysmsi *sysmsi_irqchip;
+	u32 hwirq;
+	u32 imsic_hwirq;
+	bool mpxy_allow_on_clean;
+};
+
+static void rpmi_sysmsi_write_msi(u32 imsic_hwirq,
+				  const struct sbi_irqchip_msi_msg *msg, void *priv)
+{
+	struct rpmi_sysmsi_set_msi_target_req smtreq;
+	struct rpmi_sysmsi_set_msi_target_resp smtresp;
+	struct sysmsi_hwirq_data *hwirq_data = priv;
+	int rc;
+
+	if (!msg->address_hi && !msg->address_lo && !msg->data)
+		return;
+
+	smtreq.sys_msi_index = hwirq_data->hwirq;
+	smtreq.sys_msi_address_low = msg->address_lo;
+	smtreq.sys_msi_address_high = msg->address_hi;
+	smtreq.sys_msi_data = msg->data;
+	rc = rpmi_normal_request_with_status(hwirq_data->sysmsi_irqchip->data->chan,
+					     RPMI_SYSMSI_SRV_SET_MSI_TARGET,
+					     &smtreq, rpmi_u32_count(smtreq),
+					     rpmi_u32_count(smtreq),
+					     &smtresp, rpmi_u32_count(smtresp),
+					     rpmi_u32_count(smtresp));
+	if (rc)
+		sbi_printf("%s: SYSMSI_SRV_SET_MSI_TARGET failed rc=%d\n", __func__, rc);
+}
+
+static int rpmi_sysmsi_callback(u32 imsic_hwirq, void *priv)
+{
+	struct sysmsi_hwirq_data *hwirq_data = priv;
+	int rc;
+
+	rc = sbi_irqchip_process_hwirq(&hwirq_data->sysmsi_irqchip->irqchip, hwirq_data->hwirq);
+	if (rc && rc != SBI_ENOENT)
+		sbi_printf("%s: imsic_hwirq=%lu failed rc=%d\n",
+			   __func__, (unsigned long)imsic_hwirq, rc);
+
+	return rc;
+}
+
+static int rpmi_sysmsi_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq, u32 hwirq_flags)
+{
+	struct irqchip_rpmi_sysmsi *sysmsi_irqchip;
+	struct sysmsi_hwirq_data *hwirq_data;
+	struct sbi_irqchip_device *imsic;
+	unsigned long *mpxy_denied_bmap;
+	bool mpxy_allow_on_clean;
+	u32 first_hwirq;
+	int rc;
+
+	if (hwirq_flags != SBI_HWIRQ_FLAGS_NONE)
+		return SBI_ENOTSUPP;
+
+	sysmsi_irqchip = container_of(chip, struct irqchip_rpmi_sysmsi, irqchip);
+	if (hwirq == sysmsi_irqchip->data->p2a_db_index)
+		return SBI_EINVAL;
+
+	imsic = sbi_irqchip_find_device(sysmsi_irqchip->imsic_id);
+	if (!imsic) {
+		sbi_printf("%s: msi_parent is NULL hwirq=%lu\n", __func__, (unsigned long)hwirq);
+		return SBI_EINVAL;
+	}
+
+	hwirq_data = sbi_zalloc(sizeof(*hwirq_data));
+	if (!hwirq_data)
+		return SBI_ENOMEM;
+
+	hwirq_data->sysmsi_irqchip = sysmsi_irqchip;
+	hwirq_data->hwirq = hwirq;
+
+	/* Refuse the MPXY if the m-mode driver has registered it */
+	mpxy_denied_bmap = sysmsi_irqchip->data->sys_msi_denied_bmap;
+	mpxy_allow_on_clean = !bitmap_test(mpxy_denied_bmap, hwirq);
+	bitmap_set(mpxy_denied_bmap, hwirq, 1);
+
+	rc = sbi_irqchip_register_msi(imsic, 1,
+				      rpmi_sysmsi_write_msi, rpmi_sysmsi_callback,
+				      hwirq_data, &first_hwirq);
+	if (rc) {
+		sbi_printf("%s: register_msi failed hwirq=%lu rc=%d\n",
+			   __func__, (unsigned long)hwirq, rc);
+		sbi_free(hwirq_data);
+
+		if (mpxy_allow_on_clean)
+			bitmap_clear(mpxy_denied_bmap, hwirq, 1);
+		return rc;
+	}
+
+	hwirq_data->imsic_hwirq = first_hwirq;
+	hwirq_data->mpxy_allow_on_clean = mpxy_allow_on_clean;
+	sbi_irqchip_set_hwirq_priv(&sysmsi_irqchip->irqchip, hwirq, hwirq_data);
+
+	return SBI_OK;
+}
+
+static void rpmi_sysmsi_hwirq_cleanup(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct sysmsi_hwirq_data *hwirq_data = sbi_irqchip_get_hwirq_priv(chip, hwirq);
+	struct irqchip_rpmi_sysmsi *sysmsi_irqchip;
+	struct sbi_irqchip_device *parent;
+
+	if (!hwirq_data)
+		return;
+
+	sysmsi_irqchip = hwirq_data->sysmsi_irqchip;
+	if (hwirq_data->mpxy_allow_on_clean)
+		bitmap_clear(sysmsi_irqchip->data->sys_msi_denied_bmap, hwirq, 1);
+
+	parent = sbi_irqchip_find_device(sysmsi_irqchip->imsic_id);
+	sbi_irqchip_unregister_handler(parent, hwirq_data->imsic_hwirq, 1);
+	sbi_irqchip_set_hwirq_priv(chip, hwirq, NULL);
+	sbi_free(hwirq_data);
+}
+
+static int rpmi_sysmsi_set_affinity(struct sbi_irqchip_device *chip, u32 hwirq, u32 hart_index)
+{
+	struct irqchip_rpmi_sysmsi *sysmsi_irqchip;
+	struct sysmsi_hwirq_data *hwirq_data;
+	struct sbi_irqchip_device *parent;
+	int rc;
+
+	hwirq_data = sbi_irqchip_get_hwirq_priv(chip, hwirq);
+	if (!hwirq_data)
+		return SBI_EINVAL;
+
+	sysmsi_irqchip = hwirq_data->sysmsi_irqchip;
+	parent = sbi_irqchip_find_device(sysmsi_irqchip->imsic_id);
+	if (!parent) {
+		sbi_printf("%s: msi_parent is NULL hwirq=%lu\n", __func__, (unsigned long)hwirq);
+		return SBI_EINVAL;
+	}
+
+	rc = sbi_irqchip_set_affinity(parent, hwirq_data->imsic_hwirq, hart_index);
+	if (rc) {
+		sbi_printf("%s: set affinity failed hwirq=%lu rc=%d\n",
+			   __func__, (unsigned long)hwirq, rc);
+		return rc;
+	}
+
+	return SBI_OK;
+}
+
+static void rpmi_sysmsi_hwirq_mask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct rpmi_sysmsi_set_msi_state_resp smsresp;
+	struct rpmi_sysmsi_set_msi_state_req smsreq;
+	struct irqchip_rpmi_sysmsi *sysmsi_irqchip;
+	struct sysmsi_hwirq_data *hwirq_data;
+	struct sbi_irqchip_device *parent;
+	int rc;
+
+	hwirq_data = sbi_irqchip_get_hwirq_priv(chip, hwirq);
+	if (!hwirq_data)
+		return;
+
+	sysmsi_irqchip = hwirq_data->sysmsi_irqchip;
+	parent = sbi_irqchip_find_device(sysmsi_irqchip->imsic_id);
+	rc = sbi_irqchip_mask_hwirq(parent, hwirq_data->imsic_hwirq);
+	if (rc && rc != SBI_EALREADY)
+		sbi_printf("%s: mask parent hwirq fail rc=%d\n", __func__, rc);
+
+	smsreq.sys_msi_index = hwirq;
+	smsreq.sys_msi_state = 0;
+	rc = rpmi_normal_request_with_status(sysmsi_irqchip->data->chan,
+					     RPMI_SYSMSI_SRV_SET_MSI_STATE,
+					     &smsreq, rpmi_u32_count(smsreq),
+					     rpmi_u32_count(smsreq),
+					     &smsresp, rpmi_u32_count(smsresp),
+					     rpmi_u32_count(smsresp));
+	if (rc)
+		sbi_printf("%s: SYSMSI_SRV_SET_MSI_STATE failed hwirq=%lu rc=%d\n",
+			   __func__, (unsigned long)hwirq, rc);
+}
+
+static void rpmi_sysmsi_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct rpmi_sysmsi_set_msi_state_resp smsresp;
+	struct rpmi_sysmsi_set_msi_state_req smsreq;
+	struct irqchip_rpmi_sysmsi *sysmsi_irqchip;
+	struct sysmsi_hwirq_data *hwirq_data;
+	struct sbi_irqchip_device *parent;
+	int rc;
+
+	hwirq_data = sbi_irqchip_get_hwirq_priv(chip, hwirq);
+	if (!hwirq_data)
+		return;
+
+	sysmsi_irqchip = hwirq_data->sysmsi_irqchip;
+	parent = sbi_irqchip_find_device(sysmsi_irqchip->imsic_id);
+	rc = sbi_irqchip_unmask_hwirq(parent, hwirq_data->imsic_hwirq);
+	if (rc && rc != SBI_EALREADY)
+		sbi_printf("%s: unmask parent hwirq fail rc=%d\n", __func__, rc);
+
+	smsreq.sys_msi_index = hwirq;
+	smsreq.sys_msi_state = RPMI_SYSMSI_MSI_STATE_ENABLE;
+	rc = rpmi_normal_request_with_status(sysmsi_irqchip->data->chan,
+					     RPMI_SYSMSI_SRV_SET_MSI_STATE,
+					     &smsreq, rpmi_u32_count(smsreq),
+					     rpmi_u32_count(smsreq),
+					     &smsresp, rpmi_u32_count(smsresp),
+					     rpmi_u32_count(smsresp));
+	if (rc)
+		sbi_printf("%s: SYSMSI_SRV_SET_MSI_STATE failed hwirq=%lu rc=%d\n",
+			   __func__, (unsigned long)hwirq, rc);
+}
+
+static struct sbi_irqchip_device rpmi_sysmsi_irqchip_dev = {
+	.hwirq_setup = rpmi_sysmsi_hwirq_setup,
+	.hwirq_cleanup = rpmi_sysmsi_hwirq_cleanup,
+	.hwirq_set_affinity = rpmi_sysmsi_set_affinity,
+	.hwirq_mask = rpmi_sysmsi_hwirq_mask,
+	.hwirq_unmask = rpmi_sysmsi_hwirq_unmask,
+};
+
+int irqchip_rpmi_sysmsi_setup(struct mbox_chan *chan, u32 id, u32 imsic_id)
+{
+	struct irqchip_rpmi_sysmsi *sysmsi_irqchip;
+	int rc;
+
+	sysmsi_irqchip = sbi_zalloc(sizeof(*sysmsi_irqchip));
+	if (!sysmsi_irqchip)
+		return SBI_ENOMEM;
+
+	rc = rpmi_sysmsi_setup(chan, &sysmsi_irqchip->data);
+	if (rc) {
+		sbi_printf("%s: rpmi_sysmsi_setup failed rc=%d\n", __func__, rc);
+		goto free_irqchip;
+	}
+
+	sysmsi_irqchip->imsic_id = imsic_id;
+	sysmsi_irqchip->irqchip = rpmi_sysmsi_irqchip_dev;
+	sysmsi_irqchip->irqchip.id = id;
+	sysmsi_irqchip->irqchip.caps = SBI_IRQCHIP_CAPS_RPMI_SYSMSI;
+	sysmsi_irqchip->irqchip.num_hwirq = sysmsi_irqchip->data->sys_num_msi;
+
+	sbi_hartmask_set_all(&sysmsi_irqchip->irqchip.target_harts);
+	rc = sbi_irqchip_add_device(&sysmsi_irqchip->irqchip);
+	if (rc) {
+		sbi_printf("%s: sbi_irqchip_add_device failed rc=%d\n", __func__, rc);
+		goto free_data;
+	}
+
+	return SBI_OK;
+free_data:
+	rpmi_sysmsi_cleanup(sysmsi_irqchip->data);
+free_irqchip:
+	sbi_free(sysmsi_irqchip);
+	return rc;
+}
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 98829884..97ca9d18 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -42,6 +42,7 @@ CONFIG_FDT_IRQCHIP=y
 CONFIG_FDT_IRQCHIP_APLIC=y
 CONFIG_FDT_IRQCHIP_IMSIC=y
 CONFIG_FDT_IRQCHIP_PLIC=y
+CONFIG_FDT_IRQCHIP_RPMI_SYSMSI=y
 CONFIG_FDT_MAILBOX=y
 CONFIG_RPMI_MAILBOX=y
 CONFIG_FDT_MAILBOX_RPMI_SHMEM=y

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
