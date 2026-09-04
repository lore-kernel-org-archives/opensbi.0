Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F90C79F83
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 04:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eh24LEreK+hvo1LO572PTQZ0BxH3r8rekRmRvpX+KhU=; b=dCyL0MEu2bFYDO
	tSiQzkq2dO79ZbCY++/ctwmSieObcHU3Wo2VE/TXqUaUSA9mC9hpppSjlyM6n6RdgFV0xpPZUx2Cu
	w1WOKiJEqs4nWDkzpUSwMMGgJvbiu8JP3ydIoddF4ucQGmKb7iP27Mwjw8K6XAtBzpyecIBIjU/sK
	cPdJXmylHzPWYRk+PrtEwwgcRZdgxhgZdA1EnNi1uPPt9vsfNYRGzR0pBQcIYox6HNP0V/umUj5Jm
	tp6bMaSoFGLq1G5bDOprH9BNkRkeL7rEU+5we8ZaOReTwDpgwhMgP5LHJABI1cZApXwxum3CaK0ro
	tGx02NXHxlfy1US8EbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LmT-000000012GM-0GzU;
	Fri, 04 Sep 2026 04:44:01 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LmQ-000000012Ek-0Hra
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 04:43:59 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-ca80d708489so447597a12.1
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 21:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788497037; x=1789101837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWkeN/cnrC/qZtDZUnTSIQ04kAF4+NohFBBRZIEn4f4=;
        b=hhjZUuVVvHYGyStP9g9p6fNfIgcodEHYb9G59gN9aoQQ5Q2whg4BJy2Y7PqM443c/S
         PVhucURdAGDxLMSArT1nT2iCWBvI+ujeaZfI1iXuVfKeva47Ue5JI7lNR/qaXBk13lZ6
         PUVtZgN3S+nM1V1q3oNpF11ztXpkfi3xIzRyOWaGp25Dt/6e3x1JPmFTyPskNECaNFYU
         a5fyyR4tgUShzAYX6LDl/W4h8jJWR6t6sF8k5G38oovGgilMbpQCUMEPAl2IGpeUn9xp
         h2nW+xWoRlWlhRFERL0jLJRjBsiVOi4VazDwpa1R5StKUcKqwX1keL7dSZ4wXABnmAGm
         ds1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788497037; x=1789101837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWkeN/cnrC/qZtDZUnTSIQ04kAF4+NohFBBRZIEn4f4=;
        b=OaG3gLcHNOQvtJNzwq5ndWqcrcXUUMN2Dy1UvtWFfCnD1D+vLjpemYRZH+OB8YuZ4X
         c8NtRkh1SpJJCBYZ/iS5jR0DA/inThqP4IONOZ855dHFC4lnp6qxnqNabO8EGkzY4U55
         d5P0Z3MpOMjQxkA6Qi4MnlSu+Mh64aRR8O+SKr3nAcwJKUsOg71LQsqHKIUVud6LgJF1
         x1hdC1mGYTxz5zfM7oltOdMzXumE5+yXH2+vlTVkDF+jDBthSbDUE7+XKqTXC6z4rVb+
         ndWqYiMzdSnetqEwV3cxmrMIk4yubhRTssTBder09y013RbhC0jbS6IKhyijilrQuk4T
         sR3A==
X-Gm-Message-State: AFuF++nzPeXTezeqIxFU0MnN8IAnXcgdDWYS1qsRLY+v9SG90mlnRqJj
	4ug6cmWuT3TCntq6/8uc+uoNEkr89VFS5lST9ea+1lhEd0FPumii3uoMvZnOst+su2k=
X-Gm-Gg: AYBFou0cSp5/YewwAax1jWnwr6lKBHNB9MTNYvzQqx/FbYLFVN/TXM2L4cIhN46ufER
	bpHn3WT66Fm51cqyMXDmzcndaK2+pZ0H8ErDay9jf8Ood0aY2/2BCBt7c3y4iht2/u3zrZFRKht
	FoWC7Bvb792CMrCvV9DoARDu5E9vj2Y2pp6S6DDa9DfC05zY84WKKEB7pT5wVDdQWlb01673Iz1
	lPHHOxUTNrT3+jxjmmZ2e/P+r9GIR6sazedEb/4CJo9+ju7z7ybYPXrva39CQzaIXEeYIuXdwsW
	s0JYB9nt+JeJmy6IXLFYcQXYZigN2TCRQ+6UwaWsbTAfUG1uJKhbhFzvLVR+xy07FFlYIZ6XRjC
	jGVQ2pwU43BXyvhdIkcst+B4yxYbtfLcIHfYdy5PtsDCn/MRH4HNBeySQ5/4MCcj8RjXbZN5GoL
	V3cwbSM/PvNkSRWZXnPT17McGn5UgoawiNwaswoRRLHZnzqawnq7ngSfwVrXVItpIKi242yxk=
X-Received: by 2002:a17:90a:c88f:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-39b07f3216bmr11806705a91.3.1788497037194;
        Thu, 03 Sep 2026 21:43:57 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm3574463eec.30.2026.09.03.21.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 21:43:56 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Thu, 03 Sep 2026 21:43:52 -0700
Subject: [PATCH v2 3/3] lib: sbi: allow NULL smrnmi_handlers_init and
 report init mode at boot
MIME-Version: 1.0
Message-Id: <20260903-smrnmi-context-restore-v2-3-10b17506d257@sifive.com>
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
In-Reply-To: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>, Nick Hu <nick.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Zong Li <zong.li@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4448; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=IUzgt9X9225LIlGKNYw+DfwzkP5zUIVVJvomqhWnYOs=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqmkyJMTuHUz9WCoPYqtKsV5c+/m3TYyvOl27pC
 /GeE42ahhiJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCappMiQAKCRCIoTSWt/mH
 4BEkD/0YJKyksGqv7tbjhXmEA7lwUsYNbtm4eOBza2jR5HfbHpZgZ3eggfpEf3EoLNxo8qXqIdD
 ijk2yjSD8G/pQiA6JIy5N8EvxiUdgKC/Uk/ZJa74l9JYsTCZJCHtwUqvUmR3ME0IDgWa2/aMlFv
 nzra5qm8z1IHfWIdchS0BCOgiS8MB+ROux9zwN8z58YzQ0PibKxMVNm4hz+L8tNignHiWS2LNh1
 4kYT+mQKlsUqFCOIV+EShUCgXvDQzQ72GrpGIKWTXTz+OECFo2cskM/gFDzpcggSGIAVz3plfM0
 hus1d2yCV6a4NdLBwBGMjTe7BuUjYPJcmXVNAN38Ll2vGa8y0W+ZJlhbH3hrE22sze5aIce94+a
 2yZxoqgDUNTX8wvOONe88iXFgF4Gi2NjS/UvZE/1HVlJyfbgc9i/qZYmN45GjnnJrl1ziVkVxeF
 IBSkCeF6asyzhhFg4qpFDDY5lV35433uv6fujJ6+WEemRPW1LpH/4y7dA+cs5/jO4y9BzHb66w9
 3OVqgi8ZqJcOvnfV6rbn2n+5gGunOz5g/l1mqE8BFIxLlFiBlYktYrn9gD3DbIlYG71QO4qDf+Y
 mFd00Y9hoWgnZxMVec+8vztZV1frjAi4PajOaZMcHU8fB1MkeJLQteGs/kPbFM0xkgLUoej58e9
 wTP4rbmDfWdnz9w==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_214358_156524_2D3AF7B0 
X-CRM114-Status: GOOD (  16.80  )
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

Platforms with fixed or mtvec-based NMI vectors need no vendor
register programming, so calling sbi_panic() when smrnmi_handlers_init
is missing is too strict; an unhandled RNMI already falls back to
sbi_trap_error().

Allow a NULL smrnmi_handlers_init and report how Smrnmi was
initialized in the boot HART banner: "Platform" when
smrnmi_handlers_init programmed it, "Default" when it was left at its
fixed/mtvec vector.

Suggested-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Co-developed-by: Nia Su <nia.su@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
---
 include/sbi/sbi_hart.h |  8 ++++++++
 lib/sbi/sbi_hart.c     | 35 +++++++++++++++++++++++++++--------
 lib/sbi/sbi_init.c     |  4 ++++
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bba41526017cd95596348e26eaa897850a..ddf1bcb2bd79aded24441db7304dfc0db14615ff 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -107,6 +107,13 @@ struct sbi_hart_ext_data {
 
 extern const struct sbi_hart_ext_data sbi_hart_ext[];
 
+/** Smrnmi vector initialization mode */
+enum sbi_hart_smrnmi_init_mode {
+	SBI_HART_SMRNMI_INIT_NONE,
+	SBI_HART_SMRNMI_INIT_DEFAULT,
+	SBI_HART_SMRNMI_INIT_PLATFORM,
+};
+
 /** CSRs should be detected by access and trapping */
 enum sbi_hart_csrs {
 	SBI_HART_CSR_CYCLE = 0,
@@ -152,6 +159,7 @@ bool sbi_hart_has_extension(struct sbi_scratch *scratch,
 void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
 				 char *extension_str, int nestr);
 bool sbi_hart_has_csr(struct sbi_scratch *scratch, enum sbi_hart_csrs csr);
+const char *sbi_hart_get_smrnmi_status_str(void);
 
 void __attribute__((noreturn)) sbi_hart_hang(void);
 
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index e34bbe27a8396fef80a3d69c0416898cae47ec88..455c32185e7d6e42527cb66dfdb0f18405ec09bd 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -466,6 +466,8 @@ static int hart_mhpm_get_allowed_bits(void)
 	return num_bits;
 }
 
+static enum sbi_hart_smrnmi_init_mode smrnmi_init_mode = SBI_HART_SMRNMI_INIT_NONE;
+
 static int sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
 {
 	const struct sbi_platform *plat;
@@ -480,14 +482,19 @@ static int sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
 	plat = sbi_platform_thishart_ptr();
 	ops  = sbi_platform_ops(plat);
 
-	if (!ops || !ops->smrnmi_handlers_init)
-		sbi_panic("Smrnmi detected, but platform lacks smrnmi_handlers_init callback\n");
-
-	/* Reuse _trap_handler for the RNME slot since RNME is taken
-	 * as a regular M-mode trap with NMIE=0. */
-	ret = ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
-	if (ret)
-		return ret;
+	/*
+	 * Platforms with fixed or mtvec-based NMI vectors need no
+	 * vendor register programming; NULL callback is valid.
+	 */
+	if (ops && ops->smrnmi_handlers_init) {
+		ret = ops->smrnmi_handlers_init(_trap_rnmi_handler,
+						_trap_handler);
+		if (ret)
+			return ret;
+		smrnmi_init_mode = SBI_HART_SMRNMI_INIT_PLATFORM;
+	} else {
+		smrnmi_init_mode = SBI_HART_SMRNMI_INIT_DEFAULT;
+	}
 
 	/* Initialize MNSCRATCH for the RNMI handler */
 	csr_write(CSR_MNSCRATCH, scratch);
@@ -498,6 +505,18 @@ static int sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
 	return 0;
 }
 
+const char *sbi_hart_get_smrnmi_status_str(void)
+{
+	switch (smrnmi_init_mode) {
+	case SBI_HART_SMRNMI_INIT_PLATFORM:
+		return "Platform";
+	case SBI_HART_SMRNMI_INIT_DEFAULT:
+		return "Default";
+	default:
+		return NULL;
+	}
+}
+
 static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 {
 	struct sbi_trap_info trap = {0};
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index acd2f8b66273afe64a72bb275c978fed5cc7e7c2..60df5afe065f3eecc37a2cc59f4b91cfad1c081c 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -199,6 +199,10 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Boot HART Debug Triggers    : %d triggers\n",
 		   sbi_dbtr_get_total_triggers());
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "           ");
+
+	if (sbi_hart_get_smrnmi_status_str())
+		sbi_printf("Boot HART Smrnmi Init       : %s\n",
+			   sbi_hart_get_smrnmi_status_str());
 }
 
 static unsigned long coldboot_done;

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
