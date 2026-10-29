Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C26606A31A
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AQCa6rNG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02wq4DYW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fy0MG0P+Vq5E3XGuQyFhbBuyijbU36O70iFxqqK76yI=; b=AQCa6rNGCdrOgpTYBEbSgo93hJ
	dKMkluzgiCGb4H/1FCeKyLxE3yP0oFqgmu4URtTrP154cfrtZVg8ZDGLperyXkYRXA0in4+1yuDV2
	47slbLIhwp3oaqJ9AgVYXL+0poCwb3qdBPnlTRAYw0HtShCpZRHoIdyZP+nbp/CWwYdbBM9BPC1pv
	vag5j0pE8TIjFo8qb1uyYW/QW2caXnXNjuOi9Jsycqta/Cz9oW0SeuGZoT4V67/P2xsKhQiWik17A
	zK7BrbjtZS/YaOnGyaxv07xDvieu/MuTgIMGyJM/YitQwd6NNi+WjstSadQJhDsSNiSV17JTTPQs6
	7SvPjp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSY5-00000009iZr-3j1z;
	Thu, 29 Oct 2026 16:00:17 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSY3-00000009iXY-1E0c
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 16:00:16 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-53cd0c8614eso22178741cf.0
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 09:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289613; x=1793894413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/c6ysFCDDyurbI4bTi7NsSGi8Ef6b5bXzOoEgTpO5E=;
        b=02wq4DYWkZ//rHSIoaL+4uXToXNN+0wjOWqx0tRxtZ0inDLUR4LqnZnwx1CG33fvDo
         LZY/iHiw6py2P0scSYaPXsHySm0E7rVndUWAyoAbE8P8zRXLMxNleUg5ZTseeUq0C63h
         JEIVXO06YjgzNYIyMNyx0nnSfhJ+FYLlrGFTLy8mUPYHLwjh1IW8+SkkP+KM6OAe2mqz
         zZzSr01boUIOhT1iQlPyPLydidp3q2KdMZEcFfgN00UyZN96uJSiOa0lMaaVUgynlS/x
         zKHokRcgkl9tCNfrbmS2lfORVp3weOlRugA+J+HM9KYGNkB/cG2KNJjYjEbaZEnNMlqf
         43lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289613; x=1793894413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/c6ysFCDDyurbI4bTi7NsSGi8Ef6b5bXzOoEgTpO5E=;
        b=QwxaW+ot7KyrGKR6F/hNtXAtNie7QUU3JLu4SHe7InxiTZ3Z+COBdITPQRTKXCSx6Q
         aLMyHrQfvbkv6WT9CjzVjCEJ/6O2yojSZvYrwgmLuNZfyYLgn3fU7oyak1KSh2y9vX+l
         miGvxwwpPPPGSgH/4xZd0VItcIZ0Qi/7MYvXntRRrZluwak4t0axAAyuIbMWwS5xLc7j
         Iwocjzo4AMrOs83AM6v7PxKLv4Et3uICv4rrYWVSpQ80J7AM9M3lN2yB4MDkkPkRG4QM
         RvTgYVQL45IuFiuT8qN85XXc73cyLzcu0gCxBpScu1lkVL0RKT0NS1jYfHL5rMDciUZg
         pXGA==
X-Gm-Message-State: AFq9FYINOK/Xh3E0iDHx2+CsmkPHWSmyecc0Vk/vv0eOn5EKumu0CwZ2
	DBH2ytdsl7EfdOyIYeHwQ8AFaEuYiKCB4/A7TAH6d2LigSzdioyToPX6tNhgBg==
X-Gm-Gg: AYBFou3yuONG1hZpZ72EXS2OrfuTkHh7VlvwYDSovVIsWDCZADU5VwgDb0LbtpmWSEo
	EfzCSzo/Y25Un3Pl6O96D9O9zZLkqVEdCP5liRqJcBxyZmRYEBTtDw1mz3viN2r2rgJRfnQX0Bx
	2A0kxYWRdWekJAekJXXmOPWFIIXVU3OQRU0wZCPWGvb692KrAkgLNbVeUaYHywTrz4SOac+DSaY
	qLByYyGGn6Ta5wuBSgcivjhK/hWECSy4pMmeXNzQgey4YRbr3gcSx3La2bFib7ZYaziHEOFRAia
	PUiDnTowC+8AgvH2OQoELYrY4/8I/Z5znlkJ2YkCJp6gFck4ZhG9VxCVT7g+RtvwCkJIfJL/09l
	0HQC/1+zjVmc3KC/rh5id+gpNyF990ULQXg/X0gOXOArBv3qzBkgp5FysVWL+o+6vXLZkEnXLif
	ff8hzeR7MrbdicmaLFUBobj27JrANjhSYgrqiUcD1ZnGKhFyxKXgrsk7/SpnbywoEMLkUQq5H1D
	HMc3Uai5EHIWi0urayUgA52Mqb7zj4uG7nv9lhNKsj1LhmuGt0WAMlhxBFWsYID7u+Rt/kw+CKQ
	S3APRZ8DVHNGxR1IyQk3dJ3OtXC6hSaQmmdM+KCxqRSzCUjEqAzti43IsuC6stPP0ZQzO06XS2x
	7iX1qWMUnlYLpDQ==
X-Received: by 2002:a05:622a:1a92:b0:536:24e4:d8ab with SMTP id d75a77b69052e-53fcc3d0bb1mr96066121cf.55.1793289612476;
        Thu, 29 Oct 2026 09:00:12 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.09.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:00:12 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 10/12] lib: utils: fdt: parse sysirq routing from DT
Date: Thu, 29 Oct 2026 11:59:27 -0400
Message-Id: <20261029155929.586597-11-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_090015_359264_0921056F 
X-CRM114-Status: GOOD (  21.46  )
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

Parse mpxy-sysirq nodes under /chosen/opensbi-domains, pre-size
per-channel VIRQ maps, and add physical interrupt routes from
interrupts-extended. Mark sysirq domains to allow SEIP-based VIRQ
notification.

Initialize VIRQ on demand and register each domain-owned RPMI
SYSTEM_IRQ channel using its channel ID and interrupt entry count.
Store the physical controller, HWIRQ and IRQ flags in each route.
Activate courier handlers during domain finalization after boot HART
selection, setting affinity to the destination domain's final boot HART.
Complete mapping and channel setup before activating physical sources.

Reject malformed phandle argument lists and insufficient IRQ flag
buffers instead of truncating interrupt specifiers. Require one HWIRQ
cell and one flags cell for SYSIRQ sources, and validate scalar
channel and domain properties.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi_utils/fdt/fdt_helper.h |   8 ++
 lib/sbi/sbi_domain.c               |   3 +
 lib/utils/fdt/fdt_domain.c         | 116 ++++++++++++++++++++++++++++-
 lib/utils/fdt/fdt_helper.c         |  57 +++++++++++++-
 4 files changed, 179 insertions(+), 5 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 75a564d1..342cf738 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -12,6 +12,7 @@
 
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_domain.h>
+#include <sbi/sbi_irqchip.h>
 
 struct fdt_match {
 	const char *compatible;
@@ -38,6 +39,13 @@ int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args);
 
+int fdt_parse_interrupts_extended_entry(const void *fdt, int nodeoff,
+					int index,
+					struct sbi_irqchip_device **out_chip,
+					u32 *out_hwirq,
+					u32 *out_flags,
+					u32 *out_flags_count);
+
 int fdt_get_node_addr_size(const void *fdt, int node, int index,
 			   uint64_t *addr, uint64_t *size);
 
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 16df5533..36b64b32 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -930,6 +930,9 @@ int sbi_domain_finalize(struct sbi_scratch *scratch)
 
 	/* Select stable boot HARTs before programming physical IRQ targets. */
 	domain_select_boot_harts();
+	rc = sbi_virq_setup_couriers();
+	if (rc)
+		return rc;
 
 	/*
 	 * Set the finalized flag so that the root domain
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 575fbdf0..4d38d402 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -15,7 +15,9 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_virq.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
@@ -291,7 +293,6 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 
 	return 0;
 }
-
 static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 {
 	u32 val32;
@@ -488,12 +489,123 @@ fail_free_domain:
 	return err;
 }
 
+static int __fdt_parse_mpxy_sysirq_node(const void *fdt, int nodeoff)
+{
+	const fdt32_t *val;
+	int len, rc, doff;
+	u32 channel_id;
+	u32 index, num_irqs;
+	struct sbi_domain *dom;
+
+	if (!fdt || nodeoff < 0)
+		return SBI_EINVAL;
+
+	val = fdt_getprop(fdt, nodeoff, "opensbi,mpxy-channel-id", &len);
+	if (!val || len != sizeof(*val))
+		return SBI_EINVAL;
+	channel_id = fdt32_to_cpu(*val);
+
+	val = fdt_getprop(fdt, nodeoff, "opensbi,domain", &len);
+	if (!val || len != sizeof(*val))
+		return SBI_EINVAL;
+
+	doff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+	if (doff < 0)
+		return doff;
+
+	dom = sbi_domain_find_by_name(fdt_get_name(fdt, doff, NULL));
+	if (!dom)
+		return SBI_ENOENT;
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
+	if (!sbi_virq_is_inited()) {
+		rc = sbi_virq_init(index);
+		if (rc)
+			return rc;
+	}
+	rc = sbi_virq_map_ensure_cap(channel_id, index);
+	if (rc)
+		return rc;
+	num_irqs = index;
+
+	for (index = 0; ; index++) {
+		struct sbi_irqchip_device *chip = NULL;
+		u32 hwirq = 0, flags, flags_count = 1;
+
+		rc = fdt_parse_interrupts_extended_entry(fdt, nodeoff, index,
+							 &chip, &hwirq,
+							 &flags, &flags_count);
+		if (rc == SBI_ENOENT)
+			break;
+		if (rc)
+			return rc;
+		if (!chip)
+			return SBI_ENODEV;
+		if (flags_count != 1)
+			return SBI_ENOTSUPP;
+
+		rc = sbi_virq_map_set(channel_id, chip->id, hwirq, index);
+		if (rc)
+			return rc;
+
+		rc = sbi_virq_route_add(dom, chip->id, hwirq, flags, channel_id);
+		if (rc)
+			return rc;
+	}
+
+	return sbi_virq_sysirq_add_channel(dom, channel_id, num_irqs);
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
+	int err;
+
 	/* Sanity checks */
 	if (!fdt)
 		return SBI_EINVAL;
 
 	/* Iterate over each domain in FDT and populate details */
-	return fdt_iterate_each_domain_ro(fdt, NULL, __fdt_parse_domain);
+	err = fdt_iterate_each_domain_ro(fdt, NULL, __fdt_parse_domain);
+	if (err)
+		return err;
+
+	return __fdt_parse_mpxy_sysirq_nodes(fdt);
 }
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 747ba028..21c78279 100644
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
@@ -47,6 +48,8 @@ int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 	list = fdt_getprop(fdt, nodeoff, prop, &len);
 	if (!list)
 		return SBI_ENOENT;
+	if (len % sizeof(*list))
+		return SBI_EINVAL;
 	list_end = list + (len / sizeof(*list));
 
 	while (list < list_end) {
@@ -57,13 +60,13 @@ int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 		list++;
 
 		val = fdt_getprop(fdt, pnodeoff, cells_prop, &len);
-		if (!val)
-			return SBI_ENOENT;
+		if (!val || len != sizeof(*val))
+			return SBI_EINVAL;
 		pcells = fdt32_to_cpu(*val);
 		if (FDT_MAX_PHANDLE_ARGS < pcells)
 			return SBI_EINVAL;
 		if (list + pcells > list_end)
-			return SBI_ENOENT;
+			return SBI_EINVAL;
 
 		if (index > 0) {
 			list += pcells;
@@ -80,6 +83,54 @@ int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
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
+		*out_flags_count = flags_cnt;
+		if (out_flags && flags_cap < flags_cnt)
+			return SBI_EBAD_RANGE;
+		if (out_flags) {
+			for (i = 0; i < (int)flags_cnt; i++)
+				out_flags[i] = args.args[i + 1];
+		}
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
