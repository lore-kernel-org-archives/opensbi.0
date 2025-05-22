Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0505AC54EDA
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0o7Vak+Z957Zw9DUEMUMbSbvSDY18D/2yPXqwFDgGc=; b=1o21I9eOA1IprY
	zsxF2VLMuR5+1QXtPKCQR3A+t9XnYNwGWyiMb+41pp/Y8Jkp9rObAd/Y6SuA1hfSmzPHmBWWYqiHZ
	97bCLSNiUeSU+S6ft9CWnZrIEeXcpfg9Z2mW+RcdzJUTKwq5/P8+oubZ8hC/lenFajaJQ3fx9SZjq
	d6JNhaqP/05RZKEHitf6Htvvj+J9W85kci8qYDL8mqL2d5pNtTr5Hl4WH3+9yg1rSSPa48B+CWn7T
	T7OUgWuLJMgc+Mdebjik3uRi4QRtsfPu1iVL2sDXWMpj7qnQXNMaLDY2DYcp4ZvvDFXG6MLTg40/H
	I4Y+bsJiaOMzKxXCdKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMZ-00000002C1S-2Ke8;
	Thu, 22 May 2025 21:22:03 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMX-00000002ByL-2NLf
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 21:22:02 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6422980b3a.0
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747948920; x=1748553720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0sKhGq5Hs2VK9+YgTyLFwoQR8WeEHRphMy+zS8gQJE=;
        b=moL/QN+8pgfNeQqqgnL6H+0Ri6JyjETYN1wic+Xvn89LfyH9bXLF3j4SsVmGEtKa6T
         y4UlkGiNf4YbDoPMEhDxFI5Kw4MGy7rHUMG6+GJkxT0m8XE9f49/7ccYQMv0OlbQHffK
         w+fuKGEjb/Z7ZapIubuQZeuvWpzv7z7V4bCK3BNcK8z+3cGrLkj9CvwmcvDQRIc8XUwb
         VPQKZFPMswdZ419ibD7yoGcZgMeb4Fz38HZBb0NUNjzOms5oaheiEKic57LamqsPT4oq
         AN+ksKs7cvNV1tXWun46LNyHNMhwdiXg956qzrWb59vthw9YlH0dh8OVJOp3gfvADL+b
         hBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747948920; x=1748553720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0sKhGq5Hs2VK9+YgTyLFwoQR8WeEHRphMy+zS8gQJE=;
        b=cmLepAeTVFgzyMiJS1X5PxxMIMMQhlYNWsSuYfd8w+r6xp07j6UnsG4LWxT0AZdRsM
         nuE1Dfq4mwSz0L/xmNRHFi2W7CQnWvEI6ZNKrmweC6vlhKf26HuyJe6sPvhQx1SQKUbE
         BPtBpqXSZA3OaNYRKMWQ6YXV/w+rBGy1W3XAaqx22bP+Setf71Wo7W0F8gGaDDt0TxLh
         sVUO3YV/cx5A5nxkQ2El0u6CzJ2eQRrZlL2nKTKKFSs7QG6OE2wugG4jMnDi02hZP19k
         lG7iVoc6KtsRe/Og4NG9Z1KtZFpV+lQLlnHW2RN/vqiLGXcw9PrrkSeTEkG9u05kx4ul
         Gmpg==
X-Gm-Message-State: AOJu0YyFekw21OrJt2i/huFCLMs3OaAXVREZDO8s0ugtt/HfrK189qEm
	F3B8MZyrDeY/Cvu1YOS9Vp/IQ+9b+sgBOX2eYbtw8+c+HlATc1MRNayowfO/2VY5
X-Gm-Gg: ASbGncvkUqjS5H8mAMkdWUGejeA9Xaw4AXSFs2/x7ox3bQqQl0EIEzsAUTX2LidUeF4
	1dHMLeSyy5g+SntB3OBPDJFvNq7l0IKhuziteFfn0Xz2YmRtouat+Az8zJ6lM7nM2yWdkkd3IZg
	qY4+2Agby8qt17jSfMN99APvXeI6Qo+Kxs4RrTGxb6IgpnCifSlSh0fNf2cXGgC7W7fcFgGUBiS
	alFJ0m7M5h4x3PNg/QfnmdJyM3CCPH+ZlwhnflSWEcbnvDwB7lxAXuawIhRvnfKv5f0EKibQ5mI
	uy2wJWc404kLcpzJ40lXbyj1hNgQW8Gmz2ekg8/LiCEObH2NYqLcggOnYGXpSuVQMA==
X-Google-Smtp-Source: AGHT+IEN9zO6xD2VDjkwArfr01IG/aOGZQoMxiwYsd24nyFADnnFXN8/xPW1YYDsZsfZE7Flu5A4Rw==
X-Received: by 2002:a05:6a00:4fc2:b0:73e:598:7e5b with SMTP id d2e1a72fcca58-742acc906ccmr33191673b3a.1.1747948920133;
        Thu, 22 May 2025 14:22:00 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e1fc3sm11629766b3a.8.2025.05.22.14.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:21:59 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [MIPS P8700 v6 6/7] Convey MMIO flag as specified by SBI_DOMAIN_MEMREGION_MMIO
Date: Thu, 22 May 2025 14:21:39 -0700
Message-ID: <20250522212141.3198-7-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_142201_627359_58DF8C7A 
X-CRM114-Status: GOOD (  11.60  )
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

From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Introduce non-architecture bit PMP_MMIO for this new flag, have it
out of valid bit mask for the PMPCFG register to avoid side effects

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 include/sbi/riscv_asm.h |  2 ++
 lib/sbi/sbi_hart.c      | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index ef48dc8..1bb2be7 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -215,6 +215,8 @@ int pmp_disable(unsigned int n);
 /* Check if the matching field is set */
 int is_pmp_entry_mapped(unsigned long entry);
 
+#define PMP_MMIO   _UL(0x100)
+
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len);
 
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 74ccdd8..49aaa49 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -361,6 +361,13 @@ static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 			pmp_flags |= PMP_X;
 	}
 
+	/*
+	 * indicate whether it is MMIO, to be evaluated by code,
+	 * out of pmpcfg mask
+	 */
+	if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
+		pmp_flags |= PMP_MMIO;
+
 	return pmp_flags;
 }
 
@@ -489,6 +496,12 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 			pmp_flags |= PMP_W;
 		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
 			pmp_flags |= PMP_X;
+		/*
+		 * indicate whether it is MMIO, to be evaluated by code,
+		 * out of pmpcfg mask
+		 */
+		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
+			pmp_flags |= PMP_MMIO;
 
 		pmp_addr = reg->base >> PMP_SHIFT;
 		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
