Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3CAFD4F1B
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 18:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHdE9SXjoZU1QcbnyoWiVTLMONaFW6j/7PHQ80lDJOs=; b=f7sOeBeoqsb4xq
	XmUvbzECn2y3T/s6f9Wus5pO+2GNfT5tNt97rKc/5s6sE4A1VFOLZlZsFWPNFGFy0Z1ZXHt2jIxun
	PNPxCA/iKBMbR7LroOqgojGB3/5qb1oj7W3hPtQ5WVj7kwGRvuLPdqHr0Lq3g7FdfuVKZwjAwBnYV
	8e/awP+WhucFQ9Ihdi/t1+IXqe5yHfARMgGSpvmZZL2HMpWAMF36sOyLM5rBqMM0eI685XB5m7VqI
	KO+AvnLjxEGYQwAEOFtjUn/Q4JLIzQ7EmldNkWNEVVk2utgCr+lDPUdzeZvhH+smFRzGF9vfBVxnT
	HUelj/riCia7HZLUC3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tc-0000000A5AE-37g5;
	Tue, 10 Mar 2026 18:33:32 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01ta-0000000A57X-1Ike
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 18:33:31 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2be22d699c9so531968eec.0
        for <opensbi@lists.infradead.org>; Tue, 10 Mar 2026 11:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1773167609; x=1773772409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOqow1oY6AuxmN0QdYzUBQsS/Z8XsiMTOWecadZnvac=;
        b=ZvthuVDXYEh1vtoUvKeQ6CLFxuIz/kEBsMun6AQokXI76B4Heup7wsd1ZlfSFWwv9o
         Ddi1zA4gSjVANaF60BWuXqIXpqgSxvRn8V1sykcZRFXZ5CrqXbZlnnkku4x9+d6BgDA/
         VlGns00Tox3zbEaqezuS+mNRKRBcS87Wspb61/USj4xJ+vz9ctwt+n4hTEquEFyOGFVE
         LXBgiAhZ6y07j/uV1i/5JJkxuQNGFKLuQ1XxoZOAePHD6GX9GY8U1a33SjpohPqbPGWj
         dlig/RsGgHRYYdiek3rPdpLlGn15N7/jHcGJHMevjrFoAgjX/a1q5NssazioKgvAbZhk
         smRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167609; x=1773772409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fOqow1oY6AuxmN0QdYzUBQsS/Z8XsiMTOWecadZnvac=;
        b=jdT6FComlcymtPpfBs0C0UVm/Wq5S/P56+aMqXxmCvDSNk1wU/kqC+WwLV3+JXM5gs
         Fw/lXE1MyAIjxGtAs1tQFm2IPeGhZm5CRgk2V8fAqZpQNhfPgt+PkOEasBSQG8bd1VSF
         xPeFG6JP5H2JFGWZD7/PAjrleu7f4zvGSqUyx2/vsP5/pINFGM2ChUd2d7u150wWKvve
         bSXPmH4PDJsCLvJUtxAVsd/VUTgd9tdKmrDksuDS3LBvvTrFjF21BbDLP91VYmoQPE8q
         VVrfGKB/fBI1YPzZcpviapW87qyLDe3SnvLTV1moe8WWeWsd0n2TpaENf1bTsQxb7Px8
         RngQ==
X-Gm-Message-State: AOJu0Yydx03lt4uOcBZIn0UPP6YR1BhujgbWCLnWdanxZa8gaXE1veTg
	Z4vAgXFzwq6yqpCBxRVcwL4xecv9s2I61rJRvEDBcUK7DngkalQ+C4wVGM+K4hXHGFK8fpudu9M
	ExnEAWrY=
X-Gm-Gg: ATEYQzyj1sB8t4vfaOk4rldxIh0/3Q1HlQxc12TUdyVx7AmAevAQvaJr2XRIyE6ZqIc
	kQvz6J8MnrqB4FGededirQe7pzcssku1xJp/4eJiIybDyD9tRGjM287GdrpKWjFDKVa7jIM2CRS
	2/R1r8DjFRZmo67I8hX3Byo7WiYDCp1k19MSzIKxlU9aoGiIgtm5s+hJdoa4u6bAUr3zV04Pfxc
	gFY21+5gnAtSWzJW5bCFkg9RybmURjt3CmHncL/3BvmTc8ENKDk99YYpb7/4+htjTQlF2IhY1Il
	oP2MBUwE2i4EWnePPTqIFBl2wr+QP1SJVmxu+G5JGSNatnWhzXQQTw+tsfCgZ5xCAi02BXNOA7u
	almEx3Dwbq3zPIWjm13rKpvJrqDsTOOZrs73B7eF5dwPJT+FoRIElnrMPrKIRzB6TacVLOTe0A9
	GWKtyO3q9eD4CEN280m4Yd12w9Ttw=
X-Received: by 2002:a05:7301:1014:b0:2ba:7d5a:a816 with SMTP id 5a478bee46e88-2be4e02888cmr3394247eec.4.1773167608999;
        Tue, 10 Mar 2026 11:33:28 -0700 (PDT)
Received: from localhost ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96f25bsm13947062eec.28.2026.03.10.11.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:33:28 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Google-Original-From: Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@oss.tenstorrent.com,
	Evgeny Voevodin <evvoevod@tenstorrent.com>
Subject: [PATCH 5/7] lib: sbi: hart: Detect and enable Smrnmi before trap-based feature detection
Date: Tue, 10 Mar 2026 18:31:53 +0000
Message-ID: <20260310183155.2186463-6-evvoevod@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113330_353047_51C29560 
X-CRM114-Status: GOOD (  13.51  )
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

From: Evgeny Voevodin <evvoevod@tenstorrent.com>

Move platform extension detection to the beginning of hart_detect_features()
and enable NMIs early if Smrnmi extension is present. This ensures that
trap-based CSR probing and feature detection happen with NMIs properly
configured.

This ordering is critical: Smrnmi must be detected from device tree and
enabled before any trap-based feature detection, ensuring subsequent
expected traps are handled normally through MTVEC rather than through NMEVEC.

Also, Smrnmi-enabled platform MUST provide smrnmi_handlers_init callback
in order to set up NMI and trap handlers in platform defined way. If
handler is missing, we assume that handlers are not installed properly
and subsequent NMIs or traps will jump into nowhere. If handler is in
place we assume that platform has taken care of it and proceed.
Platforms which don't need handlers installed by design, might use empty
stub as callback.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 lib/sbi/sbi_hart.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4aefb759..ed0f2037 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -522,6 +522,34 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	hfeatures->mhpm_mask = 0;
 	hfeatures->priv_version = SBI_HART_PRIV_VER_UNKNOWN;
 
+	/*
+	 * Parse device tree extensions early, before any trap-based checks.
+	 * This is needed to detect SMRNMI and enable it before CSR probes.
+	 */
+	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
+					  hfeatures);
+	if (rc)
+		return rc;
+
+	/* Detect Resumable Non-Maskable Interrupts from device tree
+	 * If it exists we must:
+	 *  1. Check that platform has installed smrnmi_handlers_init callback
+	 *  2. Enable NMIs before any trap-based checks to let subsequent traps be
+	 *     handled as normal expected traps
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI)) {
+		const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+		const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
+		if (!ops || !ops->smrnmi_handlers_init)
+			sbi_panic("SMRNMI detected, but platform lacks smrnmi_handlers_init callback!\n");
+
+		/* Initialize MNSCRATCH with scratch pointer (for RNMI handler) */
+		csr_write(CSR_MNSCRATCH, scratch);
+
+		/* Smrnmi init callback exists and was called in sbi_platform_early_init() */
+		csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
+	}
+
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, &trap);			  \
 	if (!trap.cause) {						  \
@@ -676,12 +704,6 @@ __pmp_skip:
 
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
