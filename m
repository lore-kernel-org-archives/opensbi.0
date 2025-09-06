Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DE3CA1012
	for <opensbi@archiver.kernel.org>; Sat,  6 Sep 2025 07:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AyOMw2raOh7THStjHIxZubkw4ot0rlrlNguNumsxDUg=; b=wycus+dp2NRCqX
	l9olHvsnRcnZ3J8RC1R5XMotyiR5sVNxY4E6N5Plg5AuMQZEsy9ooVViUQEw20MxH2eD0qCI1T+zX
	iUGUxCPYIDv2y1VLiJzN6AaLLD81l5Y9CS4FhdKrGKeguB70glgXGFV3TJAjALwHEoFOEsd2Wv5Zf
	XMVGiaDxMCM9T7bxg2QtLoq/E6m2G4dfnwdYRbfdw0tQWCFvweOi4iOzE0O00TNLPRgVpuRyDcBCd
	5cnjqdnV/PMxpYrL9iKud7cpxeO7D8VNOQ0IAXBRK4M0vJLE5FSEACfLgu+jyjgG0XRx447roCrc2
	QROy/M6BbBA4TJShPG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uunKD-000000078IY-251N;
	Sat, 06 Sep 2025 07:27:05 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uunKA-000000078HX-3Jia
	for opensbi@lists.infradead.org;
	Sat, 06 Sep 2025 07:27:03 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b52287367ceso15153a12.2
        for <opensbi@lists.infradead.org>; Sat, 06 Sep 2025 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757143621; x=1757748421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WHKz0vSDqtVcXCwhJvi4FhbgoHJw0D4bvXiKqs1xan8=;
        b=lGrfebWGF7GLsf3Q63tR44bh8ZYGUTYLRD84/TWq3mI3XjKcqEzSb1eRzF/ilEoSyN
         83Z7YXD24h1aaR6VVC/UyQKzhqE24TriAe/C0cR9VYRcktoCuGiu6OjVjAwRHLBhXq3C
         DJeUkaqjBwCNiMLw7dfmd0ZkZ1QJCo0Uk35a/AhmXUQ93xCr5g/IbM6fMRVRLoeVtuHz
         jVeBKMUHvAgMMkmZskPeGwzIkTsNIUwCLE1s6ctzJJnKZTGz7t0xjNcfx2HsuMhw7e7V
         pyjc2L8hmvuMAjWT0vsYAWbT6RbpMNQ+neD0sA1sYxr3E4oQ+kNCzIBHmrJC78EfxXVd
         cOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757143621; x=1757748421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHKz0vSDqtVcXCwhJvi4FhbgoHJw0D4bvXiKqs1xan8=;
        b=IAF9VNw0shZ4ere11sZc6Pe8OStUApavqFXAcYnUpH5KZEbZMWcDGygsON3Zu6p5AA
         VOTpPKF/GxObMrw6i5a5Gif8GGZgPYJW67/rjC5t6MTDMnnrRaqF+taVMbua8iKdP00q
         510VG+iXvwazby2NE74rHiczGe45njm8i17mA5X2Zz8zQyVgNTgA/qdON4BI78rKbYjF
         Ps0j+mxmj2qN+2mhvGe0349zmyGEqBGyur+ktu3huOFSlSUH1rRrAV5KMFGOF4rnOv+L
         S+Kx2T9upNXrzMX02671MrE1GjGVdk0A62Fqy3JLHLov8ZrGYEMUfwRpJlIyC4VY7ZZv
         VcaA==
X-Gm-Message-State: AOJu0YzIQXr/pQEcQ+ySrc42DgQ0myzM0KauYUfxjP7kOxP2Axn9gVR2
	WRlHCLx2RbKOtWzk+Rah/LdJSiNzIA0huoJwH36lfdRV96PHrPcEYd+MtupCVSRHgWDp5I0BhJa
	EuE2WMmWIxSyliNM2AUQFb+ojiltgGnYE56Yw5ZtIqGBZIj91uo7/hu7HmGfz1BSzJe0QU/bood
	Mk0ih1uAfEiMTzfm6dfEs8szMMNXOXwonfp2xXLFQsKADtORyoie0=
X-Gm-Gg: ASbGncvRARxoOOUkQdaI4SFpX3H4NxqhOigUBnnk9X/UdqS4gYYnPgsqdYJDlltJyFe
	1IxVzeM8P5DnJ4cDAYyFl0UPaH0o1cuv+a/NjVCRz/5DIje/o3DPsJaU65HRyqsyOYkx7iJN2uF
	YAS2JLPk5qWZcnUgvPT6ISo57pIpCOnJYBHeYvBpGJAs25rC6MezjRiXiRDnEwcstIMVVzSR/qw
	hyMhVKzw9aVCxO+NDML7FW3H3GD2dhlFo/V47jsyO+/XemlfS0zJKtit+2K/4UjuF5LzFyqyES9
	uEfo81XX0IIxvPIR6cH1LDjrD7bHnrGuL29ntFM3ZSOT9eiPgJ89rtXVshOVwjs+iwbVydpSbHT
	hJA5CixbCRGOhcCYU1XRyOxKZe/o3rsXHUDiW87pgkVEyZaL46FUXAO94c0u5+ZXbbAJpZSJy7/
	EBjoyS+Q4e11N3Pghj5sJEQBUkUEmypSnPWePVpxGkc0Q=
X-Google-Smtp-Source: AGHT+IFBnhWDo7DC94Q7CmPgwGQb9h0aZH0dR0+hZIeTuHFprtlkfqWI+d7IeQF3bGxMAdTB9ZJWhg==
X-Received: by 2002:a05:6a20:3943:b0:24a:c995:e145 with SMTP id adf61e73a8af0-2533d225ee3mr2264335637.19.1757143621378;
        Sat, 06 Sep 2025 00:27:01 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b5d95709fsm10233653a91.10.2025.09.06.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 00:27:00 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2] lib: utils: fdt_helper: simplify fdt_parse_isa_extensions() helper
Date: Sat,  6 Sep 2025 15:26:56 +0800
Message-ID: <20250906072656.5525-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_002702_839526_165B1634 
X-CRM114-Status: GOOD (  14.01  )
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

The fdt_isa_bitmap was previously used as a temporary array
to store ISA extensions when parsing device-tree.
To reduce scratch space consumption, set the ISA bitmap
directly in hfeature->extensions, allows us to remove the
fdt_parse_isa_all_harts() as fdt_parse_isa_extensions() can
now handle the task directly.

This change makes the helper function more versatile, even
before scratch space is initialized.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi_utils/fdt/fdt_helper.h |  3 +-
 lib/utils/fdt/fdt_helper.c         | 48 ++++--------------------------
 platform/generic/platform.c        |  2 +-
 3 files changed, 7 insertions(+), 46 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 04c850cc..24ad1a94 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -54,8 +54,7 @@ int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long  *c
 
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
-int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
-			     unsigned long *extensions);
+int fdt_parse_isa_extensions(const void *fdt, unsigned long *hart_exts);
 
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 0f4859c1..252dd459 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -324,8 +324,6 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
 
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
-static unsigned long fdt_isa_bitmap_offset;
-
 static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
 {
 	size_t i, j, isa_len;
@@ -405,15 +403,13 @@ static void fdt_parse_isa_extensions_one_hart(const char *isa,
 	}
 }
 
-static int fdt_parse_isa_all_harts(const void *fdt)
+int fdt_parse_isa_extensions(const void *fdt, unsigned long *hart_exts)
 {
 	u32 hartid;
 	const fdt32_t *val;
-	unsigned long *hart_exts;
-	struct sbi_scratch *scratch;
 	int err, cpu_offset, cpus_offset, len;
 
-	if (!fdt || !fdt_isa_bitmap_offset)
+	if (!fdt || !hart_exts)
 		return SBI_EINVAL;
 
 	cpus_offset = fdt_path_offset(fdt, "/cpus");
@@ -425,15 +421,11 @@ static int fdt_parse_isa_all_harts(const void *fdt)
 		if (err)
 			continue;
 
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
+		if (hartid != current_hartid())
 			continue;
 
-		scratch = sbi_hartid_to_scratch(hartid);
-		if (!scratch)
-			return SBI_ENOENT;
-
-		hart_exts = sbi_scratch_offset_ptr(scratch,
-						   fdt_isa_bitmap_offset);
+		if (!fdt_node_is_enabled(fdt, cpu_offset))
+			continue;
 
 		val = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
 		if (val && len > 0) {
@@ -454,36 +446,6 @@ static int fdt_parse_isa_all_harts(const void *fdt)
 	return 0;
 }
 
-int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
-			unsigned long *extensions)
-{
-	int rc, i;
-	unsigned long *hart_exts;
-	struct sbi_scratch *scratch;
-
-	if (!fdt_isa_bitmap_offset) {
-		fdt_isa_bitmap_offset = sbi_scratch_alloc_offset(
-					sizeof(*hart_exts) *
-					BITS_TO_LONGS(SBI_HART_EXT_MAX));
-		if (!fdt_isa_bitmap_offset)
-			return SBI_ENOMEM;
-
-		rc = fdt_parse_isa_all_harts(fdt);
-		if (rc)
-			return rc;
-	}
-
-	scratch = sbi_hartid_to_scratch(hartid);
-	if (!scratch)
-		return SBI_ENOENT;
-
-	hart_exts = sbi_scratch_offset_ptr(scratch, fdt_isa_bitmap_offset);
-
-	for (i = 0; i < BITS_TO_LONGS(SBI_HART_EXT_MAX); i++)
-		extensions[i] |= hart_exts[i];
-	return 0;
-}
-
 static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 47e771ad..2e8c6051 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -251,7 +251,7 @@ int generic_final_init(bool cold_boot)
 int generic_extensions_init(struct sbi_hart_features *hfeatures)
 {
 	/* Parse the ISA string from FDT and enable the listed extensions */
-	return fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
+	return fdt_parse_isa_extensions(fdt_get_address(),
 					hfeatures->extensions);
 }
 
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
