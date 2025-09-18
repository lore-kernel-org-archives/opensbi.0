Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF9FCAC59F
	for <opensbi@archiver.kernel.org>; Thu, 18 Sep 2025 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Rc+3SXjSDYc0GjF2Fh3MeYltrfdFeL+z8feXxkZshY=; b=nUXZQ9vtBPhXFZ
	GXmzMr48GATIJs9qDZ7r7d+M9fHWW+DLy9pkPm1IO6rqF3Izs4fA+uQkUxXInOZPh8sFYGFylGiYK
	9FC4eAfKpOT7tmiLxB3HdHdiWAjku01Rr2pjwB1ZcHhHjxP9G1zjwU76kPXvcudIslv44LBGuCG+C
	bi2iA0bS02p4ZSmmsPYwg+hKEpYYh3/6jLWIzIgBPw1lVKVq1zON/M4Ps5eLKPhhiMa+1L4yXSmyD
	DkdxMPj+sIi0EpdkLsrh4kPdjRg8aMSa6G1mvItbuWjysf/CNL1QvkwMj/aY7Kt6cT9bF03XEdLUp
	q+RaZmKlYzaAgskbrZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAcH-0000000GoRq-3EIA;
	Thu, 18 Sep 2025 09:07:49 +0000
Received: from m.syntacore.com ([178.249.69.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAcF-0000000GoQ8-1RPQ
	for opensbi@lists.infradead.org;
	Thu, 18 Sep 2025 09:07:48 +0000
Received: from MRN-SC-KSMG-01.corp.syntacore.com (localhost [127.0.0.1])
	by m.syntacore.com (Postfix) with ESMTP id 4C4811A0004
	for <opensbi@lists.infradead.org>; Thu, 18 Sep 2025 09:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.syntacore.com 4C4811A0004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=m;
	t=1758186464; bh=TRmBtFq2Yz7td7yp59ITefq76OG8oJamk6XY16+kV0k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=KYOoZDKqEs2JxGYLQQO3nvvjAomJ3KSKaXvc/EaaF0m/YElxVkp1n2rStzLNbIwQm
	 kf0GytkXljl/8pj0gn0PTKzVYk4XmYQJ9Js3HerGqpD/ZVMDz/sWL4Los9TOTDL8LP
	 DyUxkaE+ZSwOkIaMdr7n/x5n9m3bBE1i464uUBTXu19g52SbUSUCYvDt048G8LaJyH
	 Jov8245B73UQTkWwPg4j0/fmxI59J5mxVAn8ZjuNyJ1nLqssKRXL+et3TGPrgUEzv1
	 6bIs59Afnw+fbJJgZMDv9rpu8QHtzsQn4oBxsUPpIHGnTWEdIh+onK7PKJQc7nKcyW
	 /4kt9zvw8xakA==
Received: from S-SC-EXCH-01.corp.syntacore.com (exchange.syntacore.com [10.76.202.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by m.syntacore.com (Postfix) with ESMTPS
	for <opensbi@lists.infradead.org>; Thu, 18 Sep 2025 09:07:44 +0000 (UTC)
Received: from alex-HP-ProBook-440-G7.corp.yadro.com (10.178.116.193) by
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 12:06:53 +0300
From: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
To: <opensbi@lists.infradead.org>
CC: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
Subject: [PATCH 1/3] lib: sbi: sbi_pmu: fixed hw counters start for hart
Date: Thu, 18 Sep 2025 12:07:04 +0300
Message-ID: <20250918090706.2217603-2-alexander.chuprunov@syntacore.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918090706.2217603-1-alexander.chuprunov@syntacore.com>
References: <20250918090706.2217603-1-alexander.chuprunov@syntacore.com>
MIME-Version: 1.0
X-Originating-IP: [10.178.116.193]
X-ClientProxiedBy: S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) To
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20)
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/09/18 08:29:00 #27829917
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_020747_542115_4F7E0802 
X-CRM114-Status: GOOD (  22.74  )
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

Generally, hardware performance counters can only be started, stopped,
or configured from machine-mode using mcountinhibit and mhpmeventX CSRs.
Also, in opensbi only sbi_pmu_ctr_cfg_match() managed mhpmeventX. But
in generic Linux driver, when perf starts, Linux calls both
sbi_pmu_ctr_cfg_match() and sbi_pmu_ctr_start(), while after hart suspend
only sbi_pmu_ctr_start() command called through SBI interface. This doesn't
work properly in case when suspend state resets HPM registers. In order
to keep counter integrity, sbi_pmu_ctr_start() modified. First, we're saving
hw_counters_data, and after hart suspend this value is restored if
event is currently active.

Signed-off-by: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
---
 lib/sbi/sbi_pmu.c | 128 +++++++++++++++++++++++++---------------------
 1 file changed, 71 insertions(+), 57 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 4ffbbfc6..0718b3ed 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -72,6 +72,11 @@ struct sbi_pmu_hart_state {
 	 * and hence can optimally share the same memory.
 	 */
 	uint64_t fw_counters_data[SBI_PMU_FW_CTR_MAX];
+	/* Data values from sbi_pmu_ctr_cfg_match() command which
+	 * is used for restoring RAW hardware events after
+	 * cpu suspending.
+	 */
+	uint64_t hw_counters_data[SBI_PMU_HW_CTR_MAX];
 };
 
 /** Offset of pointer to PMU HART state in scratch space */
@@ -447,6 +452,61 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 	return 0;
 }
 
+static void pmu_update_inhibit_flags(unsigned long flags, uint64_t *mhpmevent_val)
+{
+	if (flags & SBI_PMU_CFG_FLAG_SET_VUINH)
+		*mhpmevent_val |= MHPMEVENT_VUINH;
+	if (flags & SBI_PMU_CFG_FLAG_SET_VSINH)
+		*mhpmevent_val |= MHPMEVENT_VSINH;
+	if (flags & SBI_PMU_CFG_FLAG_SET_UINH)
+		*mhpmevent_val |= MHPMEVENT_UINH;
+	if (flags & SBI_PMU_CFG_FLAG_SET_SINH)
+		*mhpmevent_val |= MHPMEVENT_SINH;
+}
+
+static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
+				   unsigned long flags, unsigned long eindex,
+				   uint64_t data)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	uint64_t mhpmevent_val;
+
+	/* Get the final mhpmevent value to be written from platform */
+	mhpmevent_val = sbi_platform_pmu_xlate_to_mhpmevent(plat, eindex, data);
+
+	if (!mhpmevent_val || ctr_idx < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX)
+		return SBI_EFAIL;
+
+	/**
+	 * Always set the OVF bit(disable interrupts) and inhibit counting of
+	 * events in M-mode. The OVF bit should be enabled during the start call.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+		mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) |
+				 MHPMEVENT_MINH | MHPMEVENT_OF;
+
+	if (pmu_dev && pmu_dev->hw_counter_disable_irq)
+		pmu_dev->hw_counter_disable_irq(ctr_idx);
+
+	/* Update the inhibit flags based on inhibit flags received from supervisor */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+		pmu_update_inhibit_flags(flags, &mhpmevent_val);
+	if (pmu_dev && pmu_dev->hw_counter_filter_mode)
+		pmu_dev->hw_counter_filter_mode(flags, ctr_idx);
+
+#if __riscv_xlen == 32
+	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val & 0xFFFFFFFF);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+		csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3,
+			      mhpmevent_val >> BITS_PER_LONG);
+#else
+	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val);
+#endif
+
+	return 0;
+}
+
 int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 		      unsigned long flags, uint64_t ival)
 {
@@ -483,9 +543,17 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 				 : 0x0;
 			ret = pmu_ctr_start_fw(phs, cidx, event_code, edata,
 					       ival, bUpdate);
+		} else {
+			if (cidx >= 3) {
+				ret = pmu_update_hw_mhpmevent(&hw_event_map[cidx], cidx,
+							0, phs->active_events[cidx],
+							phs->hw_counters_data[cidx]);
+				if (!ret)
+					ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
+			} else {
+				ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
+			}
 		}
-		else
-			ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
 	}
 
 	return ret;
@@ -605,61 +673,6 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 	return ret;
 }
 
-static void pmu_update_inhibit_flags(unsigned long flags, uint64_t *mhpmevent_val)
-{
-	if (flags & SBI_PMU_CFG_FLAG_SET_VUINH)
-		*mhpmevent_val |= MHPMEVENT_VUINH;
-	if (flags & SBI_PMU_CFG_FLAG_SET_VSINH)
-		*mhpmevent_val |= MHPMEVENT_VSINH;
-	if (flags & SBI_PMU_CFG_FLAG_SET_UINH)
-		*mhpmevent_val |= MHPMEVENT_UINH;
-	if (flags & SBI_PMU_CFG_FLAG_SET_SINH)
-		*mhpmevent_val |= MHPMEVENT_SINH;
-}
-
-static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
-				   unsigned long flags, unsigned long eindex,
-				   uint64_t data)
-{
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
-	uint64_t mhpmevent_val;
-
-	/* Get the final mhpmevent value to be written from platform */
-	mhpmevent_val = sbi_platform_pmu_xlate_to_mhpmevent(plat, eindex, data);
-
-	if (!mhpmevent_val || ctr_idx < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX)
-		return SBI_EFAIL;
-
-	/**
-	 * Always set the OVF bit(disable interrupts) and inhibit counting of
-	 * events in M-mode. The OVF bit should be enabled during the start call.
-	 */
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
-		mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) |
-				 MHPMEVENT_MINH | MHPMEVENT_OF;
-
-	if (pmu_dev && pmu_dev->hw_counter_disable_irq)
-		pmu_dev->hw_counter_disable_irq(ctr_idx);
-
-	/* Update the inhibit flags based on inhibit flags received from supervisor */
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
-		pmu_update_inhibit_flags(flags, &mhpmevent_val);
-	if (pmu_dev && pmu_dev->hw_counter_filter_mode)
-		pmu_dev->hw_counter_filter_mode(flags, ctr_idx);
-
-#if __riscv_xlen == 32
-	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val & 0xFFFFFFFF);
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
-		csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3,
-			      mhpmevent_val >> BITS_PER_LONG);
-#else
-	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val);
-#endif
-
-	return 0;
-}
-
 static int pmu_fixed_ctr_update_inhibit_bits(int fixed_ctr, unsigned long flags)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
@@ -870,6 +883,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	} else {
 		ctr_idx = pmu_ctr_find_hw(phs, cidx_base, cidx_mask, flags,
 					  event_idx, event_data);
+		phs->hw_counters_data[ctr_idx] = event_data;
 	}
 
 	if (ctr_idx < 0)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
