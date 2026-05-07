Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C087BCD37A9
	for <opensbi@archiver.kernel.org>; Thu,  7 May 2026 18:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+hCkdphGhH4d24/QONrTMeuFInxdGeUXuXf9lu25vM=; b=BOD9BcAjIC9Ft0
	zcUaJp3N11Mzg4YnEpS7gdU78rTaaLPRLwFbBH0paTJauYE7ktKW7EHHqui9lwkvywml0/QWaikjx
	q87QQVvuDH6aznItydMwjvpqvZoitBm0m5eJtUb5O7KJ8APJWIXwOKGGaJMMKH5lob7LHX3vrrLDq
	usPn8L7xYf51ys2ktUlK5cizjH1AV7H45QEaGCY4cCU78ydaehEeeydUwLqWgkg6e7PQ9WkJz3Q1I
	MUpn7fODZKFHigF0mc3yJDxLyJ3t//j1XipVWKw+Lch/f7aqAAb6NrawMA/bE4x9VU4c1Fv4gCIT6
	EJ4/esPS5y8id57S9FSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39M-00000004YST-4AqJ;
	Thu, 07 May 2026 18:08:40 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39G-00000004YPd-35UK
	for opensbi@lists.infradead.org;
	Thu, 07 May 2026 18:08:39 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2f114d129c0so78698eec.0
        for <opensbi@lists.infradead.org>; Thu, 07 May 2026 11:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1778177314; x=1778782114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSZhBQItjwmyUYAL8I7VshwlWGe3+bTqFitH9tH6nUI=;
        b=cmpsDgdB+jr9xaR8NI7m1QMOKjdu2uTmydwUitRAzQZoBF+uX3EayYZB02Y+0apHPd
         gKTnn3ESA5IN/YzTdqNNL4hsK2A+IbqwbenZL3Rz7+l8f1+E4PPzY6Mgu7aZRnH/7c8p
         fGORVE5TLBNbdeEiN/gCZMTtb0QZuZzRA/oCNFVTly6tReYwCVoFMM4qpLZq+2n7FmuM
         alaMui2xVFdq11mB1hEBxc+cWHRW4MbfnjtVwCVzZmZF1P3VxFDo3WOHJb/PvRbBOH1f
         nsKOptyjgrnSuCkrRwkrGgUaRie2Z/Svzl1MbMAbiB7qy2YwDspQhV8KhJ+YK8cQWJRP
         Im7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177314; x=1778782114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OSZhBQItjwmyUYAL8I7VshwlWGe3+bTqFitH9tH6nUI=;
        b=mPaRz1Vqo8TeEwPUo1YEiUguze1k9+q5VjswvyHBCnvEiEju6l/ndm5fs9U31Ej84k
         PekETC8c118C9jd+hmkqlEjX/htw8rVjBY7PX0BC1YlyyfNdiHb8R2n+wPRePCqGarN3
         3a+TXwTMBLclB9kEtwsyi3pRmNE7f6V8ae/9N6hW7EvS97T0/njp+baNa0/xAOZuLh3V
         ZjLOVxe5A3Q2/tVbie1yvhQAdfDDUMyZhGzKfO+yUkZYWQwuyrgDQuGW8wjT5qAAxHCm
         V13SMpKaUzN1xLKpCKHmKRBy/VVeeotDm/LDCfYuLmo82PwhZRiMOaGZJw4YMNSNGT7H
         lv/A==
X-Gm-Message-State: AOJu0Yx2H1VTB3tybPtuWnJqB98Vd/PGaFqAskpN0/dC60LZ7nER6UKD
	4W1oacqHFDvEV/xV3Qc7kSi3nwF5rSRmrPvk4VFGy/DMxjeMtJ8IM3/rIudNobtxo0QaxFhFcxn
	e36uV
X-Gm-Gg: Acq92OGFuOewnRHjLIJldevifNC4yaYnYGtLymcsy74p26xMc9Pbbq4fbRIIO3nd1V+
	vviAeGN5KpMqW+L3pjn08lBSaLDLFw3sn++KzrWFOk+QZYdSIhhxhpNpdOSqFrNWe3D6rE5amnf
	an4el1b906SHNjgSFuN/wfqn8RS3D0jLZVBIynCq5G9dKBHyhKV2na65DkNqLO1VjIoxqP74lxC
	nD4tP1rsxrFDtMWo14kRTaG4ISoKw10FlXjObwPPmDwoun55Nmlq3BWytnRDSjmfddEY2rhoRC0
	wjKsnhOsrdg/LqS+dLMHaDk7HMldVLWR2Q7coDyYdQM0EGpbbBoKsEi/vb2O+mLiJIefpXjRPzS
	MoqADYju1VVTbdLaGsWxORO35FgDg8l2kQR453jdgKJopLS6iyrcwL82Tpm/3IZQA8kVG/RTjs0
	NJcAdraWwl2KlI9KIV7IkZryiU0qBTrgJ1SDBGRyIZfUq7JGao0Q==
X-Received: by 2002:a05:7300:a146:b0:2f5:2154:c7b with SMTP id 5a478bee46e88-2f59ce9921amr1948214eec.1.1778177313713;
        Thu, 07 May 2026 11:08:33 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82b5636besm78285eec.2.2026.05.07.11.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:08:33 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v3 2/6] lib: sbi: Add Smrnmi extension macros for registers and bits
Date: Thu,  7 May 2026 18:08:03 +0000
Message-ID: <1c6feb6d359b9827b3c2ad8f4f0e0a4dfd1de911.1778176768.git.evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778176768.git.evvoevod@tenstorrent.com>
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_110834_789947_89BBE8B0 
X-CRM114-Status: UNSURE (   8.81  )
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
