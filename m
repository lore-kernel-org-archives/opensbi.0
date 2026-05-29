Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49DCCD5BD2
	for <opensbi@archiver.kernel.org>; Fri, 29 May 2026 07:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ItjNg8o9UNe4eGhPNdOOd+spqWFqvQulCDfLjet6lS8=; b=hJth0l7NBj8WuD
	JZzVRxPv1WNorLtLEQgeLHpp2TTprByIWJYD/H2hATiFMlgf85EIUZmchrQobM5RndmHhj/Nj8es6
	eCAoz2gQYkvQPs6szEcQdgGdeJ3KY0TAq8fwVLE5H94710giz6iiZB/xZQXqwzBCd8R/IVyael8AN
	zYOWoTjb283hzuNlef7VS1/YOykPUCAPP1nVe7m0TTjZQODzeKneRBRhESd3W3PukFQlr2VonWPVn
	1osqlGqRpTyfLIWbOS7cjSL9vSce3BoDlAtlsBG4ZewRjzPDcAom4mVeZRebkhetOLFJU1WWVLOf6
	kB7wFipXQUS/xgHq/lCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrk5-00000006stt-2OqU;
	Fri, 29 May 2026 07:34:53 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrk2-00000006srY-1L1z
	for opensbi@lists.infradead.org;
	Fri, 29 May 2026 07:34:52 +0000
Received: from localhost (unknown [122.194.100.152])
	by APP-03 (Coremail) with SMTP id rQCowABng9qVQRlqQBbWEg--.1354S2;
	Fri, 29 May 2026 15:34:45 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Xiang W <wangxiang@iscas.ac.cn>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH] platform: Allow platforms to customize TLB operations
Date: Fri, 29 May 2026 15:35:10 +0800
Message-ID: <20260529073510.97299-1-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: rQCowABng9qVQRlqQBbWEg--.1354S2
X-Coremail-Antispam: 1UD129KBjvAXoW3KF1DAF15Cry7AryrtFykAFb_yoW8Jr1kZo
	WIgF429w4vkr47Was5ArnrtFWFqFWku34rW3y5GFnI93ZYqrWjq3yqqw17W3WIvr909rWD
	J348A3W8ZFWxXa4rn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYn7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUekucDUUUU
X-Originating-IP: [122.194.100.152]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_003450_915954_8ED99E8B 
X-CRM114-Status: GOOD (  16.57  )
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

Some T-Head based processors, for example the Sophgo SG2044, have a
JTLB errata that requires special handling of certain TLB maintenance
instructions (sfence.vma).

Enable the JTLB workaround for affected boards.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 include/sbi/sbi_platform.h                   | 162 +++++++++++++++++++
 lib/sbi/sbi_tlb.c                            |  28 ++++
 platform/generic/include/thead/c9xx_errata.h |   1 +
 platform/generic/thead/thead-generic.c       |  26 ++-
 4 files changed, 216 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index fe382b56..911b37bf 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -56,6 +56,7 @@ struct sbi_domain_memregion;
 struct sbi_ecall_return;
 struct sbi_trap_regs;
 struct sbi_hart_features;
+struct sbi_tlb_info;
 union sbi_ldst_data;
 
 /** Possible feature flags of a platform */
@@ -125,6 +126,27 @@ struct sbi_platform_operations {
 	/** Get tlb fifo num entries*/
 	u32 (*get_tlb_num_entries)(void);
 
+	/** Platform hook for custom fence.i */
+	void (*local_fence_i)(struct sbi_tlb_info *tinfo);
+
+	/** Platform hook for custom supervisor-mode TLB flush */
+	void (*local_sfence_vma)(struct sbi_tlb_info *tinfo);
+
+	/** Platform hook for custom supervisor-mode TLB flush with ASID */
+	void (*local_sfence_vma_asid)(struct sbi_tlb_info *tinfo);
+
+	/** Platform hook for custom G-stage TLB flush for a specific VMID */
+	void (*local_hfence_gvma_vmid)(struct sbi_tlb_info *tinfo);
+
+	/** Platform hook for custom G-stage TLB flush */
+	void (*local_hfence_gvma)(struct sbi_tlb_info *tinfo);
+
+	/** Platform hook for custom VS-stage TLB flush with ASID */
+	void (*local_hfence_vvma_asid)(struct sbi_tlb_info *tinfo);
+
+	/** Platform hook for custom VS-stage TLB flush */
+	void (*local_hfence_vvma)(struct sbi_tlb_info *tinfo);
+
 	/** Initialize platform timer during cold boot */
 	int (*timer_init)(void);
 
@@ -313,6 +335,146 @@ static inline u32 sbi_platform_tlb_fifo_num_entries(const struct sbi_platform *p
 	return sbi_hart_count();
 }
 
+/**
+ * Platform hook for custom fence.i
+ *
+ * @param plat pointer to struct sbi_platform
+ * @paeam tinfo pointer to struct sbi_tlb_info
+ *
+ * @return 0 indicates that the platform supports the operation and the
+ * operation was successful; otherwise, a normal operation needs to be performed.
+ */
+static inline u32 sbi_platform_local_fence_i(
+					const struct sbi_platform *plat,
+					struct sbi_tlb_info *tinfo)
+{
+	if (plat && sbi_platform_ops(plat)->local_fence_i) {
+		sbi_platform_ops(plat)->local_fence_i(tinfo);
+		return 0;
+	}
+	return SBI_ENOTSUPP;
+}
+
+/**
+ * Platform hook for custom supervisor-mode TLB flush
+ *
+ * @param plat pointer to struct sbi_platform
+ * @paeam tinfo pointer to struct sbi_tlb_info
+ *
+ * @return 0 indicates that the platform supports the operation and the
+ * operation was successful; otherwise, a normal operation needs to be performed.
+ */
+static inline u32 sbi_platform_local_sfence_vma(
+					const struct sbi_platform *plat,
+					struct sbi_tlb_info *tinfo)
+{
+	if (plat && sbi_platform_ops(plat)->local_sfence_vma) {
+		sbi_platform_ops(plat)->local_sfence_vma(tinfo);
+		return 0;
+	}
+	return SBI_ENOTSUPP;
+}
+
+/**
+ * Platform hook for custom supervisor-mode TLB flush with ASID
+ *
+ * @param plat pointer to struct sbi_platform
+ * @paeam tinfo pointer to struct sbi_tlb_info
+ *
+ * @return 0 indicates that the platform supports the operation and the
+ * operation was successful; otherwise, a normal operation needs to be performed.
+ */
+static inline u32 sbi_platform_local_sfence_vma_asid(
+					const struct sbi_platform *plat,
+					struct sbi_tlb_info *tinfo)
+{
+	if (plat && sbi_platform_ops(plat)->local_sfence_vma_asid) {
+		sbi_platform_ops(plat)->local_sfence_vma_asid(tinfo);
+		return 0;
+	}
+	return SBI_ENOTSUPP;
+}
+
+/**
+ * Platform hook for custom G-stage TLB flush for a specific VMID
+ *
+ * @param plat pointer to struct sbi_platform
+ * @paeam tinfo pointer to struct sbi_tlb_info
+ *
+ * @return 0 indicates that the platform supports the operation and the
+ * operation was successful; otherwise, a normal operation needs to be performed.
+ */
+static inline u32 sbi_platform_local_hfence_gvma_vmid(
+					const struct sbi_platform *plat,
+					struct sbi_tlb_info *tinfo)
+{
+	if (plat && sbi_platform_ops(plat)->local_hfence_gvma_vmid) {
+		sbi_platform_ops(plat)->local_hfence_gvma_vmid(tinfo);
+		return 0;
+	}
+	return SBI_ENOTSUPP;
+}
+
+/**
+ * Platform hook for custom G-stage TLB flush
+ *
+ * @param plat pointer to struct sbi_platform
+ * @paeam tinfo pointer to struct sbi_tlb_info
+ *
+ * @return 0 indicates that the platform supports the operation and the
+ * operation was successful; otherwise, a normal operation needs to be performed.
+ */
+static inline u32 sbi_platform_local_hfence_gvma(
+					const struct sbi_platform *plat,
+					struct sbi_tlb_info *tinfo)
+{
+	if (plat && sbi_platform_ops(plat)->local_hfence_gvma) {
+		sbi_platform_ops(plat)->local_hfence_gvma(tinfo);
+		return 0;
+	}
+	return SBI_ENOTSUPP;
+}
+
+/**
+ * Platform hook for custom VS-stage TLB flush with ASID
+ *
+ * @param plat pointer to struct sbi_platform
+ * @paeam tinfo pointer to struct sbi_tlb_info
+ *
+ * @return 0 indicates that the platform supports the operation and the
+ * operation was successful; otherwise, a normal operation needs to be performed.
+ */
+static inline u32 sbi_platform_local_hfence_vvma_asid(
+					const struct sbi_platform *plat,
+					struct sbi_tlb_info *tinfo)
+{
+	if (plat && sbi_platform_ops(plat)->local_hfence_vvma_asid) {
+		sbi_platform_ops(plat)->local_hfence_vvma_asid(tinfo);
+		return 0;
+	}
+	return SBI_ENOTSUPP;
+}
+
+/**
+ * Platform hook for custom VS-stage TLB flush
+ *
+ * @param plat pointer to struct sbi_platform
+ * @paeam tinfo pointer to struct sbi_tlb_info
+ *
+ * @return 0 indicates that the platform supports the operation and the
+ * operation was successful; otherwise, a normal operation needs to be performed.
+ */
+static inline u32 sbi_platform_local_hfence_vvma(
+					const struct sbi_platform *plat,
+					struct sbi_tlb_info *tinfo)
+{
+	if (plat && sbi_platform_ops(plat)->local_hfence_vvma) {
+		sbi_platform_ops(plat)->local_hfence_vvma(tinfo);
+		return 0;
+	}
+	return SBI_ENOTSUPP;
+}
+
 /**
  * Get total number of HARTs supported by the platform
  *
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index ada60c32..69b8fb48 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -46,6 +46,10 @@ static void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo)
 	hgatp = csr_swap(CSR_HGATP,
 			 (vmid << HGATP_VMID_SHIFT) & HGATP_VMID_MASK);
 
+	if (sbi_platform_local_hfence_gvma(
+			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
+		gito done;
+
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__sbi_hfence_vvma_all();
 		goto done;
@@ -67,6 +71,10 @@ static void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo)
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_RCVD);
 
+	if (sbi_platform_local_hfence_gvma(
+			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
+		return;
+
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__sbi_hfence_gvma_all();
 		return;
@@ -85,6 +93,10 @@ static void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_RCVD);
 
+	if (sbi_platform_local_sfence_vma(
+			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
+		return;
+
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__sbi_sfence_vma_all();
 		return;
@@ -111,6 +123,10 @@ static void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo)
 	hgatp = csr_swap(CSR_HGATP,
 			 (vmid << HGATP_VMID_SHIFT) & HGATP_VMID_MASK);
 
+	if (sbi_platform_local_hfence_vvma_asid(
+			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
+		goto done;
+
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__sbi_hfence_vvma_asid(asid);
 		goto done;
@@ -133,6 +149,10 @@ static void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD);
 
+	if (sbi_platform_local_hfence_gvma_vmid(
+			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
+		return;
+
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__sbi_hfence_gvma_vmid(vmid);
 		return;
@@ -152,6 +172,10 @@ static void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_RCVD);
 
+	if (sbi_platform_local_sfence_vma_asid(
+			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
+		return;
+
 	/* Flush entire MM context for a given ASID */
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__asm__ __volatile__("sfence.vma x0, %0"
@@ -173,6 +197,10 @@ static void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo)
 {
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_FENCE_I_RECVD);
 
+	if (sbi_platform_local_fence_i(
+			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
+		return;
+
 	__asm__ __volatile("fence.i");
 }
 
diff --git a/platform/generic/include/thead/c9xx_errata.h b/platform/generic/include/thead/c9xx_errata.h
index 40c1587b..7a419e41 100644
--- a/platform/generic/include/thead/c9xx_errata.h
+++ b/platform/generic/include/thead/c9xx_errata.h
@@ -8,6 +8,7 @@
  */
 #define THEAD_QUIRK_ERRATA_TLB_FLUSH		BIT(0)
 #define THEAD_QUIRK_ERRATA_THEAD_PMU		BIT(1)
+#define THEAD_QUIRK_ERRATA_JTLB			BIT(2)
 
 void thead_register_tlb_flush_trap_handler(void);
 
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index ddb4f0bf..86793ab1 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_tlb.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
 struct thead_generic_quirks {
@@ -39,6 +40,20 @@ static int thead_pmu_extensions_init(struct sbi_hart_features *hfeatures)
 	return 0;
 }
 
+static void thead_jtlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
+{
+	__asm__ __volatile__("sfence.vma");
+}
+
+static void thead_jtlb_local_sfence_vvma_asid(struct sbi_tlb_info *tinfo)
+{
+	/* Flush entire MM context for a given ASID */
+	__asm__ __volatile__("sfence.vma x0, %0"
+			     :
+			     : "r"(tinfo->asid)
+			     : "memory");
+}
+
 static int thead_generic_platform_init(const void *fdt, int nodeoff,
 				       const struct fdt_match *match)
 {
@@ -49,6 +64,11 @@ static int thead_generic_platform_init(const void *fdt, int nodeoff,
 	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)
 		generic_platform_ops.extensions_init = thead_pmu_extensions_init;
 
+	if (quirks->errata &THEAD_QUIRK_ERRATA_JTLB) {
+		generic_platform_ops.local_sfence_vma = thead_jtlb_local_sfence_vma;
+		generic_platform_ops.local_sfence_vma_asid = thead_jtlb_local_sfence_vvma_asid;
+	}
+
 	return 0;
 }
 
@@ -60,13 +80,17 @@ static const struct thead_generic_quirks thead_pmu_quirks = {
 	.errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
 };
 
+static const struct thead_generic_quirks thead_pmu_jtlb_quirks = {
+	.errata = THEAD_QUIRK_ERRATA_THEAD_PMU | THEAD_QUIRK_ERRATA_JTLB,
+};
+
 static const struct fdt_match thead_generic_match[] = {
 	{ .compatible = "canaan,kendryte-k230", .data = &thead_pmu_quirks },
 	{ .compatible = "sophgo,cv1800b", .data = &thead_pmu_quirks },
 	{ .compatible = "sophgo,cv1812h", .data = &thead_pmu_quirks },
 	{ .compatible = "sophgo,sg2000", .data = &thead_pmu_quirks },
 	{ .compatible = "sophgo,sg2002", .data = &thead_pmu_quirks },
-	{ .compatible = "sophgo,sg2044", .data = &thead_pmu_quirks },
+	{ .compatible = "sophgo,sg2044", .data = &thead_pmu_jtlb_quirks },
 	{ .compatible = "thead,th1520", .data = &thead_th1520_quirks },
 	{ },
 };
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
