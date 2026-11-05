Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440FB606A326
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZYWPue0e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8sO1XFH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EjZ1PB5lJ7IcR1cZF+g/zqvIDEWbLiMm9aV5D7z3ei8=; b=ZYWPue0e43BTJm+pP1GMt81IwU
	FWStRu1uSvqetMd7C7hXIUIDIPHJYl+hrYQl9J427rSoVIbuin1/ItUjZLD6HfdN7KQl2voMjKqEG
	qPxqOJ7wrOU6rlhA0rpG+89HFX0h1ADZeIRPYiawTOuRAfNPjYGdkizFkt6PDsi4UKwIfuO15YaT9
	/aD55YHCYKjVg0aG3ricw5GS5wn3nqhXgV2x6qPJcIXfAs0cSm25JNweCUJmOTLCD7jsGv7T//Zly
	30mCKGWNehjniiPhIm7s4W8IqUsixb4mlxHp9rU3bevwlUvRqr2/Dxvix/Y1BIWxzxrSmGuHUUKcI
	B2Ew7Igw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKN-00000007o1P-0aBH;
	Thu, 05 Nov 2026 04:43:55 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKI-00000007nxw-06hk
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 04:43:52 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-36a315ed211so339796eec.0
        for <opensbi@lists.infradead.org>; Wed, 04 Nov 2026 20:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793853829; x=1794458629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkdlTHLMTwXPjGXULi7FqYBH4jNOstGxqhIyhRHcTEM=;
        b=b8sO1XFHj2HF00xmQ4VHSmsucz6H8pwlqz1IN7nUzkKx30EfEeS5tDhdx0M4kcSaaB
         sredDQGIf5lnC//a7ZD/7ZGJcl091+/kS0LASN+2NQfw5faf0gCwNTBBsSnuje4nBoxn
         eCjbLYTiAKB8rFm7aB5Er6+sTFl+L3GH3h6pKnFpbtR8oC1fajbzsiQZ7VV4Q3LiYKVs
         qXKRC7PgRquBzGDJahpKsK3WQBg/jBxzspTKCTpSy0Lj8pwkcNMRZ2y0x4ApB12lf7CS
         hCw6FBRdkjD/Ug9pP4WXUlN45Lv0lH7NFkG4Kujbc/h/BdK+WRnvw/MczhFbgLtyiFZh
         L9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853829; x=1794458629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XkdlTHLMTwXPjGXULi7FqYBH4jNOstGxqhIyhRHcTEM=;
        b=APjiDzsaOROP/lnB8XQKZlKZc6CvI/EMDmau+JCDpVPgIYKO1ldmp7c/R4koZBirpm
         YZ63Gt3l2NO9t0vbE/v0ZOfukhpIWwc/BZNAxdLAwQ4zmfzx62kQV4EwPa1x/3HzR+aP
         /Ag9eEXHfQc6/kVTnuiH8e7GRwZK9l45zcLsKuD1nPvoG+mCTPPBPKyqMkCoV8fNwhVd
         UyfI/wXwdBoBYN5e4uHemNYV2I7r4wdXYgXbIBRuo/u461+U6x244Quksogxp64oMtWw
         PxEs+/HawojK6I5Mk6TKkvdkWpUNQxt4HOy5JKu6msrzIgjMzGL/TkrIngD54CCDk3Zj
         FXEw==
X-Gm-Message-State: APuU4Z9fhQX8Zw+F45k16Mczi3z4Az1WOY+wnY4dsy11H39FvCSETqAZ
	H7qLFY4rysyjoMrVMprkQP5hdBIaMhuuUZ+y4yL8uuZLKI2efL5jXbBcFX9f3jNh
X-Gm-Gg: AYBFou0xjVTwwWPOl9zupncthm5CW22aMi5lNoI9nQghbQXbm6D0v5rKmWzONzGbXTh
	0teME7DcfqsBgDdtmVSeevGymitg8xDFOB098CLabEi6n0k03trjRMSAQKxHpkctrp2MTmfkfwU
	6bg/fof708AuSzgjT4MHbLNvarTPClN1RXTlEnw3UQx4UAiQIwg3WXDvfYk3uO/21+0l9kapw/K
	OPJ4lsY3AyPQwQzkKVcMHKsJd6ANh1YK953hBwH7W4/O48kOsEriRRx0JuuO/1qGCQXUWaw2Lyn
	tz79+zWZ/DVAiaMZJCmIiHSRJXSzd1fXzYlTtziSwmD9ZXg1XBSZMz3J0A6iemiIW/9Etd5T2np
	25BdG8T/88CznRNdA1IXakW5NtJdNAI3+NmV1K9SRkWrkZUy2m22Q7yQMVSQx9A6BCx13boSbjR
	S+LJtcClQl/47swApybvw93nDz3hTsY3lELmhvamYjaAi9JSMiNOcYirkhTklj9hdarvv3LlVY+
	VvSDZ4oCc2B84XU2xB5Adh0vwL44vamgdO0uvJl2JGMkmYLge/b03xzbIJRt4T0w/bhZ/K0z8Ra
	h7EYrtnQWfodlkFeH+i8EyCOERAsIG7p8vXM/U8B2B+s3k0FP3ee8hpx/OIW83my5kXsqGjSuUC
	4N40WfGTLECHM2zjyIs8ANYpeMTfL3HE9mh9AXvs4WFiLYOIb/QO8
X-Received: by 2002:a05:7301:1a18:b0:367:a092:3c73 with SMTP id 5a478bee46e88-36de666056dmr2126395eec.12.1793853829054;
        Wed, 04 Nov 2026 20:43:49 -0800 (PST)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm11547657eec.9.2026.11.04.20.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:43:48 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	rkrcmar@qti.qualcomm.com
Subject: [RFC PATCH v3 3/6] lib: sbi: Preserve supervisor count inhibit configuration
Date: Wed,  4 Nov 2026 21:43:36 -0700
Message-ID: <20261105044339.435711-4-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204351_012768_DFC8BEDD 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Preserve the delegated counter inhibit configuration across domain
switches when Ssccfg is available and menvcfg.CDE is enabled.

The extra CDE guard avoids accessing scountinhibit while counter
delegation is disabled. scountinhibit aliases delegated parts of
mcountinhibit, so this is not a complete PMU state virtualization fix.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index d2490483..89fd1647 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -94,6 +94,8 @@ struct hart_context {
 	/** Supervisor resource management configuration register */
 	unsigned long srmcfg;
 	struct hart_context_sstc sstc;
+	/** Supervisor counter inhibit configuration */
+	unsigned long scountinhibit;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -271,6 +273,10 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 			ctx->sstc.vstimecmp = csr_swap64(CSR_VSTIMECMP,
 						 dom_ctx->sstc.vstimecmp);
 	}
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCCFG) &&
+	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
+		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
+						 dom_ctx->scountinhibit);
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
