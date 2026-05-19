Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBA2CD4F54
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 22:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BdmkyRuT6aqvkB4KoxEbRrVpF/8Td/0AIiKDkj9BD+c=; b=K8c1gqKU3wpxQD
	q/PD2SM3wqB5xnxj+qDZvVSJmcVL+OLefqVlqYlyCfWM3D7X0BgqC7MVU0opi/GA+VFBt6X31Zg1z
	B3V1IeK9HuECcSHZzeB7dnBZCW7sPKr9v6ocP6wMIM6ET5EAnvAr9/s7IGrPxXGC2TTQw0l/iHzVt
	DHkjRrR1eoXxeuqFFlNuaazfoiMHINjqe2G2x+7GpCxvsvBSILJZJDnteWh4Z9V5zP18ZjRsdcbSB
	sHNW0AQ5id+JECf6KpC1vWySIKll7Hl/ZL8JdD80PNqXI20SZRxLPmzIauQvqVANoPgMto3Ky2HU2
	kGLbQsDBFsGIevXGmgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPTGt-000000030UI-20xv;
	Tue, 19 May 2026 22:50:43 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPTGr-000000030Tg-2101
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 22:50:42 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2f0f13b7c1eso214842eec.0
        for <opensbi@lists.infradead.org>; Tue, 19 May 2026 15:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779231040; x=1779835840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLyP9BSwTWR84mL73zzr3lhGyJ1+4/8SVmAYjJkKGek=;
        b=LUERKuGm1iNIDT/8MVqzwNg04JL83qgkKhXoiPaFryfYfpHE0jpkaiCNEBLungd32K
         LlSeljWaefsLwLMkmV4qGXpbnvoSVUP/dnbcsc2zVzFgnVbmni/w65nIyBpgCJ7/AGdX
         DF357TnaG6tCgDa330MnYtjCgwY6d23yLAYNFJ+VAit/QA6SGErXuGfL5rAo4FHIYA0D
         QE1d8wyEDgwL1MSINDyFPBYf6yC7O44L9+JUBl+81KjVpjlxhzzpRyD3IKYN5Bai/7sf
         jv3e2+NgyxjBHMSBP6hyglEyWM7ALVoxd0mp1N2Vsif0lIPdteLN94sg5E5oho7Al0bs
         YJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779231040; x=1779835840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLyP9BSwTWR84mL73zzr3lhGyJ1+4/8SVmAYjJkKGek=;
        b=i952cPJJsXeA+1PQ4BXYUrWJsufDC9a5LjLRbVoOnx9SToD/NjVzTiUTYMThjwclOf
         sAOvB0nEMDHf4kQHTpBI7MG2Ne3PQLPOBTIPBGIORvk3tTPmb3oCLicfJk+2Usd5SYaf
         QwZJqvaGIWcPAUntTmOzAB5HdyqXVhD/SFAZAm9fjOtK39f1NhSE1MYRHGMazfafw+Tz
         qgu1SpVFcKItVpmXqWfODRZTwk1+uwYhLB3Vh9dUlNh+BLdrD4cMV73sEcg2Mi6hEdzQ
         KBBFUfQ9de5o/Vk96AssDhzpyGbV1HrmXBKdwT477BRopu3Ne6qwbrPLAwvupTc55s2b
         0QLg==
X-Gm-Message-State: AOJu0Yyr5a2FX5f64P4mX8ZuycXitaL+Ehp3ajEDk0YIbiBGlcQCPz7l
	pwgspNaqmOC8nZpvHmx0JKo8AyyCwSXxNletPZtlQ9WHwtZTCWLZTA5/t8ldxwsObQ5WEForEEY
	8HStR
X-Gm-Gg: Acq92OFH06zOrRcFFTKhJCFEppGCZv5C+cORykMVZgMgmau1gbyHxfAe/82eQFMjFBc
	wkSjY7b1zezKywb97D6s/mtIWTmvD4d4m2ZZQaRxFezuVdH4rfkVgd5GtWp5erost5T8PR/Oky+
	J77ijAvyvVFvvDsMnqupHG/J23eygC5SwuoWhJo3gSpJnr+ZF4+XltOBONylpy1Azf0H3SBxFav
	RXsHNB1Jg2UlqfiIQBBN29dXV75T1VWd7Uxp9uuvSp2afUqHFw+nEJ2uzVX+OKT49h8WSwpfiOe
	/PxxO+OK+3TO/ScHehEb4vPEC9hQ9QIg60GzKW4jhPBlU5WFfYRR7wNipDZIuu/DwJ4bqjfkv3v
	ACkE1axeoBo1t6kQ2wBOR65wg+o1A4a1HArIa5S1Z2hTADmKaZRg/SfGXBuV26V+/BCwk63mxD5
	hl1P68lmde5/pYArTREhkafDJ41pP85YzaVGZKN7bmANAZmVH7gcN8pR0Z9Xd2rw==
X-Received: by 2002:a05:7301:290b:b0:2f3:3835:2005 with SMTP id 5a478bee46e88-3039870695fmr4760594eec.6.1779231040228;
        Tue, 19 May 2026 15:50:40 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500a97sm20109448eec.9.2026.05.19.15.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:50:39 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@tenstorrent.com
Subject: [PATCH] lib: sbi: Apply budget restriction when polling Zkr CSR state transition
Date: Tue, 19 May 2026 22:50:14 +0000
Message-ID: <20260519225014.244672-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_155041_522739_BB76A66B 
X-CRM114-Status: GOOD (  12.98  )
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

Zkr architecture doesn't define a time limit on state transitions
which results in hanging on unresponsive or event-driven platforms.
To prevent this, we need to limit polling iterations and fall back
in case the budget is over, and stack guard keeps its initial value.
The budget is configurable with CONFIG_SBI_INIT_ZKR_POLL_BUDGET,
defaulting to 1000 iterations.
Successful reads do not consume a try.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 lib/sbi/Kconfig    | 12 ++++++++++++
 lib/sbi/sbi_init.c | 12 +++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index c6cc04bc..a11f788c 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -6,6 +6,18 @@ config CONSOLE_EARLY_BUFFER_SIZE
 	int "Early console buffer size (bytes)"
 	default 256
 
+config SBI_INIT_ZKR_POLL_BUDGET
+	int "Zkr seed polling budget (iterations)"
+	default 1000
+	help
+	  Maximum number of iterations to poll CSR_SEED when initializing
+	  the stack guard variable. The Zkr specification doesn't define
+	  a time limit on transitioning to ES16 between polls, which
+	  makes it impossible to tell whether entropy is being
+	  accumulated slowly or the entropy source is not functioning.
+	  This also limits the wait time on systems with an event-driven
+	  entropy source. A successful read doesn't consume a try.
+
 config SBI_ECALL_TIME
 	bool "Timer extension"
 	default y
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index b248e73f..7a0c4f74 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -280,20 +280,26 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZKR)) {
 		unsigned long guard_val = 0;
 		int chunks = sizeof(unsigned long) / sizeof(uint16_t);
-		bool res = true;
+		unsigned int tries = CONFIG_SBI_INIT_ZKR_POLL_BUDGET;
+		bool res = false;
 
-		while (chunks) {
+		while (chunks && tries) {
 			unsigned long seed = csr_swap(CSR_SEED, 0);
 			unsigned long opst = seed & SEED_OPTS_MASK;
+			res = false;
 
 			if (opst == SEED_OPTS_DEAD) {
-				res = false;
 				break;
 			}
 			if (opst == SEED_OPTS_ES16) {
 				guard_val = (guard_val << 16) | (seed & SEED_ENTROPY_MASK);
 				chunks--;
+				res = true;
+				/* Successful read doesn't consume a try */
+				tries++;
 			}
+
+			tries--;
 			continue;
 		}
 		if (res)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
