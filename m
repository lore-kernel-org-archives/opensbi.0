Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DEDCC6B2A
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 11:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAA7ZMFhT5e49hXG2GQAGUQuF+xWYzqBe2HobGuWdxg=; b=tGFcNgNwz5oN4C
	9BHkW+Xv09is6i1CvnI7b7X9Isy4hgMCwu/BV69/SMGf0JfoJhNZI1u8pP7HQomP3r6zcBbcbHa75
	hdqdPzu+6kQu0okcePxKSUSpBv23PfEe1BJaNVWhw5/h4Q6YNKwV1ahIjj3TlkHmHPSNpSt9lQ4mP
	pSTXq6nRCkKCmyKIHpAFQrTmLKNvRmkZksazcLtMN7vTIdc75yh4LaCFS3DKZaqg6wUdsrnglbGVo
	K6/nY3Muikwy6IBW4RhA6pERQnoo4lu1F0sG1b6Vp9Dm3b5sV7GTm7mykqxNzqJ5pYWvGRhheWpHX
	GAgev+7ixc1VInYkDVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCT-0000000FLT4-3q1y;
	Wed, 14 Oct 2026 11:31:13 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCR-0000000FLPh-2OxH
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 11:31:12 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-14394530ec6so2864701c88.1
        for <opensbi@lists.infradead.org>; Wed, 14 Oct 2026 04:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791977471; x=1792582271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W4L3Oyb2Q1dpR43H6zZjdqdelr8iPhbznjsToRE8sU=;
        b=KpN64qJd7l9KPGznsKXwUNbTGVX5eCZ4E+j3DclkYc4zuPb/znUlaJc0fCvsOZ4GKU
         5L/1LdDPPSQPGmDKQNgzQ0R1vV94NSsvk4sJLIcebJB/9asCw1SGYkL5gYRtBx1E185B
         L8WbAP8JSLXEdkGTthjbIp/A8TsLjAMZOdoPAqy7xvHILpyLgYhOGbj924RXQncjn6R3
         Hqo9Cz85CPY54lWCd1TO/5B+jMw2AHAB8blzC3EXRc7qVng90QH/BtUSOVrBZ1lER+1/
         XdyGds6o5y8aLebLj8i6bWdCZsYD7TrHZQfm3B8x7aLrgsQYJ9AXgJhn53wiJ1Rq0egA
         /N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977471; x=1792582271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W4L3Oyb2Q1dpR43H6zZjdqdelr8iPhbznjsToRE8sU=;
        b=AuDunQyNqTWyEVVdbt6/IucJgUn6uNhOglq3eXfy1VuRYkp2Haxi7HglLzwq7FY2fG
         4zv0FgP0aXrBDRhkxr+N5UfVzJ5WoROdFxIvwbFOEoxsvcjkomnc3un0JawjMo/zyudq
         2lYNX7t32L1GV1iIBLXM1xsQFqICOzc5DrQS3tWca69oYLUOeMaveQ1808UAx0VguUKL
         UnWk2Uh3YZjzKwrK2CFPST8266mM1++cFBpAX8NgW2O6pxXkWLZYcxo3eEMlnH0Ee/8P
         tb8immdBm3nN5yFC+6zixsb0+XemXnYJJl7DyPpwk+b2XkGGIrrUIMHudeRU133MWsAd
         nE2g==
X-Gm-Message-State: AFq9FYJTUlOdSmXpZEH7Nisqyq+UiXwMaQHxqina3TbXM/Rt7M71CSXc
	mHMp070LfBxNOq+qRfXCijKdlwWPJ1ie7DFGVR10lNcSVvjw5Y0s209BCHMRQ2JpwyiAU5EFr5b
	6pRSuV2p83p/p0xJY1thwaJFvaeOvkkGbeN5VWSB6oZvSonXtG7d5G2srnKGa75NR3HR02vrZNO
	WoHr1MsIlu8ApFvvBukGXTCloyDn+JcLth1QFaOdrpaq+l+EmPqapoVhE=
X-Gm-Gg: AYBFou2sMKbEdFQgIpQib6Qsg2oMnzCJE6pTQ+K3rrxG0Qb4LxDZ4RqrzkBiDETEMuT
	QKeTgJbI6hpGE+hboi8Ug2h3UELwPArt5L3rrS3LqUoZ7QWBxBB9TNDamcVB6I0hzRn2HF5Tpf2
	hLDcQAtjRDHJ51Ji17qVK0a2p0oy7QSkWYCVd6yixpSW4EQVH5lKN3GdadObxiiEQDqn2s/JFUS
	byo5Te4M3SiBFXopKrrdX9MUZcJzleGnKwBKDZMTBOYOR++GD+9gD9KP1ki6u9B8yxICx6CsuYd
	/m/teGzXTCTw7q0Kcoeqs5MN+mhyO0lX5S3PI0nJ2DjSVbHNk9hogsuIUY3bQIS+/WbfCjP1LFd
	LAfYRI2HwMsiJwqeMA0H4I+QkSgQS/6YydN8rpkXIzGhAo8ca+iDnxUEkoo7JR3FKXv+hF2AQ+f
	pve1lJ/i90r6HHIl0GaZhjg2ZI5C8f0R8/4hjNw0ON3pYQZFUNlpQG9CxlK+XpHMt9YEA35+MWr
	dpkpTzBAoZvqzJTli7e
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr29066323c88.24.1791977470185;
        Wed, 14 Oct 2026 04:31:10 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm71207996c88.18.2026.10.14.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:31:09 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 7/7] lib: utils: Use fdt_cpu_get_timebase_frequency()
Date: Wed, 14 Oct 2026 04:30:24 -0700
Message-ID: <20261014113100.2192229-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014113100.2192229-1-samuel.holland@sifive.com>
References: <20261014113100.2192229-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_043111_721111_E8A542F3 
X-CRM114-Status: GOOD (  14.57  )
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

Since fdt_cpu_init() already extracted /cpus/timebase-frequency from the
DT, use the cached value instead of parsing the DT again.

The logic should otherwise be equivalent.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Also update platform/generic/openhwgroup/ariane.c

 include/sbi_utils/fdt/fdt_helper.h       |  2 --
 lib/utils/fdt/fdt_helper.c               | 21 ---------------------
 lib/utils/timer/fdt_timer_mtimer.c       |  7 ++++---
 lib/utils/timer/fdt_timer_plmt.c         |  8 +++++---
 platform/generic/openhwgroup/ariane.c    |  7 ++++---
 platform/generic/openhwgroup/openpiton.c |  7 ++++---
 6 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 263e07c7..d66c5fe9 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -49,8 +49,6 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
 
 int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long  *cbom_block_size);
 
-int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
-
 int fdt_parse_isa_extensions_all_harts(const void *fdt);
 
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 9dc1c863..545b8804 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -294,27 +294,6 @@ int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long *cb
 	return 0;
 }
 
-int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
-{
-	const fdt32_t *val;
-	int len, cpus_offset;
-
-	if (!fdt || !freq)
-		return SBI_EINVAL;
-
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return cpus_offset;
-
-	val = fdt_getprop(fdt, cpus_offset, "timebase-frequency", &len);
-	if (len > 0 && val)
-		*freq = fdt32_to_cpu(*val);
-	else
-		return SBI_ENOENT;
-
-	return 0;
-}
-
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
 static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index d5520fad..97b1ed1f 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_list.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/timer/fdt_timer.h>
 #include <sbi_utils/timer/aclint_mtimer.h>
@@ -56,10 +57,10 @@ static int timer_mtimer_cold_init(const void *fdt, int nodeoff,
 	mt->has_64bit_mmio = true;
 	mt->has_shared_mtime = false;
 
-	rc = fdt_parse_timebase_frequency(fdt, &mt->mtime_freq);
-	if (rc) {
+	mt->mtime_freq = fdt_cpu_get_timebase_frequency();
+	if (!mt->mtime_freq) {
 		sbi_free(mtn);
-		return rc;
+		return SBI_ENOENT;
 	}
 
 	if (is_clint) { /* SiFive CLINT */
diff --git a/lib/utils/timer/fdt_timer_plmt.c b/lib/utils/timer/fdt_timer_plmt.c
index 1e146689..23ca8f3d 100644
--- a/lib/utils/timer/fdt_timer_plmt.c
+++ b/lib/utils/timer/fdt_timer_plmt.c
@@ -7,6 +7,8 @@
  *   Yu Chien Peter Lin <peterlin@andestech.com>
  */
 
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/timer/fdt_timer.h>
 #include <sbi_utils/timer/andes_plmt.h>
@@ -27,9 +29,9 @@ static int fdt_plmt_cold_timer_init(const void *fdt, int nodeoff,
 	plmt.time_val = (u64 *)plmt_base;
 	plmt.time_cmp = (u64 *)(plmt_base + 0x8);
 
-	rc = fdt_parse_timebase_frequency(fdt, &plmt.timer_freq);
-	if (rc)
-		return rc;
+	plmt.timer_freq = fdt_cpu_get_timebase_frequency();
+	if (!plmt.timer_freq)
+		return SBI_ENOENT;
 
 	rc = plmt_cold_timer_init(&plmt);
 	if (rc)
diff --git a/platform/generic/openhwgroup/ariane.c b/platform/generic/openhwgroup/ariane.c
index ce2f5512..6da4a171 100644
--- a/platform/generic/openhwgroup/ariane.c
+++ b/platform/generic/openhwgroup/ariane.c
@@ -5,6 +5,7 @@
  */
 
 #include <platform_override.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
@@ -61,8 +62,8 @@ static int ariane_early_init(bool cold_boot)
 {
 	const void *fdt;
 	struct plic_data plic_data = plic;
-	unsigned long aclint_freq;
 	uint64_t clint_addr;
+	u32 aclint_freq;
 	int rc;
 
 	if (!cold_boot)
@@ -74,8 +75,8 @@ static int ariane_early_init(bool cold_boot)
 
 	fdt = fdt_get_address();
 
-	rc = fdt_parse_timebase_frequency(fdt, &aclint_freq);
-	if (!rc)
+	aclint_freq = fdt_cpu_get_timebase_frequency();
+	if (aclint_freq)
 		mtimer.mtime_freq = aclint_freq;
 
 	rc = fdt_parse_compat_addr(fdt, &clint_addr, "riscv,clint0");
diff --git a/platform/generic/openhwgroup/openpiton.c b/platform/generic/openhwgroup/openpiton.c
index 1d098da7..21bdb076 100644
--- a/platform/generic/openhwgroup/openpiton.c
+++ b/platform/generic/openhwgroup/openpiton.c
@@ -4,6 +4,7 @@
  */
 
 #include <platform_override.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
@@ -62,8 +63,8 @@ static int openpiton_early_init(bool cold_boot)
 {
 	const void *fdt;
 	struct plic_data plic_data = plic;
-	unsigned long aclint_freq;
 	uint64_t clint_addr;
+	u32 aclint_freq;
 	int rc;
 
 	if (!cold_boot)
@@ -78,8 +79,8 @@ static int openpiton_early_init(bool cold_boot)
 	if (!rc)
 		plic = plic_data;
 
-	rc = fdt_parse_timebase_frequency(fdt, &aclint_freq);
-	if (!rc)
+	aclint_freq = fdt_cpu_get_timebase_frequency();
+	if (aclint_freq)
 		mtimer.mtime_freq = aclint_freq;
 
 	rc = fdt_parse_compat_addr(fdt, &clint_addr, "riscv,clint0");
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
