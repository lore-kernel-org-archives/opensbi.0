Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD73606A31B
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 02:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x1/xK9il;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hE5VxSeA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ipDp8Jhc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xXmdqQWI+nr/j2hKihMxZivPm+ur1rK2h9tX5IU9pGY=; b=x1/xK9ilqXomygw//gcyXcoYDZ
	WSTN+VjDfcD3ZxMx9+cCIFI15+TU5Fm3yQAuwpfMEWuEKtpYRyn8tKUvpvEQit8JPOsWA1wMukvgV
	P/6vUQ+eFQ6UPbdGfc4A3Ttzi8Oq0nmoqML4VeA1bKKp6LwyIDAsmUGxmLN6T+s7znFG6kOyBWY1d
	Dx+If8ZVjxSlgYag0Tnd7eSna1zFbogNYg7Jj3r0lLxkF7zFMO9lf6xygamheAgdq38C4xtwdz7IU
	k5a+IPM8DPYCiaik1I2R859ose0YsLinVh88l3Q3WUach6HVeDqCLWep1v7Gh+jmCMwEyIAoDkiqU
	lC/FOLJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GP-0000000FL89-3CRm;
	Fri, 23 Oct 2026 02:44:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GN-0000000FL7L-2SCb
	for opensbi@bombadil.infradead.org;
	Fri, 23 Oct 2026 02:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XhF26oX8RR5rK1fb6iLJB0Tq6y7U9BqkVyOe8EJNLcM=; b=hE5VxSeAnAb1mUkIVD45/zUsj/
	u81+GRo3n2RqvbdQpcTKf1n8a8nUro+zfQQW0i+SLHTAocyoV5M0afL6ARdx5Gzv2KomjgGAOinOa
	kFuTGjeHwLXmIJwAWx+bLu7oQ29yNGGoA8D4r3hdt/XGoKJ3D47ixByb9XNzexYXFmTXTwCFE8HSN
	IiDdCT7Db16/96lDKu96nVw+6OczPz0LsEpeJvrnUlimKCTZ+PvFWIjrXqWSOvrNrfxxulNZmQFAR
	xw0mUQYCAAJH/kuzDASb0rXhnzdOWekab05qULNdJR8xfsZlZUERNSYdfxeXm/2bpoIUcLd/NbKFT
	DCxOEjYw==;
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GC-00000008YdI-3nFo
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 02:44:09 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-156cbe59524so412884c88.1
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 19:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792723439; x=1793328239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhF26oX8RR5rK1fb6iLJB0Tq6y7U9BqkVyOe8EJNLcM=;
        b=ipDp8Jhc5oNFaSC/+M3f1MeMS2KM6rpF8hg9evIjVO8FRJqCzNxQkt3HFhtM+wJE5j
         DT6PAlMyUC9LovZlnrgebP0OEfuoP6ukbH1wVum/JDY6LJoGnqZm86K1EQoclUp/SFF5
         N+X+nLQxi5BZ7U68E4z0gevqsFRZMu6lHIykfk0aR0sAYxoE5RCgXYh+EWPKnRaFmClS
         NKxNvOY/ie3Ky8Fb2kerFyB0VE+/1EWiY8vLf6TeZhOhfeTBzv0J3vH8rVLNmvPvsFI0
         hZzslr9y3d8LedkNj0kJp79FUtyyqAoEV35Pk2ARPBEfpZAa8kn90uBEY68dnWUjA3cx
         Vrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723439; x=1793328239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhF26oX8RR5rK1fb6iLJB0Tq6y7U9BqkVyOe8EJNLcM=;
        b=M5e4UAuGNbTEaV9rKM4z4Hwo+COfhNJVL0hy627TlBma+t0D44WrHuB/Jn1KArf90C
         NOw7ZQ+JHU1mkP7aWJDgeeew66HvsGvIqMeptiSxfrtPIvCLK3C/l2x2in+44hJogmiu
         TS0fKjzkO1H4dkozhqTQjUAVwbbpkzqxlNP1V0Uf6YbvOf1H9qMZXRIvoM1aKRyG9L1p
         rYfZae0zVNYzBaTcR9iYrfPWyXEZtMoB5DAa5rAArI3qDOmWCr1Ek4qhmjWSGMFU1Yti
         EQyii1b35tZeym4a8WIwE0vU4JGIC2zMxfP/sF+iaRSVfJ3iHJ7TZUq8W6+7Qny1uPoy
         +3/Q==
X-Gm-Message-State: AFq9FYIQldeakEINZS/J5sCIkmN5FyD7bp45ckm/YpejidyWRnbPjS5D
	94qsJHNH+6E9QDfgVC9b/o/HdNYgxo1sD+7cnoQj6KrE85ZrLu2EwS3vLup3rrBV
X-Gm-Gg: AYBFou3QpWkzMcAYlb/OojILk80kYPAslqNUy4d+2ecOnTlNoSNrTtZ79mwH27Ozz3v
	jKEg/SF6vi7iQNT7zaCOoLywWlkw0GzDqL1U60WBQg4j/FkKPLtkH+JlcUiEoNyIAst+rz4i9be
	I7UFONlHwD9F1Zv/Pxw78a1YsQbgWLcFT5N6xVY/t+Jo3r6wuPCRJiF1VxyVk1nvnUrCLwcipgo
	PHqJ9m++RqQx6xpknLQOIP42UI6npYyTA/mo2xo0DnsAnlADQthZifMLb7/XNNv6wNsvDiAEqy+
	d3tdzxt0IWB5HulZG5PM8ixSl0si5d92DHSct07t3gQYwWG9pJZH3rM23Gk37Xm1eHmnkMaNPTo
	qbsWGme5QzjCdzs1nnWoUh5Kb8m3fKSo1UoMh5f6mDrlZhxzwAr8z8JHFsRFj3CcYmfIGbYdBYm
	Fa4ZzBHjQyVjz4lYt8yi2yc/1fPY4KP/hIVfUEDW3q3kJEpdiWrIjyku/0bx6mUBXZ4U84P8rg3
	VeyiRHPcygFDbGVEZyaZsIZh9dFfkl0t59TqEZpC2lBDIwYSYt8yBXskxw3QS1JibGHj2SYZ2e7
	ReQpE8uIA5BojadXJhTEcsCIKHitsD5+i62a32yA9XIOzPF+t42BA7a3MA==
X-Received: by 2002:a05:701b:260a:b0:144:e246:a0b2 with SMTP id a92af1059eb24-195c9483107mr1118799c88.44.1792723438550;
        Thu, 22 Oct 2026 19:43:58 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb6c3fb2sm2877233c88.13.2026.10.22.19.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:43:58 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC PATCH 5/5] lib: sbi: Preserve the supervisor indirect CSR selector
Date: Thu, 22 Oct 2026 19:43:45 -0700
Message-ID: <20261023024345.16779-6-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_034405_404708_B27D7359 
X-CRM114-Status: GOOD (  10.67  )
X-Spam-Score: 0.1 (/)
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

From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>

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
index 0541bf8e..15e9f543 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -73,6 +73,8 @@ struct hart_context {
 	u64 stimecmp;
 	/** Supervisor counter inhibit configuration */
 	unsigned long scountinhibit;
+	/** Supervisor indirect CSR selector */
+	unsigned long siselect;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -207,6 +209,8 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
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
