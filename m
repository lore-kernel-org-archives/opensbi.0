Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EA6606A324
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QrBtvpPR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dHWdCJAr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=quRRLnv0KAZdCssC7/gqz9yadWW2OSIrvWAoHm6iKoo=; b=QrBtvpPR0PPXSPEVJme8XQd8kb
	vE/WbKNpXLlu6kNUxAAirdRrSA0HYcQ0tio/r7uucW1Ikv9NRUE0N2Bf4XgAHjuHG7hnZShvojzIa
	QB5PEIxTXaKaCagZiJIG94I6biazHIY2Z1poe7PWip/CtcIArPw9Bqg4jQQ+EZGqZ45oreyzb8tFE
	mKuRxnvCD1ngEZSQAu9aqz4nR2q4/YlX0BWc+jovIM8wRA6P03AIbRFfaAY0YnUX7iHt9oSCWrXP4
	GFmcAr/WRx/2P47kumj2q8CalmZ9ycrxtjkSL4dOycupZtSmNf1f7uJgBPDEGGTB/yvZz0kQ5V/7P
	QHWIhTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXf-00000009iFS-3vMd;
	Thu, 29 Oct 2026 15:59:51 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXd-00000009iEH-333N
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 15:59:51 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-53664b4860bso25714331cf.1
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 08:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289588; x=1793894388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhACzLG53dzJmE4ROk5Y4Z16otYJCMnqlw+/e0l5FjE=;
        b=dHWdCJAr9nNdEAiLHvaRPkZO/yDsM2bsG/0VnZIl4FvoKfcZYMe9sWMXl2QyHfxWZ2
         KXtwl6gL8JemItXwx22XXkxTHPNT3QQkDmuiAFOEjXlvilCPqFSDxk/p2yj0AChZi3tp
         ooD6z5dTAVzWkMHpNep727huthJRpwuYZOVczRt64QfbANUEoMt297QCC6Il9+748a7H
         8Wpg9zENRc2bQ6dSDTuz0d8eI8TluPZWFcSr9Cx0jrSCeyOhsn2N8BmkeJdMVl/OZm4e
         0Iiuo2tqjkqv1cJzAhCaVNpnatdwniOWJlJp4Alac2HBAt9F+6qSTHpzd1fe85IQPV5u
         jPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289588; x=1793894388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhACzLG53dzJmE4ROk5Y4Z16otYJCMnqlw+/e0l5FjE=;
        b=LBIlHAaAGhHV8vhdulHnG2R5rKAr+EwoK0ydVGACvQKrMoCL4z5avYXuOt1OBeaOwN
         +dv/ffyFUICGRfWR6joaL+1FikS4UeD/aiaba3zANRIlmt/hLcccI+RajPCa3XKME/uu
         6VS6ASpiZSywUmgCW0n4u+CGsqnUs7CVvVeVKeqdsZkQEzI21aN2ZeeIzh/xS3KwA/hc
         Px4wM518bFSSUD1FWp0Ep/uDJ5xkUJhZBDt7f9XDgkDah+oTlNTjYvV/tzrjy3Zr+2wL
         tt1DfE5VOmHltTgHRNnfBJSiWGoizI261pcX3FX8/r3Ne/lJU9MzGxX4WGuOdvwG2Xq9
         slUw==
X-Gm-Message-State: AFq9FYKceAS0xxdEzPIotlsQ0GZ2wDT4IXN0mHS8XjQw7nwdMKmAmnLQ
	iu7RIlB7s/IHOosbi4YYvrFXZSMgMlN2ITQjNVMM56WbrbDJuv0FS6B6axfbXg==
X-Gm-Gg: AYBFou2gwv6J/TsuXe2n3uD2AFtBn0chE/5CMKCy/wGg9vOTvFJrHkNgMp+Kwt+jCDX
	CBvW13GQowzflXKecD462/7F+j6ZCY01GDzAMukRiVzUOQ2/cOFscto6M2wZ1FK2tXqWRl3fp4Y
	yhNHoVxuQy6tVnxQ+R9lrSScD5t+4qvZuDXCFImcSFO8ZGFE8pKbGazFw7u5WCqwity5jv8O+nM
	79sNc6q0ICol5YxZitfp2q6nsdDlOCTnWadlFAjxyJ0+OXuHkXTxqrgfW2LyCUuOHBtUaeWdGHC
	JKYyksKvg359cx23qClIeDLGGO9zHNmDO1od5fRd+MTilAM7+FyUzoPLgugbVhga14VDtKtfC0M
	OaeE5ee6bZ3cbm8IRm1cIIjTPsv/jCTj+brcgL3OHssX8Z5xWl4QOB+JlenF/+fiS5Z6rkZgk8W
	BRFrKPEW7uPwj/Pj/ci2CvNd/02Lknyis3Yg1sno/vPWK1fTlUZYDDR4VjyeMGXag5YJ79C0WMS
	M5G+s7hCLcGSciqkyXeHLwxoaI5Tq2x564S88ptCzo0R0kRBGcvoHEtoQkjH5m7R5PeTOom4Urn
	O08W+HSrETgQPnAciQW4M1kcM34xcqlZWXMNix//rRT15S7ye8l8ukskU+vFXwHP2mTIOEVOLM0
	YZzGiMkjqm32nNw==
X-Received: by 2002:a05:622a:5e10:b0:531:17a2:4e4a with SMTP id d75a77b69052e-53fcc3cfdbamr85992141cf.47.1793289587892;
        Thu, 29 Oct 2026 08:59:47 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.08.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:59:47 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 01/12] lib: utils: add RPMI SYSTEM_IRQ service support
Date: Thu, 29 Oct 2026 11:59:18 -0400
Message-Id: <20261029155929.586597-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_085949_803964_67AD1D8C 
X-CRM114-Status: GOOD (  23.89  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Raymond Mao <raymond.mao@riscstar.com>

Provide an SBI MPXY implementation of the RPMI SYSTEM_IRQ service
group, version 2.0, with GET_ATTRIBUTES, GET_TARGET_ATTRIBUTES,
GET_IRQ_ATTRIBUTES and SYSIRQ_CLAIM. Other services return NOTSUPP.

Expose backend callbacks for claiming and completing IRQs, allowing
delivery implementations to register domain-owned channels. Target
indices enumerate possible harts and CLAIM is restricted to the
calling domain and hart.

Keep claimed sources outstanding until the next valid CLAIM, after the
payload has handled the previous batch. Preserve failed completion
records for retry. This completion convention introduces no new RPMI
service and leaves backend device handling outside the protocol layer.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h |  25 +++
 include/sbi_utils/sysirq/rpmi_sysirq.h   |  30 +++
 lib/utils/mpxy/objects.mk                |   2 +
 lib/utils/sysirq/rpmi_sysirq.c           | 266 +++++++++++++++++++++++
 4 files changed, 323 insertions(+)
 create mode 100644 include/sbi_utils/sysirq/rpmi_sysirq.h
 create mode 100644 lib/utils/sysirq/rpmi_sysirq.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 7ae4abe0..f9d1d177 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -226,6 +226,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_PERFORMANCE = 0x0000A,
 	RPMI_SRVGRP_MANAGEMENT_MODE = 0x000B,
 	RPMI_SRVGRP_LOGGING = 0x000E,
+	RPMI_SRVGRP_SYSTEM_IRQ = 0x000F,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
 	/* Reserved range for service groups */
@@ -290,6 +291,30 @@ struct rpmi_base_get_platform_info_resp {
 	char plat_info[];
 };
 
+/** RPMI System IRQ ServiceGroup Service IDs */
+enum rpmi_sysirq_service_id {
+	RPMI_SYSIRQ_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_SYSIRQ_SRV_GET_ATTRIBUTES = 0x02,
+	RPMI_SYSIRQ_SRV_GET_TARGET_ATTRIBUTES = 0x03,
+	RPMI_SYSIRQ_SRV_GET_IRQ_ATTRIBUTES = 0x04,
+	RPMI_SYSIRQ_SRV_SET_IRQ_STATE = 0x05,
+	RPMI_SYSIRQ_SRV_GET_IRQ_STATE = 0x06,
+	RPMI_SYSIRQ_SRV_SET_IRQ_TARGET = 0x07,
+	RPMI_SYSIRQ_SRV_GET_IRQ_TARGET = 0x08,
+	RPMI_SYSIRQ_SRV_CLAIM = 0x09,
+	RPMI_SYSIRQ_SRV_ID_MAX_COUNT,
+};
+
+struct rpmi_sysirq_claim_req {
+	u32 sys_target_index;
+};
+
+struct rpmi_sysirq_claim_resp {
+	s32 status;
+	u32 returned;
+	u32 sys_irq_index[];
+};
+
 /** RPMI System MSI ServiceGroup Service IDs */
 enum rpmi_sysmsi_service_id {
 	RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION = 0x01,
diff --git a/include/sbi_utils/sysirq/rpmi_sysirq.h b/include/sbi_utils/sysirq/rpmi_sysirq.h
new file mode 100644
index 00000000..0af2f33b
--- /dev/null
+++ b/include/sbi_utils/sysirq/rpmi_sysirq.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __RPMI_SYSIRQ_H__
+#define __RPMI_SYSIRQ_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_domain;
+
+/* Callbacks operate on the calling domain and hart; ops must remain valid. */
+struct rpmi_sysirq_ops {
+	int (*claim)(u32 channel_id, u32 *irqs, u32 max_count, u32 *count);
+	int (*complete)(u32 channel_id, u32 irq);
+	void (*drained)(void);
+};
+
+int rpmi_sysirq_register_channel(struct sbi_domain *dom, u32 channel_id,
+				u32 num_irqs, const struct rpmi_sysirq_ops *ops);
+
+bool rpmi_sysirq_available(void);
+
+/* Complete this domain/hart's batches, then ask backends to consider return. */
+int rpmi_sysirq_complete_thishart(u32 *completed);
+
+#endif
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 1f1bf0a0..a59a7175 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -32,3 +32,5 @@ libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MM) += mpxy/fdt_mpxy_rpmi_mm.o
 
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_LOGGING) += fdt_mpxy_rpmi_logging
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_LOGGING) += mpxy/fdt_mpxy_rpmi_logging.o
+
+libsbiutils-objs-y += sysirq/rpmi_sysirq.o
diff --git a/lib/utils/sysirq/rpmi_sysirq.c b/lib/utils/sysirq/rpmi_sysirq.c
new file mode 100644
index 00000000..8fa37887
--- /dev/null
+++ b/lib/utils/sysirq/rpmi_sysirq.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <sbi/sbi_byteorder.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_mpxy.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <sbi_utils/mailbox/rpmi_msgprot.h>
+#include <sbi_utils/sysirq/rpmi_sysirq.h>
+
+#define SYSIRQ_BATCH_MAX 63U
+#define SYSIRQ_MSG_MAX_LEN ((SYSIRQ_BATCH_MAX + 2) * sizeof(u32))
+#define SYSIRQ_ATTR_RESPONSE_LEN (8 * sizeof(u32))
+
+struct rpmi_sysirq_target {
+	u32 count;
+	u32 claimed[SYSIRQ_BATCH_MAX];
+};
+
+struct rpmi_sysirq_channel {
+	struct sbi_dlist node;
+	struct sbi_mpxy_channel channel;
+	const struct rpmi_sysirq_ops *ops;
+	u32 num_irqs;
+	struct rpmi_sysirq_target targets[];
+};
+
+static SBI_LIST_HEAD(sysirq_channels);
+
+static int sysirq_complete_batch(struct rpmi_sysirq_channel *sc,
+				 struct rpmi_sysirq_target *target,
+				 u32 *completed)
+{
+	u32 irq;
+	int rc;
+
+	while (target->count) {
+		irq = target->claimed[target->count - 1];
+		rc = sc->ops->complete(sc->channel.channel_id, irq);
+		if (rc)
+			return rc;
+		target->count--;
+		(*completed)++;
+	}
+	return SBI_OK;
+}
+
+bool rpmi_sysirq_available(void)
+{
+	return !sbi_list_empty(&sysirq_channels);
+}
+
+int rpmi_sysirq_complete_thishart(u32 *completed)
+{
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct rpmi_sysirq_channel *sc;
+	u32 index = 0, hidx;
+	int rc;
+
+	if (!dom || !completed)
+		return SBI_EINVAL;
+	*completed = 0;
+	sbi_hartmask_for_each_hartindex(hidx, dom->possible_harts) {
+		if (hidx == current_hartindex())
+			break;
+		index++;
+	}
+	if (index == sbi_hartmask_weight(dom->possible_harts))
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(sc, &sysirq_channels, node) {
+		if (sc->channel.owner_domain != dom)
+			continue;
+		rc = sysirq_complete_batch(sc, &sc->targets[index], completed);
+		if (rc)
+			return rc;
+	}
+
+	/* Only consider return once every owned channel completed successfully. */
+	sbi_list_for_each_entry(sc, &sysirq_channels, node) {
+		if (sc->channel.owner_domain == dom && sc->ops->drained)
+			sc->ops->drained();
+	}
+	return SBI_OK;
+}
+
+static int sysirq_read_attributes(struct sbi_mpxy_channel *channel,
+				  u32 *out, u32 base, u32 count)
+{
+	u32 attrs[] = { RPMI_SRVGRP_SYSTEM_IRQ, RPMI_VERSION(2, 0), 0, 0 };
+	u32 index, i;
+
+	if (base < SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
+		return SBI_EBAD_RANGE;
+	index = base - SBI_MPXY_ATTR_MSGPROTO_ATTR_START;
+	if (index >= array_size(attrs) || count > array_size(attrs) - index)
+		return SBI_EBAD_RANGE;
+
+	for (i = 0; i < count; i++)
+		out[i] = cpu_to_le32(attrs[index + i]);
+
+	return SBI_OK;
+}
+
+static u32 sysirq_target_hartindex(struct sbi_domain *dom, u32 target)
+{
+	u32 index = 0, hidx;
+
+	sbi_hartmask_for_each_hartindex(hidx, dom->possible_harts) {
+		if (index++ == target)
+			return hidx;
+	}
+
+	return -1U;
+}
+
+static int sysirq_send_message(struct sbi_mpxy_channel *channel,
+			       u32 msg_id, void *msg, u32 msg_len,
+			       void *response, u32 response_max_len,
+			       unsigned long *response_len)
+{
+	struct rpmi_sysirq_channel *sc =
+		container_of(channel, struct rpmi_sysirq_channel, channel);
+	struct sbi_domain *dom = channel->owner_domain;
+	struct rpmi_sysirq_target *target;
+	u32 *out = response;
+	u32 index = 0, hartindex, count, max_count, i, completed = 0;
+	s32 status = RPMI_SUCCESS;
+	int rc;
+
+	if (!response || !response_len || response_max_len < sizeof(u32))
+		return SBI_EINVAL;
+	*response_len = sizeof(u32);
+	if (sbi_domain_thishart_ptr() != dom) {
+		status = RPMI_ERR_DENIED;
+		goto done;
+	}
+
+	switch (msg_id) {
+	case RPMI_SYSIRQ_SRV_GET_ATTRIBUTES:
+		if (msg_len) {
+			status = RPMI_ERR_INVALID_PARAM;
+			break;
+		}
+		if (response_max_len < SYSIRQ_ATTR_RESPONSE_LEN)
+			return SBI_EINVAL;
+		sbi_memset(out, 0, SYSIRQ_ATTR_RESPONSE_LEN);
+		out[1] = cpu_to_le32(sbi_hartmask_weight(dom->possible_harts));
+		out[2] = cpu_to_le32(sc->num_irqs);
+		*response_len = SYSIRQ_ATTR_RESPONSE_LEN;
+		break;
+	case RPMI_SYSIRQ_SRV_GET_TARGET_ATTRIBUTES:
+	case RPMI_SYSIRQ_SRV_GET_IRQ_ATTRIBUTES:
+	case RPMI_SYSIRQ_SRV_CLAIM:
+		if (!msg || msg_len != sizeof(u32)) {
+			status = RPMI_ERR_INVALID_PARAM;
+			break;
+		}
+		/* MPXY uses the same shared buffer for request and response. */
+		index = le32_to_cpu(*(u32 *)msg);
+		if (msg_id == RPMI_SYSIRQ_SRV_GET_IRQ_ATTRIBUTES) {
+			if (index >= sc->num_irqs) {
+				status = RPMI_ERR_INVALID_PARAM;
+				break;
+			}
+			if (response_max_len < SYSIRQ_ATTR_RESPONSE_LEN)
+				return SBI_EINVAL;
+			sbi_memset(out, 0, SYSIRQ_ATTR_RESPONSE_LEN);
+			sbi_snprintf((char *)&out[3], 20, "virq%u", index);
+			*response_len = SYSIRQ_ATTR_RESPONSE_LEN;
+			break;
+		}
+		hartindex = sysirq_target_hartindex(dom, index);
+		if (!sbi_hartindex_valid(hartindex)) {
+			status = RPMI_ERR_INVALID_PARAM;
+			break;
+		}
+		if (msg_id == RPMI_SYSIRQ_SRV_GET_TARGET_ATTRIBUTES) {
+			if (response_max_len < SYSIRQ_ATTR_RESPONSE_LEN)
+				return SBI_EINVAL;
+			sbi_memset(out, 0, SYSIRQ_ATTR_RESPONSE_LEN);
+			out[2] = cpu_to_le32(sbi_hartindex_to_hartid(hartindex));
+			sbi_snprintf((char *)&out[3], 20, "hart%u",
+				     sbi_hartindex_to_hartid(hartindex));
+			*response_len = SYSIRQ_ATTR_RESPONSE_LEN;
+			break;
+		}
+		if (hartindex != current_hartindex()) {
+			status = RPMI_ERR_DENIED;
+			break;
+		}
+		if (response_max_len > channel->attrs.msg_data_maxlen)
+			response_max_len = channel->attrs.msg_data_maxlen;
+		if (response_max_len < 3 * sizeof(u32))
+			return SBI_EINVAL;
+		max_count = response_max_len / sizeof(u32) - 2;
+		target = &sc->targets[index];
+		if (max_count > array_size(target->claimed))
+			max_count = array_size(target->claimed);
+		/* A new CLAIM follows device handling of the previous batch. */
+		rc = sysirq_complete_batch(sc, target, &completed);
+		if (rc) {
+			status = RPMI_ERR_FAILED;
+			goto done;
+		}
+		rc = sc->ops->claim(channel->channel_id, target->claimed,
+				    max_count, &count);
+		if (rc) {
+			status = RPMI_ERR_FAILED;
+			break;
+		}
+		target->count = count;
+		out[1] = cpu_to_le32(count);
+		for (i = 0; i < count; i++)
+			out[i + 2] = cpu_to_le32(target->claimed[i]);
+		*response_len = (count + 2) * sizeof(u32);
+		break;
+	default:
+		status = RPMI_ERR_NOTSUPP;
+		break;
+	}
+
+done:
+	out[0] = cpu_to_le32((u32)status);
+	return SBI_OK;
+}
+
+int rpmi_sysirq_register_channel(struct sbi_domain *dom, u32 channel_id,
+				u32 num_irqs, const struct rpmi_sysirq_ops *ops)
+{
+	struct rpmi_sysirq_channel *sc;
+	int rc;
+
+	if (!dom || !dom->possible_harts || !num_irqs || !ops ||
+	    !ops->claim || !ops->complete)
+		return SBI_EINVAL;
+
+	sc = sbi_zalloc(sizeof(*sc) +
+			sbi_hartmask_weight(dom->possible_harts) * sizeof(sc->targets[0]));
+	if (!sc)
+		return SBI_ENOMEM;
+	sc->ops = ops;
+	sc->num_irqs = num_irqs;
+	sc->channel.channel_id = channel_id;
+	sc->channel.owner_domain = dom;
+	sc->channel.attrs.msg_proto_id = SBI_MPXY_MSGPROTO_RPMI_ID;
+	sc->channel.attrs.msg_proto_version = RPMI_VERSION(2, 0);
+	sc->channel.attrs.msg_data_maxlen = SYSIRQ_MSG_MAX_LEN;
+	sc->channel.read_attributes = sysirq_read_attributes;
+	sc->channel.send_message_with_response = sysirq_send_message;
+	rc = sbi_mpxy_register_channel(&sc->channel);
+	if (rc)
+		sbi_free(sc);
+	else
+		sbi_list_add_tail(&sc->node, &sysirq_channels);
+
+	return rc;
+}
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
