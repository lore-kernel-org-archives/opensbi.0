Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A8EC53219
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 08:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWXwKHjSY/f/5TmenWeBy7uON+ik2wGUE4n8fF0Hoj4=; b=fi7jmLcGG7L7Mi
	wtgt/Yc4ZWOGpme+ckxOCykfC27zHiNBNxh7GuXZtRyDEqmHLdnxf/Jivi/+pA2+uw9YfQXBBg7ya
	/RjEDQ2TB6IZwCAYCvoq86RctBnUnrn3vVgUotFDbE7RGPnOjdDIHZIjZ2k1Gax5VP4y85rISYCGM
	cyVbCHkLLhSnu0I8MuPmtYpdq0rKtna+Sd1/zJnDIOjK5bshkSSglxHE+pPMWrJkSwjvBryATsW3V
	ZGXUd9xjQAmvAcu2t05+rkSDUIJWA1S1ikPptCoRZggWKgXLUQ9JW7IfWVkwpv23QWDwhqih9q9UH
	rU/FO0ireOTxNwE8i3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocu9-00000004gSj-1MfV;
	Tue, 28 Jul 2026 08:11:13 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocu6-00000004gRb-2xJg
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 08:11:12 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 66S8B3X0069307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 16:11:03 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jul
 2026 16:11:03 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 4/7] lib: utils/suspend: restore Andes CSRs on system-suspend resume
Date: Tue, 28 Jul 2026 16:10:38 +0800
Message-ID: <20260728081041.2724668-5-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728081041.2724668-1-ben717@andestech.com>
References: <20260728081041.2724668-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 66S8B3X0069307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_011111_090665_EE55F96B 
X-CRM114-Status: GOOD (  10.22  )
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

A deep sleep resume leaves the boot hart in SUSPENDED state, so
init_warmboot() dispatches to init_warm_resume(), which calls the SUSP
device's system_resume callback and not sbi_platform_early_init(). The
restore in ae350_early_init() is dead code on that path.

Fixes: b27ecec76b8a ("lib: utils/suspend: add Andes ATCSMU suspend driver")
Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 lib/utils/suspend/fdt_suspend_andes_atcsmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/utils/suspend/fdt_suspend_andes_atcsmu.c b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
index 072accc031a0..6722b70f0e6e 100644
--- a/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
+++ b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
@@ -91,8 +91,10 @@ static void ae350_system_resume(void)
 	u32 hartid = current_hartid();
 	u32 sleep_type = atcsmu_get_sleep_type(hartid);
 
-	if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND)
+	if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) {
 		fdt_cmo_llc_enable(true);
+		ae350_non_ret_restore(sbi_scratch_thishart_ptr());
+	}
 }
 
 static struct sbi_system_suspend_device suspend_andes_atcsmu = {
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
