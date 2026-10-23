Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00D606A321
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fMy5LIdE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pNDXH9zW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J3EIswSW1UTByKXKvJCYE1Wm2HetFwxNOSkLFx0bnHA=; b=fMy5LIdEAdME2L8Q6OeWnSAH+1
	xkSRRC5J3zRG82QZX8B5LegC2g46GzXUg5fDYDCvcw2apaIfv29aoF0dbRxReeIw+OFeyMZQPq82y
	tkNay+/Y9yqbSBkDUlJS6QaG7H2j/zy292GPfIwQ5MaDCSHzXvt1whtNl3adbBoYCSMbwcXsAUqR3
	AO987ZHVVSDBT1SJgGco5TDyqTM+yU7ED4bqHCgYNTj+d/q5jHQGKQOd9gMRsE4q/45E5UYSE8nUB
	RJT1XDxsv+7WPj66tv/aqAOx2bGeFKTz1CwYcGsh9aSFOIrJhbQDUhTF3+LwGL48Hj62uRBd+FdNS
	vlZB3jYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PJ-0000000FijU-2ZXL;
	Fri, 23 Oct 2026 07:09:41 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PF-0000000FifL-3aSy
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:09:39 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-35b2c599f43so1385178eec.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739377; x=1793344177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=28pw9GwxKZtMjZUbHr/FuOH+6CTYdDLbVi9vU5FKG08=;
        b=pNDXH9zWOVnF1Ex/DZwq3L+D/IjZy7a8L6iiZn6EvxxLS9oT5ANT7m0JS4gbLsFwFi
         sk3bCCH/TFC/ml3QPoQDz3TH/CO1Zjg4j5y4OVtg06hIzFuZ5VhjFWSgnUXT2o46TOES
         wLwRLPPIycm1YegEUHGEocTy6AcuHGw3h71XvgV5vyFgylcgNpzptdhDAbppFuZGKDzU
         QoYIN2D/uZ5CCJ3smnhXjWT8HvA+3XgEWh7JApp9T8N5Y90ueMzEh27LiLzRD23LEeeR
         zmu1sD+uGJiez3lzc50Kzi6pH/3l+Y6zG6lc5h6YHXQVeO/Hnplc3S2ZKzO6qeFU1SXC
         84Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739377; x=1793344177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=28pw9GwxKZtMjZUbHr/FuOH+6CTYdDLbVi9vU5FKG08=;
        b=pSEsEAxqL6by57LnBOO3pqypJQkkDeiQYkHUbnkLzk0PN7uA053OeqGgvb2w36igB1
         1ZYkt5G29FDSqL8LCWTCyXgS67nU3vEFQhyYAOYmNRwz+2ri8W89zCmlYIzzVfu4M5TO
         O6ZDMb7iPkP7KV2m9BEm2DAgS3QZNxoUbAFPb+b1ur8DUwwdqAthkxb1u6qgtjZcC4A+
         orK102qCc7Nho7HtAYbHdYYBeyEo1uWjWy9KisE4MZyg1sLankFYBxjs4Ciuqyj8pQvs
         kvAHji8FoMJ1qFFjkdwEhVQbrzGHmSqf+dbtVjW3IbFQuDa8rFGWV3bIXytmboB0b4Fk
         bZfg==
X-Gm-Message-State: AFq9FYJ4q6bturWUuPCTiRfRjmjVO6Yszi47gs4S9TUChkRGYc30qwPA
	rbWSTKmS+9NL5Hb7CksOxD2mnCPueFcziSBJYoWLvLqdAKnTEEcqgkNF9Cn7iuZT
X-Gm-Gg: AYBFou0/NrJpBPvSzAzSGi9Dxb+INvHrVqZww6YsnpJHYnJRJJSYHsxw/5rKIJFxPCs
	bRb9TsxtYBj1ArJVPL3Kh2Dy7nb6QSR73i6q7jGRtDnonqNPi+UboecLx62CxEsf3ifvfjuE+7t
	kMzr4gXhzE5K8yNdzzJjc0tzMDYDGSrPCoo1S16lC9wbZUMiRvv1VtenG4uJV9E1kfue5FKePrE
	KTYtCr7F6Lxk+Mqm2vFqpWwrRBKPsfOtDd/VtZYNn6OneP5MC2feTxwEPDSqlqZm+Yx7YUzu/lS
	YPmbRzsranxJhYaRS8rtV/jrbxV5/+j2uz0qVL6tG2ztjE+soZZWmRSx+iq/lSMa+GbSmfG4wFV
	8Pr15OKt9SmOWUc6MZVDR31pwApwCsm6Z9yyq6Rx2gyffnXDIX8sSj7/ci9OhwboCH+c3LBQ5js
	gDmVNjTtZSvaLe+ewk5ZXvxZxXqBWOs1imw3Z78Av3rK2Pmz6zBSUsEzRyVLKR8GbpBu8Lee1SS
	VlnaLEvKnbdezzpoTNXO8Epj383CqZxLqiWumuZjqZGMBMy313venniihLeQZ3Uz3VFhQs/FWfW
	vSApe2a2zl2rtXeAQCrJadKwC40hSbXAcKuhX9rRFx0/C2HdnJ44ZZp2vA==
X-Received: by 2002:a05:7301:b18:b0:35f:f0:8edf with SMTP id 5a478bee46e88-369d971f2e6mr1939156eec.13.1792739377095;
        Fri, 23 Oct 2026 00:09:37 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10da4sm3863206eec.26.2026.10.23.00.09.35
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:09:36 -0700 (PDT)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH v2 5/8] lib: sbi: Preserve the supervisor indirect CSR selector
Date: Fri, 23 Oct 2026 00:09:22 -0700
Message-ID: <20261023070925.241680-6-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000937_897136_F734DF9F 
X-CRM114-Status: UNSURE (   9.86  )
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

Save the supervisor indirect CSR selector when Sscsrind is available.

The sireg windows refer to different backing state depending on
siselect. This change preserves the selector only and does not save
the indirect backing state, IMSIC files, or CTR records.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 9b4a4f5a..961fd182 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -91,6 +91,8 @@ struct hart_context {
 	struct hart_context_sstc sstc;
 	/** Supervisor counter inhibit configuration */
 	unsigned long scountinhibit;
+	/** Supervisor indirect CSR selector */
+	unsigned long siselect;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -249,6 +251,8 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
 		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
 						 dom_ctx->scountinhibit);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND))
+		ctx->siselect = csr_swap(CSR_SISELECT, dom_ctx->siselect);
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
