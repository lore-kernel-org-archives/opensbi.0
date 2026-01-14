Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD1BD31A2A
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUwF7OmAaVKc2bhAuoDHc6YJk7bhYDPg4oW7WumoWhQ=; b=ubSrMOJwC4fGhQ
	Y7uopzNOrwc378/1CHq3hGbQVQEZZlpZoydHDY19PXKYMSQ5J1mKack5LXHUOWeDiKbVSJJ2df0qo
	2owkV8UHFSSChLgvwM3J2zeI/ZBXY8wqCNnLUaNczI0TumBXqPdvylzaSMfWTtp+U9D2CC3/1zYzz
	kMqq35EZCDb0gN5vEYdE+RYGsSqsuxOoSzX+rMcnnnsvnPuiv+8AZmOiIKnSt2LcRhMpCMD+OrGud
	sXP6AOBi3DUzfZWQXlsmIBshHl6oGSaJWIAgwXGtCZBTqqK8AuRB2k8FhIkEp15A/EgP1Vyax1WpC
	bsYlX1KZCMrUzlLu5jvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4O-00000008VoO-1wiR;
	Wed, 14 Jan 2026 09:21:40 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4J-00000008Vdm-1oMf
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382495; x=1799918495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hNCx72wcmP4RWQ+uYrlNGj435+y0p9yHt69PkI5K2mU=;
  b=JLV9ynyXbAsSNdKa4I6O9Js73VB4YsNCqT1vIrhq4sJo+zbvmX7dm9pv
   NpMuUHmfW72bRVi2h92ZO2nSURgLvWdXabX5WZhS8BOOl9ZG4IhpJ/INR
   SLV3OO5SFgqLQNosGe/2oETONF70FUrvKdb7vwhmx3h8VaUktasIN+S1/
   I82DBwUqHf5G0PJuzhHYD6KR7knTUbfsWII21Y6SdMpQIUn1jcTyxVs5r
   vEPjGQILjJXzkxsddVRr5pd/x9ANKSwiGvHpVkEEkP50BYTtNbo+xQm1q
   TU+rlPaH5IT4JNSuXcG7k0W8X7rRjCki7BJt9H/SoUeL0vsoVJ8UWy1td
   Q==;
X-CSE-ConnectionGUID: z46RAvKCTcWX/fTP+QsvEg==
X-CSE-MsgGUID: JLG1gflkSyi0K/9fjNujaQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:25 +0200
X-CSE-ConnectionGUID: fWfyzGuYQd61Gp9m61qFmQ==
X-CSE-MsgGUID: fmg+SJVsSaaMsKDVadppXw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:07 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:24 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 04/22] platform: generic: mips p8700: prohibit accessing memory beyond DRAM
Date: Wed, 14 Jan 2026 11:21:00 +0200
Message-ID: <20260114092118.1315581-5-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012135_794537_8877D4AE 
X-CRM114-Status: GOOD (  18.39  )
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

SBI code arranges domain PMP regions in a way that last entry is
all-inclusive "0..~0 RWX". When PMP is actually programmed on the
later stage, only defined entries get programmed. Therefore,
if boot code configured some entries beyond what is set in domain
configuration, it will be untouched. Thus, to prevent left over PMP
entries, domain should configure all possible PMP regions.

Find last PMP entry configured by generic code, adjust its limits
to match DRAM. Fill the rest of PMP entries with valid values that
will not interfere with actual memory access configuration required,
but will force SBI to configure these regions.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/p8700.c | 44 +++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 07cea604a415..2ba412a057a8 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_timer.h>
+#include <sbi/sbi_hart_pmp.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
@@ -19,6 +20,7 @@
 extern void mips_warm_boot(void);
 #define MMIO_BASE 0x00000000
 #define MMIO_SIZE 0x80000000
+#define PMP_REGION_MAX (16)
 
 static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 			       unsigned long prot, unsigned long addr,
@@ -141,10 +143,48 @@ static const struct sbi_hsm_device mips_hsm = {
 	.hart_stop	= mips_hart_stop,
 };
 
+static struct sbi_domain_memregion *find_last_memregion(const struct sbi_domain *dom)
+{
+	struct sbi_domain_memregion *reg;
+
+	sbi_domain_for_each_memregion(dom, reg) {}
+	return --reg;
+}
+
 static int mips_p8700_final_init(bool cold_boot)
 {
-	if (cold_boot)
-		sbi_hsm_set_device(&mips_hsm);
+	const struct sbi_domain *dom;
+	struct sbi_domain_memregion *reg;
+	const unsigned long end_of_dram = 0x1000000000LU;
+	unsigned long gran = sbi_hart_pmp_log2gran(sbi_scratch_thishart_ptr());
+
+	if (!cold_boot)
+		return 0;
+
+	sbi_hsm_set_device(&mips_hsm);
+
+	/*
+	 * sbi_domain_init adds last "all-inclusive" memory region
+	 * 0 .. ~0 RWX
+	 * Find this region (it is the last one) and update size according to DRAM
+	 */
+	dom = sbi_domain_thishart_ptr();
+	reg = find_last_memregion(dom);
+	sbi_printf("Fix region[%ld]: base 0x%lx order %ld flags 0x%lx\n",
+		   reg - dom->regions, reg->base, reg->order, reg->flags);
+	reg->order = sbi_fls(end_of_dram);
+	sbi_printf("Modified order: %ld to match end of DRAM 0x%lx\n",
+		   reg->order, end_of_dram);
+	/*
+	 * clear the rest of regions that may be set by the boot code
+	 * SBI code don't let to disable PMP region, so configure it to
+	 * some fake values. order should be valid or region won't be set.
+	 */
+	for (++reg; reg < &dom->regions[PMP_REGION_MAX]; reg++) {
+		reg->order = gran; // order should be not 0, this is minimum valid
+		reg->base = 0;
+		reg->flags = SBI_DOMAIN_MEMREGION_MMIO; // disable cache & prefetch
+	}
 
 	return generic_final_init(cold_boot);
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
