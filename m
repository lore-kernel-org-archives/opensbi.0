Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71302606A32C
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNEcXW/5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S52qlS1e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w2hdtQtoTjfm3Ud04sNcK/zNrrlZBGaHatySZIUZRUg=; b=cNEcXW/5AxprDmwRN1x7U1fX8O
	MeXkMyv7FVnhTds+24GfihvSWGfTZLC/yWMZf0t45OO0ABNnGBPuyu3vFT/384JHCNxJqIKHeErSU
	4kcdeCyfb0HrRkapfBFvOruT2fgI8TNkefG9xPWSQGayqIRMRiBfEWhwd98c6B8HjfJ6PVlRn3FdF
	vKnS1XOzSIw5l0qK20NJXCC5F/c6ilvxkt351vVQdHwwMHPlpuC5wSqDNazGeEO/aRRcsZOUZjxhI
	f7w4DqH0Pe42lf8u1tYzrcD7UG+XGdM/5NYJcQNXXvIqeEvMK0vc9RNkoDVs2WJ7jDjDl0EIRjSXU
	drsb3SqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKN-00000007o1i-14yB;
	Thu, 05 Nov 2026 04:43:55 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKJ-00000007nz3-313p
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 04:43:53 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-35b2c599f43so1156790eec.0
        for <opensbi@lists.infradead.org>; Wed, 04 Nov 2026 20:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793853831; x=1794458631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spW7hx8Hg/7RNV4KKzi2amk7FwYg9QaCdQBngcHFgPM=;
        b=S52qlS1eVvbzN329jU3x/5a/NhgfUpbeuVOmJOzw+Z5SghZl8Efqlo4gEKcSE+kx2j
         ZIlSpewVCWZ7o04aBwPpJ2LLqfB51wIadKzvp+gWbzFmf9tGoQQbZkWSLorXd4M8XQnF
         qx1x2kvPskbJB9HHB2uwpHl7LrpTKs2WfnIxEix1yeVxc/EFWQJAY3y5qBW3/lyaItdf
         uf7o1aERWi+mO61WV+Zt2qJkeBq8E8YXq7AavnGOX1+N7/u+sgXL1bUG4Wj5SO1h/4kM
         lCBYO8fH7HBD8PPcfo88BX/LkWRUi1qNGtap0N5wjOmaJRr6Tu99fq4nvD1epUFQ9M1A
         6vhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853831; x=1794458631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=spW7hx8Hg/7RNV4KKzi2amk7FwYg9QaCdQBngcHFgPM=;
        b=SmoaAfikYWHDxtFMlxVIahqSV1yZMucD0BlWbiAudzUXubAYiyxzoQQdL2YMKL2rUo
         PI/3DnknRzxaGeCMQ53pw43TDmXSSnMKHaJ0/E3l9alivczxJH3MdTDDM7TP7yy6hut6
         OBDCVFSXO6RHQKE2lCJkt5aYp1b4tIdozBinL6BbORZ9MeKDcsu85J+kfh1uiiVvDBnm
         jLl3z9co6WLYbC2DHt1HrW1U1MLH6RyBYoihkdoV6stQlPyK0DRFjRMFcbrwwgTBnyjm
         gQkbBWANRa6r43QYRQAIpA15U6+ZfmQy/3ClxOBw6uHWaZzzvpP+ChLA6rsqa9vDWybG
         UVSA==
X-Gm-Message-State: APuU4Z/SloU964VqKZhpgBd593lb66z4rV47KVoVfDT4hsUTCPSLlMbr
	2bx7YeoBDu+Rdj+rUAZd7soialyF0XK3jKa4x9KCbSKI2un7YhuV+JOtc9okcmTb
X-Gm-Gg: AYBFou3BxJRE1JYtYWTP+AlUo1m0SMS5Y0os7xDr1JR/hIb6xWKmPAuq76/iDQ1QCvO
	kTpT2g3GMAzP1zVCbct4aeT/3zFJA6d1GE+UJML6VxvuVSHukrFUTj4rBY6EaLnMiUXIGX5t/Fc
	3qhXClsKp3GCujvpQtEfkwjQORGzyNOJgagwm3+kr7wbUwq8kmfG663nWMCL7ybXwuZN6t4ZY58
	0AOfqZynkQs3+WTrTu1I3Z1sw5byElqtNRMDsM99hpejheQwwcdOgmumI/H89NMc6Jatip6/uyJ
	99b1zdGxAIg6FajAC1rCcIRYihmsPiEIS4j3Sfi2aTWFEKtYJQ4oI3SlzP/y7tNLeC9UXZZde7I
	/xvEd3lTTFdC4N0DVpfBJbkvQaxSQs0uO8C+ooR7U5XHA7+4hNxSfM9VvcolWoSJ+pD+s/GqmC4
	/lEMCnVAx6j0U2WLfF53ELpxvLPJOnzDfIacsXJW0uontfSSlc0odEGrNwNq5XOf2f4TW8cG2gw
	NTn0d6rosmhdWt4e4gc9lzKUyTOtPFlZ/9z3RwFMgSVZoceNeW3AGw5hs7debdisTXVuIcUqmAW
	9FaOuvgVsSmxfCK3RmNotqUpAVurSLc2UEutIRP1MNSon0g+ZCHIuvQdnPD32IKG/5Tw5XCAi6r
	zh/iOCejh+kZXYpgR4PwuVf8w6gFvINWO
X-Received: by 2002:a05:7301:6404:b0:36a:79e7:2fd with SMTP id 5a478bee46e88-36a79e708c7mr10659244eec.40.1793853830675;
        Wed, 04 Nov 2026 20:43:50 -0800 (PST)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm11547657eec.9.2026.11.04.20.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:43:50 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	rkrcmar@qti.qualcomm.com
Subject: [RFC PATCH v3 4/6] lib: sbi: Preserve S/VS indirect CSR selectors
Date: Wed,  4 Nov 2026 21:43:37 -0700
Message-ID: <20261105044339.435711-5-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204351_773960_5D4038ED 
X-CRM114-Status: GOOD (  10.36  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Preserve siselect when either Sscsrind or Smaia is available.

When H is implemented, also preserve vsiselect.

This change preserves the selectors only. It does not save
the indirectly selected backing state or IMSIC files.

Link: https://github.com/riscv-software-src/opensbi/issues/433

Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 89fd1647..fe7d98af 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -96,6 +96,10 @@ struct hart_context {
 	struct hart_context_sstc sstc;
 	/** Supervisor counter inhibit configuration */
 	unsigned long scountinhibit;
+	/** Supervisor indirect CSR selector */
+	unsigned long siselect;
+	/** Virtual supervisor indirect CSR selector */
+	unsigned long vsiselect;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -277,6 +281,13 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
 		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
 						 dom_ctx->scountinhibit);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND) ||
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
+		ctx->siselect = csr_swap(CSR_SISELECT, dom_ctx->siselect);
+		if (misa_extension('H'))
+			ctx->vsiselect = csr_swap(CSR_VSISELECT,
+						 dom_ctx->vsiselect);
+	}
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
