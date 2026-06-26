Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0FFCD4F26
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LnvxI3bbbqBDL0+tz3gTLSvLP5LiLWwBRo4AD9MP8I=; b=BbuEc79OP6FLnp
	uwQvNlRKTwia+9kGQDFuWAXVS+0G+62t/Q1siEbHTX28mKb8btdByGRulCkJQJA+GH5eUcZCBujBW
	Q7o9fQMQ+18MuvqP3hrCSVBowYJoqho9YaIHu9RQfdfiBalykwrfdBZfUdp2W3aUEvpQicDHfYTC5
	qIRtrEOLpiZeFzvUHwwgjlUkMVD5YpfyzRDTLrS9AERIo+3EPQfM/sqThZmgsvHF1g8mm7KfsyXrW
	i0lNui7y5cQSHNaMIEN6xZw1RhprhvcrjGXL941LYftPHy7CuRjjjTzac1DwdUe5BktAdu+1E0icG
	Dew8mCs1hC+ZVYQGmr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3bz-0000000B4Ia-3BCC;
	Fri, 26 Jun 2026 10:16:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3bw-0000000B4Hd-3On2
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:16:38 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-845537740ddso427789b3a.0
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782468996; x=1783073796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=um3xvF5lFdOSqIgG6jt36X/3BvUtQkpNsyiT3a1S8Qk=;
        b=d9IaspEP5Jgd3ShvC9TQbt5DPeGBpvEGssA1MI2HgInbTYILMoeAk5C/WtcTgRodPt
         TtkSxfMCjQFyUHUqkjRY0hAlxjyxmf9PVAmOgm6WEmynYYkOcBdgxKdr9VOEmk786Lvz
         wDDe5kkWYn+8/pg1CHT8g2+nFqGyvTR2wRi4xfO7G0ryJmjJz/DDb2yzObKvXLGCzsEb
         6/HpqvFea1jo+taz57Uu1iU8BH/ZBuh9R4SuBWjLQF697Y08a1ZogT/ilGOtDgOo8697
         iEteiyIWpJy3LsXYELsPMWTjtIP7Jbnabu7liUvYylRQpHmChL591qlfrzr4FqUcTldp
         q5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782468996; x=1783073796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=um3xvF5lFdOSqIgG6jt36X/3BvUtQkpNsyiT3a1S8Qk=;
        b=P3Z8FSdT3fgyvRCHAQZVhCXikc+4AJ/Oe90/REjAcAKo4usdehHZjIhONWJ4E9vpJD
         4gpRuavk+Tn6Y2mtEflQfxSJmv9pqQlEULO94Ehm3pw0QECh5MVsZBecjQAd4WQ/KYQG
         uR2b52EM9UpYLfMCLsHqOaYwHuE903j/xnFHxBNc/fGRu/zPWX4ZJF7BD5PSKfQzrbDT
         HvdcG3fLopMtKa+jgUcfGuXdvCsWYhJ03hN9jz1jTPQftgzB3t8liTpxHsW3aln7hsMK
         Of+hJFm1PZ+ww/c6HQnDDueIn2UQDbqHdcaY9kLe33uYddWky+c3NPp+CY8eNhoVTm7R
         brGA==
X-Gm-Message-State: AOJu0Ywv91GCTVNaIc5YVH6bBxyDpVgxU2RYKYi8FJMvnM1tkHKU0HSd
	JKzvlr7ib43+VbaaPPV3UWxeIMSpzOjKSZu6+oT41UWEBpfXrbklvSsv2BjYVaYbLaJx8pagFco
	ne4JJfpr4yB8hrqjd+iJn3m9xG6FuQD3JEcwuJPjOQ+fPDL1sAewjajcw7xsbqLO4tW81J1LAq9
	ZgEuB1Taoz7sjT57vfH1O07zB1pcFnYODZCiaiKCKJygtkdWBZ24M=
X-Gm-Gg: AfdE7ck3gq/45kOLBZYcVDmTV4AuRILfBhO9quG/m73pu2RkRcvkgkMgQsjqduVyp6o
	+BebHaw1P9OJnNc1VNoo14kIEni0eWOvH5weelySmqEc3t/v1MEgTdvFP2fGErhqzBSzC8gEn9+
	iDbYjBr0BAyA8duFzL1CC7IRWTee217TPmDEDLzjdiu+VAj8GCPV+ZHKWVjqTWG2UjNVL1wRYT9
	gQ6ypUCGNRoFyBh7ohjbTWQ90IRBp0CUzDawk77FZRVL6CTQr1VBV9tZ7oeHN1PrL5JpXlnY3Uj
	HO1TB/7Z/6UzbHXZkOoqNCMuJLtZpQx1aks+WltgUXz5jAJRTDJ1mNpPign15Qm1luIcT659XJk
	Hrqn4EPCpJYuxMd6trfkvzjnhZy6yWhE+baY/biUAVIlAG+AZG++glMYggM0A7+yK51Bb1HrkuV
	EpnI+C+iYc3SQ7/oxvTyqwwSPCMDSV5snfYqCN
X-Received: by 2002:a05:6a00:760e:b0:845:b758:8ff3 with SMTP id d2e1a72fcca58-845b75894b8mr5130398b3a.48.1782468995486;
        Fri, 26 Jun 2026 03:16:35 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:16:34 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 01/12] lib: sbi_hart: detect RISC-V Worlds ISA extensions
Date: Fri, 26 Jun 2026 18:14:22 +0800
Message-ID: <20260626101433.3133466-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031636_853633_A176DB29 
X-CRM114-Status: GOOD (  10.67  )
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

Add detection for RISC-V Worlds ISA extensions (Smwid, Smlwid,
Smlwidlist, Smwiddeleg, Sswid) via ISA string detection and
CSR probes.

These feature flags enable subsequent patches to conditionally
configure World ID CSRs and print boot-time Worlds status.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/riscv_encoding.h | 12 +++++++++
 include/sbi/sbi_hart.h       | 10 +++++++
 lib/sbi/sbi_hart.c           | 51 ++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index ffe7666c..271820fd 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -400,6 +400,9 @@
 /* Supervisor Resource Management Configuration CSRs */
 #define CSR_SRMCFG			0x181
 
+/* Supervisor World-ID CSR (Sswid) */
+#define CSR_SLWID			0x190
+
 /* Machine-Level Control transfer records CSRs */
 #define CSR_MCTRCTL                     0x34e
 
@@ -520,6 +523,15 @@
 #define CSR_MTINST			0x34a
 #define CSR_MTVAL2			0x34b
 
+/* Machine World-ID CSRs (Smwid, Smlwid, Smlwidlist, Smwiddeleg) */
+#define CSR_MLWID			0x390
+#define CSR_MWID			0x391
+#define CSR_MWIDDELEG			0x748
+#define CSR_MLWIDLIST			0x749
+
+/* mwid lock bit */
+#define MWID_LOCK			(_UL(1) << (__riscv_xlen - 1))
+
 /* Machine Memory Protection */
 #define CSR_PMPCFG0			0x3a0
 #define CSR_PMPCFG1			0x3a1
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bb..2941809e 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -95,6 +95,16 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_F,
 	/** Hart has D extension */
 	SBI_HART_EXT_D,
+	/** Hart has Smwid extension */
+	SBI_HART_EXT_SMWID,
+	/** Hart has Smlwid extension */
+	SBI_HART_EXT_SMLWID,
+	/** Hart has Smlwidlist extension */
+	SBI_HART_EXT_SMLWIDLIST,
+	/** Hart has Smwiddeleg extension */
+	SBI_HART_EXT_SMWIDDELEG,
+	/** Hart has Sswid extension */
+	SBI_HART_EXT_SSWID,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 21713816..0c584bfc 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -402,6 +402,11 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
 	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
 	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
+	__SBI_HART_EXT_DATA(smwid, SBI_HART_EXT_SMWID),
+	__SBI_HART_EXT_DATA(smlwid, SBI_HART_EXT_SMLWID),
+	__SBI_HART_EXT_DATA(smlwidlist, SBI_HART_EXT_SMLWIDLIST),
+	__SBI_HART_EXT_DATA(smwiddeleg, SBI_HART_EXT_SMWIDDELEG),
+	__SBI_HART_EXT_DATA(sswid, SBI_HART_EXT_SSWID),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
@@ -689,6 +694,52 @@ __pmp_skip:
 	/* Detect if hart support sdtrig (debug triggers) */
 	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
 			CSR_TSELECT, SBI_HART_EXT_SDTRIG);
+	/* Detect if hart supports Smwid (mwid CSR) */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MWID, SBI_HART_EXT_SMWID);
+	/* Detect if hart supports Smlwid (mlwid CSR) */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MLWID, SBI_HART_EXT_SMLWID);
+	/* Detect if hart supports Smlwidlist (mlwidlist CSR). */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MLWIDLIST, SBI_HART_EXT_SMLWIDLIST);
+	/*
+	 * Detect if hart supports Smwiddeleg & Sswid.
+	 * Smwiddeleg requires Smlwid. Sswid requires Smwiddeleg.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID)) {
+		unsigned long old_mwiddeleg, new_mwiddeleg;
+
+		old_mwiddeleg = csr_read_allowed(CSR_MWIDDELEG, &trap);
+		if (trap.cause)
+			goto skip_smwiddeleg;
+
+		csr_write_allowed(CSR_MWIDDELEG, &trap, ~0UL);
+		if (trap.cause)
+			goto skip_smwiddeleg;
+
+		new_mwiddeleg = csr_read_allowed(CSR_MWIDDELEG, &trap);
+		if (trap.cause) {
+			csr_write(CSR_MWIDDELEG, old_mwiddeleg);
+			goto skip_smwiddeleg;
+		}
+
+		if (new_mwiddeleg) {
+			__sbi_hart_update_extension(hfeatures,
+						    SBI_HART_EXT_SMWIDDELEG, true);
+
+			csr_read_allowed(CSR_SLWID, &trap);
+			if (!trap.cause) {
+				__sbi_hart_update_extension(hfeatures,
+							    SBI_HART_EXT_SSWID, true);
+			}
+		}
+
+		csr_write(CSR_MWIDDELEG, old_mwiddeleg);
+
+skip_smwiddeleg:
+		;
+	}
 
 #undef __check_ext_csr
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
