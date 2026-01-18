Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D46CA5FEC
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVfDQc+zpFpZWstLZKyCwWUDgymdlJHW7kxTUkQ1zHI=; b=JR9a+oLHM5n2D5
	0s7y/HeBiYZkP0ZUUS+rMiXVq8sopieyub/j8cH+QUGAbkwfFWqi7QZMpHShgHZ082MkSQ8TqvnVk
	rs9U0UluT/vEHPF0oYbyzHee9liuCUoRMtM3ICMzg6R3aokScyISl49G66butlxea/i2R2H8XvaUn
	d6L1X16dLJssOWImi24elU4V513nak1jU9o9SQ/g2OfizmvK8bbJC2t1xBXJpb9eF3GC1JHxnR6AD
	m6TIzLwrX5VgHeZkSq0fowy4bG+wf7Lruj2YURJlDtOTipJze4GPnAMaomZaUe+w2VJIk4NEFY/nr
	/tJD5LgA1ApFFJ9sUCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR70-0000000HT3p-1vze;
	Sun, 18 Jan 2026 11:38:30 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6r-0000000HSsx-0xYx
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736301; x=1800272301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GNADMDq6Ke/nM4H68tiESzcG5BRWM2db1NQgvmCV8Lc=;
  b=jTZHbiFVoA8ppSIvUipZIdrm6h9Syjsc2jutoo36FnQ0Re7GhTtSsPVZ
   MJ2LdHR0n1WnFNSPHVFf1vzJja4rlQcnfS45IUIPjpqT9n/dZlCzZwpC1
   9Lj9oo0wQxBo9tNtVNhMj/63wh4uT6ovf1+vltK7h73GK8XisCnjivvk0
   ViuFAVwWwpVXmy1JAuMGoNLv9lLBqcylcP9eKblbh+U/cCH3aaVIytHoP
   6Chyx9Vl23dVj6rzvjqFYbjWmc3OZSquqCA0WTkf4zIu70W4+Z1/mrssY
   l2JfTACFnU1njg7LkEFvZTIEX5/bVqd+uVdUbFhwA9R5xiduXbfCe/pOM
   A==;
X-CSE-ConnectionGUID: pGyy4ODBQxyFdhw0aArWHw==
X-CSE-MsgGUID: +dkcYDxfSritBwTOYuipvg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:17 +0200
X-CSE-ConnectionGUID: zHEWaMw9TXmeJeCxNnkasA==
X-CSE-MsgGUID: 6RvSt7ZBTZGFgb6PJ2K6Ig==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 18 Jan 2026 13:40:03 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:16 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 11/20] platform: generic: mips eyeq7h: detect
 accelerators cluster presence
Date: Sun, 18 Jan 2026 13:37:53 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-11-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033821_561599_5A492678 
X-CRM114-Status: UNSURE (   8.70  )
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
index d70ffa1b3b750754ae60cfef21f012dc4f0484ed..fb4282f4a9b85b58bc0b8921caf47425ebcf059f 100644
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
