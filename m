Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B30CA0EDC
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 02:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rmv720ZU+Qq8eDdniOmJKkBcyrQvDIb9fpCRtBnf7jU=; b=vkZczE07NCOV+0
	oSsPmhUfq+8mKO7QTJgFM7sXvp/Ry9vKgWPP+msfpy6Oa1vbcu3Bf9Cl8bfVUrX0ytaMQS8JbzBt/
	+UimkVEnqJfpGpwwwae6eD16OPIsVSClQ97JbbvQJfjZVhc7gNChxXOtCZLki1/S3aNet+dLY/Azc
	350CbCo6H0DC7rqncp+cydardUcIDqhMV2VSd+c6bQERsx8YezAucRbxccVCCxMDakKgLfbxqPFKL
	OCCJut7zBF0S+ob1SRypvQuRd3xM2ku7jiWo3367ZSgnjLIITxGqnIqAh01mPJjPrmTpCu6ppXnic
	3y6/LriMx6H1yiMPr8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkR5-00000001DR7-1wtv;
	Fri, 15 Aug 2025 02:44:55 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkQq-00000001DOZ-3wbO
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 02:44:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-323266d2d9eso1373080a91.0
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 19:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755225880; x=1755830680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C9U+v+vAaXNyZNAVrpD6hzPettA2oPkzkJkJXG5TIO0=;
        b=KddcjA1a84GUHnCgC0mUxQua2NzXeXJiEFznlx+1kgTtQCWmR8PRwY+lA1sU6sEAZx
         f0sM5mQw/ax3ppuorPXH9ouidVYY7odXbKoQONjjuhELplMld93F7h2EBs6duMCmFIEH
         QUFEqtyj9W2iCENeHrI0oL0fQXUZ8oKuQtpBKglXdWiQlwGECFH9xH5vLqOUkLoUOuDB
         aR3eShk3hTKfu+0nF3f/1Fw0SPS2AVrt9VmFS6kZVHs44+3lc2g4CT1M9aeVCupGICdc
         Jk4RBOsvrI56DvyU0z1DnVSMGZmwwMtOmMuQuGvD1i0mYB5p1SccCRQGyv/xAGccMHqN
         q4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755225880; x=1755830680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9U+v+vAaXNyZNAVrpD6hzPettA2oPkzkJkJXG5TIO0=;
        b=WzCDd9ractnHzC95djVa9yj1QHid0kfY4uLxsTT1hs/YkTQgspI35eNp24FIAzSBmN
         ClblLNny3STw5wT4Vs8sASJUYwjL2gCyq0iRROPFv8WCtUKuxWcNGjVDK38g6u+z7KgF
         THvASl+HzTJBt/eretnUXW27S2DXliwX5XroWnsDiOcMpEBbZUfuuwiC0m8diF4t2tOd
         IPi/v0hkoJmc20uTjBUbjVPzxopY2LVYxpjIdcAmKH2pz/C8FtDPQGFygtiwRu/9DeKn
         vfV042enuFqn+1a2yU+xS4yeVyLgFghobVPLYXHD6KIPNgrtTQSInhgZTSUbcDPBO1UP
         w9DQ==
X-Gm-Message-State: AOJu0Yyz1SRVBD1vlACT99MKljz5liIbXsgxJliRtFiWH2XwCp9sae9w
	DNpP5KRGa7FtZtUVUgemDdRhXKYmEUFPS+MStkctf41UhgzakGxqyDT+wjOb+6esAS617Lq7Sy8
	uz5OwvnAQJtaqDbuybApDrCgClOZ0qqzjBNKhLQV0AGEqs3NzqPwSN5J8OL4zfAdJFxTOM+ugl0
	cb/7Cpsvu2vPbwghxziicXjrA24E/LkMZUMJ3c3OkEfqJ3hY+Bmz3asw==
X-Gm-Gg: ASbGncsJMmuJZ138dbso89QiBVAdUgJiRnDCkFVjuqFwuc6FTp/4t0iJ22VHh3Z0uyp
	DkdV5CDtaTX9ardWUxEUc7aSamCPvBjIWBOmbUeey4awHQebOKCPXDNovTEFgMCgYJS/TKQ/fP2
	wb3c3HDEhrfRL40GZKWR9Ud4AFJyCb/CQWGqId5ctjfYMHjPhwW4LYnIA+7AVsnCGoliVusqNCg
	DHShdFt10y3mQXJr8hURvLVHdOg4QZGqRQ0jWoNzmoYAbgb8eugLEJr41kh3CRM9uKKKLT7riDl
	zqK5uImBNTMPS6KayD5KiJ2YFHcumg2uk/WAcAtAVDeqzPip3mAf/Ka9BFeKcEv4znCq1OGJprI
	lZ+Wnxv1gHdJK7OahLdiLeQaFjZGuu10of0inDzBbPp3Fn3A=
X-Google-Smtp-Source: AGHT+IE7vmEZ0I6qRx3IFQ6v2BS6KyIQL0ptIsW905TKMbZL425tNM3mtz08vqoSZan2rwphyPtWow==
X-Received: by 2002:a17:90a:dfcb:b0:321:9382:b043 with SMTP id 98e67ed59e1d1-32341ff939bmr747963a91.33.1755225879571;
        Thu, 14 Aug 2025 19:44:39 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32330fc3684sm3243384a91.11.2025.08.14.19.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 19:44:39 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH] lib: utils: fdt_helper: simplify fdt_parse_isa_extensions() helper
Date: Fri, 15 Aug 2025 10:44:34 +0800
Message-ID: <20250815024434.14303-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_194440_984528_898018BC 
X-CRM114-Status: GOOD (  13.31  )
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
 lib/utils/fdt/fdt_helper.c         | 45 ++----------------------------
 platform/generic/platform.c        |  2 +-
 3 files changed, 4 insertions(+), 46 deletions(-)

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
index 0f4859c1..61a5962c 100644
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
@@ -428,13 +424,6 @@ static int fdt_parse_isa_all_harts(const void *fdt)
 		if (!fdt_node_is_enabled(fdt, cpu_offset))
 			continue;
 
-		scratch = sbi_hartid_to_scratch(hartid);
-		if (!scratch)
-			return SBI_ENOENT;
-
-		hart_exts = sbi_scratch_offset_ptr(scratch,
-						   fdt_isa_bitmap_offset);
-
 		val = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
 		if (val && len > 0) {
 			fdt_parse_isa_extensions_one_hart((const char *)val,
@@ -454,36 +443,6 @@ static int fdt_parse_isa_all_harts(const void *fdt)
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
