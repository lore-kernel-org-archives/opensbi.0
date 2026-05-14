Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EE3CD4F42
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3ePYc6sh9Jb0qeXsmZidxVM4bxdbjxZmXJ26Mat43A=; b=YoT1WvUnXeO7Zt
	0UUHAXw94OPx+os19Zgozz9dKj2Ui1oEeNQ6ZYzHa1Oinwehq28eEnlqXqVwC3xDjLtTmOw+EYM57
	FUhgvoGIPCtfiSYT0wgDr1QteaAR4ztx+sU6AAfWnWQuLhTGzeTcqinQNV+MKLu1M1cMxr9kZpvFN
	dktqftzrmcbIK5JgRatesITSzJedTFEt2rl1Kf+V4/GwkFc1FXNBpxjBP0x/FXSeBj4vrWrejCEi+
	7fIFxhk7UMHv4L+jMIU4W+PLxPZ/11qTFB0iJ4Xgf2anKBaJhXHXvtOrNIA72n1u1/R049ulB7JGj
	oHBu0D/sHIMlpiTdviyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0d-00000006m3k-1rBN;
	Thu, 14 May 2026 22:58:27 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0a-00000006m1H-3zJr
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:26 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50d6b9bca48so103123731cf.2
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799504; x=1779404304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOeXw/VN7ClywN9zF/5qH2mBYjW7JErvJ0vWNKSnyGk=;
        b=A8PmV44Xr2hwrTFEcON4VWfKfAM2647Oh+N0Kj9AY5KISmdIZmN0e1/a+71VlzUHCv
         yicjbrfI2bLEBQPTHZsHXHuHu8KhQ8RyR9AijB5Cj4NMWfh0pAoYE9EponR6H5Cjb6qz
         Os1mx7XW9KjKDx/YJT7GtNjMPWnkkF97ylB95PcZo5rpTKycRozAWDUcQZDb/TaTzXMh
         WoUEmLI7J7FTw/Da2+T+MwaxeH1JTHxfa1okCTOJaZEVdCjYZyAQWoNXDH4P91Nrb4z5
         5OFDOLziF+/jT3d781SRMuRlx4Zayf85cy7lJrH+++plw3Ta8Z6k61wBu/skWjtOXX3t
         plIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799504; x=1779404304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mOeXw/VN7ClywN9zF/5qH2mBYjW7JErvJ0vWNKSnyGk=;
        b=k/lpAr2HkfceDpBWbjY4ovgRNy6SEuEMGPv7OjdUF6b/o84eTSJDj6eqgHgoyZTw+1
         r5cjlYs7M2gO68WR5loKuRv5yBxyguv/shKlkj9k2CiQJ2AmmH1/8u4uYGwfsFG5XWJb
         nJguKePV+5JCn7ql3KweTAfK6Hj0rNdsTJ22AhguJpIWq+01b1UQQj9/s+NsSCiPBuUE
         uFX0brsP4qnmk/nxOm1fgGO1uEvePPxlyuY+TS6/3QhHZgPRXsQBwu/TfNrsFnSFGgPk
         ujo4v7ZLUdbvTdPE2ndd2f6ST43ozdJZALOeMk4qMwRqoBL2OQs5PgDOgWD+jcV/CO3b
         jonA==
X-Gm-Message-State: AOJu0YwBZN9lZVoaE2tQUxkHll58VHjvcnnTVj3aVzI0auAwFlUwHIX2
	PvOEfMfiyicNzJn9fDyfgjCr/DMAPEPzO12nGZmvyUDSQmdAZF4sKo+julj5XA==
X-Gm-Gg: Acq92OFpZMmmV9/kW7JQcJoOjXJbsGupJpujP6nT7uJVFP0yiEdqBMCtUtNwcK7lviE
	24dfMEgdFQlC1oAebi/S643z5fi/2YMEGnClTFm8uWgbFWEUIn14DsivVxaf2IFGsVVjAmlNved
	JuBq4rZEVr8cqH5AWITJzP2MrKetmeHESnV183jNS6j1v+h3Oed0QsWZixviN1JdGvfEAnOJ+F7
	yJB4+n4GExLFU6oq79VVMV0xCC0OvVk1tLcQgQop4F+1Yw2sCNx7z3D+23SZkcMnxU0h4aHatxE
	wmrN77Ao1kbV/4+MVNyUMLD87RgvuyR2wGK73VqeMMCF8BzQCtTAy0KPVikCiWehgdrAPEDpW0S
	BNjRk/ojbCDcnffrd6izXG8ugfZitCCc2RH90V+9MQCUTdEyURWy60hwg3XbvWykCJsjLAA9Y7+
	WfSRWszct6JkW8+0O1FGEmwBZ2p+IH5Ak95KSNURpKLhSnwEfX72BkT7kE6Uvy3bM5t69B4MHQu
	OBkGjqYusoBBZRfd7bNMg==
X-Received: by 2002:ac8:5ccc:0:b0:50f:b13e:b746 with SMTP id d75a77b69052e-5165a1e4662mr21610671cf.44.1778799503888;
        Thu, 14 May 2026 15:58:23 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:23 -0700 (PDT)
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
Subject: [PATCH 06/10] lib: utils: fdt: parse sysirq routing from DT
Date: Thu, 14 May 2026 18:57:52 -0400
Message-Id: <20260514225756.2255758-7-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155825_011739_6B1F217A 
X-CRM114-Status: GOOD (  17.75  )
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

Init VIRQ and parse mpxy-sysirq nodes under /chosen/opensbi-domains,
pre-size per-channel VIRQ maps, and add HWIRQ routes from
interrupts-extended.
Mark sysirq domains to allow SEIP-based VIRQ notification.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi_utils/fdt/fdt_helper.h |  17 +++++
 lib/utils/fdt/fdt_domain.c         | 119 ++++++++++++++++++++++++++++-
 lib/utils/fdt/fdt_helper.c         |  49 ++++++++++++
 3 files changed, 183 insertions(+), 2 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 04c850cc..e49a5bca 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -12,6 +12,7 @@
 
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_domain.h>
+#include <sbi/sbi_irqchip.h>
 
 struct fdt_match {
 	const char *compatible;
@@ -38,6 +39,22 @@ int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args);
 
+/*
+ * Parse one entry from "interrupts-extended" and return irqchip device,
+ * hwirq, and optional flags.
+ *
+ * @index: entry index within interrupts-extended
+ * @out_flags_count: in/out, on input capacity of out_flags array;
+ *                   on output number of flags returned (or total flags
+ *                   if out_flags is NULL).
+ */
+int fdt_parse_interrupts_extended_entry(const void *fdt, int nodeoff,
+					int index,
+					struct sbi_irqchip_device **out_chip,
+					u32 *out_hwirq,
+					u32 *out_flags,
+					u32 *out_flags_count);
+
 int fdt_get_node_addr_size(const void *fdt, int node, int index,
 			   uint64_t *addr, uint64_t *size);
 
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index b2fa8633..4a75f25a 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -10,11 +10,14 @@
 
 #include <libfdt.h>
 #include <libfdt_env.h>
+#include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_virq.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
@@ -304,6 +307,7 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 	return 0;
 }
 
+
 static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 {
 	u32 val32;
@@ -511,6 +515,113 @@ fail_free_domain:
 	return err;
 }
 
+static int __fdt_parse_mpxy_sysirq_node(const void *fdt, int nodeoff)
+{
+	const fdt32_t *val;
+	int len, rc, doff;
+	u32 channel_id;
+	u32 index;
+	struct sbi_domain *dom;
+
+	if (!fdt || nodeoff < 0)
+		return SBI_EINVAL;
+
+	val = fdt_getprop(fdt, nodeoff, "opensbi,mpxy-channel-id", &len);
+	if (!val || len < (int)sizeof(fdt32_t)) {
+		sbi_printf("[SYSIRQ] missing opensbi,mpxy-channel-id\n");
+		return SBI_EINVAL;
+	}
+	channel_id = fdt32_to_cpu(*val);
+
+	val = fdt_getprop(fdt, nodeoff, "opensbi,domain", &len);
+	if (!val || len < (int)sizeof(fdt32_t)) {
+		sbi_printf("[SYSIRQ] missing opensbi,domain\n");
+		return SBI_EINVAL;
+	}
+
+	doff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+	if (doff < 0)
+		return doff;
+
+	dom = sbi_domain_find_by_name(fdt_get_name(fdt, doff, NULL));
+	if (!dom) {
+		sbi_printf("[SYSIRQ] domain not found for node %s\n",
+			   fdt_get_name(fdt, doff, NULL));
+		return SBI_ENOENT;
+	}
+	dom->virq_seip_notify = true;
+
+	/* Pre-allocate VIRQ map based on interrupts-extended count */
+	for (index = 0; ; index++) {
+		rc = fdt_parse_interrupts_extended_entry(fdt, nodeoff, index,
+							 NULL, NULL,
+							 NULL, NULL);
+		if (rc == SBI_ENOENT)
+			break;
+		if (rc)
+			return rc;
+	}
+
+	if (!sbi_virq_is_inited())
+		rc = sbi_virq_init(index);
+	else
+		rc = sbi_virq_map_ensure_cap(channel_id, index);
+	if (rc)
+		return rc;
+
+	for (index = 0; ; index++) {
+		struct sbi_irqchip_device *chip = NULL;
+		u32 hwirq = 0;
+
+		rc = fdt_parse_interrupts_extended_entry(fdt, nodeoff, index,
+							 &chip, &hwirq,
+							 NULL, NULL);
+		if (rc == SBI_ENOENT)
+			break;
+		if (rc)
+			return rc;
+		if (!chip)
+			return SBI_ENODEV;
+
+		rc = sbi_virq_map_set(channel_id, chip->id, hwirq, index);
+		if (rc)
+			return rc;
+
+		rc = sbi_virq_route_add(dom, hwirq, channel_id);
+		if (rc)
+			return rc;
+	}
+
+	return SBI_OK;
+}
+
+static int __fdt_parse_mpxy_sysirq_nodes(const void *fdt)
+{
+	int poffset, noff, rc;
+
+	if (!fdt)
+		return SBI_EINVAL;
+
+	poffset = fdt_path_offset(fdt, "/chosen");
+	if (poffset < 0)
+		return 0;
+	poffset = fdt_node_offset_by_compatible(fdt, poffset,
+						"opensbi,domain,config");
+	if (poffset < 0)
+		return 0;
+
+	fdt_for_each_subnode(noff, fdt, poffset) {
+		if (fdt_node_check_compatible(fdt, noff,
+					      "opensbi,mpxy-sysirq"))
+			continue;
+		rc = __fdt_parse_mpxy_sysirq_node(fdt, noff);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
 int fdt_domains_populate(const void *fdt)
 {
 	const u32 *val;
@@ -550,6 +661,10 @@ int fdt_domains_populate(const void *fdt)
 	}
 
 	/* Iterate over each domain in FDT and populate details */
-	return fdt_iterate_each_domain_ro(fdt, &cold_domain_offset,
-					  __fdt_parse_domain);
+	err = fdt_iterate_each_domain_ro(fdt, &cold_domain_offset,
+					 __fdt_parse_domain);
+	if (err)
+		return err;
+
+	return __fdt_parse_mpxy_sysirq_nodes(fdt);
 }
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index b57eae1a..3d7c4eec 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -10,6 +10,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_hart.h>
@@ -80,6 +81,54 @@ int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 	return SBI_ENOENT;
 }
 
+int fdt_parse_interrupts_extended_entry(const void *fdt, int nodeoff,
+					int index,
+					struct sbi_irqchip_device **out_chip,
+					u32 *out_hwirq,
+					u32 *out_flags,
+					u32 *out_flags_count)
+{
+	struct fdt_phandle_args args;
+	struct sbi_irqchip_device *chip;
+	u32 flags_cap = 0, flags_cnt = 0;
+	int rc, i;
+
+	if (!fdt || nodeoff < 0)
+		return SBI_EINVAL;
+
+	rc = fdt_parse_phandle_with_args(fdt, nodeoff, "interrupts-extended",
+					 "#interrupt-cells", index, &args);
+	if (rc)
+		return rc;
+
+	if (args.args_count < 1)
+		return SBI_EINVAL;
+
+	if (out_hwirq)
+		*out_hwirq = args.args[0];
+
+	if (out_flags_count) {
+		flags_cap = *out_flags_count;
+		flags_cnt = (args.args_count > 1) ? (args.args_count - 1) : 0;
+		if (out_flags && flags_cap < flags_cnt)
+			flags_cnt = flags_cap;
+		if (out_flags) {
+			for (i = 0; i < (int)flags_cnt; i++)
+				out_flags[i] = args.args[i + 1];
+		}
+		*out_flags_count = flags_cnt;
+	}
+
+	if (out_chip) {
+		chip = sbi_irqchip_find_device((u32)args.node_offset);
+		if (!chip)
+			return SBI_ENODEV;
+		*out_chip = chip;
+	}
+
+	return 0;
+}
+
 static int fdt_translate_address(const void *fdt, uint64_t reg, int parent,
 				 uint64_t *addr)
 {
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
