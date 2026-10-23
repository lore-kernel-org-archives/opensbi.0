Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC81606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 00:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ifYMHUZy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R/xKBPY/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BuwUB7wpjLIYrfHtaJjIsj29FPnV+7ARAnb45dpiJmQ=; b=ifYMHUZyjyg/IF4tohpYtqsumU
	CeQJ7vBPo1qM0z9IzezLPMlppGS0oCf0Ok5HoRT8MGzLIrKU+UErJEitPRM+Ad8t81ztYj/I1G7xI
	Y6g35r+gNFZtcNgRD32tSawHIq6aqNWNV0j+5DESSY9ohshLHGSnH0Obft50WirsjddnmrySxXqt6
	FYZPGJedKAAOG0Pw7rhLX2joxRGowoH4mbQM5jqglA84bHym7jR2sY8flmFMlAkT8Xs3sv74uDmhK
	lG1MFNQqv/Zg4ITWz1LqRBFxZjqIMzS6sm/LUYzMe6zcEOMl6LvQ54sWD+kWPu5pDSMV1JyqhffGU
	Q94T0kbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK2kB-0000000FCZf-39Uv;
	Fri, 23 Oct 2026 00:02:47 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK2k9-0000000FCZK-3PgD
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 00:02:47 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-170135e43c7so369248c88.0
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 17:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792713765; x=1793318565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W55BbdfegJdMzmaby79fKER61Is1aGQpGXypPMLCXmU=;
        b=R/xKBPY/NpzyH74doeuI6ze5woC+HWU7S0TQWEbdf3CnuUSxytIuGVdqBO0pd+5Uwk
         DoL7QMOR4nUjtcy88J4dfBimsAZBuXT6gNn5gORUpXsm1Mic8U0G2etcGrEs9/ug/kO/
         rIMPMAWo9Uwdxh6C9H8X85g424ndVrbOA/+lBLACnvZsYyA0nxdB/0BunS1fufrg3q9j
         0oi8u8LMvhR16V/OA/0GSxwIVVfVyjWDmtfYRQg9l3kzUoj4i6pBE7nfMZE49sKbKDFb
         plvMpJCBArHHhRljiYsf3v1WDIIvDvAsOZYMDkk9TYPP+PRBESmnL+3Al7SkIEU0TfI1
         od2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792713765; x=1793318565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W55BbdfegJdMzmaby79fKER61Is1aGQpGXypPMLCXmU=;
        b=fpccaLkaDKJfmwJO0U0JHo1gVu17Ya1I2BjiuS3nYft09+CYpxTFdAmsealy6BmW9B
         j61BrNim4MJ0DxTjDdFF1LxEsEuD+X0kPxxaAspXOdNPu2owqOO8cRy0usX0aTnnRJ3U
         RDPyEhJoPOpxqBjrsGnjEvQPaw4OQR63yElmxmCc+CYInXLYQvm8RLzgFNP6Sb5jVPtX
         1SZ1pFq9O+fQetqlRLww5l/NlmBfP3D62n3joT+k0f4YVtlYE5SpLFSUjiZJ2WBXOXPV
         fp7JFewrEgXpy6kEW/6yUHTzm344LUfo0vXB2G1KesbjywTAhgG3EkUlaq96MI0WTVaf
         m8KA==
X-Gm-Message-State: AFq9FYJT5pznYjLVoCRQ8EwkqU3DNQVrNuZk0pEiLfopFeMtqvAaZ+vD
	dqkaoXdgmZSMCCDfhbiKR8hslwygBykVyhUPROPIV+3D/6y4ogx4ApzJ9hOrDKDt
X-Gm-Gg: AYBFou1nNZ/OE/pRtOo2VOX1bH1/fFexmqEl+BoPy7/i1pz5i4Vg4kNZkhn+wFzvqQx
	Cpc5gK29Dy5EFFlUC9J7O29NPJfzPnc7aHwht/D4XVExu9k7hQs5DmqLObJgw7kA8n+Iz/rf0ht
	I2U3LpQnFt1ZVSPkDnpP5TASoXW/1Bl4Tss3OP9DTuxPt7FPJ4z8FFcruNiXsBEJ9a3kUzLttvc
	Xw/i1mEBrmxPuzfH3/tNHMvXgPJD//PCWgWxPsfOtYtpWy/g6FHVCLWvdJYzacO9ou/ThEJ+jwN
	YI7DqWFIMj2yvmVJCWO0IyH9aRZumlai+Sh49BwiNOFJlv6MR1pe1WCUcfIQqZOmaxS0E3Oodd3
	dfqvDn5W1o4u8oYdAHSpQ24DEAGcSVtKeJqi2J/x9YSsm8gxvyhtlVPeu0ATAsDYLTDWciqCo0z
	PeaT+2VTj7s8TnwhnNJnTUxES3pA7N/6By9V4OJLbHqJQ74JSDBqhw01R8EFG7UcCKj7qMvgPmI
	pVGWhEnMkPunsj56y7FUsRsthvPtECF85vqAuSaVIqdnNHFSMvlUvv4yBm7n1k5ocaX1sbqzu+C
	enLxlppxaQW/Gaau+hA59bS03jA2zZ1ousv37ozieU35q/ALFTqFNabcIyISetzUN/4Yq8Z31vg
	xGFE=
X-Received: by 2002:a05:7022:628c:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-195c56fdc43mr1487369c88.26.1792713764646;
        Thu, 22 Oct 2026 17:02:44 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9de20a2sm1388381eec.21.2026.10.22.17.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:02:43 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: whensun <theodoruswensanfebruanto025@gmail.com>
Subject: [PATCH] lib: sbi: Preserve hcounteren and htimedelta across domain switches
Date: Thu, 22 Oct 2026 17:02:41 -0700
Message-ID: <20261023000241.345893-1-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_170245_855891_6A67C9E7 
X-CRM114-Status: UNSURE (   8.54  )
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

Save and restore hcounteren and htimedelta when switching between
domains on harts supporting the Hypervisor extension.

Without this preservation, a resumed domain can observe the register
values left by another domain.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: whensun <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 0861d541..31fa5afc 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -50,6 +50,8 @@ struct hart_context {
 	unsigned long senvcfg;
 	/** Supervisor resource management configuration register */
 	unsigned long srmcfg;
+	unsigned long hcounteren;
+	u64 htimedelta;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -145,6 +147,10 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
+	if (misa_extension('H')) {
+		ctx->hcounteren = csr_swap(CSR_HCOUNTEREN, dom_ctx->hcounteren);
+		ctx->htimedelta = csr_swap64(CSR_HTIMEDELTA, dom_ctx->htimedelta);
+	}
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
