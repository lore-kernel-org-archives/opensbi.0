Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450D9D31A2A
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XV7P9rdNLSfCvqtytHBhYHuYcmpMbo/MzTTefTipATg=; b=mF34r2dT1tm4/2
	PA3lFMFBW/rUV3UW0/Dp3JX4nW1PAE5/pcj6YEivjtyrECF+a1JHM6t2kSsGMIxplTqzg6C6BImxc
	cgVMVOjiO1Hjkbp0NuBz5pIWThgpp6Wv/LJoSHnuQvIxUUo/IrqicingdR2hTSOojawzVmkDxgY9K
	fHeLoXA0Amho8UpnKQPFCEKGG0leWjviLIu6yV0WXIMkyktY13jnJo48yIq/oxXOWM29P4HTToeK7
	Q4hs7W9sYmQ8AIdznWL+rG/LUH7nslp1ktm829nxzL8Go+3I6xGg6T1bKZBCz+uR1rWgRK7p1b8UB
	UZqLh4DKbs4ZTDQyAN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4P-00000008VqK-3xOB;
	Wed, 14 Jan 2026 09:21:41 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4M-00000008Vdu-39Fx
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382498; x=1799918498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vt2kSZHtIPFESVfVujAF2YhsakyGt9tSpTyDmTLC/EM=;
  b=lccO7hdtmwbzPEfF7KjtiTS060a+3W9u+6NDauh/JBiNTGyHoSb5hCzr
   NJ/7VrY9M03nQdioYkZ5+2a2ft8SYyqPQKI4FqiCx6BXwPbHuVDqg7oHh
   uBwEGW11Dp030Gd63qUKaggHIiNIWj/MUazQaAr4ZGpJ8XuRFW8z9U8vi
   hv00dYOCTmR0Hb23bau66iktfsFGFgcFtApKyJ30/5jhDnC7FuNWTlxhi
   RKLP/rPMjVCjZTLYukjALYrfdjCQKTwviT0tc4kHIkSnGUOBphw9H4naT
   3lLER1JjAELd87fkDMlCKp90QiStN2rZyjpE3TIRwNUbPqiPTSq9PE29X
   w==;
X-CSE-ConnectionGUID: JjjogeVFQUedD1i4Z4GxwQ==
X-CSE-MsgGUID: wtytjPdHQ6G8M5RA5mQiqQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:28 +0200
X-CSE-ConnectionGUID: a20G0je+ThuKN0VFSv3Nvg==
X-CSE-MsgGUID: SnD8Y3F1QM2QRM3qD+/u2g==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:18 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:26 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 06/22] platform: generic: mips p8700: use detected PMP count
Date: Wed, 14 Jan 2026 11:21:02 +0200
Message-ID: <20260114092118.1315581-7-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012139_188543_CE2EEC29 
X-CRM114-Status: GOOD (  12.17  )
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

When fixing up PMP regions, no need in #define for PMP region
count, we now have correct result by sbi_hart_pmp_count()
thanks to
56e93b4b91bf ("lib: sbi: fix number of PMP entries detection")

Fixing: ae3e994c30dd ("eq7: Prohibit accessing memory beyond DRAM")

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/p8700.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 1fb6ece3ab68..b4aef5fa7e36 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -21,7 +21,6 @@
 extern void mips_warm_boot(void);
 #define MMIO_BASE 0x00000000
 #define MMIO_SIZE 0x80000000
-#define PMP_REGION_MAX (16)
 
 static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 			       unsigned long prot, unsigned long addr,
@@ -144,15 +143,20 @@ static struct sbi_domain_memregion *find_last_memregion(const struct sbi_domain
 
 static int mips_p8700_final_init(bool cold_boot)
 {
+	struct sbi_scratch *scratch;
 	const struct sbi_domain *dom;
 	struct sbi_domain_memregion *reg;
 	const unsigned long end_of_dram = 0x1000000000LU;
-	unsigned long gran = sbi_hart_pmp_log2gran(sbi_scratch_thishart_ptr());
+	unsigned long pmp_gran;
+	int pmp_count;
 
 	if (!cold_boot)
 		return 0;
 
 	sbi_hsm_set_device(&mips_hsm);
+	scratch = sbi_scratch_thishart_ptr();
+	pmp_gran = sbi_hart_pmp_log2gran(scratch);
+	pmp_count = sbi_hart_pmp_count(scratch);
 
 	/*
 	 * sbi_domain_init adds last "all-inclusive" memory region
@@ -171,8 +175,8 @@ static int mips_p8700_final_init(bool cold_boot)
 	 * SBI code don't let to disable PMP region, so configure it to
 	 * some fake values. order should be valid or region won't be set.
 	 */
-	for (++reg; reg < &dom->regions[PMP_REGION_MAX]; reg++) {
-		reg->order = gran; // order should be not 0, this is minimum valid
+	for (++reg; reg < &dom->regions[pmp_count]; reg++) {
+		reg->order = pmp_gran; // order should be not 0, this is minimum valid
 		reg->base = 0;
 		reg->flags = SBI_DOMAIN_MEMREGION_MMIO; // disable cache & prefetch
 	}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
