Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4864CD98F0
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 11:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g0CKQQIvSuwlpDzNWGlJw6Tm1h42ePFvCCfb0JmtUTU=; b=3JRkOcMJB1oliZ
	OrNOBHBH/e8v0x2g6Ljo/zdkQRfKeUHZmGGpDMUBBhj5eGUumDDTqrV2XbhIRylYeZc49bKBBTOic
	/VrkPJXyLoSUlnKBPjN5mz8PnwDrZxrjRHFp828vrEpM+PIBbSnQw056POuNnCXLbsH2Tu5wBsnC6
	SRP1T5ZzMAfNLGiQ5bPubw5t1a3nnOOePRVS1RhFYr9/TZwXZuZN5jP7n9CPL+Xn90z4a1YeSL3eo
	Xot0afmxcGF6WJL/zG4qo7WWAYKm/nP9bN9E+sOYJRXM9mGeBUAHBDXtNRelr/DDDAOHv2+JlS1ql
	vx/xX5i6DqpDTo1E2FhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoTi-0000000HEgH-2nY4;
	Wed, 17 Jun 2026 11:30:42 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoTe-0000000HEff-2HJm
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 11:30:41 +0000
Received: from localhost (unknown [122.194.100.2])
	by APP-01 (Coremail) with SMTP id qwCowABX_NRWhTJqz2ELAg--.79S2;
	Wed, 17 Jun 2026 19:30:32 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	inochiama@gmail.com,
	Xiang W <wangxiang@iscas.ac.cn>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v2] lib: sbi: Allow platforms to override local TLB operations
Date: Wed, 17 Jun 2026 19:29:26 +0800
Message-ID: <20260617112925.1144190-2-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: qwCowABX_NRWhTJqz2ELAg--.79S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKFykCr1UuF4xtFWftw1DJrb_yoW3KryUpF
	s8ur4DKaykWF15Wa47AFyDurZ8uw48K395Cry3A34SvrsxWr1vqr1kKF1YvFy5X3s7Jr1I
	gryIvr17uF4jyrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-Originating-IP: [122.194.100.2]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_043039_215565_4139FAE9 
X-CRM114-Status: GOOD (  13.80  )
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

Introduce a sbi_tlb_local_operations structure so platforms can provide
custom local TLB flush implementations. Use it to implement the JTLB
workaround on affected SoCs (currently Sophgo SG2044).

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 include/sbi/sbi_tlb.h                        | 31 +++++++++++++
 lib/sbi/sbi_tlb.c                            | 46 +++++++++++++++++---
 platform/generic/include/thead/c9xx_errata.h |  1 +
 platform/generic/thead/thead-generic.c       | 31 ++++++++++++-
 4 files changed, 101 insertions(+), 8 deletions(-)

diff --git a/include/sbi/sbi_tlb.h b/include/sbi/sbi_tlb.h
index 3936e857..0d2198ab 100644
--- a/include/sbi/sbi_tlb.h
+++ b/include/sbi/sbi_tlb.h
@@ -54,6 +54,37 @@ do { \
 
 #define SBI_TLB_INFO_SIZE		sizeof(struct sbi_tlb_info)
 
+/** Collection of Local TLB operations */
+struct sbi_tlb_local_operations {
+       /** Local fence.i */
+       void (*local_fence_i)(struct sbi_tlb_info *tinfo);
+
+       /** Local supervisor-mode TLB flush */
+       void (*local_sfence_vma)(struct sbi_tlb_info *tinfo);
+
+       /** Local supervisor-mode TLB flush with ASID */
+       void (*local_sfence_vma_asid)(struct sbi_tlb_info *tinfo);
+
+       /** Local G-stage TLB flush for a specific VMID */
+       void (*local_hfence_gvma_vmid)(struct sbi_tlb_info *tinfo);
+
+       /** Local G-stage TLB flush */
+       void (*local_hfence_gvma)(struct sbi_tlb_info *tinfo);
+
+       /** Local VS-stage TLB flush with ASID */
+       void (*local_hfence_vvma_asid)(struct sbi_tlb_info *tinfo);
+
+       /** Local VS-stage TLB flush */
+       void (*local_hfence_vvma)(struct sbi_tlb_info *tinfo);
+};
+
+/** Get the local TLB operations */
+const struct sbi_tlb_local_operations *sbi_tlb_get_local_operations(void);
+
+/** Set the local TLB operations */
+void sbi_tlb_set_local_operations(
+		const struct sbi_tlb_local_operations *ops);
+
 void __sbi_sfence_vma_all();
 
 int sbi_tlb_request(ulong hmask, ulong hbase, struct sbi_tlb_info *tinfo);
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index ada60c32..ab1e3a99 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -29,6 +29,38 @@ static unsigned long tlb_fifo_off;
 static unsigned long tlb_fifo_mem_off;
 static unsigned long tlb_range_flush_limit;
 
+static void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo);
+static void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo);
+static void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo);
+static void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo);
+static void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo);
+static void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo);
+static void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo);
+
+static struct sbi_tlb_local_operations default_tlb_local_ops = {
+	.local_fence_i = sbi_tlb_local_fence_i,
+	.local_sfence_vma = sbi_tlb_local_sfence_vma,
+	.local_sfence_vma_asid = sbi_tlb_local_sfence_vma_asid,
+	.local_hfence_gvma_vmid = sbi_tlb_local_hfence_gvma_vmid,
+	.local_hfence_gvma = sbi_tlb_local_hfence_gvma,
+	.local_hfence_vvma_asid = sbi_tlb_local_hfence_vvma_asid,
+	.local_hfence_vvma = sbi_tlb_local_hfence_vvma
+};
+
+static const struct sbi_tlb_local_operations *tlb_local_ops =
+	&default_tlb_local_ops;
+
+const struct sbi_tlb_local_operations *sbi_tlb_get_local_operations(void)
+{
+	return tlb_local_ops;
+}
+
+void sbi_tlb_set_local_operations(
+		const struct sbi_tlb_local_operations *ops)
+{
+	tlb_local_ops = ops;
+}
+
 void __sbi_sfence_vma_all(void)
 {
 	__asm__ __volatile("sfence.vma");
@@ -183,25 +215,25 @@ static void tlb_entry_local_process(struct sbi_tlb_info *data)
 
 	switch (data->type) {
 	case SBI_TLB_FENCE_I:
-		sbi_tlb_local_fence_i(data);
+		tlb_local_ops->local_fence_i(data);
 		break;
 	case SBI_TLB_SFENCE_VMA:
-		sbi_tlb_local_sfence_vma(data);
+		tlb_local_ops->local_sfence_vma(data);
 		break;
 	case SBI_TLB_SFENCE_VMA_ASID:
-		sbi_tlb_local_sfence_vma_asid(data);
+		tlb_local_ops->local_sfence_vma_asid(data);
 		break;
 	case SBI_TLB_HFENCE_GVMA_VMID:
-		sbi_tlb_local_hfence_gvma_vmid(data);
+		tlb_local_ops->local_hfence_gvma_vmid(data);
 		break;
 	case SBI_TLB_HFENCE_GVMA:
-		sbi_tlb_local_hfence_gvma(data);
+		tlb_local_ops->local_hfence_gvma(data);
 		break;
 	case SBI_TLB_HFENCE_VVMA_ASID:
-		sbi_tlb_local_hfence_vvma_asid(data);
+		tlb_local_ops->local_hfence_vvma_asid(data);
 		break;
 	case SBI_TLB_HFENCE_VVMA:
-		sbi_tlb_local_hfence_vvma(data);
+		tlb_local_ops->local_hfence_vvma(data);
 		break;
 	default:
 		break;
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
index ddb4f0bf..8ec90746 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -11,8 +11,10 @@
 #include <thead/c9xx_pmu.h>
 #include <sbi/sbi_const.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_tlb.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
 struct thead_generic_quirks {
@@ -39,15 +41,38 @@ static int thead_pmu_extensions_init(struct sbi_hart_features *hfeatures)
 	return 0;
 }
 
+static void thead_jtlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
+{
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_RCVD);
+	__asm__ __volatile__("sfence.vma");
+}
+
+static void thead_jtlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
+{
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_RCVD);
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
 	const struct thead_generic_quirks *quirks = match->data;
+	static struct sbi_tlb_local_operations tlb_local_ops;
 
 	if (quirks->errata & THEAD_QUIRK_ERRATA_TLB_FLUSH)
 		generic_platform_ops.early_init = thead_tlb_flush_early_init;
 	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)
 		generic_platform_ops.extensions_init = thead_pmu_extensions_init;
+	if (quirks->errata &THEAD_QUIRK_ERRATA_JTLB) {
+		sbi_memcpy(&tlb_local_ops, sbi_tlb_get_local_operations(), sizeof(tlb_local_ops));
+		tlb_local_ops.local_sfence_vma = thead_jtlb_local_sfence_vma;
+		tlb_local_ops.local_sfence_vma_asid = thead_jtlb_local_sfence_vma_asid;
+		sbi_tlb_set_local_operations(&tlb_local_ops);
+	}
 
 	return 0;
 }
@@ -60,13 +85,17 @@ static const struct thead_generic_quirks thead_pmu_quirks = {
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
