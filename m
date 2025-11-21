Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E38CFC502
	for <opensbi@archiver.kernel.org>; Fri, 21 Nov 2025 19:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdgkF8Rvu1LeDD3vM/U2vlPAmLwcvz+Zbe3DO1P7Oyc=; b=jnebQ4IVzkT99j
	w2JGuT2xE1uB7BsqUrT4a+YssyzSZpNQ3hYf6T3rH8YapYXGLJkrvidu7LudzyMw8+U7P01uQgP0s
	pWgqudwH/S6XVgn3VNRQsWMDPtxIr6V4jzioyl1Sxb3L5lHkI9t3RB9T+VIhGt8OEyVqMWb9U8EXw
	Ew8E++Yyz+IJiHoIIE5c10iNrwLsbbZgCi0/y8h/xPA0ReU3CTkyYwpzZsBUM9QOial3KRZwbegVg
	Lv/cSbRnj7DwUr9EMi/xcwzLsEo7GCCQfiDfg3imihcfxKhbc9IR4cUileMh4MQeDzZsDzJZS0Q8F
	dwYppeJQG2q8IUwQFWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWxT-00000008ul7-2BCr;
	Fri, 21 Nov 2025 19:38:15 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWxQ-00000008uk9-4B5X
	for opensbi@lists.infradead.org;
	Fri, 21 Nov 2025 19:38:14 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-bc0e89640b9so1499287a12.1
        for <opensbi@lists.infradead.org>; Fri, 21 Nov 2025 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763753892; x=1764358692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yfb1/stTWKwUg9dKuyamtWWY6tzqJixikkEPhpb0a0M=;
        b=iM0RqsaF7a2AntwOygUIGbERDKmemm7GekXRKuMfKdVLn4H1o9OdN7YiNdcDHQZARd
         ApcL2hfXjezse8F4FN0eS+saUFAxBHz0I+k+5zzYFNZrCL9D5vxSWCZUfaCFL6/QSSS3
         6xnXWapV+g+/yUhrXXL2XWFGa9usykW/A6Ry7cA3AQCzrPL8wkqNDH45+7nDVxMrbLG8
         llthkIjUUJETKyStLbmAT7YMgQYCy0fM1fekUn4MbXCFLn0fO5Ic+jJAPKi37UW6PtFT
         7bmmyr3OIHUoisUuriiXxlIUv5Bs1nUOfVUWBWrGlDULKArugr3ewPM7XwuyA1AzCDqm
         ywXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763753892; x=1764358692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yfb1/stTWKwUg9dKuyamtWWY6tzqJixikkEPhpb0a0M=;
        b=e2KprjZCH3CGGWtFzmziXfvfXiYETsROfISOenyKFloTvP5cg5wgyrMT9Nx28Vz+Fb
         pwl6gcMPAM4QJAtMMnjDlcs15zHuOZ211whipq6BBBsJZM2F1bxPq9Px06bRJPvK2djX
         xqJOuyLASSgcY/H3HrHS7U2CSeZMcZ+2MieFKWSjLmusH0HyyCuIhq72zgVNA9tgzDYe
         E9XNIXTJ4SoeKF6ZGAPt0F8xSMTgaX9N06JZg7qbj7dHj/ehACKtbI1uvQVeHpuAdlpp
         18+jMH174k26dedsXic0WqXizHFTT/QNWaqL6H9+5VoWBo88PVvWm0lT/QXKWWg0ZW+K
         zrLg==
X-Gm-Message-State: AOJu0YxnbvM4xn6P0ofG93VgjYIa/51Tv23pVL9ogRlhmn7CcwPipVst
	B+oeS99mP3w1F6BjpZBU/PYoHrVd4IW7lUqARZk5+/2SLauMpuioYqlYDhWT23zz8HWc0Ob83Ai
	5MgZsGrukoLFcPtkdk/uy3jDW1Pge+nhpL7t3TCXMktwqo6jEgiBiMsEsardFr1F+z7hFXYfYD7
	wAMLIctz2a3jK6LJs4daAvq3Epz574QBDSF/IM30+5xb3qfkonYPFKHjE=
X-Gm-Gg: ASbGncvB7jpNTez7kEcc/sWkPFTUXeMJP0B365JH0WwTLgcIOdtE2Re2MWp5nwysexL
	Vnk8uv2zl+tdFXxMKDQm50/xjg7emAGrW2MC09G4BhuNRnTghsScy8nh2TGUjN79YTIrcGY82c5
	lGlQl+jbRpJSsoE+iJAnk80uk4IHwdVKbumfIqQlrDLZAfucoTLLeksO9PHYafu+C8N0KtxmbEN
	vjoae0lopP9NCzMdJpr5LZxgWt29Y9w+8tov+OZJTOWmNdWKGVlIN2rjpd9cUT5B5vnVZk/a2s6
	lP2Zi/MNqw75Kg2KRUKWF89DttjvOtjQGTWMqlXJ1WgjtIk8Upgplrk38oldLG8ln/ClRuFRL5Z
	17sRHdZZT5MAIdS2e1YuV4L1yw1pCwAZM/KYbix7llNH4hQZmzGm/BTWOIxGgBtboY/4JdUZEUK
	sjovCcwCx5Bp6X8V0a2qWbndl+p9EqFdie
X-Google-Smtp-Source: AGHT+IEF+QpOaw4aCxs4Id6LeUMHgQArs4NZtNcki96a8b3OtApZWwBfqOV+4DGpl808pfQ/g9YRAA==
X-Received: by 2002:a05:7301:db0e:b0:2a4:3594:72df with SMTP id 5a478bee46e88-2a7190f29d9mr1071760eec.14.1763753891774;
        Fri, 21 Nov 2025 11:38:11 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc204881sm25505480eec.0.2025.11.21.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:38:11 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/2] lib: utils: Use SBI_DOMAIN_MMIO to check MMIO device permissions
Date: Fri, 21 Nov 2025 11:37:52 -0800
Message-ID: <20251121193808.1528050-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251121193808.1528050-1-samuel.holland@sifive.com>
References: <20251121193808.1528050-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_113813_035780_E1CB5537 
X-CRM114-Status: GOOD (  11.41  )
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

Drivers or platforms may create memory regions with the MMIO flag set
that contain S-mode-accessible MMIO devices. This is strictly correct
and should be allowed, along with the existing default case of
S-mode-accessible MMIO devices appearing in non-MMIO memory regions.
When passed SBI_DOMAIN_MMIO, sbi_domain_check_addr() will perform the
correct set of permission checks.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/utils/fdt/fdt_fixup.c             | 2 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index f3fe8af9..b0ed20c8 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -185,7 +185,7 @@ static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
 		return;
 
 	if (!sbi_domain_check_addr(dom, reg_addr, dom->next_mode,
-				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
+				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE | SBI_DOMAIN_MMIO)) {
 		rc = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 		if (rc < 0)
 			return;
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
index 94a5af8c..1dcc049e 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
@@ -57,7 +57,8 @@ static int mpxy_rpmi_sysmis_xfer(void *context, struct mbox_chan *chan,
 			sys_msi_address |= ((u64)le32_to_cpu(((u32 *)xfer->tx)[2])) << 32;
 			if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
 							 sys_msi_address, 0x4, PRV_S,
-							 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
+							 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE |
+							 SBI_DOMAIN_MMIO)) {
 				((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_ERR_INVALID_ADDR);
 				args->rx_data_len = sizeof(u32);
 				break;
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
