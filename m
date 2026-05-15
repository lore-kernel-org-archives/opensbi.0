Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69377CD4851
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GX5WiH88GjCEeFWa8+Q9lyo0x/pn3iQTk+caz6KjzT8=; b=vF41iFFaUKFbIH
	di05R+sB6zzRb3OdmWscNdbZlNSUP3obU8trCDfGenAiwLbB6/OPMNaOLF5MfNLQhBa7Xjj88FqjZ
	fsMIu4FIwKPvzejLl9Z2NxYqKaMYOQyYKsEi8qdYeZbJoiw+SRe+b1uIWBdTTWtXRW+i1bC6PZ2oY
	KbgaJ1FguVY22hWaI1XDv0RgXvSxRvgtv/K80Z+A62lzurHkG3SFM/BHZL/1hwnMIGzqluCDxGJir
	wG5rBlf4AErc63BhwFlXZVK/laKg+lywInqi3n0OgT9DW3bgAosJL/+G94Gfq68mMTUldNngnXd0w
	4uApNjoLTLIy6jNnwOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqT3-0000000895H-38wO;
	Fri, 15 May 2026 11:12:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqT1-0000000894D-1Fz0
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 11:12:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so106356015e9.0
        for <opensbi@lists.infradead.org>; Fri, 15 May 2026 04:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778843549; x=1779448349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXtp1F9PO17/3q6VGRdDp+JCjlpCriA5LF3lzPNQC+A=;
        b=ibB37Imn5STUD36mHkyKJJls5mUeVApK9NA0EEkdOvs36VmlYomZkF9f96Vtb2Im+P
         o403D7tdpyrqpn89kdQ4wbulkhSeYL2jW2/IKwlB37ciL8MFPvgsuxbaedQf14gCF3Ms
         QgRbQ78uwwLdTS0mAlub6wCWewcIJ+dLgsVJGcLoAkGFlRH33Qohyws3oeRcmGbab9Lk
         7+H6nnXJire74SBf1EBkonBRooOtGRJetFYPtwIflaUEIBfnCdGDIv3pUsfy0clivfH2
         HBBy8DYz5dEBlE7a1+2qkpHB7gDHcVjnhbbjOWyyllJ7qxPaUSjNXrleRi0tB439XbEv
         cr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843549; x=1779448349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXtp1F9PO17/3q6VGRdDp+JCjlpCriA5LF3lzPNQC+A=;
        b=Xm07p3oBI8mhWl4OmELCUU00R9HqAUoC97uLv5kAxL9UFxslxrjKYZpwkEpQFyRSh6
         fQ16FQMXKgJ9NoEOe0cxRlKGWV0YrwJiFI8LHoWO/UEIp81+tBUhVrKuS8Et8NaPJgt+
         8XJ5prafX12KDIn2kpD08raPSb1pp2lh+GbO2b1bSV2res3SMwU5CgcO8952SCCrP/ri
         tZ4ky/MXkQQNgnge/6xDELkTPcxinc0C/mMgJV+7mOcCi5KzpOzAgbIRI2G+oKxSd7k0
         c+JDzdWsHGaCLPX57y+n6Mlj3RQoyGEatCAgYfwrdWpmDsSjR8Cfq/1ehkkNdCaMm9/4
         f2cQ==
X-Gm-Message-State: AOJu0Ywq9qwekjh22oJEXFw1rID3kdnkAWyk4yZ6jDC/bPnAucdXixoa
	HjgQkKZiGnqZPKGpnBzHGl/BHw7S3k2ZTdf4Sg75iyiyHhp5JeJJBAMAdgV1mINv4C+709gDPWH
	rIfEtV6/Q4XwWmrosANxXe9EDOCaXn5+bCV6pXH/j0pOWklTXquXAQANPs1SKTSyyD/0HhlSEGs
	7IjNbjjM5tho4ZbYhLt5RCzBMeWf7MDLV3msu/pufm+RVkLE1Lrn4=
X-Gm-Gg: Acq92OEodgZFCEMtUZe7ahFE9oDzIFvYcRo/0iZj/WE7koCIeTpNzhVkv0xgVXs6Xh0
	Ui+QeRQzUG+zJKnvHWVvoZ3Tw1qRd9/9PbB0CNFLxRNhAuwgBy+ujPc2ebd82olK+Raq8Gs0x9i
	lTROa7T0dhuSYBsoGm5/+ho6PREYWt3YAbiyR1s5LHn9fok3YmjTLFogVPdLTMs1z+X/v6RpDb3
	DTxF6Jyz5XXH9rG1O+buBEPSM7vwG5K35IvHHgsxx7yv0aQq0Gp9aVawSJ/5nEO/xPo6ZN4SF8f
	DBgm0R/zYH/uOWYr+qeovidMOf8zr2+GLA1NmwTXVG6dGNnVFYnb+vsL+aa9Pn1+0WwVN/rjJtL
	HLOuCT7hFTpoFoyQAA4J4a/I/EaihPxA71ChEtoAHXbG6E6wgePsJksGg2PaOyvP4XFgrNvuEYr
	4/puwNI9VEJGwCbmrFJEmHS4NhiNPO0fmdxdRubgRPeZs6w44=
X-Received: by 2002:a05:600c:46cf:b0:48e:8974:c377 with SMTP id 5b1f17b1804b1-48fe6626ba1mr46717055e9.29.1778843548904;
        Fri, 15 May 2026 04:12:28 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537c516sm56629345e9.13.2026.05.15.04.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:12:28 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2] lib: utils: fdt_domain: add root-regions-inheritance policy
Date: Fri, 15 May 2026 19:12:21 +0800
Message-ID: <20260515111221.1235342-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_041231_381841_428E00F7 
X-CRM114-Status: GOOD (  16.16  )
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

Introduce root-regions-inheritance DT property to control
copying of root domain memregions. Support 'all' and 'm-only'
modes, always inheriting firmware and M-only regions; behavior
matches existing policy when property is absent.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v1->v2:
- Addressed feedback from Anup: https://lists.infradead.org/pipermail/opensbi/2026-May/009850.html
---
 docs/domain_support.md     |  7 ++++++
 lib/utils/fdt/fdt_domain.c | 49 ++++++++++++++++++++++++++++----------
 2 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index c01e445f..e267a9f7 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -159,6 +159,13 @@ The DT properties of a domain instance DT node are as follows:
 * **possible-harts** (Optional) - The list of CPU DT node phandles for the
   the domain instance. This list represents the possible HARTs of the
   domain instance.
+* **root-regions-inheritance** (Optional) - A string property controlling
+  how memory regions are inherited from **the ROOT domain**, which are then
+  overlaid with regions specified in the **regions** property for additional
+  restrictions. The allowed values are:
+  * "all" - inherit all memory regions from **the ROOT domain**
+  * "m-only" - inherit M-mode only memory regions from **the ROOT domain**
+  If this DT property is absent, behavior is the same as "m-only".
 * **regions** (Optional) - The list of domain memory region DT node phandle
   and access permissions for the domain instance. Each list entry is a pair
   of DT node phandle and access permissions. The access permissions are
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 1b039533..2357346b 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -10,6 +10,7 @@
 
 #include <libfdt.h>
 #include <libfdt_env.h>
+#include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
@@ -237,7 +238,9 @@ skip_device_disable:
 	fdt_nop_node(fdt, poffset);
 }
 
-#define FDT_DOMAIN_REGION_MAX_COUNT	16
+#define FDT_DOMAIN_REGION_MAX_COUNT		16
+#define FDT_ROOT_REGION_INHERIT_ALL		0
+#define FDT_ROOT_REGION_INHERIT_M_ONLY		1
 
 struct parse_region_data {
 	struct sbi_domain *dom;
@@ -309,12 +312,14 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	u32 val32;
 	u64 val64;
 	const u32 *val;
+	const char *inherit;
 	struct sbi_domain *dom;
 	struct sbi_hartmask *mask;
 	struct sbi_hartmask assign_mask;
 	struct parse_region_data preg;
 	int *cold_domain_offset = opaque;
 	struct sbi_domain_memregion *reg;
+	int inheritance_mode = FDT_ROOT_REGION_INHERIT_M_ONLY;
 	int i, err = 0, len, cpus_offset, cpu_offset, doffset;
 
 	dom = sbi_zalloc(sizeof(*dom));
@@ -373,20 +378,38 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	if (err)
 		goto fail_free_all;
 
-	/*
-	 * Copy over root domain memregions which don't allow
-	 * read, write and execute from lower privilege modes.
-	 *
-	 * These root domain memregions without read, write,
-	 * and execute permissions include:
-	 * 1) firmware region protecting the firmware memory
-	 * 2) mmio regions protecting M-mode only mmio devices
-	 */
+	/* Determine root domain regions inheritance behavior. */
+	inherit = fdt_getprop(fdt, domain_offset,
+			       "root-regions-inheritance", &len);
+	if (inherit && len > 0) {
+		if (!strcmp(inherit, "all"))
+			inheritance_mode = FDT_ROOT_REGION_INHERIT_ALL;
+		else {
+			sbi_printf("%s: domain \"%s\" has unsupported "
+				   "root-regions-inheritance=\"%s\", using \"m-only\"\n",
+				   __func__, dom->name, inherit);
+		}
+	}
+
+	/* Copy over root domain memregions according to inheritance_mode. */
 	sbi_domain_for_each_memregion(&root, reg) {
-		if ((reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE) ||
-		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE) ||
-		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE))
+		int copy = 0;
+
+		switch (inheritance_mode) {
+		case FDT_ROOT_REGION_INHERIT_ALL:
+			copy = 1;
+			break;
+		case FDT_ROOT_REGION_INHERIT_M_ONLY:
+			if (SBI_DOMAIN_MEMREGION_IS_FIRMWARE(reg->flags) ||
+			    SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+				copy = 1;
+			}
+			break;
+		}
+
+		if (!copy)
 			continue;
+
 		if (preg.max_regions <= preg.region_count) {
 			err = SBI_EINVAL;
 			goto fail_free_all;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
