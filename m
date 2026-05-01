Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A8CCD342E
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+hCkdphGhH4d24/QONrTMeuFInxdGeUXuXf9lu25vM=; b=OWJJTwzFbC9A7j
	aPNiu71KR+J3ZG/8/22PI3CHAbX1jAsGAIvRrGUAy2ADVLh7psEwIL2QE7NMxaT8UYEa0kCKq/5nA
	Rl9j/zqNaZbORYdXZXcb41Yxt6y9PvSGuyxhdmuG/c9HE0nD/pW+Ju/X5JOdYjUhwiX+FFvg4GCxl
	Nvp35G78FUH70nUHTLw+sqZI7LaEeEIn7//p+STO5c/GW8IX67jK2MPp/TFhZz1axEBdlEbyCtaWL
	YF/RRsZFo1NhwwEiEyyrDKkIx9j3nuPgeHciFpFuGqNUUgWUDkED4NRiJ2H6JB9t6VBtJh7w58TG9
	WmsXxncFbb0kXyt44f9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE6-00000007gps-2TB7;
	Fri, 01 May 2026 21:16:46 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE4-00000007goN-1aPs
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 21:16:45 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-12c7288cfb9so153473c88.2
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1777670203; x=1778275003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSZhBQItjwmyUYAL8I7VshwlWGe3+bTqFitH9tH6nUI=;
        b=h2sayeL/X7//sWtmjEniVptrGzeS8NnxRa3gpfgfABjuKAIex8PHbqz40ynWC2ehlZ
         GoHxe4jOKtg/etz4SMDrEQRAkgtdnUAEfmSp28ysYEJJqKtrMCUsP3cbxfmUkBxzAyOc
         tMg1g+FhK6+0p2HbTWA8yBFgn5M/mYxHq8tuXraG3dH1o+PvN3vcLsJAyvawVbxlSn17
         WQrEgDItPg42S8xA96PIAGYxvNXEMQynIDvYKUiICyg+A0hYttLMjKN1q1b+fisvUg+z
         sDvjZeVP2+h4KRmAm5vCQ6v2VmG6AmjtAFQEjElNXMoxmiWYugEiJRUeW/FBUqUatuRz
         yqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670203; x=1778275003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OSZhBQItjwmyUYAL8I7VshwlWGe3+bTqFitH9tH6nUI=;
        b=CphbHjrWafazIEuLFWbqb8uSh7sw4PyKA5KR29qbWndK/v7LGsCKZg1unWxEOYjgM0
         BjX/DOFpXEKIMldN8m/2o7Fz8aVyFRjvDyxgj3kVRWP/ZcezohEd4OyMD3lePlZskDm6
         Tb84yTAUuwMmsNrFe+NG7iFXjJSj3SssTwMwbMWksblpMVBmgfwZxSZft/UFDPg49WUo
         xit74zpdJqqH7UFPr5RxdSDykRsVDtKV4EEffC9+QLDx/8zJu/K8srisfegyiRU65d+K
         rNYw8wXcmDu7HeVEYeFSc2dmMfr7rXCCBrnLpknssnnDgsQsTLRlG3YVwa5YVov3PJNb
         owjA==
X-Gm-Message-State: AOJu0Yw6Ww9ZavpiMBmaHnWf7YVT9IxSLdmrK4itsxVyubEIUw9DY92V
	GmFajdtZ6HxyzfyEw92MKfperXw+8hyGQwwOIXCsQffRIE8+JRNTDUyyzw8XGHuPGFYz823mK+s
	9ARbp
X-Gm-Gg: AeBDieuS7jZft7K8mI855m1dwgavmShb126F9BPVNF6dHdPBYQURi8gXmK5i56lJWdt
	OlmN0+HlzF5itkgXcPQhy1hc/YHcmq606fLrmbaCpbIWytWKcMGbT15HgkeWBNF8BDmMgaWiFAH
	karRgmWLazoHoCnPq6w9uFRu/fT0e/a4g7/ZcEXP+dtzjReZC5z6NGtpBbbaOPuNVmrjJXrFMEI
	b7VVg4/R33wZnDfLX9kYatj8LSZaYdnblPnTsbMvPd2ufOGNBuAPXrPXdSyl0Dna6Mone12YiHW
	rOlh2zNW3TLBYaOw49wWaUpPTKacoUsTrGNJKRTeYFTeUy0NCh7/1BfFzURgSPJIXnjxgCpLi7z
	WnJl3lhWRJt9jLQNh6KZb3zYlm9t6etLwyuxFEgcG89/vJ7ffLpm8dW9fWtd8f6WM4SUL1zMuJD
	CINVbVS8DZ61EnLMX2wp3RdWQ1yEVd7KCvFpFogBI+lGuMsg1PvP1DeNRMHJH8
X-Received: by 2002:a05:693c:2c11:b0:2cb:de38:c76f with SMTP id 5a478bee46e88-2efba27a488mr189882eec.6.1777670203282;
        Fri, 01 May 2026 14:16:43 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2casm5879308eec.14.2026.05.01.14.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 14:16:42 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v2 2/5] lib: sbi: Add Smrnmi extension macros for registers and bits
Date: Fri,  1 May 2026 21:16:24 +0000
Message-ID: <20260501211627.3293126-3-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
References: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_141644_414411_00BD42B1 
X-CRM114-Status: UNSURE (   8.97  )
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

Add CSR definitions (MNSCRATCH, MNSTATUS, MNEPC, MNCAUSE) and bit definitions
(MNSTATUS_NMIE, MNSTATUS_MNPV, MNSTATUS_MNPP). Also add SBI_HART_EXT_SMRNMI to
the hart extension enumeration.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/riscv_encoding.h | 10 ++++++++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/sbi_hart.c           |  1 +
 3 files changed, 13 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 3c1d5256..18f7b4a7 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -215,6 +215,10 @@
 
 #endif
 
+#define MNSTATUS_NMIE			(_UL(0x8))
+#define MNSTATUS_MNPV			(_UL(0x80))
+#define MNSTATUS_MNPP			(_UL(0x1800))
+
 #define MHPMEVENT_SSCOF_MASK		_ULL(0xFF00000000000000)
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
@@ -830,6 +834,12 @@
 #define CSR_CUSTOM10_M_RO_BASE		0xFC0
 #define CSR_CUSTOM10_M_RO_COUNT		0x040
 
+/* Smrnmi extension registers */
+#define CSR_MNSCRATCH				0x740
+#define CSR_MNEPC					0x741
+#define CSR_MNCAUSE					0x742
+#define CSR_MNSTATUS				0x744
+
 /* ===== Trap/Exception Causes ===== */
 
 #define CAUSE_MISALIGNED_FETCH		0x0
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
index 99e13990..4aefb759 100644
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
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
