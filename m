Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1F5606A31B
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oIP2i6cB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nob4Ri2L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mmwGMPy0jYWnK3uy2KiUUvESB582GHIBbk1+5OEELNo=; b=oIP2i6cBZPF8e8xaTMM3zzg3X1
	OIOk13HC3qZbrFBnUxzK0t11l33flmMNIJokI3joJTh3k8JX/2/bosRS8ABBj5iN7XowYIYH0fGXU
	uvyT/1VLOubZm7kTFr5Q8qMXYF5asArCW7c6WFdrYc6WEJSFQ7L+fSC7YsjpmRxzpQ7+vq0g6cVcP
	/rH50zMMZJF95afE7HTDBpII1lk3OJFZBV5RXRc3+ktQzxMmE1wdo0ujpzWD5DuOig8eIZ0VxMtB/
	c+cVQHkJ+Q2QFTKRdtIPx8cV9F4mspcZtwsLwi8PKEiH8AvqO7vcPnPn6PWTbO1k75CQayVlvNqQZ
	U2boZndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PJ-0000000FijN-2ETF;
	Fri, 23 Oct 2026 07:09:41 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PE-0000000FieX-2VaM
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:09:37 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1027195eec.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739376; x=1793344176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r6o45wUYBbGNKgK4Mzuz9aLQ9qrzf8dUYaBNbz5ioG0=;
        b=Nob4Ri2L5ctM5VAXnFyXbF+DzYapCgporoRm3h9MppqyfUsHyLcaO8K6uN2CEmAl7W
         md/eD5suO6GGs90If3EiEjL45OWZYr8hTwxEF8kzUSB45dNOEsPy3LzqX9oNBLb4aPQ/
         pbihR+9/5P3pKz7y3uLp0wkKCNOwhZhoolZENxJfI3DQ1xFzBuDKzTubllJ4oc2wWyFr
         W8z6TI0fOBis4I+6NNHcHrFcIYxn9xuKFTe6LeFDyuXFMiLhnZHACuMEVKgHPlvImPFs
         iBWY6h5JYs50mDCs2H3ilDgaqyW8v5+zvsOclGciYwmoSQ/goA5IhoiujVivDlOEUWcK
         SXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739376; x=1793344176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r6o45wUYBbGNKgK4Mzuz9aLQ9qrzf8dUYaBNbz5ioG0=;
        b=kzFK4RyEexulxT6Fd6M9jNtXbr39LW/6ieV7LYm3K6J6861U1h0E4WFpZQw2tB7mzc
         vnzev4V5/Tklx6OtiJrp1JXUpaDjzVGbRtOBSb2OCrs+DFWfbJuCD2bqCjT1nGlEGTXx
         ee788TCbiyGzLlmxbBSANN8pEdOgtBuB1kn5bx4uWYlaANL+QqwRQFdygAmIwh8IOeYp
         F3m2z2VxIZurKHnd6Tdb/u1msmdO2dhW1VYe+RgjIPMmSxBasuPB0e7q+041qtzS9DSq
         q178F3C54upOIKkVH7ypScxbgX+mEXFaEDLDrRSd/THbNYCZMT4v8qr5CkqGokbmyFWc
         DEJQ==
X-Gm-Message-State: AFq9FYLIqdGu2q+YbKOTgMACRlQ7uGqT89nkPQxthsCmeRnpvxyzhVZd
	CgHya5ta71nPkbrTh6gW6dbyYe4mwTOwwIqaS+eiix7po/owd6BZFiu3r0IvI9o1
X-Gm-Gg: AYBFou1+y3x0q5EpjVCcWrzNSTOe59sgiBNyu8TNLQ3T5HhhinNa23Md+qqE7AW+RK6
	y/ZukmuDg6US5BI76qvWMuSE6Tsazu436UOJZUOdAMw0BaIH0FFVV8u0j65K2fjvYBa6pxEf306
	MRXx+aeJSB38G6/CUWbCojfbP0QNNoimljwer5+1izI4X27IzCl5XsiZKSedlLOXYtTKZPZtCCS
	x2uBF8E1vYX5rK5xcj+1dvY0JgOZ68COqlD3RdMuRiu9Evl2IvpE6cj7p0HN/gDQf/F98miEdTS
	AvSQg5YHzHKGsVt8WlL2T4UiCXA1WlpVKR5Ba5dxnwYAgYYnXl3iE2Dl42h/dVHodINIlxjcGSI
	jjWfarbNdsIZgIQI3nvewWA7iyeRnp1JUDKn6J5VLsKa/AaRbkpvYQ0h1ON8y6k5t6RwznpO7NU
	QjonaC/nPQfixoRGxZghq1xy+ddMrf0/1jQzo6OHVTGzBz/jIkScJlDaCcFh7FXPMyq7MssmAFu
	saTYmqcQsBtNR0rQ/AGhPtn7nTVblnlxveoLpSORvm/0frQe16Daqm6Tj2dSgq1eUfz2917Litu
	xv5qn/v9IupLzwvKNmoRNmc0zz+qSkcQozy6PEuW0n42zFTfRBwGKEH/mg==
X-Received: by 2002:a05:693c:8084:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-369d9809322mr2186631eec.28.1792739375809;
        Fri, 23 Oct 2026 00:09:35 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10da4sm3863206eec.26.2026.10.23.00.09.35
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:09:35 -0700 (PDT)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH v2 4/8] lib: sbi: Preserve supervisor count inhibit configuration
Date: Fri, 23 Oct 2026 00:09:21 -0700
Message-ID: <20261023070925.241680-5-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000936_643043_A82B3E17 
X-CRM114-Status: UNSURE (   9.87  )
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
index 33c19d04..9b4a4f5a 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -89,6 +89,8 @@ struct hart_context {
 	/** Supervisor resource management configuration register */
 	unsigned long srmcfg;
 	struct hart_context_sstc sstc;
+	/** Supervisor counter inhibit configuration */
+	unsigned long scountinhibit;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -243,6 +245,10 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
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
