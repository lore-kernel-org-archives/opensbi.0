Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A4FCA0EE4
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPj4/pf61gqYMTkKsE0gCZ89KONYWoExJ8ccMZhIHXA=; b=WdPuOEJyFava5R
	dvzoaIv/wGltfwHOd3NBIjlp8M0WIJl4v6v/PKMNpn37TzIIAVEtzlA41omfaFgRuQCdSuA41IkGi
	+QlFmuUblYYCeCw6J5vWwDwOasxZ4U3lESwsX6ttcfndlApBApR+2Prb786oSHfp+/vexF7wz/TOE
	NU7PLLmSkuRtOBcpt3vlovC5ZSiRfroj8u7WM5b/QNM4wUxsgYeKpcd+hsW9ca3qgZjnvw8gtXpVe
	WzWXaOKtmDJxAp5Ao376FdaxghtU95koUrwgJ62vh6f587NGvvYbnh1MWCVD2a6ODCntLjwvD4GbE
	6QMManP4EDwH5BmfSU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGP-00000002YCa-1RSh;
	Fri, 15 Aug 2025 13:14:33 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrFZ-000000028iA-0ASM
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 10:01:30 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-32326e5a623so1664596a91.3
        for <opensbi@lists.infradead.org>; Fri, 15 Aug 2025 03:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755252088; x=1755856888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpHoZBfP/pg/tiQuMbnw9plTR4uSarvEUE9dskP8dNw=;
        b=BatOmO1ieBLZa3cA5Cjc0Pv04DzV1P8u0KW13ey8dcZwPlez71IbnjdjAKqSd3gUig
         VM7vpE4bP741SU2ieGlLFy1fot+jyoTS9Z7txokP7nnYk+E3IjW/dkWQsHPJDa044fHk
         D5hzoU5I7YX3tP7z5akhrUeOO7glZCkIb+xkuOVOBYOs1YxKtf6xH19YFiA5nbwyC441
         dYR+0KA6KWDNTv5Vv6+on494mPRUIzFf0sevFRD3zSdabCE7qTzuYnQN6Xy4YA53aIXS
         VIGLMf5KUijAQHQ+V5zd9/PLYf6PIDl/EnTjC/oOYJFXGtw0A4tmxIX1RDq9npFXM0mf
         9uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755252088; x=1755856888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpHoZBfP/pg/tiQuMbnw9plTR4uSarvEUE9dskP8dNw=;
        b=guD4VTuPruQD4pafLb6zQHKzaoTB7smomQ7r8RHe2YnZEI79GUQfOT2iWzFE/DwjWh
         RlDH2qG+NiOZQC2A3cI32r6h25O+u3GEtmQnXFHk/5GzD8kf9E0HJQkIMrlqtw2tCmU7
         OQ/1sqvmPsstpZ9XlW/Zyr2IuCrLeX3Z8wvbq3Cp7bVkxcgH1Dm9J4NF5sFC0+0Trm63
         +Ylf2I5EzMjBlldxtgR4IDdhoBXg1oQsaVLT5zzlWtGqFKhbY7/hjezrzLecexGFzIfV
         mZWKj+4Rv0Iyo7eCdo/cjlqTN6evlJKVg0YxvWXaYyXUAsmcCkml0lfZPhXle+YmUhA/
         Ozsw==
X-Gm-Message-State: AOJu0YwS9tp3Foi+yQUj3Mp1gExqRETe7X0/6I5fhJ9MwYKlnxC3FFrm
	W9vzVUtFelmuye4MHMCok8c/8YyCZXhIDhz3kEmiyUfrRGolJ5FsizCci2mBduinXElTiVzyUIp
	e88e2bMK+g8+YOi7qvLO40iBLp5Ita6VhmFRHev5LgXVPRoq48HPUz9prvWvPts8aOiI6ZgFlAj
	U/80mNAr8ED5iTB6JZK/6UxtFlysWPFVmU4rRo4ABPPh4b0jK7frQwAw==
X-Gm-Gg: ASbGncsdt2IdPh5dLwQfy1nismuP3bhL6cMpXNe2QHzCYTm4KnGAYKHyjYwQbDtthty
	SvZxZ/WkyJItEfwUBqTaqebZgnxw2pgZVHtXwY5xICuGPocFAkequ6+1vuH5PYfbPW84rHn4U55
	kLRBciR/DF+kpVUdWISQki6dJRy/DyB1xnOGluxraCQwQeN7z1Rek0P1IHUqtKH4sJYkD64pWRr
	bvu8YMe106gj8qESqfeV16VrXQmrQOtWlRYOiLRjx6OUCMYLth5lN87b4Fom6TbSgX+8TtN2Ynj
	ncbc+he3axQ8834Fx3gEQcVCDODwPbHJ7K4jv+uid53BXDgKTF+gqgN4WKLrlqazJl+XnpLYVu+
	8yiMWMnLNDiKFMAGZeQ9myFitPRVRlGHN6ix3cQ7ZV49BLP1skcgsx5CIYA==
X-Google-Smtp-Source: AGHT+IEfu8BEPUAoMEY4rkvt8+E8CePbF0ROq6EMTsnrq4Qamvr140Ol+BXjw4dUtyISyOE4YrB5rQ==
X-Received: by 2002:a17:90b:5282:b0:31f:2101:849c with SMTP id 98e67ed59e1d1-32341e18abemr2744287a91.12.1755252087899;
        Fri, 15 Aug 2025 03:01:27 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5a7a40sm879220a12.9.2025.08.15.03.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:01:27 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH 1/7] lib: utils: fdt_helper: add fdt_has_isa_extension() helper
Date: Fri, 15 Aug 2025 18:01:09 +0800
Message-ID: <20250815100116.27776-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250815100116.27776-1-peter.lin@sifive.com>
References: <20250815100116.27776-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_030129_081713_EF59D824 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: greentime.hu@sifive.com, Yu-Chien Peter Lin <peter.lin@sifive.com>, zong.li@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add a helper function to search for a given ISA string in
`riscv,isa-extensions` or `riscv,isa` properties within
the FDT.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi_utils/fdt/fdt_helper.h |  2 ++
 lib/utils/fdt/fdt_helper.c         | 35 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 24ad1a94..8aa216c7 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -56,6 +56,8 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
 int fdt_parse_isa_extensions(const void *fdt, unsigned long *hart_exts);
 
+bool fdt_has_isa_extension(const void *fdt, const char *ext);
+
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index b0b18b1c..de72f34a 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -447,6 +447,41 @@ int fdt_parse_isa_extensions(const void *fdt, unsigned long *hart_exts)
 	return 0;
 }
 
+bool fdt_has_isa_extension(const void *fdt, const char *ext)
+{
+	const struct sbi_hart_ext_data *ext_data = NULL;
+	DECLARE_BITMAP(hart_exts, SBI_HART_EXT_MAX);
+	int rc, i;
+
+	if (!fdt || !ext)
+		return false;
+
+	for (i = 0; i < SBI_HART_EXT_MAX; i++) {
+		if (!sbi_strncmp(sbi_hart_ext[i].name, ext,
+	                         sbi_strlen(ext))) {
+			ext_data = &sbi_hart_ext[i];
+			break;
+		}
+	}
+
+	if (!ext_data) {
+		sbi_printf("%s: extension %s not found in sbi_hart_ext[]\n",
+			   __func__, ext);
+		return false;
+	}
+
+	bitmap_zero(hart_exts, SBI_HART_EXT_MAX);
+
+	rc = fdt_parse_isa_extensions(fdt, hart_exts);
+	if (rc) {
+		sbi_printf("%s: failed to parse isa extensions\n",
+			   __func__);
+		return false;
+	}
+
+	return bitmap_test(hart_exts, ext_data->id);
+}
+
 static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
