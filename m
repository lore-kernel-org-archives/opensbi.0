Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C25BC88E5C
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 05:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SSh1DCq5/62H3DYOb/4GOX6bk5kbhPgAI3pL20hjLo=; b=AGZSm30iENX1XX
	nOErQLeSM2Km0Y1hlTKfZ6JjVk9voa/m11i3gnP1p5KCxniD4giaLe6osgVfIm2Qqvd2zaH1ZJMLX
	THeEAx1wq4pemunb5qr5iT3Av7+6CkVyBlkLCvTHMGrokWB5/XNEQPxJ165MC2ushrgXz20P63gU9
	jBmd1f9PmQiXXWpMn1ShkpqqV/kS6eNHf3iqXTimhWKUkUQut0g7Z4sPbUq4vbVGcMI/ti6+XlBcc
	re60dTZ+WgA4/fBoCPkC+HQEYf7Mc77c5oKmNbTYiCEPiHFXLUzv6NyH2BnkKBj4ZCK3/9qBcMHnQ
	e4+7i1AFHuJnaQFA6Nxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6idc-00000008Qek-2YXB;
	Wed, 16 Sep 2026 05:56:56 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6idY-00000008QdF-37Hq
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 05:56:56 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469a34907so547529b3a.1
        for <opensbi@lists.infradead.org>; Tue, 15 Sep 2026 22:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789538212; x=1790143012; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB6npxI24OhMJVrjd1fkcXEXBYDZ5jWKUyay9RRFgQ0=;
        b=A2PwLyzUoJNLZ8Br5megyHeuw/uoN61+K3y08odoS6Xlr5zs2AtkKd4YM78nFlSOZC
         o/LpopjQIIkVyttpzzr5fELlZulLu1BMfw/r5I5WJshjwaZdsGY0B4Z0NnoI4jlCCT3w
         4cihoDOizcxWsfvyrzSxIGKhnWL2cVCHupvUYk5hOZO97jZtB3iPKJVYRVNjn4zHxYlM
         fzuoQcjxIaYeQCUUJeTt9y+aeB8uva4YcS5T9RR7Nuz2nPV8leWfB/tgGsi2SgZxjf65
         LuInzlz5ityKrbE7ZAUHzd5bsMMrmcHBv5v4UbeLRoqCk+eyNv1HIspCJP+5fIUE1YnV
         ixWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538212; x=1790143012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JB6npxI24OhMJVrjd1fkcXEXBYDZ5jWKUyay9RRFgQ0=;
        b=nR+v+ig8DmR4ivjwO9FcXDHfbtLii3XY+azkub6ALzXnsU+hIj2qLj9lK7LrpgfGZ4
         YYHNlLT7jlBU9+weCUbLILmiVWD5C9ptVWABDyicgw9tLL/YkxOuhts5Nd1JOzimINRt
         96iovrKcoS5B2Cju9LBdGuVd1RTLCMUIrML7y2Q4cBNytxAZRQ3PvIZ+APESaiUmrFUP
         T9f1bKs5KCfqUeCCtPACuFPRGgB68SGhMuSh8J16FXKUK/Zb2KB3dM/rGrW27bScnE7L
         tYI68pp8dNUcRDyPT3gIvANL1tv+LbVZF+PBu6NBbsRTGh2sEA7TSEgaODmqybUgxHSS
         eGOw==
X-Gm-Message-State: AFuF++ndFAY+tBkKB5bf8UQDRJ2Lcs0r+WzNFZto9yxl4Suf5O8d88Jz
	OsEf12uEVybjM9E5qxUqzN9AdoWRjY8cjv4vXXEQ+LgH/WkAAJVpsRRM4Gfghs10kunxYUGMTEC
	2M3gKzU2/3SOtvkJ5nkOhFf3TccSu8JDlKYqg6K78okCmTPJPgGfrcCG5iX45f/MyFEU9qkDGMl
	m22mgzeuftdx8uo2pY5QXuIMzYfdsup2jve2Q0JEp2NemqhJ8=
X-Gm-Gg: AYBFou0bg20hTVqNmcE33sK4u2fyZf7CU2uXn0x6AkxS9+FoW9x/oDX38NhSCiLE9r+
	ra3gxRIZfUy8L+oINPdInfpzS6FiirSn+/iKDuIvNZZrpnfqk5bPzafSA218QMLHrWC0qqZ72A6
	k8s1lmmXFzKTc6XMpGkN1FWVNBK4RJQhX1Vulk1dQ6L53YlR3CFHIfbHmZDMhhAMCmXiZaeZP1N
	z4kLVYjBxbNdzcT59/nO5ltYy6d9lu7G0/KTEMcHehSSfLOvXcEEnzbAiO8kaeBjJnb8yi6u0zS
	Ctsd/DviLAHzgKUZ6Yz3gsd7fOSMLFC8Zw3/0vmp3ZkYheE0DXHKZGNJSfKGJeoLGB+OWPJ8cH9
	cJnFMAYzEuqmkFJaMzXGPF9yzvT0MyDrLXR06CKeLi32dul3/bbWF/FAOtY/EpHuTekcCjMzsbL
	VeT9SiAve91JS0E1+rq6OcnzAUpBCp5almuhsigr0l9zAdTD/LG6Rv6V9dfWFAqiEWiq9j+LW74
	8wnwBqKCD7vhOLinBf/
X-Received: by 2002:a05:6a20:a105:b0:3da:4cc6:17d3 with SMTP id adf61e73a8af0-3dd5f838992mr3413547637.26.1789538211936;
        Tue, 15 Sep 2026 22:56:51 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm3550521c88.11.2026.09.15.22.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:56:51 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Tue, 15 Sep 2026 22:56:43 -0700
Subject: [PATCH v3 1/3] lib: sbi: extract sbi_smrnmi_hart_init() and call
 on non-retentive resume
MIME-Version: 1.0
Message-Id: <20260915-smrnmi-context-restore-v3-1-e9dd31152515@sifive.com>
References: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com>
In-Reply-To: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Zong Li <zong.li@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4216; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=sdsTc654a7NTvBTkF4xdqecNt6xH0xfm0Hv4f/7e83s=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqqi+is8vCbQ5wEbks0stXMXtb/iNZyhsMG4Hsl
 ZbBdJtAt1OJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCaqovogAKCRCIoTSWt/mH
 4HsxEACRrfyOUDah3Bf+J29aYC2O81geyBX5AQeXcs0f8kWPZVZwWwJswx7mTNuh2PEtwGXOVvb
 0ZEIFcn7e0fTbvTeBUxyCgub+gWBc+aCS3ZE9PA/IavE6w7A2QrTUIIEG4JfkbpooDwww2mrjPs
 WvggzGr0HPBg4r2WmBkL7dWp51AM/62ff9PRiUUp8YRfBuSHX4XK8XUE5si+/ft5UM8p1cKaD2F
 Lk0+wSzOh6AYtIMK3vTSE+vdYZCoj+nmNRtPh2azfPeeBwsFljakuCmLZBMr9FhIkRdbyjKXWq6
 ystBP+MNzw2Wbxjzy+jrjAEiqcWaH+YLf7ji68yYi0LQZuYD8VLt6mt9tuwEE7BRCTZPvNljXBw
 XQhsL3mwMOBD5N0GP7dagz4xrkZt3eTADzmJBMt8vOIrFzEDQZRMCcp5Cd8qJ7xUJDyzOOq4pmb
 P+DsCUzEbMs6I0u6vGZOmTteK6R7wESToOC09/tYW7hzLRC8d2DTw+bnzY58oitRhlCe5cdtpit
 hAgSozsRElGHpaWkzIXj0fRQ9LyNvqCjG7ZBeEaA7PfLGqmbNgQuqcDh9p/M6IaigKvT74k+2FK
 97XIm2K3Qsm2VS6kNvLU08MjS3kvqvHRB3XVRg7To/rLd3u1tUBf8DXivQ7893FEpumEqC6ckU4
 f8AfefNuudn4Xuw==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_225652_824070_083B694D 
X-CRM114-Status: GOOD (  15.46  )
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

On non-retentive suspend resume, the hart never initializes the
Smrnmi CSRs the way hart_detect_features() does at boot, so a hart
waking from non-retentive suspend resumes with NMIs disabled and no
RNMI handler installed.

Extract the setup into sbi_smrnmi_hart_init() and call it from both
hart_detect_features() and sbi_hart_reinit().

Fixes: 2d211fe6f9d5 ("lib: sbi: hart: Detect and enable Smrnmi before trap-based feature detection")
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Co-developed-by: Nia Su <nia.su@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
---
 include/sbi/sbi_platform.h |  5 ++++-
 lib/sbi/sbi_hart.c         | 55 +++++++++++++++++++++++++---------------------
 2 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 1e9a23c1252558879c683633ad000828fbfa8f3f..0a1e7eee0bae8eee963e5a4ebc0895b2bd10dd23 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -154,7 +154,10 @@ struct sbi_platform_operations {
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
 
-	/** platform specific Smrnmi handlers init on current HART */
+	/** platform specific Smrnmi handlers init on current HART.
+	 *  May be called more than once on the same HART (e.g. once
+	 *  during boot feature detection and again during hart
+	 *  re-init), so it must be safe to call repeatedly. */
 	void (*smrnmi_handlers_init)(void (*rnmi_handler)(void),
 			void (*rnme_handler)(void));
 
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee8855772d8bfe452a1f9f086ece2a7ab8bbe6b..18fac76ac070cb626ccb1cc959f4327de0e7c1d8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -466,6 +466,33 @@ static int hart_mhpm_get_allowed_bits(void)
 	return num_bits;
 }
 
+static void sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
+{
+	const struct sbi_platform *plat;
+	const struct sbi_platform_operations *ops;
+	extern void _trap_rnmi_handler(void);
+	extern void _trap_handler(void);
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
+		return;
+
+	plat = sbi_platform_thishart_ptr();
+	ops  = sbi_platform_ops(plat);
+
+	if (!ops || !ops->smrnmi_handlers_init)
+		sbi_panic("Smrnmi detected, but platform lacks smrnmi_handlers_init callback\n");
+
+	/* Reuse _trap_handler for the RNME slot since RNME is taken
+	 * as a regular M-mode trap with NMIE=0. */
+	ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
+
+	/* Initialize MNSCRATCH for the RNMI handler */
+	csr_write(CSR_MNSCRATCH, scratch);
+
+	/* Enable NMIs */
+	csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
+}
+
 static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 {
 	struct sbi_trap_info trap = {0};
@@ -487,25 +514,7 @@ static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 	if (rc)
 		return rc;
 
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI)) {
-		const struct sbi_platform *plat = sbi_platform_thishart_ptr();
-		const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
-		extern void _trap_rnmi_handler(void);
-		extern void _trap_handler(void);
-
-		if (!ops || !ops->smrnmi_handlers_init)
-			sbi_panic("Smrnmi detected, but platform lacks smrnmi_handlers_init callback\n");
-
-		/* Reuse _trap_handler for the RNME slot since RNME is taken
-		 * as a regular M-mode trap with NMIE=0. */
-		ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
-
-		/* Initialize MNSCRATCH for the RNMI handler */
-		csr_write(CSR_MNSCRATCH, scratch);
-
-		/* Enable NMIs */
-		csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
-	}
+	sbi_smrnmi_hart_init(scratch);
 
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, &trap);			  \
@@ -690,15 +699,11 @@ __pmp_skip:
 
 int sbi_hart_reinit(struct sbi_scratch *scratch)
 {
-	int rc;
+	sbi_smrnmi_hart_init(scratch);
 
 	mstatus_init(scratch);
 
-	rc = fp_init(scratch);
-	if (rc)
-		return rc;
-
-	return 0;
+	return fp_init(scratch);
 }
 
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
