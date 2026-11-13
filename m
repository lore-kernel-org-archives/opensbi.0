Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C61606A31C
	for <opensbi@archiver.kernel.org>; Fri, 13 Nov 2026 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w0MU+rRj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ua3lbUvyYQGnpKfsC1yMm/yEkKymi1RuyaxQWeW6aMA=; b=w0MU+rRjsxql155kVJcWL2Cp6d
	ffcH2lnZHavlRQHfHxTc3OrTw1uhRdCQfn4ujtTL2owBYW1u6k0fdSSciFowXvWqwVn3x6idNqPUT
	blPSaZpX6xJrefx4TzIPCgxheU7lg4bQki8zSUsrsN9VHBv3yrzihlz2RvI73xFiI4tSbsnRvhhx7
	4RMG5ST5yuOXmhDTnrcwqbA1oSZRoqwl2lkuzfxR+1VInXjZKoAzyitg2fLjV3gtOy9t/Az0GbhRB
	XNpnxFC1PHckqRKMfakHPdSdFP6PkaMGWmPlJZpirhAvfrExyqaiDqG0RQd1sCLxrFiOXoc+WDPtu
	UPEe/5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRneg-0000000CEBZ-3Nvf;
	Fri, 13 Nov 2026 09:33:10 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRned-0000000CEAE-3Iyu
	for opensbi@lists.infradead.org;
	Fri, 13 Nov 2026 09:33:09 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD9WKql020973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 17:32:20 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 17:32:20 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 17:32:20 +0800
From: Randolph Lin <randolph@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [RFC PATCH 4/5] platform: generic/andes: ae350: register the Andes PMA device
Date: Fri, 13 Nov 2026 17:32:11 +0800
Message-ID: <20261113093212.3816428-5-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113093212.3816428-1-randolph@andestech.com>
References: <20261113093212.3816428-1-randolph@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD9WKql020973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_013308_209415_85C56AF0 
X-CRM114-Status: GOOD (  10.85  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Samuel Holland <samuel.holland@sifive.com>, Randolph Lin <randolph@andestech.com>, Randolph Lin <randolph.sklin@gmail.com>, Jun Chang <jun.chang@metanoia-comm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Register andes_pma_device with the PMA framework, so that an AE350 board
can set its PMA regions from the "riscv,pma-regions" DT node.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 platform/generic/andes/ae350.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 7aafe545..aceca2f3 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -5,6 +5,7 @@
  */
 
 #include <andes/andes.h>
+#include <andes/andes_pma.h>
 #include <andes/andes_pmu.h>
 #include <andes/andes_sbi.h>
 #include <platform_override.h>
@@ -14,6 +15,7 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/hsm/fdt_hsm_andes_atcsmu.h>
+#include <sbi_utils/pma/pma.h>
 
 static unsigned long andes_hart_data_offset;
 extern void _start_warm(void);
@@ -99,7 +101,7 @@ static int ae350_platform_init(const void *fdt, int nodeoff, const struct fdt_ma
 	generic_platform_ops.pmu_init = andes_pmu_init;
 	generic_platform_ops.vendor_ext_provider = andes_sbi_vendor_ext_provider;
 
-	return 0;
+	return pma_set_device(&andes_pma_device);
 }
 
 static const struct fdt_match andes_ae350_match[] = {
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
