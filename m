Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C7FC7115C
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ns8JLGK1A/+nZed88ox42xEDFj+UGxYDjq7Yx84TeR4=; b=h4LHS+r8y8xcY2
	z7VPZIHnqYu1cSpbT1herhXZpvlVbyNSucyS4AmwOwcedD8JEbYUpsc3/DQ81fJNy0VnOLcr27oMF
	LV51e3MgLRfeQ5N+NipSTZWCno2dBkiTYarAfzVqF5fm9kSrNK4ee3jUuGQDj3UdVUmaE7BUeP6K8
	guFd8B2+39OiZO8+fcCo1p+2DJN3KiXu/8yu55IhHK4fzk1aduaMu/Ypf27NLbbB6ijWqOTIVRsER
	iQO97bYywbteueX2VMNFiotw4LR8KYVYug6U07mY2/3yP/PWEHCZp24XkfMlM9srQrMP1Ybgn/5J6
	pvzqaj42IRp/iIp+NFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpyi-0000000H5yq-2xes;
	Sat, 21 Jun 2025 04:37:20 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpl9-0000000H4zm-3Fvo
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ca
	RP0zwbISiu1XBalqyCZbJKfsdzg/KvHTsbclw1qVQ=; b=dsXIwHF198uTlr39OR
	zsk9c7IhWrdA01SyhUUBVhOTHCLFQOAwB4HVqkwm2jomYECZb1mDjZnCXn7/vmd4
	ePMnnu6dULZjTqwhlEXl22i/+/BfnqKm/CiAQao+ReHYLgtsGSZfXSgu8vHjAVqb
	ZeQwgemcA8V8H92Bkc2SULmj0=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S5;
	Sat, 21 Jun 2025 12:23:09 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 3/9] lib: sbi: Add wait operations in some initialization functions
Date: Sat, 21 Jun 2025 12:22:51 +0800
Message-ID: <20250621042302.160802-4-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621042302.160802-1-wxjstz@126.com>
References: <20250621042302.160802-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxKFWxZr18WF1UWFyUZF4fKrg_yoW3Cw1kpF
	y5KF9rJr4vqry8K3srXa1DZrs3Gw10v3y7Gry2y34SyF48Ar1rXry2kF1Yva9xGrWUAa12
	y3yv9ryfCF15Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U0hFxUUUUU=
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5BZzOmhWMwUHdwAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212320_185033_E48DFE01 
X-CRM114-Status: GOOD (  11.90  )
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

Many initialization functions need to wait for coldboot HART to
complete some initialization work before other HART can continue
to execute. This patch adds wait operations to these functions.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_dbtr.c    | 3 +++
 lib/sbi/sbi_fwft.c    | 3 +++
 lib/sbi/sbi_hart.c    | 3 +++
 lib/sbi/sbi_ipi.c     | 3 +++
 lib/sbi/sbi_irqchip.c | 5 ++++-
 lib/sbi/sbi_pmu.c     | 3 +++
 lib/sbi/sbi_sse.c     | 3 +++
 lib/sbi/sbi_timer.c   | 3 +++
 lib/sbi/sbi_tlb.c     | 3 +++
 9 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index a832c7f1..dcf24ce5 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -140,15 +140,18 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 	unsigned long val;
 	int i;
 	struct sbi_dbtr_hart_triggers_state *hart_state = NULL;
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SDTRIG))
 		return SBI_SUCCESS;
 
+	sbi_wait_for_boot_hart_first(coldboot, &sync_a);
 	if (coldboot) {
 		hart_state_ptr_offset = sbi_scratch_alloc_type_offset(void *);
 		if (!hart_state_ptr_offset)
 			return SBI_ENOMEM;
 	}
+	sbi_signal_boot_hart_first_done(coldboot, &sync_a);
 
 	hart_state = dbtr_get_hart_state_ptr(scratch);
 	if (!hart_state) {
diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index a2aefb9a..612d2f2b 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -406,12 +406,15 @@ int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int i;
 	struct fwft_hart_state *fhs;
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
+	sbi_wait_for_boot_hart_first(cold_boot, &sync_a);
 	if (cold_boot) {
 		fwft_ptr_offset = sbi_scratch_alloc_type_offset(void *);
 		if (!fwft_ptr_offset)
 			return SBI_ENOMEM;
 	}
+	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
 	fhs = fwft_get_hart_state_ptr(scratch);
 	if (!fhs) {
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 61d3b26b..86eedce3 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -1047,6 +1047,7 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int rc;
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
 	/*
 	 * Clear mip CSR before proceeding with init to avoid any spurious
@@ -1054,6 +1055,7 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 	 */
 	csr_write(CSR_MIP, 0);
 
+	sbi_wait_for_boot_hart_first(cold_boot, &sync_a);
 	if (cold_boot) {
 		if (misa_extension('H'))
 			sbi_hart_expected_trap = &__sbi_expected_trap_hext;
@@ -1063,6 +1065,7 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 		if (!hart_features_offset)
 			return SBI_ENOMEM;
 	}
+	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
 	rc = hart_detect_features(scratch);
 	if (rc)
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 2de459b0..8aeb1e8b 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -317,7 +317,9 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int ret;
 	struct sbi_ipi_data *ipi_data;
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
+	sbi_wait_for_boot_hart_first(cold_boot, &sync_a);
 	if (cold_boot) {
 		ipi_data_off = sbi_scratch_alloc_offset(sizeof(*ipi_data));
 		if (!ipi_data_off)
@@ -342,6 +344,7 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
 		    SBI_IPI_EVENT_MAX <= ipi_halt_event)
 			return SBI_ENOSPC;
 	}
+	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
 	ipi_data = sbi_scratch_offset_ptr(scratch, ipi_data_off);
 	ipi_data->ipi_type = 0x00;
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 0594e05a..18818c22 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -6,7 +6,7 @@
  * Authors:
  *   Anup Patel <apatel@ventanamicro.com>
  */
-
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_list.h>
 #include <sbi/sbi_platform.h>
@@ -38,12 +38,15 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 	int rc;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 	struct sbi_irqchip_device *dev;
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
+	sbi_wait_for_boot_hart_first(cold_boot, &sync_a);
 	if (cold_boot) {
 		rc = sbi_platform_irqchip_init(plat);
 		if (rc)
 			return rc;
 	}
+	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
 	sbi_list_for_each_entry(dev, &irqchip_list, node) {
 		if (!dev->warm_init)
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 07a5c544..842858da 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1150,7 +1150,9 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 	struct sbi_pmu_hart_state *phs;
 	const struct sbi_platform *plat;
 	int rc;
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
+	sbi_wait_for_boot_hart_first(cold_boot, &sync_a);
 	if (cold_boot) {
 		hw_event_map = sbi_calloc(sizeof(*hw_event_map),
 					  SBI_PMU_HW_EVENT_MAX);
@@ -1185,6 +1187,7 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 		if (sbi_pmu_irq_bit() >= 0)
 			sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, &pmu_sse_cb_ops);
 	}
+	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
 	phs = pmu_get_hart_state_ptr(scratch);
 	if (!phs) {
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 986b7701..63572633 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1214,7 +1214,9 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
 	void *sse_inject_mem;
 	struct sse_hart_state *shs;
 	struct sbi_fifo *sse_inject_q;
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
+	sbi_wait_for_boot_hart_first(cold_boot, &sync_a);
 	if (cold_boot) {
 		sse_event_count_init();
 
@@ -1249,6 +1251,7 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
 		}
 		sse_ipi_inject_event = ret;
 	}
+	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
 	shs = sse_get_hart_state_ptr(scratch);
 	if (!shs) {
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 4088a597..d14e53ab 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -179,7 +179,9 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 	u64 *time_delta;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 	int ret;
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
+	sbi_wait_for_boot_hart_first(cold_boot, &sync_a);
 	if (cold_boot) {
 		time_delta_off = sbi_scratch_alloc_offset(sizeof(*time_delta));
 		if (!time_delta_off)
@@ -195,6 +197,7 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 		if (!time_delta_off)
 			return SBI_ENOMEM;
 	}
+	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
 	time_delta = sbi_scratch_offset_ptr(scratch, time_delta_off);
 	*time_delta = 0;
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 01b31f4e..69cc2dfd 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -419,7 +419,9 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 	atomic_t *tlb_sync;
 	struct sbi_fifo *tlb_q;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
+	sbi_wait_for_boot_hart_first(cold_boot, &sync_a);
 	if (cold_boot) {
 		tlb_sync_off = sbi_scratch_alloc_offset(sizeof(*tlb_sync));
 		if (!tlb_sync_off)
@@ -452,6 +454,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 		if (SBI_IPI_EVENT_MAX <= tlb_event)
 			return SBI_ENOSPC;
 	}
+	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
 	tlb_sync = sbi_scratch_offset_ptr(scratch, tlb_sync_off);
 	tlb_q = sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
