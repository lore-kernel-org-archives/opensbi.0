Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6794FC5DF70
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qv5UXMDatT9Y4NgcVN5AHmpkfpY69jAYGDxqH6reL7c=; b=Idu7nMwITqNABB
	THAvWzhopLnJYcoDC2V3PbG5Io0oHKLsK6mX30m1JLNwizQgl7rV9i91v6hdihckeOPF1dPndhm0a
	ey7VGrCHyURawEYaugk/psYPV4xx7b4PVhpsM9CMRdF04rj6Ex2MIynH0FOXddWNMss65/YiUKZ1p
	MzTaFDPnrEtr3mShlegxVi+vZekr3qidSdhPaLdAjZPr8ipjVWSFWGrjLaVmn1o6yPjoIDruR5ZLV
	W7cWjYiqNt/z4ylgcWmZ+eQ/FX7SCn804E51HuSOgbZhAAf9YSY7Kz8YPidXxopQ4unDIO/kIOH49
	E77jQnrX4SSouPVwu19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHe-00000005lYD-0NMv;
	Mon, 17 Aug 2026 09:05:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHc-00000005lWW-0tgW
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8485b358552so533392b3a.2
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957527; x=1787562327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lnXziWvbXSlBrCf+MrzgXAKm1SZu0o781YGTNxYALg=;
        b=K3TpJyjyd/wqXiFxYm0RYMpQkOfzz59Qj8lLjq+sNsKNV+CNwHhf6pzVNWTkrl6YG7
         dAZtEhy4LUHyguRryZmmNyCDwzxPTgGrE3mL89nrN9PvJk+AImCdv75t7wM1ah56iyLX
         s2MJixhOeMoMa+MdE0HA1sZdcdQbcb46SFa6kD/lgqXFpgj7h8ajaO75YRet7ZVD+gop
         cFcjHv6uYjxoz4GPuTu1Px/kT02Th4FUN8/pRhLE9jZA39eO/2Fqxbpk+pbECWC825QB
         9di8MpxRWSMp2sEtx0q4uRpRLMkqQ6Kxjt7tVKwidmHfuCFcdbwTSMIuWC4XnYL+5ZUd
         pBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957527; x=1787562327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lnXziWvbXSlBrCf+MrzgXAKm1SZu0o781YGTNxYALg=;
        b=fU9JGjK2aHz2+OY9Fm7KAefi6P9UvdxzMaAbachiYeJRGcdZh1F9orb2y+zASWNASe
         3JW03oJJA8rTPGWuZfPfFiSoXRxKfoi8coUoODrWsoUsGAgf6krlpbfrp1SnrtJk3Roz
         4tH3vE2pZsZ00MIdYsfk9DXrK/H21KovUX9gZwb5K1lTHvxWx2FO0rRrrdZlb+5iN575
         Xcd5hU5OZeN0T+ysfo16exLnQGgDmU9unDMt8V+qFDeW7ibODB+vjvceTI1hmVmq/9SS
         ipjUDyvPBIeuC3aQxzWM2Up8+tKUDnjuimOO3fXFUyYpcnifHt/QNrux3C2VJuZNYW2O
         jpOw==
X-Gm-Message-State: AOJu0YxxAfQCL4+si2uViF21AkSAiPJ2h9cYQFrnO+7PpGJi0lZ7e2Jd
	bRU5WzVgidKIm3i/KYzqkiY76TDIrA36U5KdxDMLxGGlNBOMKlgO8v98JXOuVfnrXjmHvZWPaIS
	Kggj0Bmcmx3v2a7skJ33Fm8fLudQfIUvx/3smEfdZzqNB6xcbobNrIB3n0k3uKg0Ikc7fhjWqXP
	ZIKoIaq+uojFRFHuXSHptek5QxVNY4SlWOJfhl4TMFNucX1edVP/k=
X-Gm-Gg: AR+sD13nfbeoQpn5+HvmyN0+T8XThCGY/yP/yWUKqrmpsF5LJFe0+eXbco/jylm4+qr
	vG8SOSoPP6JmgQb3S7EAtzNdOkS5sqJs1YLjTAngH7tJjcXdz0izXl8JVpYWnd5sXyv6f1r1lGP
	dXDFw+Xlm8DkvGZS12r1RdYXvrVx0IWz/X+NAOOITlF1KBAdcNZI4h13GobycL8+yoU0leLMlHC
	5aNjuQbZlxrHJskOJhORjAzKnoU10BL5tjYlefCVOWn2SmKXP0imxGirApbktvLq23KOzjB4dMt
	r/66tNbaSaRvUOAivUqenQegv9Oii94T/byHZ/HpLXr4OnZ8QwtFejD0YkDXsWRIyBhV1DXwizZ
	smM585t5Dyguapk1Ei+lqJ+jQz2eMTdXoa4pe3yMITpRB9Fh4s25LyxbEJsZJJ59RuUAOEkcflD
	jOIi3fExjJvXnxzMWBL0oLXeKtT87ne+pJE/YH/84zKCj0365jwSQjarRl4lLgB5ULzDupI8t1f
	0t9uibdB1i+
X-Received: by 2002:a05:6a00:301e:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84fde20e20bmr25319717b3a.22.1786957527032;
        Mon, 17 Aug 2026 02:05:27 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:26 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 3/9] lib: fdt_domain: parse domain WID properties
Date: Mon, 17 Aug 2026 17:04:57 +0800
Message-ID: <20260817090503.2104998-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020528_260102_3014C6F4 
X-CRM114-Status: GOOD (  12.97  )
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

Add wid and widdeleg fields to struct sbi_domain to store the
RISC-V Worlds mlwid and mwideleg CSR values for each domain.
Also, parse the root and user-defined domains' WID during
fdt_domains_populate().

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v1 -> v2:
- Add root subnode for root domain configuration (Oza and Anup)
- Rename next_wid/widlist to wid/widdeleg (Oza)
---
 include/sbi/sbi_domain.h   |  6 +++++
 lib/utils/fdt/fdt_domain.c | 50 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 16edd4ce..44c8befc 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -215,6 +215,12 @@ struct sbi_domain {
 	bool system_reset_allowed;
 	/** Is domain allowed to suspend the system */
 	bool system_suspend_allowed;
+	/** World ID for this domain (mlwid value) */
+	u32 wid;
+	/** Whether World ID was explicitly set */
+	bool has_wid;
+	/** World ID delegation bitmask for this domain (mwiddeleg value) */
+	u64 widdeleg;
 	/** Identifies whether to include the firmware region */
 	bool fw_region_inited;
 };
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 61627db3..68dd6da4 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -307,6 +307,27 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 	return 0;
 }
 
+static void fdt_parse_domain_wid_props(const void *fdt, int offset,
+				       struct sbi_domain *dom)
+{
+	const fdt32_t *val;
+	int len;
+	u64 val64;
+
+	val = fdt_getprop(fdt, offset, "wid", &len);
+	if (val && len == sizeof(fdt32_t)) {
+		dom->wid = fdt32_to_cpu(val[0]);
+		dom->has_wid = true;
+	}
+
+	val = fdt_getprop(fdt, offset, "widdeleg", &len);
+	if (val && (len == (2 * sizeof(fdt32_t)))) {
+		val64 = fdt32_to_cpu(val[0]);
+		val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
+		dom->widdeleg = val64;
+	}
+}
+
 static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 {
 	u32 val32;
@@ -469,6 +490,9 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	}
 	dom->next_mode = val32;
 
+	/* Read "wid" and "widdeleg" DT properties */
+	fdt_parse_domain_wid_props(fdt, domain_offset, dom);
+
 	/* Read "system-reset-allowed" DT property */
 	if (fdt_get_property(fdt, domain_offset,
 			     "system-reset-allowed", NULL))
@@ -535,6 +559,29 @@ fail_free_domain:
 	return err;
 }
 
+static void fdt_parse_root_domain(const void *fdt)
+{
+	int offset;
+
+	if (!fdt)
+		return;
+
+	offset = fdt_path_offset(fdt, "/chosen");
+	if (offset < 0)
+		return;
+
+	offset = fdt_node_offset_by_compatible(fdt, offset,
+					       "opensbi,domain,config");
+	if (offset < 0)
+		return;
+
+	offset = fdt_subnode_offset(fdt, offset, "root");
+	if (offset < 0)
+		return;
+
+	fdt_parse_domain_wid_props(fdt, offset, &root);
+}
+
 int fdt_domains_populate(const void *fdt)
 {
 	const u32 *val;
@@ -573,6 +620,9 @@ int fdt_domains_populate(const void *fdt)
 		break;
 	}
 
+	/* Parse root domain config from "root" subnode */
+	fdt_parse_root_domain(fdt);
+
 	/* Iterate over each domain in FDT and populate details */
 	return fdt_iterate_each_domain_ro(fdt, &cold_domain_offset,
 					  __fdt_parse_domain);
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
