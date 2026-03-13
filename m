Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C10105F7AC
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bcVFPOS7wqTYnP2gqctGabTz2p/gf2cbXo9CwjQRNs=; b=pHSWyFPedLkn1e
	IcvB3j5PzwPEu1FK73g5Y2i1WGug9BEimuyr+ctgf+4nOWhuARTTS8Cr4/lRc1CQpCM2Xl39i6Pnv
	l3FclVVpkebJY5X5RBiozzoVbxBt8KrBKtV1ajb+DrbOhU4fgAL7iiv3y4wQPaVBNWm94WiOT3E7h
	V+8uBJmAm3FZomScOckCsAVXts7kKAuF90QvLwVGsnYL9et42rx1QtciQmnBYUFFKsS+yuV4FAF/i
	BPidroVFcaxG14MNTtJXSJ1nPYatc9zbNKCNVc7XmaByTH1MVVpc1PnTEqEcjWKMSnpZ3XWqHm9Zl
	ExDoPhmzW9hILBpv6D8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12k9-00000000IW6-0yEb;
	Fri, 13 Mar 2026 13:39:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12k8-00000000IVC-1vx8
	for opensbi@bombadil.infradead.org;
	Fri, 13 Mar 2026 13:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HYSreSM9ARWESgh/9suLR8UHf5wjfLBXbLlT7aroYNQ=; b=IGZzc3QGbSN1uQq4YoKSP8+lKL
	/dF4jOMw3T+KSV82Vcy2hxLQN6VgFLh8/wGdTdYZRAfrWAlbvHxrOBjnI8XCfSMULXl8sgVsZRBYu
	skk2XOPHH2kcDPdBEzH9wlr21DR2HObjVBPd/n9+hU6cpAiMe6MkKp4ZVkAob/ArWi4Zva0qS/wAW
	ESDJU2fcln7dLHUtcssTdkhlxH32lup0ubMxDYkPAe7bifNJbYrr6gFasHJSIX6e2Lf6BM8Kj2Mw1
	+l83kMfQz5P0Q9GFobtmm3DgOdsrzmwFJziVgJNjFZlL7MsSV4BwbDDpxYz12lPEg/3HCJ7lq0bGr
	tAgGTHqg==;
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12k1-00000003PpC-3XQF
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 13:39:54 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-126ea4e9694so375663c88.1
        for <opensbi@lists.infradead.org>; Fri, 13 Mar 2026 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773409184; x=1774013984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYSreSM9ARWESgh/9suLR8UHf5wjfLBXbLlT7aroYNQ=;
        b=ey1P7EdA8+9pBF8x6PAMnDRKn84tKQMdkHlmcnIBzzUhzdlDt8TuY2Gq2B/3rNiFcH
         TBKx/h8QRSpmwI6Fi8dfKimD1G8nn3foIulsIZ7soh4Bf4fjD5nzOlJRHbxcNsEDMSEt
         /NBkOsdYBCNvnPnAcARRPhvSbVb7BwewPtt+ZMnKZqU/m2pEOYPt7qOlZhQfeZDUV1an
         pBj4377HZuakuBygx1GevMll4Ej3OYOqisZPO7uLUV/VyWHAai4THCcMmDk/3Ugp22wL
         LRqLsc1i2w+P+F8q7uPfS1LAk2G2A600fbBHdsFKAj7XLEpfQkJjehOua7bm4oJC+FJp
         z5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409184; x=1774013984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HYSreSM9ARWESgh/9suLR8UHf5wjfLBXbLlT7aroYNQ=;
        b=iucEhghM0FZ+82Cye4QfYVa25WVAHJBa0tLvnhcZGez5QdRqfQcTt1NwF83ayCNy7E
         zQtM+bkXPI4pemPAXWSJgIwjyN7WyoGmDv8U/dSF8/SHyAeXufecFfV3faDNInNr+upT
         xKnfSoiy51/L4AhRNoswMZBOO/255G+bPRPhng2RxdalLT863dailTALJfDkjaeDJGw2
         95IMjCUJBJIJZCltct3XNlK/dMLpurhhpFBF4o1XgVG5u+fcmQTqT1MKNTJsFT0Li4gm
         zvNhbeT3T4M0LIkLbrJzgkwlm7x3uP5lU5/qdsLuTt939RI05X2edHlohkZiLhzz1U4G
         3vQw==
X-Gm-Message-State: AOJu0Yw9PCn/sqQ3S3kTnH1aBmIBcaJzvj2QDkpH31qJCMKAZVTOrkks
	gQIlasm3YOHnlTGour2lJDsytgVfMZk2rFhKG8C40rNCO2uWpTcXCJjqtaqn9isz3kaNYG3yiwn
	xoEndrv42V5FuARlVJNvvou06Ux7wwH/m7ggEGrqaqIUEw0JjZ2TtOJkiVplS4PdlvOXvHpFpCB
	GhzQZFbtAL7PnjjV1tYHj4nEfMVzBK1oDZsV2xWNT4L4NV5rESKA==
X-Gm-Gg: ATEYQzwRnlL267baFuMaqNyGNS+UdRPBk94SfUyn9Mhex5ShEsMh8umrqlOiiwo0Q2F
	YXhCKMi1A3BfQhwU5GalG69VG0Odhc5jFRM2rMaa/LpsVIE/GgI2f2lwhcZX8OS758G6vs4AAOB
	cVGKKf5LSlIsHj+jJbj8PITy1E7nMk5pGW/WKS4eLSoNGdfDK+x9zTPqawEAXoOoy5ZFaEjFvkh
	SZCPp6AwsJKk+tzTgjMjjIAalmG3DW8UogDdOgTnKTi/txXaFnaizXooI3j5KajuG7XdccQzqLH
	1/q5iS+6twIfQc57q4deGbt0eCtUFkf++dl2XtuqRBCqwwjtdMzUt/cRDET2Q4jGhGQJdwqwpTl
	zBKez1PhVMRFuQw0tviKLD8E0mi/x0NbHdMRjoQdUECLKatlOpNxsv1/l7QNKnzcRTzuYpjn65s
	DhiRkCj6EktVn6CcWFDO7SQ4x1AjphlM9TosLHn2Q=
X-Received: by 2002:a05:7300:2208:b0:2be:37d:3d6d with SMTP id 5a478bee46e88-2bea560314fmr1729116eec.32.1773409183828;
        Fri, 13 Mar 2026 06:39:43 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab57b1d2sm2441671eec.32.2026.03.13.06.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:39:43 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	anup@brainfault.org,
	rkrcmar@qti.qualcomm.com,
	atishp@rivosinc.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v4 1/3] lib: sbi: Add Smrnmi extension detection
Date: Fri, 13 Mar 2026 06:39:39 -0700
Message-ID: <20260313133941.3012966-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313133941.3012966-1-nylon.chen@sifive.com>
References: <20260313133941.3012966-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_133953_103273_1810D7CF 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

Add detection support for the RISC-V Smrnmi (Resumable Non-Maskable
Interrupts) extension.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/riscv_encoding.h | 12 ++++++++++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/sbi_hart.c           |  1 +
 3 files changed, 15 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index b5a4ce81..386c1720 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -215,6 +215,12 @@
 
 #endif
 
+/* Smrnmi extension status bits */
+#define MNSTATUS_NMIE			(_UL(0x8))
+#define MNSTATUS_MNPV			(_UL(0x80))
+#define MNSTATUS_MNPELP			(_UL(0x200))
+#define MNSTATUS_MNPP			(_UL(0x1800))
+
 #define MHPMEVENT_SSCOF_MASK		_ULL(0xFF00000000000000)
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
@@ -780,6 +786,12 @@
 #define CSR_MVIPH			0x319
 #define CSR_MIPH			0x354
 
+/* Smrnmi extension registers */
+#define CSR_MNSCRATCH			0x740
+#define CSR_MNEPC			0x741
+#define CSR_MNCAUSE			0x742
+#define CSR_MNSTATUS			0x744
+
 /* Vector extension registers */
 #define CSR_VSTART			0x8
 #define CSR_VL				0xc20
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index a788b34c..937cdf29 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -87,6 +87,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
 	/** Hart has Xsfcease extension */
 	SBI_HART_EXT_XSIFIVE_CEASE,
+	/** Hart has Smrnmi extension */
+	SBI_HART_EXT_SMRNMI,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 60e95bca..495ad1d8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -396,6 +396,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
 	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
+	__SBI_HART_EXT_DATA(smrnmi, SBI_HART_EXT_SMRNMI),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
