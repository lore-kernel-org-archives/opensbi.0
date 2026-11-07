Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C679606A332
	for <opensbi@archiver.kernel.org>; Sat,  7 Nov 2026 23:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f+qQRIP6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aj1UVy1O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A78JGoTB+VoRcan7OYEi76MqLmoMlqtFCT6T2x4dPPg=; b=f+qQRIP6SXYxr0sJI9ZVLbxP32
	dmpdasWQGLYZ05BQo95axaLN8VuyNoFlG9SjDqnrRV5Sd5gJSR6MTO7JWVgkJTZDAemEPfzEGEkEg
	4UGiGYhmtyZcq0dnkAXa49/AMe5y+QVTDoALX6NIAn1uuK5U+ca6HbdJEDUcFt3r0hdc7mcgJNopV
	rHyd4m5rZ0AKs9dJM6NSnxN2qgzC7qlgPkZ0xnJ0cieEsDVdxhs+CGBOxOFeB49N1uJjifhUSb9+X
	O60g5MwNCAtbcvdp0rTtCaTC6vKeWsFEc9PNhh8u+kq5Y3kC+SbUrkj3Po7uRoZ0RwdThAomKWCxU
	pVjeijDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5R-0000000FVyF-1blr;
	Sat, 07 Nov 2026 23:44:41 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5O-0000000FVwK-1O62
	for opensbi@lists.infradead.org;
	Sat, 07 Nov 2026 23:44:39 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-170135e43c7so77265c88.0
        for <opensbi@lists.infradead.org>; Sat, 07 Nov 2026 15:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794095077; x=1794699877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGDOTk3pdFIwtXA7RRF6N0ctWgxZcgd+DdR8vT12ieI=;
        b=aj1UVy1OdE/2Sx/0Wi8JOaNNN98XWeiSjkc8VOPVIZuFDchIs4ZKJMbZ5oTVw/Xxet
         GqjCgCW5Foo22e4H7o6PaNqrcmtTMzR8mxQ4dO1PYICv0zgmUOnkSLcDqGX0lQk0jq92
         kcucwTNt8bShznhlWbJgT2w0NsX3+SFT16QJxREOx4sNcPHArb9mv++0ECaUgu+wH9vg
         pPKGDrCbzTi6SaIEJeuoGnBPxyQpUvqmQGrzmSPoOQ3XJ4Pr32iicPG5wqwd9d1hTbiO
         Vc68XTZKf+fPP/4TiZAkF8K65rJJnJjFPFTOfSbLlaSbutU3mdVUTG2ZnPwqojybtwlX
         hJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095077; x=1794699877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGDOTk3pdFIwtXA7RRF6N0ctWgxZcgd+DdR8vT12ieI=;
        b=JE627J8gBVxDymuPnLqlb0bMgvn8R42B53njLjDVHLiN4jFyvi0mCCqhLCLNl129vi
         u/rR/HBAqIGvngNrFKe2blBK5kPcujuzKoJ5Vxe+U5+kpGhQ6jpwFIYIVIt7Ld8x3O/B
         m+Xn0xiwoLcM1TGgPlkGNEIw0UkG0IER/O41x0Fnxi1SuEkdZbYDpYdU/UM7cnRWF0IH
         dOmdJMzu536Lh7Juj4pmSvzo1mIMEtljGjkjuO42ruaEfWqKK9cydniSnPANh6Cbk1Gr
         HXwrsSVTjqjFFn9uAtqb0VJneohLC2w7f8Xy5TPNb8kUVMDiD8fwPojWK4VaPGjLTODu
         7BLQ==
X-Gm-Message-State: APuU4Z/rkdw3vLixnSDMkng06jnMa5Lz+L6CQTNmyN3N52hEFEMvTZi0
	jONBxw0zMqP4rLwjYJRn4f4TXgckgZC4LatzQl8ulTp2KFylqDkZHxwz+tPqBlX8
X-Gm-Gg: AYBFou1kHULHRnDvrkQs08SSbXGecvvbbckAda3mu29W9JabZx1UAt5FLGUmUE0b40j
	cx2QMk03U6hLWcTd57wLqEpRv/6lkuK/4p/A1AbIDjhoo/Dfk4uWvns55pdMvCK9CJcaM66IYQe
	X024OFWsEY8Tx4zoT3SiYvkirDeCuUB6RWRd8k9zTXYilo/wm/TFNedarpObNgA3HrhdwJdikgn
	9zx14iZh2c4m3SNuV9R5xsmLCUX0n0IkBtXdxqncWA6T5YmcsFOuJ18ITpypxHT2CP8Vm0Pej08
	4Ic9UoTSE3wN3PcQuzrltH+FwzzRJ7VznhHmyReYrGAg83gwQp1x6QdbuEfvzFnUajFCV3q0vkW
	t0U5e2pDxakBVTwtucskPHZ+5SbRMKqKsXhUO6hbM8JputKT5IKlk4M7AF4D6CCK2c7nf0wYbSd
	+wp2fhadlpvEyy71Ca/PJZerd6R9Og9bZEp8tmMtVlwkUqdJaew8aaKCRYASrdXwum0gHUSIwox
	Vc3QQJDhPUaRsIWCjdbVVdg8HAT5VFNz9wrsckmT+LuKEOul84wb+bE3PW4mstrb2NI3g+A8ngW
	zlacYvnPiobSxPih6stGlFzsUse2t616gCr0Mt5uJOpzND2codkj+01HxSt+XCQyZ/OwHohMbmo
	lFSZ6MiHeQGRYWzmpAuYKcGxcg9uXpTc=
X-Received: by 2002:a05:7022:2606:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b39fe301edmr168077c88.2.1794095077338;
        Sat, 07 Nov 2026 15:44:37 -0800 (PST)
Received: from aster-MS-7D31.scai.dhcp.asu.edu (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm1819730c88.6.2026.11.07.15.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:44:36 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: samuel.holland@sifive.com
Subject: [RFC PATCH v4 3/5] lib: sbi: Preserve S/VS indirect CSR selectors
Date: Sat,  7 Nov 2026 16:44:19 -0700
Message-ID: <20261107234421.137100-4-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
References: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_154438_376204_BDCD271A 
X-CRM114-Status: GOOD (  10.38  )
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
 lib/sbi/sbi_domain_context.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 9c5c7a7f..b5989516 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -56,6 +56,8 @@ struct hart_context_hext {
 	unsigned long vstval;
 	unsigned long vsip;
 	unsigned long vsatp;
+	/** Virtual supervisor indirect CSR selector */
+	unsigned long vsiselect;
 };
 
 /** Context representation for a hart within a domain */
@@ -91,6 +93,10 @@ struct hart_context {
 	unsigned long srmcfg;
 	/** Supervisor counter inhibit configuration */
 	unsigned long scountinhibit;
+	/** Supervisor indirect CSR selector */
+	unsigned long siselect;
+	/** Supervisor control transfer records */
+	struct hart_ctr_context *ctr_ctx;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -288,6 +294,13 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
 		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
 					     dom_ctx->scountinhibit);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND) ||
+	    has_smaia) {
+		ctx->siselect = csr_swap(CSR_SISELECT, dom_ctx->siselect);
+		if (misa_extension('H'))
+			ctx->hext.vsiselect = csr_swap(CSR_VSISELECT,
+						      dom_ctx->hext.vsiselect);
+	}
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
