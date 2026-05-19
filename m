Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4D3CD5BA4
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 20:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+vNmHeyqRjElf8YpPkGq82mKo6v4km2YaXoJ0Xmdys=; b=oYhXCMlqH5YCXn
	qwfWovpQnZeXgZpjA5taDUm78fvI+sMXDQcq9z06YXBVwArznnGCXMZe8H/ayyohgzI4/KovurF0x
	2fa+8U/pylZtehj4C4QxO+XGZXIDfvMP2N1ryCcljSdiAyXEhK6HQwGbR3/+LV6yU+ieUqQ6OwWDv
	4ZOF6z4513VqGwFBQ/sUvxxOPo5YPuRclBB7+Jlo+nTUMzVo0INTRRFvhe65mVJY/IzpuHwjgcP8G
	aQmhmUNhsG6BTJgLZAVRT9P91AfP4I5IuU8RZ0+8s1r/FQB8pKqZRFQ/lJz0BBT1R7qOSWFanG1cq
	aYZU0LJjbTMCZeOuCGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8R-00000002iyo-0O3T;
	Tue, 19 May 2026 20:33:51 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8O-00000002ixi-3uub
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 20:33:50 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50e5b55062fso36275271cf.2
        for <opensbi@lists.infradead.org>; Tue, 19 May 2026 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779222827; x=1779827627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC8+RGF3mKTZLu1q05L9cvM/vQ89uiRie1hvwHPmJl4=;
        b=fPHOfL5KBAiz95kDT88qDZCdtgkMFKaeRIR0vcXIa/P+IYK+7FH4nLMwumFOPEJaBV
         xpYObdvvNKUjvFVnNqVUq5oGwShtDiLLvTchw7B7QBzm50X/G2v0oejifJbFUEKmObih
         Dfcc7LyCpATIfezAlT2tn504aspeCA/7Wu3lzsal1aWWcqum/9cCdKRgTD/47SUYPCBd
         rhzDlpc6ivxArKtZnGXk2k2celzk1nHROLqZgoIpJLVlMO2YsSxeexGj+EjDECv5Bb6e
         HwnK1CnBo9+DuFcsy21isalnz2YngrYAmcQtU1GLCK6b0cAMPq8qtqVouIOdFWOqGKj6
         H8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222827; x=1779827627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FC8+RGF3mKTZLu1q05L9cvM/vQ89uiRie1hvwHPmJl4=;
        b=h/oKmYAZ9UpHmqfkUFst37rmsXAJQms2gCqPJiW3g5+eqrZ+1OL2hsY1zMqeMU7BlI
         ztATmnUDJJG/D1IOvCNFnIl3++3ghKD18RhG4ohs2r73tZ+lLiWCD54UjNW56Nbok/9V
         UGmqzuwFQTMKF1Czf9IoMhJqHlR5xpba8GtJAWdXOXXFs/B2e7X6hdgEWF3zO1gYhwfY
         kMD9KwM8bVxViV2+hE1CHXJZQwCTBxp7GJn5FHP2KaoJ0PcCJJLBxXnKqXj3wDnDyykA
         UmwPzj5e1KoVzjqoUIyIW+3pbwfKkmLkm8ug9cSrFq1O7oTuOmB2L+r1q64zw817kTTF
         PncA==
X-Gm-Message-State: AOJu0Yzwq+VXVrKE2K2QAC/kj4E4ti+JLnKQLjRUjP35stChaIVK0SKi
	VRDOglGqCHMZJge+jgyCbl+hn60rqfr+JDHat9BPIg6+KQPHEH0TK6Th2SmfBQ==
X-Gm-Gg: Acq92OHQpdsTgd4nAjoMmLLEjgTvJ6sFpCpin9WAsz2vJPI6O3wjQw9vg+z68TOK/GB
	EVOGAfYOlxKRZPFX1l8KjDl9XRT4jU5uFtDFelILRIJ3lpqdPD3vp6xqgJAexxCa084phUUuaHz
	5ZwbxxA3wSxqKbdp2WdWeMGuApNRLe/AsQOdqWT5zRhmopYC1odHOBxsoPRahuE8HPM4ZRekJOa
	HiI4a4sh+rDMWq6By6nRCR5sQEZBRpBUARInSHgfmI36mHhqXxvMEwjMLuLcf9F2zXbLjphFCbb
	zAPBvq/QUoPyANUJY/cRfMTon04ZZ+okOdcnVJOzAcppSXqDKqJjGRxb0pPjplkENWWj3zPD+j9
	4/idT04Ud2dcCUBFVncLbDXZYlCTRxNcMEhGZCA/xsX/yVUGZGHETA2uhjQo1PeHFoG2v32HtcE
	je8dwS42RhTm7GEgUeh0fMXAHiv/xTmu7Z5R6byyOfH2zwHszoSJzNU5Ej+2vDbpGHVgcMKPmn0
	7rpl6JB8W0=
X-Received: by 2002:a05:622a:1f14:b0:50f:b3d2:6ee3 with SMTP id d75a77b69052e-5165a2a0c51mr302037501cf.60.1779222827445;
        Tue, 19 May 2026 13:33:47 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581aed3sm173787461cf.23.2026.05.19.13.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:33:47 -0700 (PDT)
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
Subject: [PATCH 1/7] hart: add WorldGuard CSR IDs and hart extension flags
Date: Tue, 19 May 2026 16:33:25 -0400
Message-Id: <20260519203331.2773185-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519203331.2773185-1-raymondmaoca@gmail.com>
References: <20260519203331.2773185-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133348_983826_64154C6B 
X-CRM114-Status: UNSURE (   9.51  )
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
index 46bbeed0..48304132 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -331,6 +331,7 @@
 
 /* Supervisor Protection and Translation */
 #define CSR_SATP			0x180
+#define CSR_SLWID			0x190
 
 /* Supervisor Indirect Register Alias */
 #define CSR_SISELECT			0x150
@@ -454,6 +455,7 @@
 /* Machine Configuration */
 #define CSR_MENVCFG			0x30a
 #define CSR_MENVCFGH			0x31a
+#define CSR_MLWID			0x390
 
 /* Machine Trap Handling */
 #define CSR_MSCRATCH			0x340
@@ -680,6 +682,7 @@
 /* Machine Security Configuration CSR (mseccfg) */
 #define CSR_MSECCFG			0x747
 #define CSR_MSECCFGH			0x757
+#define CSR_MWIDDELEG			0x748
 
 #define MSECCFG_MML_SHIFT		(0)
 #define MSECCFG_MML			(_UL(1) << MSECCFG_MML_SHIFT)
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index cc78eec6..2c725ae2 100644
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
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 3d136944..6fc03a59 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -666,6 +666,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(sdtrig, SBI_HART_EXT_SDTRIG),
 	__SBI_HART_EXT_DATA(smcsrind, SBI_HART_EXT_SMCSRIND),
 	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
+	__SBI_HART_EXT_DATA(smwg, SBI_HART_EXT_SMWG),
+	__SBI_HART_EXT_DATA(sswg, SBI_HART_EXT_SSWG),
 };
 
 /**
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
