Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55049C369D9
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0MA1oWl5Ha7LKZj0QVyMO1KO3gJV7/d4NrY1S9KKXXM=; b=uS+InGn29zdhwY
	6EhEOrugRTUA9Z3pjejfOEMochkDq+PdLnvunsI8T4JP2tl088Vhf0pECdgAHsZl5NSgFLKGu4Wfi
	L70aP8I1cAShGuHGewUIobo1H1Ga/UOptxiHxKn/DLk89zANvZh3Pfk0PXbQqUOYPKDIbqQofWlZ1
	r6tPuCXUhtvSWK9xDzsE2RrjjVTeg+IXZfgv6VK34mxnsGfogEPOCKlrZQutbsycpSqtaKEJJHV/F
	FBk2oa4VDQc5iphlJfO7bNAZxXfV+v/pa7cwKWGvD6UzK8YAbDZoy3tPj4BDpy4jjMZdlZUxg1DcA
	wmYEjMbBGUosrg4d3DGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3Su-0000000CJ8o-0q9D;
	Wed, 30 Apr 2025 09:10:52 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3Sr-0000000CJ6S-1VeA
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 09:10:51 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 53U9AYf3095233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 17:10:34 +0800 (+08)
	(envelope-from alvinga@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Wed, 30 Apr 2025
 17:10:34 +0800
From: Alvin Chang <alvinga@andestech.com>
To: <opensbi@lists.infradead.org>
CC: <anup@brainfault.org>, Alvin Chang <alvinga@andestech.com>
Subject: [PATCH] lib: utils: Fix fdt_mpxy_init() not returning error code
Date: Wed, 30 Apr 2025 17:10:07 +0800
Message-ID: <20250430091007.3768180-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 53U9AYf3095233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_021049_704481_A68647F5 
X-CRM114-Status: GOOD (  12.44  )
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

It seems that current implementation doesn't fail on fdt_mpxy_init(),
because platforms might not have any MPXY devices. In fact, if there are
no MPXY devices, fdt_driver_init_all() will return SBI_OK.

More importantly, if there is any MPXY device which fails the
initialization, OpenSBI must check the error code and stop the booting.
Thus, this commit adds the return value for fdt_mpxy_init().

Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
 include/sbi_utils/mpxy/fdt_mpxy.h | 4 ++--
 lib/utils/mpxy/fdt_mpxy.c         | 8 ++------
 platform/generic/platform.c       | 3 +--
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/sbi_utils/mpxy/fdt_mpxy.h b/include/sbi_utils/mpxy/fdt_mpxy.h
index 2ba9d28..57e0b24 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy.h
@@ -15,11 +15,11 @@
 
 #ifdef CONFIG_FDT_MPXY
 
-void fdt_mpxy_init(const void *fdt);
+int fdt_mpxy_init(const void *fdt);
 
 #else
 
-static inline void fdt_mpxy_init(const void *fdt) { }
+static inline int fdt_mpxy_init(const void *fdt) { return 0; }
 
 #endif
 
diff --git a/lib/utils/mpxy/fdt_mpxy.c b/lib/utils/mpxy/fdt_mpxy.c
index 6984ec7..e6e2614 100644
--- a/lib/utils/mpxy/fdt_mpxy.c
+++ b/lib/utils/mpxy/fdt_mpxy.c
@@ -12,11 +12,7 @@
 /* List of FDT MPXY drivers generated at compile time */
 extern const struct fdt_driver *const fdt_mpxy_drivers[];
 
-void fdt_mpxy_init(const void *fdt)
+int fdt_mpxy_init(const void *fdt)
 {
-	/*
-	 * Platforms might have multiple MPXY devices or might not
-	 * have any MPXY devices so don't fail.
-	 */
-	fdt_driver_init_all(fdt, fdt_mpxy_drivers);
+	return fdt_driver_init_all(fdt, fdt_mpxy_drivers);
 }
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 2e85664..47e771a 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -324,8 +324,7 @@ int generic_mpxy_init(void)
 {
 	const void *fdt = fdt_get_address();
 
-	fdt_mpxy_init(fdt);
-	return 0;
+	return fdt_mpxy_init(fdt);
 }
 
 struct sbi_platform_operations generic_platform_ops = {
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
