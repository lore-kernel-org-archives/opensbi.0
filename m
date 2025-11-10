Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9548CCFA13
	for <opensbi@archiver.kernel.org>; Mon, 10 Nov 2025 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=51jkbrs+EU2Z//yrDrAppa05+F3dT7KKOOnU69iyPGY=; b=GfjcMkuVrS/som
	g8oNc+yT8Uh69i8HGVLfqUZRgabTGYT0XmhPpG48qwf52h8hbm7WwDsake5YbvqrKL1OCBKQ9PbA2
	A7nmqnTtELOBAG9u1CzvbNlJcB6bTMPCDMgu9uEB3x6M3QiyXbMMRmD5ok5aqtYh9mLssoLvtioIf
	xU2xviZjtV5Ruiyvbq3TFu5/ykuC65D03df/w6NjpTKGhZ1cisF9dGED5eO2irhFj7VTThVWCU9fb
	sTt2XcGVv7HBSVX6tnMwFiwB0fEfrSASmDkhJ7i5qhHihu51JjSwoQJqKA6YE88JX11RHv4ZvzJAT
	D4IpL1daZbrPQO/bpStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ8w-00000005K9I-3uYf;
	Mon, 10 Nov 2025 11:33:06 +0000
Received: from m.syntacore.com ([178.249.69.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ8u-00000005K8C-3Lhy
	for opensbi@lists.infradead.org;
	Mon, 10 Nov 2025 11:33:06 +0000
Received: from MRN-SC-KSMG-01.corp.syntacore.com (localhost [127.0.0.1])
	by m.syntacore.com (Postfix) with ESMTP id E35051A0005
	for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 11:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.syntacore.com E35051A0005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=m;
	t=1762774382; bh=W46flc4bnhqIb3msi05Enqxwk/C1N0ME1nmKPNDflCs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ACUzyh6jNkglQWftaw05IA8/cUPy4MSn3y4iGfGZX/bKXdOt1+6ZS1KQ3f+7wPdoS
	 U4fn/cgu48hFCmBRC3ZcygskBc6FDSKmYUBWVnQu3LJBa+BtoarF9up7MRYb9s/f2p
	 x1pszWt90YIggEccvAOQEB0A1KxboefQeL6vY65Sh05yqIG1BtkC/0DfexYnkrnnLc
	 1BvyujlN23KHAzPQI2tubUXrxU0V4Fqzo9K2Nz0w1YMPdzcSdxMI4L5NrlECIN9L2z
	 ugYAdFTmt5aJoR/26gMzbaRUYf3L1fV3TtmwurMH4SKmz4Qru3kidmGevVLfS/wKEw
	 fCGQ9AZhR/AFQ==
Received: from S-SC-EXCH-01.corp.syntacore.com (exchange.syntacore.com [10.76.202.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by m.syntacore.com (Postfix) with ESMTPS
	for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 11:33:02 +0000 (UTC)
Received: from apokriff-sc.corp.yadro.com (10.76.16.215) by
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 10 Nov 2025 14:32:41 +0300
From: Shifrin Dmitry <dmitry.shifrin@syntacore.com>
To: <opensbi@lists.infradead.org>
CC: Shifrin Dmitry <dmitry.shifrin@syntacore.com>
Subject: [PATCH] lib: sbi: sbi_pmu: Fix xINH bits configuring
Date: Mon, 10 Nov 2025 14:31:40 +0300
Message-ID: <20251110113140.80561-1-dmitry.shifrin@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.76.16.215]
X-ClientProxiedBy: S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) To
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20)
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/11/10 10:58:00 #27905202
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_033304_996328_1E92E1E4 
X-CRM114-Status: GOOD (  19.04  )
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

Before this patch sbi_pmu_ctr_start() ignores
flags received in sbi_pmu_ctr_cfg_match() including
inhibit ones.
To prevent it save flags together with event_data
and use them both in sbi_pmu_ctr_start()

Fixes: 1db95da2997b ("lib: sbi: sbi_pmu: fixed hw counters start for hart")

Signed-off-by: Shifrin Dmitry <dmitry.shifrin@syntacore.com>
---
 include/sbi/sbi_ecall_interface.h |  9 +++++++++
 lib/sbi/sbi_pmu.c                 | 33 ++++++++++++++++++++++++-------
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index af7a05af..bdffb0fa 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -291,6 +291,15 @@ struct sbi_pmu_event_info {
 #define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
 #define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
 #define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
+/* Event configuration mask */
+#define SBI_PMU_CFG_EVENT_MASK          \
+	( \
+		SBI_PMU_CFG_FLAG_SET_VUINH | \
+		SBI_PMU_CFG_FLAG_SET_VSINH | \
+		SBI_PMU_CFG_FLAG_SET_UINH  | \
+		SBI_PMU_CFG_FLAG_SET_SINH  | \
+		SBI_PMU_CFG_FLAG_SET_MINH    \
+	)
 
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 70c49abc..e24e485d 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -56,6 +56,14 @@ union sbi_pmu_ctr_info {
 #error "Can't handle firmware counters beyond BITS_PER_LONG"
 #endif
 
+/** HW event configuration parameters */
+struct sbi_pmu_hw_event_config {
+	/* event_data value from sbi_pmu_ctr_cfg_match() */
+	uint64_t event_data;
+	/* HW events flags from sbi_pmu_ctr_cfg_match() */
+	uint64_t flags;
+};
+
 /** Per-HART state of the PMU counters */
 struct sbi_pmu_hart_state {
 	/* HART to which this state belongs */
@@ -72,11 +80,12 @@ struct sbi_pmu_hart_state {
 	 * and hence can optimally share the same memory.
 	 */
 	uint64_t fw_counters_data[SBI_PMU_FW_CTR_MAX];
-	/* Data values from sbi_pmu_ctr_cfg_match() command which
-	 * is used for restoring RAW hardware events after
+	/* HW events configuration parameters from
+	 * sbi_pmu_ctr_cfg_match() command which are
+	 * used for restoring RAW hardware events after
 	 * cpu suspending.
 	 */
-	uint64_t hw_counters_data[SBI_PMU_HW_CTR_MAX];
+	struct sbi_pmu_hw_event_config hw_counters_cfg[SBI_PMU_HW_CTR_MAX];
 };
 
 /** Offset of pointer to PMU HART state in scratch space */
@@ -561,9 +570,13 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 					       ival, bUpdate);
 		} else {
 			if (cidx >= 3) {
+				struct sbi_pmu_hw_event_config *ev_cfg =
+					&phs->hw_counters_cfg[cidx];
+
 				ret = pmu_update_hw_mhpmevent(&hw_event_map[cidx], cidx,
-							0, phs->active_events[cidx],
-							phs->hw_counters_data[cidx]);
+							ev_cfg->flags,
+							phs->active_events[cidx],
+							ev_cfg->event_data);
 				if (ret)
 					return ret;
 			}
@@ -892,8 +905,14 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	} else {
 		ctr_idx = pmu_ctr_find_hw(phs, cidx_base, cidx_mask, flags,
 					  event_idx, event_data);
-		if (ctr_idx >= 0)
-			phs->hw_counters_data[ctr_idx] = event_data;
+		if (ctr_idx >= 0) {
+			struct sbi_pmu_hw_event_config *ev_cfg =
+					&phs->hw_counters_cfg[ctr_idx];
+
+			ev_cfg->event_data = event_data;
+			/* Remove flags that are used in match call only */
+			ev_cfg->flags = flags & SBI_PMU_CFG_EVENT_MASK;
+		}
 	}
 
 	if (ctr_idx < 0)
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
