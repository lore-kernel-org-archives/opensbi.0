Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DA3606A338
	for <opensbi@archiver.kernel.org>; Sat,  7 Nov 2026 23:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J49GrnOi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=py1l5TRh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7ldkg413vvW3HIdWZOib2j8ZEqz3qqTwJ7wsfl+Q5ig=; b=J49GrnOiKlGX3nHw2QAqc6UAeY
	J5iBQAbTk3Y1/OY3VhPM/OlRDy0DcGrntSI2e0/fnDqjioBh9T5rYeL7UYAtwJ3NpGjl9G4QlSFMA
	Z9udKFlxYxztNSZISloQmsovHZf0nnVlttVvA0ZAQDF9f32kmQyPDPcQzTP78Lwr91sAXLbMF0lx+
	KyJ6mRunBFn27YDZtv/vBm4YHeqHwWgSxgxIZ0gDLhUUiJ7+UxL1abxFpiPI5F9ufNLD/t2BlFKVR
	eGFE4KKkQlIUIaAQY63imdUkBWt4fsAc14z9oXdlfAlnHUxz/P35RggUrUbImfQsjpc2K7OxF+exN
	UYIYtI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5P-0000000FVxC-0v8T;
	Sat, 07 Nov 2026 23:44:39 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5M-0000000FVvb-0Cus
	for opensbi@lists.infradead.org;
	Sat, 07 Nov 2026 23:44:37 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-37071c0f42aso236024eec.0
        for <opensbi@lists.infradead.org>; Sat, 07 Nov 2026 15:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794095075; x=1794699875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JI6OL438bJagJ0EytbWaN4fKjwIqF8PEn6UQWeGndwk=;
        b=py1l5TRhte9DHMncpOPcod+CRkKHAeIJ0kXf3bYYWKCBUZTwUzFiJ04Mm17BDUcLrV
         OFdj/DJ31LLxtKNzIa2CvU0shz4zOjKKbi3/2OIscB+Qsez3bgjIsO/+4RdupyZxxfna
         z22I5NyGiWXz5jgYIpZntptrxSeI8XBL9QfMpJuGmziltXTu8DA92cwv9Fa6HbbQb1Ri
         U0t85tfKZHLtXBjjHj8oY+LonzaSzVu8Qh2/RW+98Whs2LW+uXF+g+jLZ3JU19qzq2+a
         ryQZ5z4SgtuB97XUFiaHMi8wlNvjTVhsslLajai28gahHI8JZWOVTJoHtqcMic85xjfa
         QnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095075; x=1794699875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JI6OL438bJagJ0EytbWaN4fKjwIqF8PEn6UQWeGndwk=;
        b=W7Y92WuftL39as6H3A4XxuBGQO+RLl/8MViph6YacvpZGeYjPrLsEVCJ28LuTe+ESX
         w8bKCJ03X1lNaCdR35yOK2YbVX7t7afE8T/00iBBoewg5bGBb6kiaBlJSBHSShxrzTJ+
         rYZQ8YbqV1votjYAy6WvNZ2HexzrTKNPkNPguzg5bZcH0LDzQckGyXkizbS/WikwIdgC
         VFJw+m4zaJlEJolbcZmpJe2jh1v5VOY+YYtjczA5FHMVC+3ZL5LzaX1ZbnSd5Bh1Ww+l
         f0oej2J+6zrB0XImx3/EhuTSqC0LJLrHS31nXHjVYKEg5Lq9nxJ/22QJftmgCU4VfiPx
         Vcfw==
X-Gm-Message-State: APuU4Z+ayr35AuC1iS32dgC0coEcwwhC+NnJ0qo9rJ6nwPjeI4QsxY5T
	cJlQ116U7x+Ji6O2G8HjJUKsg7Vgmy9e4bfWMVKmHfYhE8NUSkiDdxtarLY53Yfe
X-Gm-Gg: AYBFou0qDF3c5gphtXQkfosOJR+YkrZRJkUOCSKb1aPJ2TDcNjOpup28JdFu5axjVzm
	itPRZv93P3FghiDSXIXjMar/XBJRcLxoLyAuLCL4Moajb1mk7BmIq4QrOvUQ4d8sE0+m17uWvty
	7lp2HJRSOH94Ix6HrE3eoSBOObM1LNX//SFqswtPCI90I1cnb4VyhDlTuPt/6h6cLdR0E5XWZTZ
	OP/F5f5lTyIoT7c8dnaXxUHQk1tvdN2LhfbN9alDSIflKV9S1Kpk1brkPqx63ZUbupqrkKH3N+O
	1AGHZAbpsBMj2mEVdQ+NYbRSSRt+PGmZR2qTsTaWNVBcJmzq4sFEkVI73cMY3dv2WF8RNO6DSvf
	jHlI+GG2Dd6GOObhIALNrv4fCxzFOoKwD+SUSRHSQbPkRlfbZ6Tl34U4dV/zmFZaakNVMyDYnE4
	2uAbsOxdlFtN5L4tvpSdIuPeHmwvtkEukIsJmpVCqxHdLPzh11DsIbkBgrSCAHzuGlQtuaZpE9l
	N0pwA3K0rimI/ljOTlQmIdYrhEu7DwOJOuXfA0cEho1pqEHw+llzoDve0Ni3MdkGoQaTvRHHNXk
	0kw0lpmjQ7IBwDHKGemyx84istavHKKlZ7o2jzlwf9IEcUQAFvv092KhZkQTeN+xN9Jj1Riy46T
	auifVjMIteFD9CkYWPmBz0ewkr6nBfmM=
X-Received: by 2002:a05:701b:4293:20b0:1b2:60b2:96ff with SMTP id a92af1059eb24-1b39ff06b0bmr58418c88.38.1794095075279;
        Sat, 07 Nov 2026 15:44:35 -0800 (PST)
Received: from aster-MS-7D31.scai.dhcp.asu.edu (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm1819730c88.6.2026.11.07.15.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:44:34 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: samuel.holland@sifive.com
Subject: [RFC PATCH v4 2/5] lib: sbi: Preserve supervisor count inhibit configuration
Date: Sat,  7 Nov 2026 16:44:18 -0700
Message-ID: <20261107234421.137100-3-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
References: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_154436_094230_21A74872 
X-CRM114-Status: UNSURE (   9.68  )
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
index 7500c391..9c5c7a7f 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -89,6 +89,8 @@ struct hart_context {
 	unsigned long senvcfg;
 	/** Supervisor resource management configuration register */
 	unsigned long srmcfg;
+	/** Supervisor counter inhibit configuration */
+	unsigned long scountinhibit;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -282,6 +284,10 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCCFG) &&
+	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
+		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
+					     dom_ctx->scountinhibit);
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
