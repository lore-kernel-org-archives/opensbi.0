Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D01C79F82
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 04:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8DengUXYNP+4BBuQkYMtS2D/OwkW2Db0jLnKC9Yo50=; b=veptMh89oozryx
	x/O1dmY9dh/86KHdqBIKbofnEey/cU4S3Kxwqb804ZCkxg2DPtEofpxkfJzP9v1eL5fwS0W8l/fZ1
	LWbzMifq6kRSG5nthtwY59kejrb+ZOeBYPw2xmLaq9/edXpnKGrvfUR9OUVIUjlF7ImrTqJ9q7Gwn
	N0n56rEWdlcHTdyAuzhsDAGQWKau4WUmBFMqh3LqJ3q65rBCMzysWxwLGvpQ0A1OP95lEcXOCWc7L
	dDKC40d1W+kFIwukfnmRB4z+ErQlThq/ehhj9Ixxi4vOQEdpg6EP7wUMAsnRcHJ0cvEuyxdd5E8/B
	c5YSb7pUfeeeVuD18R+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LmS-000000012G7-40Eq;
	Fri, 04 Sep 2026 04:44:00 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LmP-000000012E8-1afe
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 04:43:58 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so694477a91.0
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 21:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788497036; x=1789101836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZidwyuJ1F3KpXNooiEERPdCYMFrxGznpWlxZ6RP9nPk=;
        b=K71mt/PFzPu8gsITar2bUQrBH1vd7DhzqdL/5grnOoK6zEhEwmLyi93W16mjCgYBMs
         dPMCi9iX2c38z/1fqHP0ORgNA/MFo5muPn5fVQmpaGMuZMmqI44WeCrNgOAA0wsZ08ey
         VYjqj9trMw5UJdxGxOw8rQUbwplR5U8fyvOE+pUQAcOgBenwayG/KodYTd73bY6bG/1x
         MvH2Ur4A3fq9UxHT5rlVbUjUwsbMoPdGD+1WsSJk4udhcWdgB+eZh7Y5EFLnpiJkWacc
         SlnFaO7D0XplguXm10pHXQYsTQApfZ6qCC3SCUgN9dPGZTICuTU0Y5GsOsqOuapcYKbO
         QGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788497036; x=1789101836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZidwyuJ1F3KpXNooiEERPdCYMFrxGznpWlxZ6RP9nPk=;
        b=sfA4KcQW1mpg3zh6ce0gPhoBeiYAmK048O+0bqRkwAV5AcXAxqZGivqNQHZRFXfuH8
         1psvhp4MwXVOmAJzLXsbrFDtIm/Bjh0Yu1g2X47eqKedNN4gwpMPs7mkJxSo3z8LYTey
         Sgag3zLXhU8eFfWpe2c3IwVL9nMesLUK+/4+NPqFwAf+oMambYyz/95EY3Zksq7tZq8B
         KIhCMwbWfTzdhZpRzOxJHDwuYl+52S7b3fH+Kq8xpjaqeDV5YMH01tkbTZ74LI/uAi+D
         2fzcvRQGlVsHr9STuGItFbwgkv8eKs7znpXISCE13AtTFQ983Zo3TuM6ut0VXRPx/H7j
         s2GQ==
X-Gm-Message-State: AFuF++n1e4wFYFP2YPw+2N/Ac9773ShWKPTbkQ+K3IKV4zl4hNAQ1CMB
	JRH9SxxXdVYYIhwkObiVmQ60MBCTdiOym0L7iO5LAUfnIndI0/FXJHUHBvSHOn5J5i4=
X-Gm-Gg: AYBFou0HTrc3/vvC5rC1cWF74E8kNJUyYmXPZBk/6G+wZmBBv4oyFA3Yj2O3fzEoIOt
	1b/P+zEgVo6AvQuc/g0kggCkxQXps7kZ311tS/+MJoaVVhUgby+LaUVjuuNeEySJe8UZ7JEnAaC
	727/Fje3M+kuI6eb+Af42ML+NH3YCLQxrRLnCYvSGhJDFW3C+FTXSyW/XFnAcKdIQU4vlRrQ1ow
	UpSaQL9REte88bxroqoMI9up0+MpLSgtwOlhzOIepzuriZ+mbC0XTiSED8HSvqywqtMPqM6z4bR
	m9ewyKo1hKarWLUHkeBZZaaPEN0TGlQ9VDdtUrPvTaH8tzoeiXr/SsJndd+bkpGqaq/eDpByFmG
	1FKtLsMPnq19moG4lZJtcVe/b0Q14R4/VHNG58HWEUw/dxe8AjRaR71f/CenEO7exA1HIH9CVK4
	aafZiitDh2VI9Tj4yCro6XqraxwSPAP4OnF8jwcKYbaVBe0axaPDBCe4/8XSzUeDvTqOuXcVU=
X-Received: by 2002:a17:90b:50cc:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39b261d9da7mr5998596a91.18.1788497036441;
        Thu, 03 Sep 2026 21:43:56 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm3574463eec.30.2026.09.03.21.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 21:43:56 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Thu, 03 Sep 2026 21:43:51 -0700
Subject: [PATCH v2 2/3] lib: sbi: report smrnmi_handlers_init failures
 instead of ignoring them
MIME-Version: 1.0
Message-Id: <20260903-smrnmi-context-restore-v2-2-10b17506d257@sifive.com>
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
In-Reply-To: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>, Nick Hu <nick.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Zong Li <zong.li@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3049; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=ypApN0JBwbcNSVDDZMCHezu9MLn5S1R04eWh53TufQ8=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqmkyJndb61AVRvPkXH18gp7JJ1BAgmRlG1W9Kl
 4nkKK9Rt7CJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCappMiQAKCRCIoTSWt/mH
 4ADPD/9DHgyTEayOhsyIQd84iNROimx9oBpLWKq8d/xjdlHDn5DymF/7W9v1JC9qT5WZdCbclvp
 bWtnwZsZNAMlwX9xP7I23AVTpM3OSeRNyUVw8qb8Jv4SvsWCpt8cuDKvxNCedkH4vD21n+dgj8H
 uiOmcEijNm+CrBxXed0ktjqIjSdSaJVtt7dCash5F0AKcyiw1xsQcDp2v++Wkbi0FyVEE2WpgxZ
 do+yDvnvPDDx+XQMr2YdKN3Yfd0d4LiheSjMAMqIMB4xIu5TKRwVsdUS9KXv14HEoPw8lu4dvbC
 0QQ2N6fxbOEVhFSfkBknqtnTYJr55KYH14HA/mtJMyCBBt6Cd0g8btFYF8oDNJEso4CteruTIee
 0A9epuYFrKRYpVQCWwOVK6zHOWcrasvhZgclKNq7Zkmjs/7/00juI3f7/k/Tr8ckW/vTQKyXWYP
 KVGeCyu0weW0VhLABDQOoFIImXMoUYBA49Jozm6Kycl6vvbO1wxPgiLMnnmsmEU0iX2fYbQ0X1X
 wCZZBFF02NkuXY22Yz5opnvgWxzetE+mhSdr5pM6i8uK8uznZYzYGfU5WyIbJjN1nw/Ag0nSHRr
 4s1ODi4FbYlzdPojEyJ6LMpY27OGv7RDFP//FXDf2IB2oguAmIqGw/NbeMA3PFnptHxaO+zk+2Q
 ReY2Z539mpIjS+g==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_214357_425741_1A7ACE15 
X-CRM114-Status: GOOD (  13.95  )
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

smrnmi_handlers_init returned void, so a failed callback went
unreported and NMIE was enabled anyway.

Change it to return int and skip enabling NMIE on failure.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Co-developed-by: Nia Su <nia.su@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
---
 include/sbi/sbi_platform.h |  2 +-
 lib/sbi/sbi_hart.c         | 19 ++++++++++++-------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 1e9a23c1252558879c683633ad000828fbfa8f3f..d55805defafb0a7935d0d95653aefcc622078f69 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -155,7 +155,7 @@ struct sbi_platform_operations {
 	void (*pmp_disable)(unsigned int n);
 
 	/** platform specific Smrnmi handlers init on current HART */
-	void (*smrnmi_handlers_init)(void (*rnmi_handler)(void),
+	int (*smrnmi_handlers_init)(void (*rnmi_handler)(void),
 			void (*rnme_handler)(void));
 
 	/** platform specific Smrnmi NMI handler.
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d2b5be6a3ce68e6ab5c368e83b9cd0f09c4ca337..e34bbe27a8396fef80a3d69c0416898cae47ec88 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -466,15 +466,16 @@ static int hart_mhpm_get_allowed_bits(void)
 	return num_bits;
 }
 
-static void sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
+static int sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
 {
 	const struct sbi_platform *plat;
 	const struct sbi_platform_operations *ops;
 	extern void _trap_rnmi_handler(void);
 	extern void _trap_handler(void);
+	int ret;
 
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
-		return;
+		return 0;
 
 	plat = sbi_platform_thishart_ptr();
 	ops  = sbi_platform_ops(plat);
@@ -484,13 +485,17 @@ static void sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
 
 	/* Reuse _trap_handler for the RNME slot since RNME is taken
 	 * as a regular M-mode trap with NMIE=0. */
-	ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
+	ret = ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
+	if (ret)
+		return ret;
 
 	/* Initialize MNSCRATCH for the RNMI handler */
 	csr_write(CSR_MNSCRATCH, scratch);
 
 	/* Enable NMIs */
 	csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
+
+	return 0;
 }
 
 static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
@@ -514,7 +519,9 @@ static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 	if (rc)
 		return rc;
 
-	sbi_smrnmi_hart_init(scratch);
+	rc = sbi_smrnmi_hart_init(scratch);
+	if (rc)
+		return rc;
 
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, &trap);			  \
@@ -707,9 +714,7 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 	if (rc)
 		return rc;
 
-	sbi_smrnmi_hart_init(scratch);
-
-	return 0;
+	return sbi_smrnmi_hart_init(scratch);
 }
 
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
