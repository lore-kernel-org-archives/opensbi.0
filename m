Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC489D111A8
	for <opensbi@archiver.kernel.org>; Sun, 30 Nov 2025 11:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyvJMcMvQbI3ysiQMcfwfEFihDLn5nqRKrM/BzVYdFk=; b=TmRdF+Q5of38Uf
	kXyhVEZMiQpEkymicJiW1mG/METgaFA/94RpzUOjmqF7WtpZqgNH3923Jtk9nCcJNk528XsLoxl42
	LK0Z6p04uDnrdhfdeozOKCBQDA1kwZ9ZKEYj8b2HIOWu5ZnkeoK6ToorQ7GdDLp1pCJYG7tX/YoPy
	DwVL7rbhPdyicU3WRVHpSyRVvZDQXiR7uZjsfN/zMBDw5BX8Fy0IW1xsaqfF893i5QSNAY+qYscGA
	lJpaXyI4hBELKL7+mKEM1NUrmt3cSIpQO1dAaVSV0yScgF/tKHDTGW/tQFtyGCrkWXUOpjcI4fWZk
	q95lYdYuAALOn7GL8fvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQO-00000002FCu-0n5t;
	Sun, 30 Nov 2025 11:17:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQL-00000002FAz-1ACS
	for opensbi@lists.infradead.org;
	Sun, 30 Nov 2025 11:17:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso1930087b3a.0
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 03:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764501420; x=1765106220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hb7DazZJJNtRdWS53fRH8dKxkXF7Kg+wmNs9TAAIv+s=;
        b=FcmLLvQB2V+aoEj08EcgoEYQKnn+mJsKPIvaxee5KPvbe8xVpMHUA4TtzDE6ZkfB45
         dy7n7bL2SoQm+Lj4dgMCrUKWqDjzLMUEzx/OCThiGYQ9SoDe8tgY+hPdMYKpHBop73cp
         3QHzbm786IBwOv5we0xtDfOHHsIJ2MlIUXTzJIvDwtYcQ0PumEMgw39rubKWRTFuqoOr
         FbcfnwiKSKTzPpnzqKxQlRpvGgpsoTauAyH01aZ3UQxUD5NSoI3Y7OyX9ll3IF7dD3js
         K5AKaqKtUcGw/uged1DlzBooIB6/LMrGbsO6t9Yz6J/zax6Pv7ClQZBZt9l1VutbSBCJ
         yZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764501420; x=1765106220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hb7DazZJJNtRdWS53fRH8dKxkXF7Kg+wmNs9TAAIv+s=;
        b=IqIBKP/5iEHwrPW0moOQ7WgWmy715rcyKwY9slKkPL6RO2Ls7BZy4fARwWIBasH70Z
         psswoFMCzPwZaHamwdSKsDGVz9lWX0+/TG0vBKq1a477eMbChV0LelDMRTrh5fb7wJVH
         5tw7iv1F8lf6SKLv+x2TlDr26+tK16lPlG7BTKqOT7fb+XhkIHIdHyJH8VS13p6KNHuh
         nHjC9+zfVsAW/ZVnVSEySuR3OS7xId40z4i81kzVqzgeV7KVfnEOc3a/joTt21drQwxc
         PoeqRuzTWa0AlRhfRe+CPO/cGRHWt9YHevHz+ON8DBQYGFBwr0ByomAzq9AFjMzq7/HO
         1Imw==
X-Gm-Message-State: AOJu0YxtEEmXBzFSolZ535MrwDJjdZxpG30jZLdCHJ483Clca3NKWjvm
	hyiAJ4gbJwrvjM0ebYaGNR+5lDLhmg6F3z08tK1oStgROuSOoY7kB64O9GbsAd3vb4S1PUTJsk3
	fEtG2cffJKbcnahOryT85F3sajKJtrhUmF17ddOPLoV3ld2AYKA3wDzg/VKv8WTMjRCeIz/BZ9d
	VYGsKHakfQK2U08YxpFa3bjJFvfcM/icj9v2frl4MnECQLRhG1
X-Gm-Gg: ASbGnctD9Q05/P5eSzCERiKTF68jQUMdZxOp3MRLm2v3OmXjlvnqLsf77tSjcUcXwjo
	JsaOZ3BurSjofRz8ne5S3b0hfh6iTq+6Lsi8QKBpbFoON3c7/7oot4u55ga6zPfBu2vmjPw39SL
	HqksH2uq+ZQ7tsi8IHRj9om5apS1bojukcvp5t38NV8omXUOmYqZo6YzFTcmlEjCh/bWaS8HzGe
	eqFUTUKOKPE/T8BO1HToxAnsUGp+207G9dPKfSVaGcCTy1mX+heiQGvqY7QJLAP3l97EMusALG+
	asJIjCONxGyIzE3LpKhiCGtel2A/x0udyyUWimOxImicv0DtQmPtLDdO1Yz/tVYIxP66kPgyoIu
	hj4Gt0bQg7tEAXKTkgERiaG6DJovdSrI8dmFw9e59jq4SkbqpYTjmGazXFp+VDaCJueemWwECFM
	HufF5f/H8/viGH+L9Gve4qIeHYgY9Z9c/cuNnWiljEQk5f9A==
X-Google-Smtp-Source: AGHT+IE91XdJ1r+dEjHmmOtgwDakDhz7TTvPAuxg4IuXo3VzPRMVysJuh00t7wGnB8bJo0GzurBRkQ==
X-Received: by 2002:a05:6a00:1f0c:b0:783:44b9:cbc9 with SMTP id d2e1a72fcca58-7c41fbaf3b7mr39041477b3a.9.1764501420235;
        Sun, 30 Nov 2025 03:17:00 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1819277c5sm10027050b3a.4.2025.11.30.03.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 03:16:59 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 6/6] [TEMP] demonstrate hole protection using reserved PMP
Date: Sun, 30 Nov 2025 19:16:43 +0800
Message-ID: <20251130111643.1291462-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251130111643.1291462-1-peter.lin@sifive.com>
References: <20251130111643.1291462-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_031701_368498_1A2F5020 
X-CRM114-Status: GOOD (  13.01  )
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

This implementation shows how platforms can use the reserved PMP
allocator to protect critical memory regions during early boot.

Benefits of using reserved PMPs:
1) Reserved PMPs are not managed by domains - platforms have full control
   over them. Since reserved entries won't be freed, they can safely set
   lock bits (pmpcfg.L), unlike domain entries which must allow being
   temporarily revoked during context switches.
2) One can allocate 2 consecutive entries to create ToR mode regions to
   save PMP usage
3) The reserved PMPs have higher priority so their permissions are less
   likely to be overwritten by other entries

Note: This is a demonstration patch and should not be merged.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 platform/generic/sifive/fu540.c | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/platform/generic/sifive/fu540.c b/platform/generic/sifive/fu540.c
index 83e57145..3f0fd032 100644
--- a/platform/generic/sifive/fu540.c
+++ b/platform/generic/sifive/fu540.c
@@ -8,6 +8,10 @@
  */
 
 #include <platform_override.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_types.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 
@@ -20,9 +24,61 @@ static u64 sifive_fu540_tlbr_flush_limit(void)
 	return 0;
 }
 
+static u32 sifive_fu540_get_reserved_pmp_count(void)
+{
+	/*
+	 * Reserve an entry for demonstrating hole protection
+	 * on SiFive FU540.
+	 */
+	return 1;
+}
+
+// This is a demonstration of PMP-based memory protection rather
+// than protecting an actual memory hole.
+static int sifive_fu540_hole_protection(void)
+{
+	int rc;
+	unsigned int pmp_id;
+
+	rc = reserved_pmp_alloc(&pmp_id);
+	if (rc)
+		return rc;
+
+	/*
+	 * Protect the memory hole at 0x0 - 0x1000 by setting
+	 * it as inaccessible (no R/W/X) with the lock bit set.
+	 * This prevents any access to this region in all modes.
+	 */
+	rc = pmp_set(pmp_id, PMP_L, 0x0, 12);
+	if (rc) {
+		reserved_pmp_free(pmp_id);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int sifive_fu540_early_init(bool cold_boot)
+{
+	int rc;
+
+	/* Set up memory hole protection */
+	rc = sifive_fu540_hole_protection();
+	if (rc)
+		return rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
 static int sifive_fu540_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	generic_platform_ops.get_tlbr_flush_limit = sifive_fu540_tlbr_flush_limit;
+	generic_platform_ops.get_reserved_pmp_count = sifive_fu540_get_reserved_pmp_count;
+	generic_platform_ops.early_init = sifive_fu540_early_init;
 
 	return 0;
 }
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
