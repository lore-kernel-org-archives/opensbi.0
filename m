Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7350FD4F1A
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 18:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Rz0smawlV3ZHyTIAinEIPdjtVj8ThxQOvjkN6wqQyY=; b=EF590KnH6Hu9fm
	5HquuYz5dGP0rlLsJpzIegnDOi63e2k6N7hl1oGlqzGJFFwhA5g8QOtFzGHkM8Tscu2CoFw0JMGN1
	Ji0iL0tgiY34zwkjVMPS4QwXn81yXBM37sNImRXp41rsO4gHYxST88HKE2ckD3ym1oRgb/qTV219f
	G1jRPy0VbAajPzUzcLNyp+xQrqDE//RWYF+bgj4jMXb3gu9F2/I8efRSy5la9kTll8uOQ/50p0oAC
	Hkd0xYm0I3cwItS24KQfnP7yQwFGjrUo82/digxARpWu6e/y8DROjeTcUcbTd+xpXGf5U8eOfh0aN
	OIy0uGaKnEEu2oXujghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tY-0000000A56e-1in5;
	Tue, 10 Mar 2026 18:33:28 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tV-0000000A55R-3ha4
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 18:33:26 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2be2425ad18so457793eec.0
        for <opensbi@lists.infradead.org>; Tue, 10 Mar 2026 11:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1773167605; x=1773772405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzU+GqgfamipmvnoIKT7xRB/NDsfY72Gzv0yTR9niG8=;
        b=T53s/HknIswvuXO4w6AbG4g6XJd4wGQPOMVr3L0im8FwNNR1AD+Y1PrAk+w28IofPl
         ynAvhRjgRFKPZxMNMIO1y/+osTrvnTxmLuX2gluvTrsAo53E7apClyOD9t6tmjk+vDgz
         bdva5cGj4vvd/cA0WYr9CxwFDnH7z3MvAuA0L6TMVVBWZyqwne7cuYB/FbJIiK/6tFug
         2DTc1juxGSrUI5rdwOGUAV3fx/kjwG7+BeNs4JAbf1qoQ5Jy2mbNZmu3wLEm7QS9eeTG
         4ZeRwjszwMZfeu/h2KxCFD1zJqCJJTfm5AIR7RyVtnsjZ5xgkA2RtTd41gFTYBMq/q/z
         zYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167605; x=1773772405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fzU+GqgfamipmvnoIKT7xRB/NDsfY72Gzv0yTR9niG8=;
        b=VkZ7TPIsXQ+2mQ+oUrMk8VY43tkl4gED2yA0+3a+xbuXeyNhs2nmxMpbWDqtLt3jQI
         aO5HDUoVXxrZkNCvX9eEow+asmR3YVIo5HxAmSaesBusOvHUCAeYSCgxgqh8qfC54xW7
         nzXg5Kf7kc3YpsYpGdeEdr1QT7465dXghqy0291LZ6f2S4scP9X+OFcXQ4LOVAgGVh4R
         2qIqX+Hjt63QH3GSKkzCvbSjSGA5a4kbnN77Omtx0VyMh/dBeQ9VsjfVyYcH7iFcFeKJ
         p/2lGI612Q+hMg49aFzRr6RUuZ86Y6QAS/acT8Vdp610MINETZmcW2qKevSUckr6LtQm
         Cn/A==
X-Gm-Message-State: AOJu0Yw+VvXU+vLdWhE6+/MzoSOyW7tsIJW0In2KjZKR4h1v0B3TW8QN
	0wfPsrpCEi9aRHN3kwc9vZQVlb/fmfxTZXrQgo8ZWLwnD+ZQZMFwM+E0y0JxGCDQ7OgukTG/ECW
	9XwHyVvA=
X-Gm-Gg: ATEYQzxUPoSEOiU1NZGXw42I71yCxebCX8mnwt3SSe4RwJ0rQtcz0szxtPUuoyrqR9z
	nqk4ip6PD1/7zv00aCOxuA5Cq8RrDG5ZOli19nlXTv0ZuU/CYiBePugWMj3BLLHdla967ZnTW/8
	aQXb/caP5YkDvM6ovbfeCE5Lx7MpVr6ND3KqdUura4OSWH8DERU+yE4wynn+34vIvWv9mUSOVvL
	+WgZXVOiq6ZG7Li6g5JpQEy5MPAP8o59jT43YcHRSdgZ94T5LOo0W5m8LXvZFCEhME6PFNgftwO
	cybY9ZoWHSC5/x6FKFGR4Iv55z46ZVa0SUl9wyhYj70BYowWPCPz3EDD0Qow6H5+puP7Hos8kXb
	Yf+WiSjj5Y0+p2zmJuV+rG3WCnBmy+GKodbx+YKJB8Qgq/DVuB3806bZW518trfg4HirhswptXO
	aqdvMyMFq92/EBGzjsDWmWtzSawcA=
X-Received: by 2002:a05:7300:a887:b0:2bd:fa8f:77f4 with SMTP id 5a478bee46e88-2be4e0549a8mr3868053eec.4.1773167605111;
        Tue, 10 Mar 2026 11:33:25 -0700 (PDT)
Received: from localhost ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96f68esm15968514eec.29.2026.03.10.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:33:24 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Google-Original-From: Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@oss.tenstorrent.com,
	Evgeny Voevodin <evvoevod@tenstorrent.com>
Subject: [PATCH 2/7] lib: sbi: Add Smrnmi extension macros for registers and bits
Date: Tue, 10 Mar 2026 18:31:50 +0000
Message-ID: <20260310183155.2186463-3-evvoevod@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113325_924154_7EBE8887 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Evgeny Voevodin <evvoevod@tenstorrent.com>

Add CSR definitions (MNSCRATCH, MNSTATUS, MNEPC, MNCAUSE) and bit definitions
(MNSTATUS_NMIE, MNSTATUS_MNPV, MNSTATUS_MNPP). Also add SBI_HART_EXT_SMRNMI to
the hart extension enumeration.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
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
