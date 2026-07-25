Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD8C531FC
	for <opensbi@archiver.kernel.org>; Sat, 25 Jul 2026 02:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWB0zv0wyI0ri3Z+Sx363yJ93Sz+sBJOI5stItTr+h4=; b=GOCn0ZTk3/TQeI
	YLgbNjG1PYB6I6Wa6F5KCMjhCEB9I89w13CO8OwId02NtA0kxV13sK16mM69jBDg+abHZ1JFzbnzM
	e55QpVMzuA1s7vqx/Ol8PhD49ZxcmTi1sL3/G+UGJSFgf9J8ETftsvidDZLrEUPI0UG7yuO3hYJHV
	fYnnp/oraH2hZFq6dFt2gKWcxum9qTDAFrP7EDwlre9eLqXF3hpSGKcAuQMe/xyT+F3Ptvu9U87jG
	+Inma5ZJFMTlVCJj32cr4SX2f0HBFJ9IQ0VUa+VucgG9xy6Si+oFdy/tCQLD5sZZocJW8QsgFz4lf
	0q3cb2uPr/BCnhm80Lhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSI6-0000000HUXR-11In;
	Sat, 25 Jul 2026 02:39:06 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSHk-0000000HUVv-1D64
	for opensbi@lists.infradead.org;
	Sat, 25 Jul 2026 02:39:05 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so1381087e0c.0
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 19:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784947123; x=1785551923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXxXAUd1PTpTbsAHKUPepDx8yENE7z5PY0rrBBugT+I=;
        b=FwPG6VJmNAo5ohtTVyUovrYRUs3PojaO6cNb7u/oURKxg9pNVTtddyIHyYADW6kLEt
         o4GHnHzKwz+nt6Ops4racWL+r2+NGH/KA9S51DoYmbh4LihqZdGEjNUDbIg0QaYA3lBD
         wymeO9hoJDcy5y/C+Qkg1gI43rLh7WmpIZtV5ccSGanmQQpaeKfUCdqSkZnqGX2Ukygd
         BCCGo2el0rS3ko8YtNtj+BRyXvQJ/hawqdR4AMj6UJvjT1KTcCtM3Zjxr14GMTa6XCzt
         B+VbnrdDgvn9qdlx1zyyxK61tD3frNVEgDW6Jof1pO13D4BqOMpYBOTMxmEJDLy94art
         8MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784947123; x=1785551923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXxXAUd1PTpTbsAHKUPepDx8yENE7z5PY0rrBBugT+I=;
        b=TKJrXV3ggLs59s42yGtepT3neyiNQ7RQcKcZpoQTmdJpDUqKbCLYWRqBcyL0tCCv6y
         SbZrCREBopzVS8oJW2ngm6ntpIbbDnoV6Uht9XfpgxwnNj4j94c/EcexY0ovrjlXCeuk
         LaGI+oLjoEp2pzI3bNd6Pu/ZWLqabCFVjV+jdDC9JCnp9cLBPv5WZpok1k0U6bVk0W9D
         Yl3EbzsMCsOC1TISqZvvtLaiiyC6669Thb1jDDLcEFKjE92uGkehRDtvMjcVzQMS3grd
         2wA2c9SmyubyBxkrtpXw7+5AUIU6+qVS1obLZyhJ2KEgEgMq36aXprODH0ebBCYRL/tL
         herA==
X-Gm-Message-State: AOJu0YxhS9Z5v+igj2PctkNqxxE4/7IN9CIKuHA+mXu/CSh68YcCgWWD
	flxgaiAmeQiMTEoq1yEZXfpMUkSuM7gAqe41M1c9MLmmSsAIemczypmlLGL9tQ==
X-Gm-Gg: AR+sD13p15z+H9PFa9cs4R54mYzt3xHxOr/kg+HTY7W0HsoOx0qvaKztV4tqpTR5Ffn
	3X9tmqqnlEra/sNwusHUydWQdCMe6cTQU81b63wAaD6XjbFM8SFzjZCkYaUoTJytDclG89CGNXM
	tLT7dppRVAa2DvhWdPVseHK8ymctqGN821Bsbi3CbY0QQ/ZBF2MxMvv4ila/LcgA0zGy2KYx+as
	vKj2DpIBA2O6Uy6wtgFlGTVKRGGaDHK5NaKAHCV2Vh7nrVI5qsXO0XuAeb+3r0sqEXMbsWmaLzW
	aIjcqMVR5LzBYauKZOZKSWJ02hsHDflU6FCn5KCVVTr9JAeN5EzIyXkiNWMxTF05qMnO3ep77JF
	s9HFDTcNHe/HpD9uVQxvqS4n17/4n9zoKpR6vpK1AEdv3C+Z7W5i+DjFZH45qVAee0rm/gL0CMg
	buxqXNBdx7zt2ZwKDYU0BrltYZS2sQbATCSFg2X0vk/3dKyvuGBC7fi019lKCWmEy9DzQUww==
X-Received: by 2002:a05:6122:3a12:b0:5bf:889f:e7da with SMTP id 71dfb90a1353d-5c30637cc7dmr594697e0c.2.1784947123046;
        Fri, 24 Jul 2026 19:38:43 -0700 (PDT)
Received: from ubuntu.localdomain (23-91-246-209.cpe.distributel.net. [23.91.246.209])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c305734410sm602529e0c.16.2026.07.24.19.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 19:38:42 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH v2 2/4] hart: add WorldGuard CSR IDs and hart extension flags
Date: Fri, 24 Jul 2026 22:38:19 -0400
Message-Id: <20260725023821.3795618-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260725023821.3795618-1-raymondmaoca@gmail.com>
References: <20260725023821.3795618-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_193844_357532_82E9B117 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Define the WorldGuard-related CSR numbers and claim smwg / sswg hart
extensions so platform code can probe support before programming
MLWID, MWIDDELEG and SLWID.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/riscv_encoding.h | 3 +++
 include/sbi/sbi_hart.h       | 4 ++++
 lib/sbi/sbi_hart.c           | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index ffe7666c..4d8b2fba 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -373,6 +373,7 @@
 
 /* Supervisor Protection and Translation */
 #define CSR_SATP			0x180
+#define CSR_SLWID			0x190
 
 /* Supervisor Indirect Register Alias */
 #define CSR_SISELECT			0x150
@@ -510,6 +511,7 @@
 /* Machine Configuration */
 #define CSR_MENVCFG			0x30a
 #define CSR_MENVCFGH			0x31a
+#define CSR_MLWID			0x390
 
 /* Machine Trap Handling */
 #define CSR_MSCRATCH			0x340
@@ -736,6 +738,7 @@
 /* Machine Security Configuration CSR (mseccfg) */
 #define CSR_MSECCFG			0x747
 #define CSR_MSECCFGH			0x757
+#define CSR_MWIDDELEG			0x748
 
 #define MSECCFG_MML_SHIFT		(0)
 #define MSECCFG_MML			(_UL(1) << MSECCFG_MML_SHIFT)
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bb..0fe8d439 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -63,6 +63,10 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCSRIND,
 	/** Hart has Ssccfg extension */
 	SBI_HART_EXT_SSCCFG,
+	/** Hart has Smwg extension */
+	SBI_HART_EXT_SMWG,
+	/** Hart has Sswg extension */
+	SBI_HART_EXT_SSWG,
 	/** Hart has Svade extension */
 	SBI_HART_EXT_SVADE,
 	/** Hart has Svadu extension */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 21713816..2b7b9cdd 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -386,6 +386,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
 	__SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
 	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
+	__SBI_HART_EXT_DATA(smwg, SBI_HART_EXT_SMWG),
+	__SBI_HART_EXT_DATA(sswg, SBI_HART_EXT_SSWG),
 	__SBI_HART_EXT_DATA(svade, SBI_HART_EXT_SVADE),
 	__SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
 	__SBI_HART_EXT_DATA(smnpm, SBI_HART_EXT_SMNPM),
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
