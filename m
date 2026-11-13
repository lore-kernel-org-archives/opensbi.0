Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF700606A323
	for <opensbi@archiver.kernel.org>; Fri, 13 Nov 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RJEmggPM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VbijznMyx7rsCuIiQuJy/iLiWjj0y1M4Lk/Dvzl5i8w=; b=RJEmggPMKs8m/rAIZ9xJOy+qsH
	WW59Z0ulSNFYDUX3WpiBuBvDfiJeXA+IjivWhSmKx7UYX+zKCLuCwG108CxNbXxblQwnqBC5nIQM+
	UB+0rJX9gcFopVvYDO+EPZ3gy37WgjmPlihmiPLLJ7J1bXSUH80ZNeJupSkobSoJzln8CHbDATjoW
	Vb+ftgIU9ZOn6fRbvgW0YRiMWXFs2loX4DjE6tyHOFJOA2CTsaSgz+hnekfAbiZria1E1bycG1mFi
	emIQH+N3OqqEjS4Quj7OgbQSUpJoihQRjV+w5D5zfDTju5blKL4VMXehKJhN5JYODaLUgAZ+1J00n
	vomRt/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnfn-0000000CEN6-2Bjk;
	Fri, 13 Nov 2026 09:34:19 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnfl-0000000CEME-1lbu
	for opensbi@lists.infradead.org;
	Fri, 13 Nov 2026 09:34:18 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD9WJVi020972
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
 2026 17:32:19 +0800
From: Randolph Lin <randolph@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [RFC PATCH 3/5] platform: generic/andes: add a PMA device for PPMA
Date: Fri, 13 Nov 2026 17:32:10 +0800
Message-ID: <20261113093212.3816428-4-randolph@andestech.com>
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
X-MAIL: Atcsqr.andestech.com 6AD9WJVi020972
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_013417_853347_9FBABCFA 
X-CRM114-Status: GOOD (  24.67  )
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

Add andes_pma_device, so that Andes platforms with programmable PMA
(PPMA) can register it with the PMA framework.

A table indexed by MTYP gives the attributes that select each memory
type of pmaxcfg. I/O selects a device type, non-cacheable memory a
non-cacheable memory type, cacheable memory a write-through or
write-back type, and the unsafe flag an empty hole. Bits 19:16 choose
bufferable or not, write-through or write-back, and the allocation.
MTYP does not encode the I/O ordering or the coherence, so the device
ignores them. When bits 19:16 are zero, I/O is MTYP 0 and cacheable
memory MTYP 11. On the 27, 45 and 46-series, these are also the types
of the device and memory regions that no PMA entry covers. The device
rejects a region whose attributes select no MTYP, and the entry is
always NAPOT.

The device sets the regions with andes_pma_setup_regions(), like the
RZ/Five and MT2824 tables, so they take the first PMA entries. The
PMA_FREE SBI call refuses to free them, because the platform needs them
for the whole boot. If a hart has no PPMA, or its PMA entries cannot
hold the regions, the device says so.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 platform/generic/andes/Kconfig             |   1 +
 platform/generic/andes/andes_pma.c         | 111 +++++++++++++++++++++
 platform/generic/include/andes/andes_pma.h |  11 ++
 3 files changed, 123 insertions(+)

diff --git a/platform/generic/andes/Kconfig b/platform/generic/andes/Kconfig
index 6edd67de..dd368fd8 100644
--- a/platform/generic/andes/Kconfig
+++ b/platform/generic/andes/Kconfig
@@ -2,6 +2,7 @@
 
 config ANDES_PMA
 	bool "Andes PMA support"
+	select PMA
 	default n
 	help
 	  Programmable PMA(PPMA) is a feature for Andes. PPMA allows
diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
index 28d33a2f..ae8a0cad 100644
--- a/platform/generic/andes/andes_pma.c
+++ b/platform/generic/andes/andes_pma.c
@@ -289,6 +289,111 @@ int andes_pma_setup_regions(void *fdt,
 	return 0;
 }
 
+/* The PMA framework puts its regions in the first PMA entries. */
+static unsigned int andes_pma_fixed_regions;
+
+/* The attributes that select each MTYP. MTYP 12 to 14 are reserved. */
+static const u32 andes_pma_mtyps[16] = {
+	[0]  = PMA_IO,
+	[1]  = PMA_IO | PMA_BUFFERABLE,
+	[2]  = PMA_NONCACHEABLE_MEMORY,
+	[3]  = PMA_NONCACHEABLE_MEMORY | PMA_BUFFERABLE,
+	[4]  = PMA_NONCOHERENT_MEMORY | PMA_WRITE_THROUGH | PMA_NO_ALLOC,
+	[5]  = PMA_NONCOHERENT_MEMORY | PMA_WRITE_THROUGH | PMA_NO_WRITE_ALLOC,
+	[6]  = PMA_NONCOHERENT_MEMORY | PMA_WRITE_THROUGH | PMA_NO_READ_ALLOC,
+	[7]  = PMA_NONCOHERENT_MEMORY | PMA_WRITE_THROUGH,
+	[8]  = PMA_NONCOHERENT_MEMORY | PMA_NO_ALLOC,
+	[9]  = PMA_NONCOHERENT_MEMORY | PMA_NO_WRITE_ALLOC,
+	[10] = PMA_NONCOHERENT_MEMORY | PMA_NO_READ_ALLOC,
+	[11] = PMA_NONCOHERENT_MEMORY,
+	[15] = PMA_UNSAFE,
+};
+
+static int andes_pma_attr_to_mtyp(u32 attr, u8 *mtyp)
+{
+	unsigned int i;
+
+	/* MTYP does not encode the I/O ordering or the coherence. */
+	if ((attr & PMA_ORDER_MASK) == PMA_ORDER_IO_STRONG)
+		attr &= ~PMA_ORDER_MASK;
+	if (attr & PMA_CACHEABLE)
+		attr &= ~PMA_COHERENT;
+
+	for (i = 0; i < array_size(andes_pma_mtyps); i++) {
+		if (i >= 12 && i < 15)
+			continue;
+
+		if (andes_pma_mtyps[i] == attr) {
+			*mtyp = i << ANDES_PMACFG_MTYP_OFFSET;
+			return 0;
+		}
+	}
+
+	return SBI_EINVAL;
+}
+
+static int andes_pma_region_check(struct pma_device *dev,
+				  const struct pma_region *region)
+{
+	u8 mtyp;
+
+	if (region->size < ANDES_PMA_GRANULARITY)
+		return SBI_EINVAL;
+
+	return andes_pma_attr_to_mtyp(region->attr, &mtyp);
+}
+
+static int andes_pma_regions_set(struct pma_device *dev,
+				 const struct pma_region *regions,
+				 unsigned int count)
+{
+	struct andes_pma_region pma[ANDES_MAX_PMA_REGIONS] = { 0 };
+	unsigned int i;
+	u8 mtyp;
+	int rc;
+
+	if (count > ANDES_MAX_PMA_REGIONS)
+		return SBI_EINVAL;
+
+	if (!andes_sbi_probe_pma()) {
+		sbi_printf("%s: hart%u has no PPMA\n", __func__,
+			   current_hartid());
+		return SBI_ENOTSUPP;
+	}
+
+	for (i = 0; i < count; i++) {
+		rc = andes_pma_attr_to_mtyp(regions[i].attr, &mtyp);
+		if (rc)
+			return rc;
+
+		pma[i].pa = regions[i].base;
+		pma[i].size = regions[i].size;
+		pma[i].flags = ANDES_PMACFG_ETYP_NAPOT | mtyp;
+	}
+
+	/* No region asks for a reserved-memory node, so pass no DT. */
+	rc = andes_pma_setup_regions(NULL, pma, count);
+	if (rc == SBI_EINVAL)
+		sbi_printf("%s: hart%u has too few PMA entries or address bits for the regions\n",
+			   __func__, current_hartid());
+	if (rc)
+		return rc;
+
+	andes_pma_fixed_regions = count;
+
+	return 0;
+}
+
+static const struct pma_ops andes_pma_ops = {
+	.region_check = andes_pma_region_check,
+	.regions_set = andes_pma_regions_set,
+};
+
+struct pma_device andes_pma_device = {
+	.max_regions = ANDES_MAX_PMA_REGIONS,
+	.ops = &andes_pma_ops,
+};
+
 bool andes_sbi_probe_pma(void)
 {
 	return (csr_read(CSR_MMSC_CFG) & MMSC_CFG_PPMA_MASK) ? true : false;
@@ -356,6 +461,12 @@ int andes_sbi_free_pma(unsigned long pa)
 		if (start != pa)
 			continue;
 
+		if (i < andes_pma_fixed_regions) {
+			sbi_printf("ERROR %s(): PMA%d is set at boot\n",
+				   __func__, i);
+			return SBI_ERR_DENIED;
+		}
+
 		set_pmaxcfg(i, ANDES_PMACFG_ETYP_OFF);
 		csr_write_num(CSR_PMAADDR0 + i, 0);
 
diff --git a/platform/generic/include/andes/andes_pma.h b/platform/generic/include/andes/andes_pma.h
index b0dbeb22..07480057 100644
--- a/platform/generic/include/andes/andes_pma.h
+++ b/platform/generic/include/andes/andes_pma.h
@@ -7,6 +7,7 @@
 #define _ANDES_PMA_H_
 
 #include <sbi/sbi_types.h>
+#include <sbi_utils/pma/pma.h>
 
 #define ANDES_MAX_PMA_REGIONS			16
 
@@ -53,6 +54,15 @@ int andes_pma_setup_regions(void *fdt,
 			    const struct andes_pma_region *pma_regions,
 			    unsigned int pma_regions_count);
 
+/**
+ * The PMA device of the PMA framework for PPMA
+ *
+ * It sets the MTYP that the attributes of a region select, and it rejects a
+ * region whose attributes select no MTYP. It puts the regions in the first
+ * PMA entries, and andes_sbi_free_pma() refuses to free them.
+ */
+extern struct pma_device andes_pma_device;
+
 /**
  * Programmable PMA(PPMA) is a feature for Andes. PPMA allows dynamic adjustment
  * of memory attributes in the runtime. It contains a configurable amount of PMA
@@ -85,6 +95,7 @@ int andes_sbi_set_pma(unsigned long pa, unsigned long size, u8 flags);
  *
  * @return SBI_SUCCESS on success
  * @return SBI_ERR_FAILED if the given region is not set before
+ * @return SBI_ERR_DENIED if the PMA framework set the given region at boot
  */
 int andes_sbi_free_pma(unsigned long pa);
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
