Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E170AC624DE
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRK95cOj7bN/Iw/RiJgCGWtFComyAqTWr+X04QW8598=; b=PMyEpQtE9Zvd1j
	3yf3p2y2Eb9FcIpdm0lrihZ+qkKKgMS8qbNlWCuGrnF4hE0uAd0e6uimbq79BUxw+wNoC2P8KktVh
	D0k2FfSd7eyROvZJix2K2GIqFMuYmr+GxtN+/H9a+08plslMROiwMvfBMnZvv0YxToMrvMl8y9NOU
	ZOtm5sY1eTWqhmM/bdZftCZB0pk3A8J+n/TLSAwauixLnWzSBBUV+YviicNR3OtPLOJv/EBM65DGm
	3Ne3o9PsDyY3b33i0MhuGk7jCyfv5pKjuXa+xWJtH4yWHzLANCkeak1+dAurzQV4prWw/e1doG9CR
	/lA9bavfOWNJp6/wZOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnF-00000002jYN-2U0e;
	Fri, 04 Sep 2026 16:29:33 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnD-00000002jWZ-03U0
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 16:29:32 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-52cd38ddcdfso14917521cf.3
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539370; x=1789144170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aChLsEokWRjvJChzyx28wPmVgPmPAP/lNJ5qzF5xYQw=;
        b=oGBRkKvEXcvvgi5082Wpjl34iyTjO75g1YqY+Xo4Lb3ble+PHDVM9c0GVtdr0Rnf5r
         Ld62mRUhhyF5/yMpgnAK0TctJZ6x8NuD4yLhVbH1JKXKetrYBCajTuEoXL45nNx2a2Am
         e2/5o77ReKAkoeoD4rYM6TELQ98cb0/l/kUc98nyvYQP23O0Kp0ODf9W8RwOF/2LqiZw
         a47ZkW+WvLm20V+6QrCC+p/tlM/at1glDme1vNZuvGZn3ArLUSu9HYk/dIWnxSzPekAL
         u2ZyEujQxvlrnxwZC/BM+1fbP4HMl5BcnGDiVdyUUNe9vW6+kQfz3LswJ48lkGHSRzxh
         FhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539370; x=1789144170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aChLsEokWRjvJChzyx28wPmVgPmPAP/lNJ5qzF5xYQw=;
        b=Z1ue6K1ekxXkaSAopJew77GBjxbVbK7a8Bful24Vl6wU/brKhom2UHoBIhzBMdaO7L
         +p+2jeIa/UTQTEaC84Q4rrYMthjBOpN34GlnB+OjvcL5v4U/tjHmTEZwbx6WCkWP/4Mv
         Glu7vIVlU0wIHzbBs/lHeOytjBhcsN5mn6tYnt8Epv6r1qY+c5EKAxvHEAyHavWkWx8+
         TxwCBEaLqx0w0FHomdZaSyhQfvu+KP1MLCCpcrVq1cezKR1JXPjZY2KVmmFPBrC0iXsB
         lUkbszBAFaEW770SkXuM8PTb7PKr7DRo+7PRccKB5ldTc1z10Qh3Ua9Az4kr7qN+0vfU
         G/Yg==
X-Gm-Message-State: AFuF++lKqQyxiSKCwFeZcEOonesCT4051bolqHHAonfuV3brzxC7TeZN
	pfGqOZpBxSPKWH60KuKeXEfjkmTdtH0u54h7TKx2RngDtIHpXaEDhW9tH+Gb4w==
X-Gm-Gg: AYBFou0waY2OgI/mITfG+k2lOWNwiVyESvwrrHR/VNuiAEWpuHuC+9AzAGgC9qPFc/1
	vCSLp8CsCcSnotc7kxvdiMtQKbXME1x4bbdCeBAlaA7bTMMqR+4wQbZq3XXSZfTJISUnAHe2Wyg
	xkbXXhR30nbDrkNjwy7blrvN0drfp9rEqCzSD54gxQfams6f9xgp+NKB8zP4kUH98MMYcRNVJ+6
	izlgDFUBzqFMs4Tf+uhYCZc8u390m6J29mY0WThUObPc2nLTcswCsq7T3eTHm9HNZtM/hBStNRT
	H00tMrBk3NAgwkPjvZv7hx4Zuxp/SrCMkaNyJFGNj13ypIJY5rgHie/iu82ssKBWVRZd7oTE/Vl
	A6tkzkJZaAXTSd82kAz0dZANTpc33AtySmflTGPi7cxI0CIREbhQErCSm7feMdoVWdJKbb4YxeD
	+xlr//w6w3Rz/lsOJFCrrUBdowZoxEl9Q6D6xc+h9mGPweHvnP1nDTPUWaSW/HhGw5VqludZAJO
	Cr9Bs7UemU=
X-Received: by 2002:a05:622a:cf:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-5305498b069mr72862481cf.27.1788539369447;
        Fri, 04 Sep 2026 09:29:29 -0700 (PDT)
Received: from ubuntu.localdomain ([209.227.130.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910405966f0sm24432386d6.6.2026.09.04.09.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:29:29 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v3 1/5] lib: utils: fdt: add generic domain and property parsing helpers
Date: Fri,  4 Sep 2026 12:29:11 -0400
Message-Id: <20260904162915.1092353-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904162915.1092353-1-raymondmaoca@gmail.com>
References: <20260904162915.1092353-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092931_072846_33DC7DBF 
X-CRM114-Status: GOOD (  19.06  )
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
index 747ba028..c0f65643 100644
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
