Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90371C3ABD8
	for <opensbi@archiver.kernel.org>; Fri, 16 May 2025 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2v+FUaCWmOEQvwPavzaA23m4d+YMpnTSBkJfVxSzc4=; b=vtIaI+e8D9XAjN
	56QobuF+JlQQ0JH/4mABhIKBis06bvzKCCnyD4/5snF6Uf1u0bIl+DAmt2iSPdKbCqdPH8nESrZtv
	hiFRPCbdJDRwsm7nQSNHfOIBSa1SelrOTo4D9gNNVTDTSHMonqBKwhbPEFzYoXAmMmit4eHFU4SB8
	R6AZqMMphGAWT/mI+k2+HzWHtyKup+6LGwyo161mosvrHYIXdIgX042H1MH626/X6VCXy0ta4KUlT
	okVZjR+FRDcgN9ji65P5O/Za5AdW8/Ls7d3CXdZ5AdAzW57V/8SScMoeZUqzpAU/vd4jQfD9PmKc1
	Mq9gCZz1CZFyaGmhqozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvDx-00000003X0b-2D7L;
	Fri, 16 May 2025 13:35:41 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvCd-00000003WoP-3h6t
	for opensbi@lists.infradead.org;
	Fri, 16 May 2025 13:34:21 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3AB8F25F3B;
	Fri, 16 May 2025 15:34:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXwmDLSuUB_e; Fri, 16 May 2025 15:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747402455; bh=UiJyLdTQVTYwswOwtQq+z3bV4X68ubXfJfDZfDL2OqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZhGg0aV3j+K/1HAh1wE/3XGih23Gp77p8csQ5Xah/1DlV1t0fYs5LBRr55CPC85A+
	 bdlPscXdKdYzDHi42D8PXyTRSbmCGLvYjcmI4/V6ZxM1kZrEw72JdKnc3dQBVudtfq
	 y7Ssu8kdYYuGHGv8kWU3udnkLf6UQ559vPQLawql2yiOPaBMumc+CoCv6pFE+I4pNp
	 YNbL73iulFt4lCHznDoMbYT1cuogMP8CeXaJS9O6ZK890xYXLa0JBewp6UvBPKKrcH
	 4nthkBURvzgv8f3RIZjuKnkHO9fifTnHvr7Sd4wIBmXoaaCvhDI+pDRzKvTU7eV8HE
	 Zj5gUV+o7XFNg==
From: Yao Zi <ziyao@disroot.org>
To: opensbi@lists.infradead.org
Cc: Yao Zi <ziyao@disroot.org>
Subject: [PATCH v4 2/2] lib: utils: fdt: Claim Zicntr if time CSR emulation is possible
Date: Fri, 16 May 2025 13:33:53 +0000
Message-ID: <20250516133352.36617-4-ziyao@disroot.org>
In-Reply-To: <20250516133352.36617-2-ziyao@disroot.org>
References: <20250516133352.36617-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_063420_345434_07694C5A 
X-CRM114-Status: GOOD (  11.67  )
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

OpenSBI is capable of emulating time CSR through an external timer for
HARTs that don't implement a full Zicntr extension. Let's register
Zicntr extension in the FDT if CSR emulation is active.

This avoids hardcoding the extension in the devicetree, which may
confuse pre-SBI bootloaders.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 lib/utils/fdt/fdt_fixup.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index e237dd0..f3fe8af 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_timer.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_pmu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -107,10 +108,21 @@ int fdt_add_cpu_idle_states(void *fdt, const struct sbi_cpu_idle_state *state)
 
 void fdt_cpu_fixup(void *fdt)
 {
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	int err, cpu_offset, cpus_offset, len;
-	const char *mmu_type;
+	const char *mmu_type, *extensions;
 	u32 hartid, hartindex;
+	bool emulated_zicntr;
+
+	/*
+	 * Claim Zicntr extension in riscv,isa-extensions if
+	 *  1. OpenSBI can emulate time CSR with a timer
+	 *  2. The other two CSRs specified by Zicntr are available
+	 */
+	emulated_zicntr = sbi_timer_get_device() != NULL &&
+			  sbi_hart_has_csr(scratch, SBI_HART_CSR_CYCLE) &&
+			  sbi_hart_has_csr(scratch, SBI_HART_CSR_INSTRET);
 
 	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 	if (err < 0)
@@ -140,6 +152,25 @@ void fdt_cpu_fixup(void *fdt)
 		    !mmu_type || !len)
 			fdt_setprop_string(fdt, cpu_offset, "status",
 					   "disabled");
+
+		if (!emulated_zicntr)
+			continue;
+
+		extensions = fdt_getprop(fdt, cpu_offset,
+					 "riscv,isa-extensions", &len);
+		/*
+		 * For legacy devicetrees, don't create riscv,isa-extensions
+		 * property if there hasn't been already one.
+		 */
+		if (extensions &&
+		    !fdt_stringlist_contains(extensions, len, "zicntr")) {
+			err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 16);
+			if (err)
+				continue;
+
+			fdt_appendprop_string(fdt, cpu_offset,
+					      "riscv,isa-extensions", "zicntr");
+		}
 	}
 }
 
-- 
2.49.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
