Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD327C5DF70
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAM06zQfySXjsdr4pHjbx0Ylbx6I2YcxSXDlcMeaz7A=; b=cOqBpZDwFNrRCY
	JchmQWEjAvP5cHvXaWSSAW6M60aeml923j00FO620HDeJqQAP2q9B48LUEDSIomHkEgbUNWR1Rs0w
	bJHDkPq7jOD1mOCLfiw58bJPtcSc6dkVP7CmpGIzii1lUwh1l3NJevGqrRgsD+7cs1XVvouSmK3z6
	8mEhS4LwXdQb3rP8bZGkRYrjmmN4vtx5mNOY4zAAVsvTzro3aQAki5F64tH+KIn8UmSD6aJ2iN3VU
	DL9Xo06HmoVMgUoMNVsvH90D5/Ub9Y2iNqpgnPhDbk9mnGyicMMjIKTRc6a7aZ5cvKTEt054+Hz1f
	scc+y5q6g7kpNocMvoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHm-00000005lf9-2fKB;
	Mon, 17 Aug 2026 09:05:38 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHk-00000005lc2-2dXV
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:37 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1671571a12.0
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957536; x=1787562336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t632Y8vzraJ7H99l+IiQY9XrAkow0ddDTvdT4qbvgdU=;
        b=VDlCJSljnfT3jvGo/BQsQJXspOWEWcyCAhmTUq30u270uLFNFRRrZ4WQEuPoIEAJ/Q
         r1KzDFirbp8C4yjDWrO2DS0YTGWf4do2ntaRErv8TBWxejbuk/VEZidt3O1FGA9V0GH9
         jSpHgqQeOEmifpZFtMBNvOEC60PzhqvgRyOufs0ZY1Ze9r2weE+BXCqOXSrMMWUffMdB
         ur6nEJC16NoToGM7YkOAW741hxiePFDyg2eMJGiitARuPGSjXNUCIGlRau5PyPDzaYwD
         zaSY8spam2GZxINOoc2cSJZt04hhUkLNjfpd/XHZ8Czh9HygP7MTn8fSK+VtdZ02wad2
         4MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957536; x=1787562336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t632Y8vzraJ7H99l+IiQY9XrAkow0ddDTvdT4qbvgdU=;
        b=sjZ4I5GLPcuskBy6hcC7J8ViK6o5uMm5hK+tP5gK8Xs4IcNKFl27Oxzgk8V+NtD/l3
         E+mtDiid3RrM57valu06mVhfjmqnv9BmOjUVNWp3xQk2vzJQp74Vh8b/ewEFWcb7M4px
         W1ekvbCzaNgO7dYjrI/tdsujqC06c2uslY6pZTCjeq1e01St6Jplo3Zwyagqxp1FL2gk
         XK28Vsk8X1iCLeUfOWSOEAc+hfS3g2PFRWxttkoz3Gnfz//iiwub93lBMPf4LAcoQ4G4
         AQ0d5nvkZ3bDTVSJdsZwLzoJfT0ALBvWtFV3mARNgwTLp8Vfr9AX8y3XG1lkmPcb9uyu
         uqrg==
X-Gm-Message-State: AOJu0Yw9T31heFkqGotX47L3jtv3Ww30/HIdMF4APDmjPD+4EtT+qiRx
	QNBaOwwj7gnKBuy4kZ73UiHyjkrbDdacRVEVNvX5DnKi+qeqqO4nVT6t2VQ4pp8fc9EG8/8uro8
	HEjilnwGDltmGUqLpo9DlrL3qCYB+RVHoneCPbd1pVMkUyiWKX0f8bd9JfHDpy4W77mfPNfpqjZ
	lCA2dzpfvHWQOtCWrfH4dZTWB29ZksaUrxEHE1Jr8hc0sqhngxXw4=
X-Gm-Gg: AR+sD10ehPbDWAsr8mc9BIXNlAOhQliw2YPJyTxx2InEv2ZnFM9tUdKn71F/o4T0f47
	HHNYkrjGs8Rvuxr63FaNqAY87C7Lij5x5RCiAYW/+hupvwkVTcN2fru7vzWaLOlYPiUGn5Lvgvw
	nzddy1fXuSOl42MEgOzDJSNjMKkC5lge012y0ZkXbcIXxNykGgYoowH4lIxkrjAGvgbDCGhTQ9K
	aJBRC0C2LT3lG+3S/PjCBUqE3NXVf3UxkCU0uTgiI9S3NEvNYJTvVhPI1N705FKvOXYFyOFYLaL
	di/pux/zVUx6dM75o64ImUTcBIXDsqoDYNTC45/exjYLqvE2qpc88VgH9wLBhdiPsottMd0UXmv
	Zdetowe2Zyi8WT8p2tUXs6QafFoO+A2nstrh7fU4f/YmANcDwrNw6u3Jqm5OQI8y7e1Npb0Ofw0
	RmtFTf4SMGt4r2u8hET1h7Cc/XfBqeHxjYFwNgmk17G88x1udep1jyVIAEhAdedHnYBzic1wVQh
	v5HIIfpRP1G
X-Received: by 2002:a05:6a00:4f88:b0:848:700d:c950 with SMTP id d2e1a72fcca58-84fde7d054cmr22873233b3a.37.1786957535476;
        Mon, 17 Aug 2026 02:05:35 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:35 -0700 (PDT)
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
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 6/9] lib: sbi_domain_context: add slwid to per-domain S-mode context
Date: Mon, 17 Aug 2026 17:05:00 +0800
Message-ID: <20260817090503.2104998-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020536_683604_8406F502 
X-CRM114-Status: GOOD (  10.27  )
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

slwid is the S-mode CSR that controls U-mode's World ID. Since
each domain may run different U-mode workloads with different
WID isolation requirements, slwid must be part of the per-domain
S-mode context.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_domain_context.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 0861d541..0b45c0fd 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -50,6 +50,8 @@ struct hart_context {
 	unsigned long senvcfg;
 	/** Supervisor resource management configuration register */
 	unsigned long srmcfg;
+	/** Supervisor lower-privilege mode World ID register */
+	unsigned long slwid;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -145,6 +147,17 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSWID)) {
+		/*
+		 * Temporarily enable Sswid so slwid is accessible for
+		 * swap. The target domain's mwiddeleg is restored by
+		 * sbi_hart_protection_reconfigure() below.
+		 */
+		csr_write(CSR_MWIDDELEG, ~0UL);
+		if (csr_read(CSR_MWIDDELEG))
+			ctx->slwid = csr_swap(CSR_SLWID, dom_ctx->slwid);
+		csr_write(CSR_MWIDDELEG, 0);
+	}
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
