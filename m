Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869A9C5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tB9/wQrmW5eJ8e3mImOVtKVt2GTPIzXiE9clz3ndp9U=; b=P6xg8mCLxWFzm1
	rJGxIDS0rWyimXO4cj1Ucw74jV1sMLdkoirT5S/ruwXcUiYMCw+ZeofSQGTpbyONuiqtQocJhgqBd
	aZqkFppeugzDH+6VIZR9O+u997Jei1wpm5hrX0ZeqEn5i0ZYVOa4wNC95JQN0+o3nZcijNf0N7YLN
	VKVMV4fSKgIUk9xxN0DcFnpzPZxaP0XEivnHm9DC5iPqnxjHn69bmE9ec4vOwfiyo/mJSbyrGzm9x
	hqY2/aYPCVv2ZD52/yUZg2twbWoSGQg0fNUz41VmqTW6/p7R/Ptt8SqHkbXNi7aSzLxui8V4vmHnu
	Vuoks5uwPOPyH3mjv+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHY-00000005lUO-3bPU;
	Mon, 17 Aug 2026 09:05:24 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHW-00000005lTh-1Ee8
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:23 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cbeeaac53a9so3118992a12.1
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957521; x=1787562321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA/To+3kMWzwkug/ZBqku9A/AeYwQ8YGNnX5KszdkqU=;
        b=hZBxlDdDOXBmkmhPyc0cq8p5UXwBlExyUkkzpKsSr4XjEJFPRZEa0UzOv5Pmv2lj/l
         K4tHuxZpLRbiJee9PhmpokT5aeXa6tRyhIxiIB2yhy3XdTGtL9cSFVmY8/cQuxWHeqCC
         tXsvJMJEtg1QvA+bW9dDjzw1bW4NBsCLQxLqoSP5EuvIlB2aft+Se3tEjSJoWr778FrR
         /cNMkRbCRn7aQksG5MiNSsGUQmgJHrmABT7leNSSylXNv1je2iMsELwxlqdVRYOHpZBp
         HmONdS5C3C5xDhxZlgS1B4KMgfAfF4KfR9ChDe9Y0oxuyzS15i58V3UpZIt1OjRpNZqA
         P+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957521; x=1787562321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pA/To+3kMWzwkug/ZBqku9A/AeYwQ8YGNnX5KszdkqU=;
        b=dKCP9s9w+gasSUY+0OP4PR1U+4YGlMK/nuETwkl0qNgiCJaVOWIGjqSPbupa6GKz9y
         OkCatlF+whotSkZAHaZBlGK6zoYbxQyo+alfRiWKutYrEK4Rfj5I0u2CsJMvnTXGgz5R
         Ciio+GhoWHfyTNrISKwzbnR6J4bbezOwtrJ1HeMkG/x4/sHay/zq0QlxaTRfJJeYtKn3
         huKtSLeM4AxrkbhyLJnvCJyJBlETiiqh/Tv6vR9MiIR8sYO8AJcrUghnAXSkcDu79wOs
         0S69FOC+iwxfzbIF3LCmwOZy68p8eApW6aK8qE2aLCKB0rPGixlQLAr8BpoojL/WNVT4
         /Hjw==
X-Gm-Message-State: AOJu0Yyu0QsL8a7wIkUQ1C+An3H6yEJcApDeGSErYBiFmVjrf2+LqGmo
	CKgES2L6Ftq9ZW0LuqGyITro9mCwok4wBHN/FK4gr8K71vYyP2Ozv34+LjtHa4/G1tcPQEeYNMU
	19joEXQn1Acjy95sjPY8J0PxIVagvfAXIgGr9wJQLzgE+0D52cckjvziAOZRjIVl6NOc2/A5zns
	ynuzPUoNV8GAQMhzBpU3CmDtgjrZ++MKVVYLSRaGsGGB05pALweM0=
X-Gm-Gg: AR+sD13A3LnSfte+XMKISLdMXif/Gyh5Pegqo55Hhl+rvu31Fwd/CABCQyLOhBhEkFV
	A9U3LGKdadAyi/Vdqyba6bGhe/IFTTjCGf4RvaWm9Bdju8M0vhY3jEfdJJEwXW61YDotVaLAhV5
	s2CW3ZxfAUm5xKQ3J7pCDfWD3IkbKYi/REqAehB8QK5gh2+J2W+zZACBo7gXeoqkqTLSasqmQ2b
	chU1oNlzpaNa6YAkeS18icoe+TumWv9zOgS4GeOrcaoTEHMclc4UdZu33WZ2l48pCeUixTp51TL
	3j7bBIQWzAnx4luAIxbO+yclwgkcoDtK6MmkQpaK0kX2Vy/0vrmJXwMfDAY0jMrEHqnfojxXyBz
	jkmU9u6CiOvW1wU9FDABN+/Lqz6+L+GjtG3OjxViiwgWvfHJ04F6h1v1xwXIUd0tZ1HgwR+PV57
	UK2O37W3W3XtiX3NsLbNXu8ZaQlPuo0cl4n7HeVAPxEpfH+yABMoYbdqXo7wghB+R3sLvMWbakU
	8cx12U0hQ9g
X-Received: by 2002:a05:6a00:3285:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-84fddf912ddmr24019635b3a.4.1786957521110;
        Mon, 17 Aug 2026 02:05:21 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:20 -0700 (PDT)
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
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 1/9] lib: sbi_hart: detect RISC-V Worlds ISA extensions
Date: Mon, 17 Aug 2026 17:04:55 +0800
Message-ID: <20260817090503.2104998-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020522_344116_8B43D0CB 
X-CRM114-Status: UNSURE (   9.49  )
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

Add CSR definitions for RISC-V Worlds (mwid, mlwid, mlwidlist,
mwiddeleg, slwid) and detect Worlds extensions via CSR probes
in hart_detect_features().

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/riscv_encoding.h | 12 ++++++++++++
 include/sbi/sbi_hart.h       | 10 ++++++++++
 lib/sbi/sbi_hart.c           | 26 ++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index ffe7666c..e0262bfc 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -400,6 +400,9 @@
 /* Supervisor Resource Management Configuration CSRs */
 #define CSR_SRMCFG			0x181
 
+/* Supervisor lower-privilege mode World ID CSR (Sswid) */
+#define CSR_SLWID			0x190
+
 /* Machine-Level Control transfer records CSRs */
 #define CSR_MCTRCTL                     0x34e
 
@@ -520,6 +523,15 @@
 #define CSR_MTINST			0x34a
 #define CSR_MTVAL2			0x34b
 
+/* Machine World ID CSRs (Smwid, Smlwid, Smlwidlist, Smwiddeleg) */
+#define CSR_MLWID			0x390
+#define CSR_MWID			0x749
+#define CSR_MWIDDELEG			0x748
+#define CSR_MLWIDLIST			0x74A
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
index bee88557..f5f4062e 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -360,6 +360,11 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
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
@@ -647,9 +652,30 @@ __pmp_skip:
 	/* Detect if hart support sdtrig (debug triggers) */
 	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
 			CSR_TSELECT, SBI_HART_EXT_SDTRIG);
+	/* Detect if hart supports Smwid */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MWID, SBI_HART_EXT_SMWID);
+	/* Detect if hart supports Smlwid */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MLWID, SBI_HART_EXT_SMLWID);
+	/* Detect if hart supports Smlwidlist */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MLWIDLIST, SBI_HART_EXT_SMLWIDLIST);
+	/* Detect if hart supports Smwiddeleg */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MWIDDELEG, SBI_HART_EXT_SMWIDDELEG);
 
 #undef __check_ext_csr
 
+	/*
+	 * slwid traps on access when mwiddeleg=0 (reset state), so
+	 * Sswid presence is inferred from Smwiddeleg.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG)) {
+		__sbi_hart_update_extension(hfeatures,
+					    SBI_HART_EXT_SSWID, true);
+	}
+
 #define __check_csr_existence(__csr, __csr_id)				\
 	csr_read_allowed(__csr, &trap);					\
 	if (!trap.cause)						\
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
