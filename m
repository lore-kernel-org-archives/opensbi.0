Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80389D31A33
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qK7FH5ZTNqXLLhFitRu8LeL3Xjd+5icAUq7bDOnvAy0=; b=rbMaLetWFzUumP
	97Yf8e20bssbqfBm4R+HpvwtmVYvsmfmxzeYuPk9/Y07y8k4JkA+EWEd+gjYnXp+EG2kRRn4E+keN
	ODJNYCga/SZ38aUtKnzpiOpdhJWyQNB+DC66k6/ckU1nWOKDzLTNcCW0NEmYSfZI04z3sA8XeDbzv
	35MFDRLahBtwwf9KlHwQNrL5f3pMxURWc2Z43bpgrf2g1MO1INn5ZqzR8YZODYd3aNGsQ76UybxBj
	KHVhdnUhQr1uZ4bGBwJE43+z6nZVDU/QSwqGL9B2aU6yPt4LgyxplmEQCtsXL1bU+iinVZVeF0/kn
	VJYVV9NLDK5XsXxtJEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBM-00000008YSy-18Os;
	Wed, 14 Jan 2026 09:28:52 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBH-00000008YMh-2Hb0
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382927; x=1799918927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uvdzpi3KRRJoeXTINZlvU877ylrr5iOY8Guo+VjLGTE=;
  b=ZCKhw92v16Neu9XjaDo7Eb6m06UkxtInnstR4H5sK1L7BLqTp9BdgtJg
   WsMZ/nvFFf5uqmiu+XPCE4Eyp6oLHCFQzsSv2/B0uELTdFaJ32Ss8VsvP
   lp5r14rMCn2WiYRdbchAG33rh1BL4tr+oWk/Ex+zlupGiC6TTPX4j8cQy
   JKvHiEJ6/ksaAMvQAYs9kM0Gva3O9c+m4Snbz9VmSEHY5F52HP1YDDpUA
   o+autcUBcSzWQAHftgHIejgNghSaqWwPIwlinau+6r54CtgugIUi0c8PC
   fQOsDDZXKBKfmeFIs1g2Kittsq3KNhjKg7oIONs11ecJe16YJ+Oq5OR6j
   g==;
X-CSE-ConnectionGUID: IKWDQWRxSOa9djxPvOgmbg==
X-CSE-MsgGUID: 68Xx9S/gQhClZ0IMRdnnog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:33 +0200
X-CSE-ConnectionGUID: 0FsSk9wXRy6HOWjHiWQFtA==
X-CSE-MsgGUID: HmmVQYa/QbWyjaQHvQk85g==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:20 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:32 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 11/22] platform: generic: mips p8700: restrict memory region to physical memory as in DTS
Date: Wed, 14 Jan 2026 11:21:07 +0200
Message-ID: <20260114092118.1315581-12-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012848_106054_8B3C8389 
X-CRM114-Status: GOOD (  17.11  )
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

SBI domain initialization add "all memory" region with unrestricted
access. This can cause a problem: CPU can issue
speculative prefetches to non-existent addresses. If this access
goes to the system NOC, it is mis-interpreted as an access violation
and error is reported, forcing system reset.

To prevent such a speculative transaction to leave a CPU cluster,
block it using PMP, by restricting memory region to physically present
memory.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/p8700.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 25e6075581e8..a3d05602a6d1 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/riscv_io.h>
+#include <libfdt.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
@@ -148,14 +149,36 @@ static struct sbi_domain_memregion *find_last_memregion(const struct sbi_domain
 	return --reg;
 }
 
+static int fixup_dram_region(const struct sbi_domain *dom,
+			     struct sbi_domain_memregion *reg)
+{
+	const void *fdt = fdt_get_address();
+	int node;
+	int ret;
+	uint64_t mem_addr, mem_size;
+	static const char mem_str[] = "memory";
+
+	if (!reg || !fdt)
+		return SBI_EINVAL;
+
+	/* Find the memory range */
+	node = fdt_node_offset_by_prop_value(fdt, -1, "device_type",
+					     mem_str, sizeof(mem_str));
+	ret = fdt_get_node_addr_size(fdt, node, 0, &mem_addr, &mem_size);
+	if (ret)
+		return ret;
+	sbi_domain_memregion_init(mem_addr, mem_size, reg->flags, reg);
+	return 0;
+}
+
 static int mips_p8700_final_init(bool cold_boot)
 {
 	struct sbi_scratch *scratch;
 	const struct sbi_domain *dom;
 	struct sbi_domain_memregion *reg;
-	const unsigned long end_of_dram = 0x1000000000LU;
 	unsigned long pmp_gran;
 	int pmp_count;
+	int ret;
 
 	if (!cold_boot)
 		return 0;
@@ -172,11 +195,9 @@ static int mips_p8700_final_init(bool cold_boot)
 	 */
 	dom = sbi_domain_thishart_ptr();
 	reg = find_last_memregion(dom);
-	sbi_printf("Fix region[%ld]: base 0x%lx order %ld flags 0x%lx\n",
-		   reg - dom->regions, reg->base, reg->order, reg->flags);
-	reg->order = sbi_fls(end_of_dram);
-	sbi_printf("Modified order: %ld to match end of DRAM 0x%lx\n",
-		   reg->order, end_of_dram);
+	ret = fixup_dram_region(dom, reg);
+	if (ret)
+		return ret;
 	/*
 	 * clear the rest of regions that may be set by the boot code
 	 * SBI code don't let to disable PMP region, so configure it to
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
