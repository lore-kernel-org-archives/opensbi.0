Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CA0C88E77
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 05:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Ujx7NK4ENe1caf69p7MCamw9u2Au4g/imRQXpf7lNU=; b=R7/LalLltFJ3us
	COMWxypgmoFRf+2RddfQ8zdfQ2j5BnfdD2EXwSlhiwben+BjnCzo5MTjm3gqoABsYSBXd0lIUyME5
	dtAzxCkFV5xbHn7VY7LXjdjtiMct8kvQEIfAYxP7PdM3eeccfSHzk2WXPIUmW/REaL1xuNkH/dUT4
	GQhu0k16EfomIrVNWx+ddhfvX2/oia0k/EduUkhIZCMK10/sWDZ4IXYVtESMVe84G224rsnDe4uRU
	cbjyRF6ZcZyaE7m+TMEaRKzUVbUWork/QI0ThRGv18A9AQWkdAhWU+sJRGX2Oh93ndFQCaIr9kIyK
	6uDp6bGckX2+3Kx+so2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6idf-00000008QfY-3mDh;
	Wed, 16 Sep 2026 05:56:59 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ida-00000008Qdn-2RB5
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 05:56:57 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d8fb334e72so5028015ad.1
        for <opensbi@lists.infradead.org>; Tue, 15 Sep 2026 22:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789538214; x=1790143014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcQR1jg4vNs3psbwJldBtcadRmpT9A+DZd2eNdx2EyM=;
        b=dy5LNbktf/S9jSeyvrYyYvb0ZbtWhvTfvpv62FnEV1QYVSeAOOD1jhlM4tmDNABcP8
         hNq0HvKxJFIAOlMl62nwm9A786WdIe3UvTb77HhSHirGh9rza9QEwFNEkMjZYAx1LWMx
         qge1+cYzl7fYBgeNlVtu6legb+glpySEHuzqOw0jGqWM/dNuM9WOAVi8kxIsO+2L6cXU
         KxiSYZmU+y4n6LenzhH0t2L7H5hGaENvNIRCP8bnf0VI8n3wxgGnX13hoEbdom2lHkea
         hvvGpRy+w8SpeefuhfEiMM2ZU6rtZPd9O4kPDFvsgzXfo+qDe9lexNCwmuj5UjtmY0nM
         IsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538214; x=1790143014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EcQR1jg4vNs3psbwJldBtcadRmpT9A+DZd2eNdx2EyM=;
        b=m9eNycnwjnLY3tzp4H+feueNlXYSejHBPJJ5zE6SYiILuuKbRcCgGykm/y9lMp+Q6k
         yK3RCptHDUJKrHdtkBe3vriltXKHY65JoenjRmWGhtanllsjjbsNGB/QW53Sta4813yx
         86jHoSl31ehHzebyOet96hu+Wc5twOpXGtc7aIj/4gc16xUzcwf3iIcu2/dtrZkXwb/i
         yxVysGLJp6bg+bgsIeGJE7X9GyVcRqdfvApd7VcF9emkOMhC9W2VATD0oGoRkhSwe+8d
         MGz3/YIl/BRp8PLiLI8IAN1FI324HlrQthg3Nut9Q1CsmpI4sFz6yBB/qa2Nq7pgC23s
         9/Kg==
X-Gm-Message-State: AFuF++nIdMWgOG6goO+iW5X/peArapaKygH6EUaPLAJei9/Z2yaxrMEo
	/CVYINSUu0tMXS8LHsFUJFjN5rUydSk/DkwCgDNCvP5RhdbsIcszVCqUEw09LT/IRzd5YrFnHKi
	wtCdpw10N22+AAilPhc5WGVilDPTrHfdZ78+Ub9noMCcTh4IUzvfvvwS/9JJpQbvygZJkyyHhOI
	XzVuwPaUTXzhRtzOqu0Cs00p+/zWdFLmD3RbwWYUqXOoJgHg0=
X-Gm-Gg: AYBFou3KGP8meOu91iIGoghfItuspzqbueWjhDxcRcFpQKU731tnzLle97EfPSuu/z2
	jAh8u3EPxZeOWLQx/W93xyZ8DvXa5ZYdkRJIqXmV0eNB7mKeNZg7jD/pxjUmZ6O3sbTNPhRURWb
	owNVPds9XHgLf6u3Md3cxRwP99Gtc4Xw9m9uCYQIFyHPMDTz5JiO5r27ZyHG0RcCsgSWNBq88GW
	DqjTYZ26megMUw5NjHQCguIqfJe8bY0JfhR3b1uvPC6VMWFG9i77R6lZ9nUT0zZmFh5JlFg24SX
	RkiwEPfw1oTYre1WZbnrVl/gM3Gzx3ev/Te5m9RR0JXd9WsWiVMBpise+b/NBdB/k9tzeQ/u0Vq
	we7zGqSoPP7JOqs8C/zxbGC1m4adnPvEDpX11ZXThqhRCtPyc3GzoWL43B0mggUZfa3VWt/HKYa
	YZszQ8zvpVeZEoTICbtoMH1XK+ZTgX73RRCrIWZX1nbMMLOh78ikhmDt+K0kNmjEgfUMT9ghTVq
	yjURvHhOw==
X-Received: by 2002:a17:90b:510a:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-39e1e24fa7amr3671530a91.1.1789538213433;
        Tue, 15 Sep 2026 22:56:53 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm3550521c88.11.2026.09.15.22.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:56:53 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Tue, 15 Sep 2026 22:56:45 -0700
Subject: [PATCH v3 3/3] lib: sbi: allow NULL smrnmi_handlers_init and
 report init mode at boot
MIME-Version: 1.0
Message-Id: <20260915-smrnmi-context-restore-v3-3-e9dd31152515@sifive.com>
References: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com>
In-Reply-To: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Zong Li <zong.li@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4522; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=m0z0sEjM4mbNwo1EXamFq3HXR5ylNkklSj8Dr9BjZGY=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqqi+iFPsxojZrXNNcplGzACU87uUGAlh1sOmam
 mydfFPd7UGJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCaqovogAKCRCIoTSWt/mH
 4HN2D/4p3RA1czjY0atDm4EYldkDK3g0OtDK72B5Ff3f1JYqwbIe/1IBqMng6b4V6Xwk6act62o
 +JzIQjUswClL79z2U8PVldNRkFtWsXNmbsufOLUYFzK10l77U23d+U7SlwS5nELW5eOBwVMA8Bj
 +T103eyWsSjQBBrrGlvUbi3b4Xvvcor7+LTyBXn7dlQAIclAj5Wd2qRDksI+wXK22767YMttuyr
 oRx10nBLoGow/yChjV0JUE15YlHi5W2v2FbmLciAIglECuwQ+sbbnEBUBNx0N1d9YH1xgfb+QQw
 e9qnOkl9SqVZ+BeHER09h3sRLcXvKM8uJ8DYkyL/arz7E/c+QiDi9wyusfGe7/X0LGfzlOR20NA
 dTYLTFz084WED0OvzZjs+D4EBGtZjyHZtsQ5Z7hu0tU9j8MCpc2onVgNSslOz9Axv67H+3KoZVF
 Q3/iU5CsNcgbiKk0RN+DJ8YsBuSHkgzjjY2Bh2z5nJqUFxpgaQkbk4FjVTfPOQBqKKac9QSRDaX
 /TanLik99bPhLfauX0sOSA+w5PhfI6Z4+0C4eAP/B3PdxsdrkNJJj6+s8lRty8/cri6Tx0ELfiG
 Uf7V+9uwSpwW4BydayaK14dGme6KJtTYfrZT6RfnIAG66xPpO+wWgYyDEMZshpyV5Nr3T8va/gk
 sCDYawcGZMRoO/w==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_225656_157295_5359DC77 
X-CRM114-Status: GOOD (  17.08  )
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

Allow a NULL smrnmi_handlers_init only when the platform has set
SBI_PLATFORM_HAS_FIXED_SMRNMI_VECTOR to indicate it uses a fixed or
mtvec-based vector. This distinguishes platforms that intentionally
have nothing to program from ones that simply forgot to set the
callback, so the latter now fails instead of enabling NMIs and
jumping to an undefined vector on the first RNMI.

Report how Smrnmi was initialized in the boot HART banner: "Platform"
when smrnmi_handlers_init programmed it, "Default" when the flag was
set instead.

Suggested-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Co-developed-by: Nia Su <nia.su@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
---
 include/sbi/sbi_platform.h |  9 ++++++++-
 lib/sbi/sbi_hart.c         | 22 ++++++++++++++--------
 lib/sbi/sbi_init.c         |  9 +++++++++
 3 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 2cfb0976772dcff627b3c7c6bb8ff6488a3ac365..6848dc7242dc3da772209ade9ca70944b2f5fc14 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -62,8 +62,11 @@ enum sbi_platform_features {
 	/** Platform has fault delegation support */
 	SBI_PLATFORM_HAS_MFAULTS_DELEGATION = (1 << 1),
 
+	/** Platform uses a fixed or mtvec-based RNMI vector */
+	SBI_PLATFORM_HAS_FIXED_SMRNMI_VECTOR = (1 << 2),
+
 	/** Last index of Platform features*/
-	SBI_PLATFORM_HAS_LAST_FEATURE = SBI_PLATFORM_HAS_MFAULTS_DELEGATION,
+	SBI_PLATFORM_HAS_LAST_FEATURE = SBI_PLATFORM_HAS_FIXED_SMRNMI_VECTOR,
 };
 
 /** Default feature set for a platform */
@@ -250,6 +253,10 @@ assert_member_offset(struct sbi_platform, cbom_block_size, SBI_PLATFORM_CBOM_BLO
 #define sbi_platform_has_mfaults_delegation(__p) \
 	((__p)->features & SBI_PLATFORM_HAS_MFAULTS_DELEGATION)
 
+/** Check whether the platform uses a fixed/mtvec-based RNMI vector */
+#define sbi_platform_has_fixed_smrnmi_vector(__p) \
+	((__p)->features & SBI_PLATFORM_HAS_FIXED_SMRNMI_VECTOR)
+
 /**
  * Get the platform features in string format
  *
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 34f02ece279333366370114333b95ced916b0e1c..817b93ec0b21f5103602fea42ea6c72684490192 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -480,14 +480,20 @@ static int sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
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
+	if (ops && ops->smrnmi_handlers_init) {
+		/* Reuse _trap_handler for the RNME slot since RNME is taken
+		 * as a regular M-mode trap with NMIE=0. */
+		ret = ops->smrnmi_handlers_init(_trap_rnmi_handler,
+						_trap_handler);
+		if (ret)
+			return ret;
+	} else if (!sbi_platform_has_fixed_smrnmi_vector(plat)) {
+		/*
+		 * No callback: platforms using a fixed/mtvec vector must set
+		 * SBI_PLATFORM_HAS_FIXED_SMRNMI_VECTOR.
+		 */
+		return SBI_ENOTSUPP;
+	}
 
 	/* Initialize MNSCRATCH for the RNMI handler */
 	csr_write(CSR_MNSCRATCH, scratch);
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index acd2f8b66273afe64a72bb275c978fed5cc7e7c2..64b8c777fc7ecb4cbfb453cd74fcbce87b0c725c 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -199,6 +199,15 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Boot HART Debug Triggers    : %d triggers\n",
 		   sbi_dbtr_get_total_triggers());
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "           ");
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI)) {
+		const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+		const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
+
+		sbi_printf("Boot HART Smrnmi Init       : %s\n",
+			   (ops && ops->smrnmi_handlers_init) ?
+			   "Platform" : "Default");
+	}
 }
 
 static unsigned long coldboot_done;

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
