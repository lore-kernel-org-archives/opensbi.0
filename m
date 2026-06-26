Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E3DCDE014
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ayRAJmf8lP6In+miXN/3FVFXod3dkG4C+9KtcAFB5E=; b=VI70TaI+wKsS5P
	dBJTDfOf9hYHcLEt9roUYF9xjjFpUVX7/DLOmbntJqIw8jCtioEfgdH90ae4CXRveWpyB/TlKK2e/
	RvTLNqphb4O7A8+iEtlJ0700k+gz3yj9I9j5ZF/ndDVxKat8ElENgNLIDUKDLL2HJk432QbTwYEO8
	7yLjJR2av+UuPqInZr3jqBF/QMdlhyH0IrUcYeHrlsvDfrojkd4vh06e5/dWPwPixwfisP11li58t
	qJ3nTciYcT6DJErAfK3xdFcXQoxly+CpfHFYh8luHt2Zd5ik/yI558xcca3g3x4GF8MSyd2Dgumrs
	ayqc+HfV/vzOu0DXo9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3c3-0000000B4Kc-3qYu;
	Fri, 26 Jun 2026 10:16:43 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3c0-0000000B4Iu-1ZOr
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:16:42 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso514004a12.1
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782468999; x=1783073799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBlcp5e9UpOvoD2ZsCUPzyKOGG8zk9RAnrUxX8cN5Gc=;
        b=gKCHoxqHGr8M+XVJo+/4cmGopQnF8UsC1uQUrQJWPL/OnEG932XVtbJLMtn89V1sMm
         GBSsATnRfnFASB8NYo+OpbMPk/fAOtfw1g/XPd2rmW/hcAZAWhtiBV/1tiZdlF13Bq0e
         hJJGWjZVjMMuuu9dQC5Gj0ixEN4EW5GfezwL4Re0rcZHaX6rpo1eRYPadQ4vRWeVWiqt
         aJiZmvidySXS6ArIetis1NPSyaXIekEciALvYeUP+yekUANYUA66QdLGzS34CeKxXTKD
         sgIzMyhWora13pUUn4Hv7CF8nFhCS3VqFQvaOusIW5s4+wpvlDoRPr12g7hHXO9IVwok
         X1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782468999; x=1783073799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uBlcp5e9UpOvoD2ZsCUPzyKOGG8zk9RAnrUxX8cN5Gc=;
        b=bM6IPv2GCedyY3nJIuG8bYFY//TI82ShjYrfyFLuezyBcjZih1D744rHLmzHZ47lhz
         XHrSUiDUEOEPtUshEmoYmK+diqacQ44SvbSPLLCk9QSsZD4lDuRIm73ILIPg0Qxl3GPo
         w/Xg/m4kKkOeAnfaXr5TqbgkxcYTGQHzOqeOlSZlC1hbF9y2o/+LWimu/hWADNoYgJ1t
         n35YOFdMlphFx2KDBiGdUAJQXpIbOijt5o4NFxumuqvMpUC1mIH2hVcrLFLcnQlCZSY9
         09up1tZC4w7RTgGpnaDZJsIfW5waRc3JsJy87A4ONaV3QjWSfMJj6CH8L52qDJ683iKu
         oWvg==
X-Gm-Message-State: AOJu0YxSLRWdtokpoSY0VpeDLfLnI9PYe7VJJtzGHI/afuXY65SSu054
	2bWMNtCr4o1VCjMUhhzWT4f4VqzabZ4fpQkgvdIGSKP5plgmkR/Akwx9UK44d11xfsypstR8t0s
	byyVz6Y9cKPcITw4UbzC4vSxC6i2vwV0EfIoLsx7PyfMqj6WBqgLNJpxbbLLD+W4ziV3ZvvrRKl
	pAS5cggE0tYVBdXrQhUZP5w+r0/KQuoYLoz13Ffn7Ux1yUbbRharE=
X-Gm-Gg: AfdE7cm0fFcRwNG51LgRdBMl6Yq+Zs1wzuteyrmWYVFJTxe9iu1G7oE4FKQ4PHLHsd5
	brLLgdHFyrNvaLiNy7gSE3INFkEpg5U/rSRwvZjbyE9Aj5Z8vHciSsll9N1mRsjK9R99t5cLwVl
	sDAzp3qj4iZHQlWYLtVbukF1eecdgvjtgh8k5lM25jvNUf9bzpLRNOaSIon0urHs0798PBj8VTW
	c0O5Wtofgcrj9ErqdfP9QjvQUItM81XoACR/BFcH7LW7jRmI17uOVCGHYx/GOyBRJzia2tPh1pj
	NATlEeve704N39TLBVX8hZIbzJMOvMCYbOuzTXIXM1K+WcnQEMI/ZXNFPbm4PUmH+g1IAwFSE/g
	BaBA5vad5JFLX645oC2y+QIzWuTNtivjcgpl56Ito4uFGBR09zDOcPOfeQjPRcjNnqn2bFqGWKa
	0Mb7I8Gmoy1+TwhI2uoO9EdpA1QYvlGbiUdty5
X-Received: by 2002:a05:6a00:e17:b0:83a:3135:edbd with SMTP id d2e1a72fcca58-845b39e2158mr7303485b3a.7.1782468999302;
        Fri, 26 Jun 2026 03:16:39 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:16:38 -0700 (PDT)
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
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 02/12] lib: utils: fdt_helper: parse RISC-V Worlds DT properties
Date: Fri, 26 Jun 2026 18:14:23 +0800
Message-ID: <20260626101433.3133466-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031640_422855_06FF09E2 
X-CRM114-Status: GOOD (  15.48  )
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

Add fdt_parse_worlds_all_harts() to parse RISC-V Worlds device tree
properties from CPU nodes:
  - riscv,pmwid (u32): Physical Machine World ID for this hart
  - riscv,pmwidlist (u64): Bitmap of permitted M-mode World IDs
  - riscv,pmlwidlist (u64): Bitmap of permitted S/U-mode World IDs

This patch extends the sbi_hart_features struct with new fields to
store the parsed World ID configuration (has_pmwid, pmwid, pmwidlist,
and pmlwidlist).

Link: https://lore.kernel.org/all/20260619105834.1277302-3-peter.lin@sifive.com/
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_hart.h             | 15 ++++++++
 include/sbi_utils/fdt/fdt_helper.h |  2 +
 lib/utils/fdt/fdt_helper.c         | 61 ++++++++++++++++++++++++++++++
 platform/generic/platform.c        | 13 ++++++-
 4 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 2941809e..97072c09 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -135,6 +135,21 @@ struct sbi_hart_features {
 	unsigned int pmp_log2gran;
 	unsigned int mhpm_mask;
 	unsigned int mhpm_bits;
+	/** True if riscv,pmwid was present in DT */
+	bool has_pmwid;
+	u32 pmwid;
+	/**
+	 * Platform-defined bitmap of M-mode WIDs
+	 * (from DT riscv,pmwidlist). Zero means
+	 * absent/unrestricted.
+	 */
+	u64 pmwidlist;
+	/**
+	 * Platform-defined bitmap of S/U-mode WIDs
+	 * (from DT riscv,pmlwidlist). Zero means
+	 * absent/unrestricted.
+	 */
+	u64 pmlwidlist;
 };
 
 extern unsigned long hart_features_offset;
diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 75a564d1..3f3d091b 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -56,6 +56,8 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
 int fdt_parse_isa_extensions_all_harts(const void *fdt);
 
+int fdt_parse_worlds_all_harts(const void *fdt);
+
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index ad4efaaf..8b40cd28 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -457,6 +457,67 @@ int fdt_parse_isa_extensions_all_harts(const void *fdt)
 	return 0;
 }
 
+int fdt_parse_worlds_all_harts(const void *fdt)
+{
+	u32 hartid;
+	const fdt32_t *val;
+	struct sbi_scratch *scratch;
+	struct sbi_hart_features *hfeatures;
+	int err, cpu_offset, cpus_offset, len;
+
+	if (!fdt)
+		return SBI_EINVAL;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return cpus_offset;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+		if (err)
+			continue;
+
+		if (!fdt_node_is_enabled(fdt, cpu_offset))
+			continue;
+
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			return SBI_ENOENT;
+
+		hfeatures = sbi_hart_features_ptr(scratch);
+		if (!hfeatures)
+			return SBI_ENOENT;
+
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmwid", &len);
+		if (val && len == sizeof(fdt32_t)) {
+			hfeatures->pmwid = fdt32_to_cpu(*val);
+			hfeatures->has_pmwid = true;
+		}
+
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmwidlist", &len);
+		if (val && len == 2 * sizeof(fdt32_t)) {
+			hfeatures->pmwidlist = ((u64)fdt32_to_cpu(val[0]) << 32) |
+					        fdt32_to_cpu(val[1]);
+		}
+
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmlwidlist", &len);
+		if (val && len == 2 * sizeof(fdt32_t)) {
+			hfeatures->pmlwidlist = ((u64)fdt32_to_cpu(val[0]) << 32) |
+					         fdt32_to_cpu(val[1]);
+		}
+
+		/* Sanity checks */
+		if (hfeatures->has_pmwid && (hfeatures->pmwid >= 64))
+			return SBI_EINVAL;
+		if (hfeatures->has_pmwid && hfeatures->pmwidlist &&
+		    !(hfeatures->pmwidlist & BIT_ULL(hfeatures->pmwid))) {
+			return SBI_EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280d..51e9f342 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -255,11 +255,22 @@ int generic_final_init(bool cold_boot)
 
 int generic_extensions_init(bool cold_boot)
 {
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
 	/* Parse the ISA string from FDT and enable the listed extensions */
-	return fdt_parse_isa_extensions_all_harts(fdt_get_address());
+	rc = fdt_parse_isa_extensions_all_harts(fdt_get_address());
+	if (rc)
+		return rc;
+
+	/* Parse RISC-V Worlds CPU properties from FDT */
+	rc = fdt_parse_worlds_all_harts(fdt_get_address());
+	if (rc)
+		return rc;
+
+	return 0;
 }
 
 int generic_domains_init(void)
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
