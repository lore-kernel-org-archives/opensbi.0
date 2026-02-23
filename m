Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B45BEA4FCE
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yr7/PE0SZBI7p03eyqUFjcsUbxYbEf9XOjElIJpKCAI=; b=neQMaH+7JgU0ln
	PL2BoRjqcI/GFElQqc/AAwFpZkafVNOHjOhJetpQLDhiR5sImrkqRhXNUlgyM0PZP4c1iuIapvYKa
	o/3wJLmmpBNou1d/714PcSZlouHZ9aHcI4n65ze+9JBOcJi5yXVJCwJCnQCUuPpdnweUinLdzf6Ef
	il73m/HD+0F8UnQ3KGEEYYM/byks62SpWAtQs4/WlrHs+W9j/jg0oewVmdRfXrcJyh/+3uBL0H+MC
	9xYvEgMTAboCehqsT8qX57iLm9jrFM8KzSDopdFxnMSKV7fVbZQQNsGjix0Dr/VcOnAq/GaT2bux3
	zJhGHdVxGrixze4BwCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLY-00000000Vli-0M0L;
	Mon, 23 Feb 2026 14:55:40 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLV-00000000VVR-15Ki
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858535; x=1803394535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cR/bP72w3fO0/kQSIKv8B2ijzvcTWVWSN8e1/QmxHwA=;
  b=RyOY3G4W4T8aNdAlUq6mEcvZMPV+NGgGmnE7+0ogjSLuwmzTnqiHat+B
   JfLvpKyeBjwIlcv/0sEjVCgwtG4qSeRsXIP1/vF9OG0LMJKMeU3WRGl6W
   020qZJXQljMVNFm3+pyECz5tDmQWLlQlKubTu90Qp0+CelerE2+MxGe+9
   UeqYmnvIpSRaDS66URvssT/HPvz9Gy/YxizhOtlDdMoYXxHDei34WIp8x
   vQX8ByKRKTteOkQCHltcFh3tpSJtvD9vd7+UgE3BxTg1bnUCBcUFxdnoj
   7bY0uDpfX+yQLqme0Vii1bF010/phDVJMST4hhqBngrO7QOVCNJGTBX4n
   w==;
X-CSE-ConnectionGUID: LqhxrzRrQHOCyLNMcEmuqQ==
X-CSE-MsgGUID: 3S8MTNwiQIaioBHIGzywFg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:33 +0200
X-CSE-ConnectionGUID: yTEIZsZ9TdiUBhgiumCGIw==
X-CSE-MsgGUID: es6qZ9QYQRKGy5dEJpDq7w==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 23 Feb 2026 16:58:10 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:34 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 12/23] platform: generic: mips eyeq7h: detect
 accelerators cluster presence
Date: Mon, 23 Feb 2026 16:54:51 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-12-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065537_572209_40FA2E9D 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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
 platform/generic/mips/eyeq7h.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index d9c252672a3e0a6cd81cd81f72d9d68772b77fd2..874c9aafa5fc818762360aa6d1c3c37cb7726a65 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -15,6 +15,7 @@
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/riscv_io.h>
 #include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/fdt/fdt_fixup.h>
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
 
@@ -112,12 +113,55 @@ static struct sbi_domain_memregion *find_last_memregion(const struct sbi_domain
 	return --reg;
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
 	if (!cold_boot)
 		return 0;
 
 	sbi_hsm_set_device(&eyeq7h_hsm);
+	fdt_register_general_fixup(&eyeq7h_acc_clusters_fixup);
 
 	return generic_final_init(cold_boot);
 }

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
