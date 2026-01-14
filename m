Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360B9D31A36
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXjNAex7R4o0DjQJnOLh8Cn2OZKNh35IM/w/9ez1aJ0=; b=VlJ3Kmqlpo+tjF
	wGPvjdkKJYcnONm+vDt4Fpk6QTv6yX3aWKarkxsEiCnN8GFl2OSATe9U6BERQo48e59VDdINWyqUd
	LBAKD0NtmgOCJaeOr5j6IcaBxuJQiM8Kp3ItFMsRYBgBxdrQEXsYNfaAPsbv22ijIA2SVJAy4ZcHn
	QSzbskdCVqbO3c+vo1MLaPQCp8wG0uw/56pWAorSnLAnVDCv7GHA8pXYKChso2RaxNULe2AIejuiw
	k/966zDvDW9BmIWRu2lHb7ylkTmRwOQOlPEq4+YejsedW/b23FelVu6ggiFGFLOTFf+fm+XrpBc/r
	lDiHegf3apslduXHoDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBv-00000008Yhj-1xAq;
	Wed, 14 Jan 2026 09:29:27 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBs-00000008YcV-3nMJ
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382965; x=1799918965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BaNOVUxvDgnjbaj2qrACZxgg36S3cV+Sfcfx88GP9gU=;
  b=t5poSO87+YU6tdjtXu02mIQbegZSbIOK2ck8EcQ8sYzQaMfhjHA3TbJJ
   cdhgD3wT+xlPhpK4nLH6NL1TG4bkCVABSVZPwvcB5hheLecJMAkVycYUP
   XWbQbhW8ThyVkJOjpjaYP5Zgb89Os45xKK56w0yZFGNhySeQsQ7DQ5r/p
   th+qiFYerFkXE/yHt87RERBYZhpPb1c72/mDf+o5cAUu8OM9ESyzsRr+S
   c8ocNtR0YxuhnCXvQlhVoJcdPAgGSu1n3XpLZSVv01Aph6nPPfoT1FGLD
   bK/pmApd8nez7B1CKlC+OX5bzTjnoc4XSbH4tpmVVVoPuFYdQNHiR4hVp
   w==;
X-CSE-ConnectionGUID: 9UgBfyUxS0KYVXB9i5JBMA==
X-CSE-MsgGUID: MbuCPWHRSUSUECQInTK9yg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:36 +0200
X-CSE-ConnectionGUID: 2zh7McL7TSqj7uCTeBfymQ==
X-CSE-MsgGUID: NAbX3AGGQqO+UtxJHkVN1g==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:17 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:35 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 14/22] platform: generic: mips eyeq7h: detect accelerators cluster presence
Date: Wed, 14 Jan 2026 11:21:10 +0200
Message-ID: <20260114092118.1315581-15-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012925_269133_DFA8C100 
X-CRM114-Status: GOOD (  12.24  )
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

In the design, accelerator clusters ACC[01] and XNN[01] presence
indicated by the OLB_WEST register OLB_WEST_TSTCSR.

In the simulation environments, part (or all) accelerators may be
not instantiated

Disable clusters not present in the model, updating the DTB

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/eyeq7h.c | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 9bc3b1e7a108..24eb149d2433 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -16,6 +16,7 @@
 #include <sbi/riscv_io.h>
 #include <libfdt.h>
 #include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/fdt/fdt_fixup.h>
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
 
@@ -135,6 +136,48 @@ static int fixup_dram_region(const struct sbi_domain *dom,
 	return 0;
 }
 
+static void fdt_disable_by_compat(void *fdt, const char *compatible)
+{
+	int node = 0;
+
+	while ((node = fdt_node_offset_by_compatible(fdt, node, compatible)) >= 0)
+		fdt_setprop_string(fdt, node, "status", "disabled");
+}
+
+/**
+ * p8700_acc_clusters_do_fixup() - detect present accelerator clusters
+ *
+ * Detect what accelerator clusters are actually present in design and
+ * disable missed ones. Same bit indicates presence of the ACC and XNN
+ * clusters
+ */
+static void eyeq7h_acc_clusters_do_fixup(struct fdt_general_fixup *f, void *fdt)
+{
+	u32 tstcsr = readl((void*)OLB_WEST + OLB_WEST_TSTCSR);
+	u32 acc01_present = EXTRACT_FIELD(tstcsr, TSTCSR_ACC_PRESENT);
+	static const char YN[2] = {'N', 'Y'};
+
+	sbi_dprintf("OLB indicates ACC clusters[01] = [%c%c]\n",
+		    YN[acc01_present & BIT(0)],
+		    YN[(acc01_present >> 1) & BIT(0)]);
+
+	if (!(acc01_present & BIT(0))) {
+		sbi_dprintf("Disable ACC0\n");
+		fdt_disable_by_compat(fdt, "mobileye,eyeq7h-acc0-olb");
+		fdt_disable_by_compat(fdt, "mobileye,eyeq7h-xnn0-olb");
+	}
+	if (!(acc01_present & BIT(1))) {
+		sbi_dprintf("Disable ACC1\n");
+		fdt_disable_by_compat(fdt, "mobileye,eyeq7h-acc1-olb");
+		fdt_disable_by_compat(fdt, "mobileye,eyeq7h-xnn1-olb");
+	}
+}
+
+static struct fdt_general_fixup eyeq7h_acc_clusters_fixup = {
+	.name = "acc-clusters-fixup",
+	.do_fixup = eyeq7h_acc_clusters_do_fixup,
+};
+
 static int eyeq7h_final_init(bool cold_boot)
 {
 	struct sbi_scratch *scratch;
@@ -172,6 +215,7 @@ static int eyeq7h_final_init(bool cold_boot)
 		reg->base = 0;
 		reg->flags = SBI_DOMAIN_MEMREGION_MMIO; // disable cache & prefetch
 	}
+	fdt_register_general_fixup(&eyeq7h_acc_clusters_fixup);
 
 	return generic_final_init(cold_boot);
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
