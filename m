Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1852606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 02:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MPL74d9D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UeDoiJxf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KQCLQ6/d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L2p2mGj9nxHYCgpjIO/vYdmuskDJQQ7qcR8SkyCCRbo=; b=MPL74d9DWyCK7IfcMuFww/rL3L
	dsSr8yHw/L7IYw7vSPSfnimoZ+zRdnah1+kIA2Ii4R1HBK6Ru6NSn0YujVQmjoh84wO8930/XUZlu
	pESeFZE6HgQ+c4MHf8f0qaiiCQS2FlfxSVpFQ+stUrczOKNkXQ/IxYQQg9uB/06NuRgdd85jtYsls
	Z66epAnSrm8ekqLNnCdI2v28fCatbOI8Jwn4AdIcA4ybEJhWDShQmevCHgPyXrBd0wISuAoWfKppS
	eckgB1Xz2sajubgj1zLVH7RDDwjxDzJ9sfIbO1oZEgSvGOGT1NdpMK8NAy+AWyIIj0DlFnjZMt9wa
	C7veW7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GK-0000000FL6O-2pTu;
	Fri, 23 Oct 2026 02:44:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GI-0000000FL5v-4BFP
	for opensbi@bombadil.infradead.org;
	Fri, 23 Oct 2026 02:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YoGSYa/aHzVsd+2Ic3EaAY8wR7R0mGw0C3L9pPOEIBk=; b=UeDoiJxfg1AKoD4ImkQ4R2V3tp
	zlAa0uJhqeZXConMBYBnU2EsFMP7egE8UHfpUIlquWfBXgIM3ItoZ7rbDKUcMVn8uOopz4pYsNiRk
	yrCYqTLrgq7bi3GvoG7ZGo4TV701U+1u7ff/HFQINd5uQa+85QdPu7+UrAOmY30uyTU4Kk/5N9jvU
	XZ3ruxbDe979CaFlFg01fafEJK5yni9JV/UnH1y2Z+cXOTvC2D/Dy7rgfnX7Nx2c6tknCarr/jixf
	LmFMMbV6H/30yp0JOs1UYTHryayEg7z48vMi2zR8YeGp45AP/hAzrlKEotpAvskbOmeZr4ZjIHNtT
	+0bLD6PQ==;
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5G9-00000008Ycc-2WyB
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 02:43:59 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1846bc43c28so477660c88.0
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 19:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792723435; x=1793328235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoGSYa/aHzVsd+2Ic3EaAY8wR7R0mGw0C3L9pPOEIBk=;
        b=KQCLQ6/dARjaKTzoIl0l0gV+ehMhscP7lBWS/sBCsNjWzfdUyTXsMEQ9PoTMxaWAsV
         cQ7DIjldW1gqPxoaCIjxJxEKXUiyTlbOTmgw9Bcg+JcgS2QqDiG2k2nBs0EwqUVdWM6V
         /rpUzaOjHCWmp7jqiLYGZpRzS2j/iPhfTV9TNB4B9BBjsxC1UP2b+u123NwT70hTm2Rz
         fXL3rvdATiCXRB9nR+25Q/H8uLRsmqvGcgL53EE0dLcX9v5V8/hjPGI/fGs0oTIiOKIP
         Zb6ZA6KgUX13E/9EwctZ4nPceQp1mR/NvQCMGE1iI+CvjJoKdgRki4hlEExhLLZf8XIX
         qMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723435; x=1793328235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YoGSYa/aHzVsd+2Ic3EaAY8wR7R0mGw0C3L9pPOEIBk=;
        b=OGEHOYf8v3Q09Xnc8pKX2G7ZXwES52wgTaollzU+VtdRfhrmY2mpw2FY1XDr0pO0Ou
         9dPrB2UF7Ish2yoBH7f0KLHPxVf9nngRJQARNMrbckpnpytdlwdsm8U6XJc8MOsVBrJx
         jG+T2aTae8b3FfwJ4VtHjHDJzTSJ5U2lYVd80W71SkQe+hoaNAqIQgCqSUC3g2XkhV/j
         wNg+JVw7sdtR2FzSecfYSrr9bLaItHEYDdANiIyKkUGUHkEnUSJgWpfXa6rIqs2tKVQO
         iqHIiEMrhUtQAT7LqSPH4ZTsPzJKT2OysTh8zc/yb6xRaUvmEjbu3rYfM9fq2ycWB9HE
         O/DA==
X-Gm-Message-State: AFq9FYL/sYknQOxlrn6TSNkCj4iWZULyEEybwirSKjgeX0LMZ7ek26Gt
	HNJiWYW5inP50GAG6Hk0HXYIzL/oUxDmvP37mvD54+NP3f7Ax2TqyAkGHbR3QBWe
X-Gm-Gg: AYBFou2ovArMcMdQDmZikh/a4kfe3jzeRUvqQH66bjEbKf2FMcHK6dohLaAnP1l+kba
	vEsYH62TS8XlZQBJMjQhGWj0yHf+B3dNFwm/5eJJuQ41+fS6hyDNn5S3KpppTuJBDz41ckiS53m
	IjOdXaEp8AXCS7m4aClMjDYfS8mn4/2apuxnLSz7cWHUZJR3DCbPgm+a0EAQg6KX2Ja7zUksX+M
	sIoickczCMgroETKjfXDoi1WvZjhKtc67ZrwWvydNeBOQbcuIRbfmYQMI54gWQggVmxTkDlT28B
	POjra1z3BANdQKE1fE9Tc6eWtbKLrUehS1HHSnoy7pMwDm83+xtVSuGynMDv0H1yF9vQiKnxXch
	x7e1ODmBpnYMdpy6TU7rj7yUiLewhfwl626/YKZ8Tllzb6xQf788MTmL2n80FCLHBj3fdyf2cL9
	/z5V/7YQrXxqtGIqCPCAvTRkkJZFI4PQKcLAmLmFVSpBqVLbooO4UjP+QMoKWDgHxIM/UnXExgF
	wmxE//95uEgbHqMgy42tPNfIe2iDnjWw68zf3nUwzdX8ngoaCRX2bZq8/U4+jlGBAtKW/nP1+vz
	3HuaCdpTT6Ng7o+xbmEBadD6v74EReExoEiHfih/9kvgzc39O/7lDAQgWg==
X-Received: by 2002:a05:701b:2059:20b0:136:c443:80e5 with SMTP id a92af1059eb24-195c0180d2dmr1345134c88.6.1792723435232;
        Thu, 22 Oct 2026 19:43:55 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb6c3fb2sm2877233c88.13.2026.10.22.19.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:43:54 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC PATCH 1/5] lib: sbi: Preserve stimecmp across domain switches
Date: Thu, 22 Oct 2026 19:43:41 -0700
Message-ID: <20261023024345.16779-2-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_034358_133713_C61C87E6 
X-CRM114-Status: GOOD (  10.49  )
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

The Sstc extension provides a supervisor timer comparison register.
Without preserving this value, another domain can replace the
previous domain's timer deadline.

Keep a per-domain timer comparison value and initialize new domains
to a future deadline to avoid immediate timer interrupts.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 0861d541..26980658 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -50,6 +50,8 @@ struct hart_context {
 	unsigned long senvcfg;
 	/** Supervisor resource management configuration register */
 	unsigned long srmcfg;
+	/** Supervisor timer comparison register */
+	u64 stimecmp;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -145,6 +147,8 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSTC))
+		ctx->stimecmp = csr_swap64(CSR_STIMECMP, dom_ctx->stimecmp);
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
@@ -206,6 +210,8 @@ static int hart_context_init(u32 hartindex)
 		if (!ctx)
 			return SBI_ENOMEM;
 
+		ctx->stimecmp = ~0ULL;
+
 		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
 					   SBI_HART_EXT_V)) {
 			vec_size = sbi_vector_context_size();
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
