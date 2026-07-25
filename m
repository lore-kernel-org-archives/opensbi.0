Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99DBC531C9
	for <opensbi@archiver.kernel.org>; Sat, 25 Jul 2026 02:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hITPnYPu9GvioU6leMb3YJtr9daaV6gAF7PASQB9zgc=; b=yiFvJvEGXXsiy0
	riVnvCIodKDD1aSyKzXp/uFF0C5xgl382oNjGXldhQkFFNNjz+/KCqN/JTKPlaPeImdZl5D9dor3D
	WpIETL2M07Ld92us1JlsfA7EstdfQArH+fJQJib7GJ5LqntHD5ycQ8fiLb10zM/+8Yvk/euHgmy+R
	Xopu8Q+dOFn9PyUJE4dX2/KksInkKIvUVQdbv8SrITzhRRS+keoxVubmqnrFCvi6qBe8N1J28axzY
	SxZElW98wA5vXs28+R250Ty0mVeQXzSF2K/eFj+IupzXKbaIOfWmvQfi8eB+nQub19QaBHIIQpBDF
	KarhkzY9uzqwZ5dPaUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSI6-0000000HUXK-0hMF;
	Sat, 25 Jul 2026 02:39:06 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSHg-0000000HUVc-05MY
	for opensbi@lists.infradead.org;
	Sat, 25 Jul 2026 02:39:04 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-9771d9759d4so348542241.0
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 19:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784947119; x=1785551919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fjk9iwlMyx5n4NG3LObsnEIH1zPrxmqQ9pywqQqXHP8=;
        b=NCxT79AshuslYjRTR7Bw/qZjcj1AbUSsdXhDTCX8X+FCgWcb+qT+u684lj6y7Qkz0e
         gSEYDU9oztKES+otRf4oZwCCPhM/2TEcNu7jXLqpYgU83AfMGHDmCg2fNiPUyFHgfUWn
         VSyICN75/thv3iSFH4WPfy9Feo4mbr9VdXf2rcqPYukKTzAigSZQC30x47yj5RdBS8sM
         lpVPo9fJ4E6c5BPnGpms6Gd6n0IU+50zbFewThvZlSa6Zpvq/t+3v0Cem5NCnXHONPPn
         F+25BQxKKdyqSlW7Zv8vR2yiZrgYbeayKz6TJLdL7/kQVH6wWFoTkKGKjuH8ZkZ90eAQ
         h2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784947119; x=1785551919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fjk9iwlMyx5n4NG3LObsnEIH1zPrxmqQ9pywqQqXHP8=;
        b=dA41U+rjcUBY9q0Ge+Hdfbq2xXtm8sLl0JWaCSNh0TXapxaYSaUs0f8Hee2ZJbHbXH
         /OT8qVEcTPEsH4ASyQ2PDmoLlhO8EjB7MdcP27uejAfiRGfqwMZLdc/uZ/qmt2hQ7ybV
         HFGE5b5UYA8MWtkXQE3EwLfLcrOPm7h6WKJZxoyO8OU2PclLki9qER4uhdfoQVtlNit+
         QkPzDxaqCQLVZUACg0kvBQkJJbrGOcHFDoRcvsVkRf3zLMyWsrHmiKYVL4p5894D0wRh
         cXz5Y+E2BwxakcR3CQfUp1WFaSXq6cjADcwDELoh+1fInwnuELrHqWrVPSEoLxzg2pI5
         99kg==
X-Gm-Message-State: AOJu0Yz7JQFmLBWFnIh5u15kvkIwjqAOowpUR1y1MKgTgTRXLBivfE32
	iX9qLb71F7YFDLZlyQZlGDmi/n4AWv5R7zjLnZgmx6SWgenLrt7TqO6/+yNj9A==
X-Gm-Gg: AR+sD12byAUm0uYsVmWfahedkbvzOVf37I78E7wZMH8VpSNKN/XCmu/bugVJCA6Al1v
	VNss/6aJ+MKpkfRB357og+20PEV4DBnaBEc5HvMmfoj7/QADXlFC8y7mkXoJ+1bUr+HE2jhEtLz
	D01slfQ8poiqpEnwho5kNSHp/Q9/KVij/v5tpfUEjP4GxlLy0OQ2pXsxNhe9MVg2yecHdjsXefE
	f5qjSjjtOXr7FTZeFrg4tYo7pfcIu8kvFlLYFpIIX4FLLMhYh7fVT5SIWHLrivSV4/wzh+Zs+M0
	wQ2f/Jp3ldv8Yhwhz2K0tgxbc2b+kGoyIPnaUrXKlK0l3/j9C71xkOqSHnlqELD+oQYdRTPe6k1
	SOJCEWKP3v+V3M4uUUZKKHy68XzT63lRoAyntpT+u+29RNUt8NB3b8WIXVzB3kkDMVrpLqxlpsf
	pHU6fb/G+0n3Jr/gMihoiQ4/dXHv5RQvJ7BPzejRHa2JelKfFG1rAg8/+df4w6q0IOq9lN6w==
X-Received: by 2002:a05:6122:2191:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c306c018cdmr490123e0c.7.1784947118533;
        Fri, 24 Jul 2026 19:38:38 -0700 (PDT)
Received: from ubuntu.localdomain (23-91-246-209.cpe.distributel.net. [23.91.246.209])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c305734410sm602529e0c.16.2026.07.24.19.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 19:38:38 -0700 (PDT)
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
Subject: [PATCH v2 1/4] lib: utils: fdt: add generic domain and property parsing helpers
Date: Fri, 24 Jul 2026 22:38:18 -0400
Message-Id: <20260725023821.3795618-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260725023821.3795618-1-raymondmaoca@gmail.com>
References: <20260725023821.3795618-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_193840_093948_D460AD4E 
X-CRM114-Status: GOOD (  18.17  )
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

Add reusable FDT helpers for domain-oriented and other FDT-based
consumers.

This adds helpers to:
- find a domain instance DT node by exact name match
- parse a single u32 property
- parse a single u64 property
- parse a u32 property list into a bitmask

Also tighten the internal domain-name matching to use exact node-name
matching.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi_utils/fdt/fdt_domain.h | 13 +++++
 include/sbi_utils/fdt/fdt_helper.h | 10 ++++
 lib/utils/fdt/fdt_domain.c         | 46 +++++++++++++++++-
 lib/utils/fdt/fdt_helper.c         | 76 ++++++++++++++++++++++++++++++
 4 files changed, 144 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/fdt/fdt_domain.h b/include/sbi_utils/fdt/fdt_domain.h
index 8c2dee09..60d51d6c 100644
--- a/include/sbi_utils/fdt/fdt_domain.h
+++ b/include/sbi_utils/fdt/fdt_domain.h
@@ -11,12 +11,18 @@
 #ifndef __FDT_DOMAIN_H__
 #define __FDT_DOMAIN_H__
 
+#include <sbi/sbi_error.h>
 #include <sbi/sbi_types.h>
 
 #ifdef CONFIG_FDT_DOMAIN
 
 struct sbi_domain;
 
+struct fdt_find_domain_offset_info {
+	const char *name;
+	int domain_offset;
+};
+
 /**
  * Iterate over each domains in device tree
  *
@@ -45,6 +51,8 @@ int fdt_iterate_each_memregion(void *fdt, int domain_offset, void *opaque,
 					 int region_offset, u32 region_access,
 					 void *opaque));
 
+int fdt_find_domain_offset(const void *fdt, const struct sbi_domain *dom);
+
 /**
  * Fix up the domain configuration in the device tree
  *
@@ -76,6 +84,11 @@ int fdt_domains_populate(const void *fdt);
 
 static inline void fdt_domain_fixup(void *fdt) { }
 static inline int fdt_domains_populate(const void *fdt) { return 0; }
+static inline int fdt_find_domain_offset(const void *fdt,
+					 const struct sbi_domain *dom)
+{
+	return SBI_ENOENT;
+}
 
 #endif
 
diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 75a564d1..05ca9f79 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -50,6 +50,16 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
 
 int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
 
+int fdt_parse_u32(const void *fdt, int nodeoff, const char *prop_name,
+		  u32 *out_val);
+
+int fdt_parse_u64(const void *fdt, int nodeoff, const char *prop_name,
+		  u64 *out_val);
+
+int fdt_parse_u32_array_bitmask(const void *fdt, int nodeoff,
+				const char *prop_name, u32 max_bits,
+				u32 *out_mask);
+
 int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long  *cbom_block_size);
 
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 61627db3..af653505 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -97,6 +97,49 @@ int fdt_iterate_each_memregion(void *fdt, int domain_offset, void *opaque,
 	return 0;
 }
 
+static bool fdt_find_domain_offset_match(void *fdt, int domain_offset,
+					 void *opaque)
+{
+	struct fdt_find_domain_offset_info *info = opaque;
+	const char *name;
+
+	name = fdt_get_name(fdt, domain_offset, NULL);
+	if (name && !strcmp(info->name, name)) {
+		info->domain_offset = domain_offset;
+		return true;
+	}
+
+	return false;
+}
+
+static int fdt_find_domain_offset_iter(void *fdt, int domain_offset,
+				       void *opaque)
+{
+	return fdt_find_domain_offset_match(fdt, domain_offset, opaque) ? 1 : 0;
+}
+
+int fdt_find_domain_offset(const void *fdt, const struct sbi_domain *dom)
+{
+	struct fdt_find_domain_offset_info info;
+	int rc;
+
+	if (!fdt || !dom)
+		return SBI_EINVAL;
+	if (dom == &root)
+		return -1;
+
+	info.name = dom->name;
+	info.domain_offset = -1;
+	rc = fdt_iterate_each_domain((void *)fdt, &info,
+				     fdt_find_domain_offset_iter);
+	if (rc < 0)
+		return rc;
+	if (info.domain_offset >= 0)
+		return info.domain_offset;
+
+	return SBI_ENOENT;
+}
+
 static int fdt_iterate_each_memregion_ro(const void *fdt, int domain_offset, void *opaque,
 					 int (*fn)(const void *fdt, int domain_offset,
 						   int region_offset, u32 region_access,
@@ -114,8 +157,9 @@ struct __fixup_find_domain_offset_info {
 static int __fixup_find_domain_offset(void *fdt, int doff, void *p)
 {
 	struct __fixup_find_domain_offset_info *fdo = p;
+	const char *name = fdt_get_name(fdt, doff, NULL);
 
-	if (!strncmp(fdo->name, fdt_get_name(fdt, doff, NULL), strlen(fdo->name)))
+	if (name && !strcmp(fdo->name, name))
 		*fdo->doffset = doff;
 
 	return 0;
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index ad4efaaf..39c3f3aa 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -250,6 +250,82 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid)
 	return 0;
 }
 
+int fdt_parse_u32(const void *fdt, int nodeoff, const char *prop_name,
+		  u32 *out_val)
+{
+	const fdt32_t *prop;
+	int len;
+
+	if (!fdt || nodeoff < 0 || !prop_name || !out_val)
+		return SBI_EINVAL;
+
+	prop = fdt_getprop(fdt, nodeoff, prop_name, &len);
+	if (!prop)
+		return SBI_ENOENT;
+	if (len != (int)sizeof(fdt32_t))
+		return SBI_EINVAL;
+
+	*out_val = fdt32_to_cpu(prop[0]);
+	return 0;
+}
+
+int fdt_parse_u64(const void *fdt, int nodeoff, const char *prop_name,
+		  u64 *out_val)
+{
+	const fdt32_t *prop;
+	int len;
+
+	if (!fdt || nodeoff < 0 || !prop_name || !out_val)
+		return SBI_EINVAL;
+
+	prop = fdt_getprop(fdt, nodeoff, prop_name, &len);
+	if (!prop)
+		return SBI_ENOENT;
+	if (len != (int)(2 * sizeof(fdt32_t)))
+		return SBI_EINVAL;
+
+	*out_val = ((u64)fdt32_to_cpu(prop[0]) << 32) | fdt32_to_cpu(prop[1]);
+	return 0;
+}
+
+int fdt_parse_u32_array_bitmask(const void *fdt, int nodeoff,
+				const char *prop_name, u32 max_bits,
+				u32 *out_mask)
+{
+	const fdt32_t *prop;
+	u32 mask = 0, count, val;
+	int len, i;
+
+	if (!fdt || nodeoff < 0 || !prop_name || !out_mask || !max_bits ||
+	    max_bits > 32)
+		return SBI_EINVAL;
+
+	*out_mask = 0;
+
+	prop = fdt_getprop(fdt, nodeoff, prop_name, &len);
+	if (!prop)
+		return 0;
+	if (len < 0 || (len % (int)sizeof(fdt32_t)))
+		return SBI_EINVAL;
+
+	count = len / sizeof(fdt32_t);
+	if (count > max_bits)
+		return SBI_EINVAL;
+
+	for (i = 0; i < (int)count; i++) {
+		val = fdt32_to_cpu(prop[i]);
+		if (val >= max_bits)
+			return SBI_EINVAL;
+		if (mask & (1U << val))
+			return SBI_EINVAL;
+
+		mask |= 1U << val;
+	}
+
+	*out_mask = mask;
+	return 0;
+}
+
 int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long *cbom_block_size)
 {
 	int len;
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
