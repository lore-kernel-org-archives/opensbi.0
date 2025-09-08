Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A7CCA1016
	for <opensbi@archiver.kernel.org>; Mon,  8 Sep 2025 05:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUSgkKT8cmJ4CuFiaDmwO3NN3SeBOCJacEO+JT5cWzc=; b=inlvQ/ptGucByN
	xCnSKa9CJ8k6NdMrLf4TZhMxyErEMupn4b4lvCJuB5tSGPAnLSA047bhw8BfziKuhxc/XwoLy5ukU
	WNrAeyOjYw5LAedZTXCNY1662mt1xi9VDMy1YXhzfFTFW59CiUfw/rt/lsZ2x+PNbQCheiGkYt632
	bKj7JiNKoJb8lDwcS0FgCrVtTH4mn66+tr/lCBJRCX82squajTJYex/f21fEw1DMfJYujPlyZVbSc
	j7jbHZIO84wbr4Aaq9xdPOAw4zTQeU/JMn45BEUisxbpWFFxdMRvsnRBRHK8IF8FRfSo3NHzll39V
	FDFM6BStfv1/azcn9DDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUs1-0000000Epne-0igA;
	Mon, 08 Sep 2025 05:56:53 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUry-0000000EplS-1Pus
	for opensbi@lists.infradead.org;
	Mon, 08 Sep 2025 05:56:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-25669596955so6059355ad.0
        for <opensbi@lists.infradead.org>; Sun, 07 Sep 2025 22:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757311009; x=1757915809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsTO+X0DTuE37z1b8cUyqxNTPCEhjHHmrsnFAhLXDm0=;
        b=kquXXf5oar9+ip/vO4aeoDp0UZF1ud7axSdyBvbqlWAvmDPE0XTmdP3vxxPXB9SKiZ
         0FkNnY4YChuxmSy6aJdKFbYcXha0kqQg/Ku1I9W1YBvhwIxbQwj523fq0N6trOoeYm6C
         m19703AvCB8BxjzcnjMyTLSdFipRsXDeMmgO1RlDXcHZpHPlpSJRySLQ4uW9KepD+tQj
         xf0zJEhguzNyKNrZcEUVcKUwpNuiaGtLRqeC9fQROPr5ZM84zTKFTccfo5xgcl9KfvdL
         x2xCCkLbB4isSYK8pxd0CxbEWWoOp3NXAKW8KZnxf48MUSWjubLMhWicKrV9YN34s0L8
         IrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757311009; x=1757915809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsTO+X0DTuE37z1b8cUyqxNTPCEhjHHmrsnFAhLXDm0=;
        b=IhKeMX9TgYN1aJ0X5xKdNxCvheKZ3Imn9a1p5o4l9vN8FxQ3MtzayUrR5D839lXd7E
         MBtmd5IXPaPIP1jJU4pkVbhr5ZXTu030AXEFDgEuwUB7Lmgl0evrYb44dhEHV//HePTI
         xKy5VnrXTZHGVwkWTA23nTgqw0O+o6FZ54t00cffPRwB1NjadpT7Hb+PFZ9ocn4ZcJfq
         hl3/gUWHD6VGC8aWjgcGf2AqHG+2DvjVelEztbD9khAOnLy6fsRMHY7aNVvXFxO36sCY
         6szwRoyqx+m8bQgsSV0j4GliGjaKu/TXA81hm4z1A9G8ormNZoxE//7BEDBnIAbzUYym
         FPHA==
X-Gm-Message-State: AOJu0Ywb6ZP90mLjpfUfPkZGpxY3tXDAN3jG2QXhH/e2ee0BANPCZN4e
	fxRw7wrCUvDYc8u3Tow5H8t3Q1UVP8ph3z8vHVUoXFKImxgRY+DQ/7j4JuqfLLiM0kFWFuRHISA
	ZeZSjoCEWQ666oMIQyU0uEvXQL0v3TWeoZePo6ispgfj4KB2Xt0JO6e94YUgR25hc9VPhu4C1NB
	0iAJ/DwUvFmaMzkgir2s6Dcp3MxMCjEUUP+nCFgICk4EqNim0+WExDXU4=
X-Gm-Gg: ASbGncuZlUtXDAr9XqShO0O/s66uXKbcRkdmLsr3G0MfBjUatr2Z9pI9ZZlS1NAoQXU
	w4hlXgZX6OBdCwk50SvxktmC2wz+IA+PrskwfZi/F0UnmOFQ6tYc/0mzBwen2merGk4nkgv9c69
	hq2NgThBdUfZb19U2rKhiakJxVZznvRsPFzVytYRerZKd4AGKrvcR/TrqXd2BGspB1NsTOxTjWY
	4WhI8X0IP4R1nYkaTk0YaH0Vbyju6qhnimb4ImujeYrqvVGaJoKNR5q1KLYm8i67vrrGjnepidp
	3w07QAosnAAruzlkcv9R7l6WlfI3pXgSgC8MZil20RlMgSViocwoYITGG2EMgD+Q+IifLgdwIi1
	7W+llKIh9cxDOQ4Mjkd08RSovjkZf08MVpEL7oC2UTpdN
X-Google-Smtp-Source: AGHT+IHTE0aZbK+Y1m0UMcYysTi4Ql2HPh6497eFPge3Xnm/YBFkGE3+UF1QnODpGkWzjQr7dmzbhg==
X-Received: by 2002:a17:902:e80e:b0:246:2e9:daa4 with SMTP id d9443c01a7336-2516ef54db3mr100401365ad.6.1757311008903;
        Sun, 07 Sep 2025 22:56:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-252ea823306sm42894525ad.26.2025.09.07.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:56:48 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/3] lib: sbi_hsm: Use 64-bit CSR macro for menvcfg
Date: Sun,  7 Sep 2025 22:56:40 -0700
Message-ID: <20250908055646.2391370-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250908055646.2391370-1-samuel.holland@sifive.com>
References: <20250908055646.2391370-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_225650_399498_70A4ADC9 
X-CRM114-Status: GOOD (  10.00  )
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

Simplify the code and remove preprocessor checks by treating menvcfg and
menvcfgh together as one 64-bit value.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_hsm.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 8ec94d2b..bb274b33 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -48,10 +48,7 @@ struct sbi_hsm_data {
 	unsigned long saved_mip;
 	unsigned long saved_medeleg;
 	unsigned long saved_mideleg;
-	unsigned long saved_menvcfg;
-#if __riscv_xlen == 32
-	unsigned long saved_menvcfgh;
-#endif
+	u64 saved_menvcfg;
 	atomic_t start_ticket;
 };
 
@@ -431,12 +428,8 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
 	hdata->saved_mip = csr_read(CSR_MIP) & (MIP_SSIP | MIP_STIP);
 	hdata->saved_medeleg = csr_read(CSR_MEDELEG);
 	hdata->saved_mideleg = csr_read(CSR_MIDELEG);
-	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
-#if __riscv_xlen == 32
-		hdata->saved_menvcfgh = csr_read(CSR_MENVCFGH);
-#endif
-		hdata->saved_menvcfg = csr_read(CSR_MENVCFG);
-	}
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
+		hdata->saved_menvcfg = csr_read64(CSR_MENVCFG);
 }
 
 static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
@@ -444,12 +437,8 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
-	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
-		csr_write(CSR_MENVCFG, hdata->saved_menvcfg);
-#if __riscv_xlen == 32
-		csr_write(CSR_MENVCFGH, hdata->saved_menvcfgh);
-#endif
-	}
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
+		csr_write64(CSR_MENVCFG, hdata->saved_menvcfg);
 	csr_write(CSR_MIDELEG, hdata->saved_mideleg);
 	csr_write(CSR_MEDELEG, hdata->saved_medeleg);
 	csr_write(CSR_MIE, hdata->saved_mie);
-- 
2.47.2

base-commit: 153cdeea5350837c1206a2d2b6189fd0ba06d1f2
branch: up/mideleg-fix

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
