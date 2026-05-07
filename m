Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B844CD37AA
	for <opensbi@archiver.kernel.org>; Thu,  7 May 2026 18:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gnt4gipmwc1UjRMt5tZ8h6XjN9pSjFqcWRBG2borYwg=; b=apEnRotMJ0S7m8
	1xJewzwJaD/gWyJ2nCh0mAiwMqn+izxLc9NzFYndqL/166udufwTCCYkfSebuJx3bq2SjTR6ipZC0
	m1+9/riVQPphSnIkqlXId+5DTBizTpG+RkzE5YZn46fH1KVgPv+DNWYJRDibt3OyegFzs+3AA2hWM
	tsssD42Ik/QUG46IWkN7czEL8ps4faWmaw9Kugrlovdzx0Az9CzJNmCMSogTG/hHmHdh8XVtDdGBQ
	Hxb1iZ818gREdbNMzoZwBGBWkeqED/VAL1vkJuYU9aRN9GqpVDk6GuXyaSRoc1ElFDxzHFIySn9lH
	ah1kcWHR+8j2g/WGXiNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39P-00000004YTN-0aOR;
	Thu, 07 May 2026 18:08:43 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39I-00000004YQH-2FZe
	for opensbi@lists.infradead.org;
	Thu, 07 May 2026 18:08:40 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2bd5658b901so161086eec.3
        for <opensbi@lists.infradead.org>; Thu, 07 May 2026 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1778177316; x=1778782116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXFnyI8gN+uXUw3uT40Mbv2JCFAlWrzkXUMNwcKVCW0=;
        b=SDlGVsQiJ6svp6wQSV/l6PHlpN9/TWvBbh82vptfBItwznqjwBASpzIYmlDZ7hatZn
         q1p2u/+nQdNMtCmalEuCG+mgZpeXJK4B7lM1DklQ/7Bu1jTQwQDIkUx+GYcSyjwWDDGj
         PifKoGhRm5aAyCCbmVtSIQGSonAxTMZC55YgFXfb8zQLmiUwLumO8rFQ8ms9WpOATLC3
         dvP2rONPg1+UL4yOao6vnpVfd7fFbQoGr6O+oE4eMM9aLPGxVuy1ceIIBMku7aNsY0Pg
         YBgOu+yTMwwePNHl79QB7eeHubZOMgSqJf7PVHHpo3oths82BFcjgW5Kcvy11CAlx46R
         p0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177316; x=1778782116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YXFnyI8gN+uXUw3uT40Mbv2JCFAlWrzkXUMNwcKVCW0=;
        b=ewP1GQmy3lfz3ecmq9NKt32rIF5uTjYY0U6gNr2S01k0GV8HEabQd3/bgQq4XCWYR7
         PZMdCOOXsc/jXdZM0Ndg9EkC18F2K2rGyGwMr8HNkGPJDElTxx1+Z9HQCQKrXcG2Jzv7
         /tdN4sGlTHE4YC3CXThtjwT51TnkVxEgiU+JPlUyQEoAnlC+vAsPORE6q6TomD41x+yi
         uxm1nrr+wHkIlN3XDMINpEhiKkc7ioDk23bl3c+XzDIiB445ajTVKAji+lXo3fjgl34F
         VlN8Xmug4QNYHifS5mr/+o20zgJcuC8zact8C6tZ645Au53h74MlR1/G+xLNTAJzBT/u
         XlZQ==
X-Gm-Message-State: AOJu0YxjdpdGpa8un1h2zUI6VPs5L4HZSwRUtbszmyQoadoGc7XONa4O
	99Pbh9jp6c/pcZsvYZs6IZ6cxBUd9k/y0wQknok5pmwgciAZUi6d4xTQ/2OMyGkpOlt6XHTIGdV
	3YAb2
X-Gm-Gg: AeBDiesS3MA6gni0sDorfHIUXHA2BrJf8rafTkhEfWIV+jVmxF8Dp3t2+1WH9wfnwMr
	OVoPqFq7t5YZQ1wwJdGq2Q8w9z9e1EQxydZ3BNZ6fhfqbksjNxb7czlJM9koKcSSJBl5SuTbuAx
	f4m4os4tdlI31N0M4J3oCFaNj4MVh1jTKEJN1AbesJZTZDqHsyNjRLA0wPwqFdt5WTg5d5E6u23
	PIRM/yWTBciJfvw5WB5jkw0gtFacLdBeJWpR4MsLNDcxenxtXmBbSgf924WWR14Swfz8MAYPXFd
	B/LSQ25eD+o2AEYKZ4j9aEEB9QLp8XdQz3vk2okmo2eFTzvFGvmCodhtbXLEIEtiZTfs7fKv+tS
	iYzeXaGEWPzN1kbgJoiIg52iUxJRxi8upG8kOoQgN00Gw3fT+u0vnk7RfySPojh0hMB4s4FzFJ6
	nkIyjFJoSxL90o2qBib1qrbNNPpKenhhDF96r1uPwOQP/yBwvKA7RSBAcVGLXV
X-Received: by 2002:a05:7300:181f:b0:2e5:faa9:ca76 with SMTP id 5a478bee46e88-2f56a089246mr1972299eec.7.1778177315571;
        Thu, 07 May 2026 11:08:35 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82b5636besm78285eec.2.2026.05.07.11.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:08:35 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v3 4/6] lib: sbi: hart: Move device tree features detection before trap-based checks
Date: Thu,  7 May 2026 18:08:05 +0000
Message-ID: <d066935990f12e1f4f21cd709eb20afba618b134.1778176768.git.evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778176768.git.evvoevod@tenstorrent.com>
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_110838_553176_A0CE5534 
X-CRM114-Status: GOOD (  10.48  )
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

Smrnmi detection and enablement in the following commits will happen
before any trap-based mechanism. As it relies on device tree, move
sbi_platform_extensions_init() to the beginning of hart_detect_features().

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 lib/sbi/sbi_hart.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4aefb759..781161e5 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -522,6 +522,16 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	hfeatures->mhpm_mask = 0;
 	hfeatures->priv_version = SBI_HART_PRIV_VER_UNKNOWN;
 
+	/*
+	 * Parse device tree extensions early, before any trap-based checks.
+	 * Needed to detect Smrnmi and install NMI handlers before CSR probes
+	 * that may trigger traps.
+	 */
+	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
+					  hfeatures);
+	if (rc)
+		return rc;
+
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, &trap);			  \
 	if (!trap.cause) {						  \
@@ -676,12 +686,6 @@ __pmp_skip:
 
 #undef __check_csr_existence
 
-	/* Let platform populate extensions */
-	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
-					  hfeatures);
-	if (rc)
-		return rc;
-
 	/* Zicntr should only be detected using traps */
 	__sbi_hart_update_extension(hfeatures, SBI_HART_EXT_ZICNTR,
 			    sbi_hart_has_csr(scratch, SBI_HART_CSR_CYCLE) &&
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
