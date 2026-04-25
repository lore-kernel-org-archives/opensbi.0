Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D207FF8863
	for <opensbi@archiver.kernel.org>; Sat, 25 Apr 2026 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPKaSFEZwDChxJGR6YTBng0Vz7dSs0n4mXl3sS3a4xk=; b=0tV/zZadseQE9z
	5f2ZDov/s1MvZi5i/Xy1wm+3DRd04Y2rtKjnXNjF9j+2ZkZ7L+P0JldE6apVa97/T+jVG29glsuvt
	1ym079qlkgPyIWcHlW6rHYwJCIrxYF9GVJffVzXVZoEr+J3MUQy3FrkXP9CpEo4Hc4aMgoSCiH/in
	TsoXvmPZlVCNllMFyzdLikxS8Tq3Ibv+FZ17ytUYvnW8yRyCRarw8kfPRf3kZ1myRnq6+2n3vMGG+
	2W5qXkgoeIC8CId79bt11TkS6h2homRCezeWe5zxwa2Qa0fwHdESAqhVyorLdTVXafYEa/ZzX+heQ
	vjhfJPuT1H5jnZ5yU0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRZ-0000000ELsr-3lkE;
	Sat, 25 Apr 2026 10:41:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRV-0000000ELrB-3vk0
	for opensbi@lists.infradead.org;
	Sat, 25 Apr 2026 10:41:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P4llE13843650;
	Sat, 25 Apr 2026 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h8BjUQ8csZ2
	llvRMq7QuajSsTtm9eJpCJoEV/Crl09c=; b=E7WkWHLLuH4zRh1pRxg82n/Bmuj
	IaQSWT/l+TI3yQA9NIvAXD3tspKaCMwHr4Fp2tKOlhQDlYAWqrrGs9e7qgxQjscp
	FCtICYCvowwkpQN99BVirjkMmYucdOr0wBetSihEij9RnnI265IQ6851/PP+D525
	jBD+9EB1Xt0GjSVAZ3ljVwL0LE2frvyec8OQGJxtycLnqqb9YZhfIKtA3xHbCB+3
	PlWQ/sFF8MCNI6/vD0jYOW6Qcmqy8Jsc6imWdFHF4wrpOvwumG/cL6i3JLkX7ha7
	eW1eqiA4EmudvsWOzzRRDgz/fsL2lqi5XJknzzb/bnn3OPKT3FKxdEBB6dA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw98k36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63PAeowT005579;
	Sat, 25 Apr 2026 10:40:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4drpph2c8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:50 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63PAencE005551;
	Sat, 25 Apr 2026 10:40:49 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63PAencS005543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:49 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 1D47522783; Sat, 25 Apr 2026 16:10:49 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 3/4] lib: sbi_timer: Add support for timer events
Date: Sat, 25 Apr 2026 16:10:47 +0530
Message-ID: <20260425104048.2335262-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
References: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: HWdlK-GBKnljKCv0u31b99I8fWi2IKpD
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ec9a36 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=u-SiSY7BG0x4dS0Ixg4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEwNiBTYWx0ZWRfXwYowS5SV/XUj
 f4Xu5o0IWaC8ymdXPnCrPDCy6OK9hzfA4MUnNstn6O0i0qxOaOyS5IsRMRlaJN6wxMei483iSRN
 UvlewGNp2DAGGRPFwDyHdZpNGu5+ULCSOAj7u9lt6ZJ1tvHway1qzvExw4ufVohESeJc+PjN67H
 otgi0N6DJih7jB/I7jBNH/7Iqfzwj3kuwRfVzLcvqp3uvPkQkbf0I537BDqJ73UQTuF/5lNV7bA
 i2qlwVlJ7lbQsHhc5xh/Vw6WKurvDz/moyYETyMOWRnQATfwjfs4LBdw9j6XCjjtESJYgiQKPJc
 QIw52u0g4B2ATgT9caO62Rqqxm1EyBugOkuXR2UtthWETRz9xsEOCCiCULBcjySewUzXA5JWKcj
 HmMxPKEjhb0f2SlqkiU9qGpSGsaYhQYyJAQLr53YsOyT54S/T24acc5Id0FkoGIZZ76tjOnSoJ5
 JDZu+myfB+Hn2sYAFDQ==
X-Proofpoint-ORIG-GUID: HWdlK-GBKnljKCv0u31b99I8fWi2IKpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_034057_979084_0328B3B5 
X-CRM114-Status: GOOD (  26.44  )
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

Currently, the sbi_timer only supports timer events configured via
SBI calls. Introduce struct sbi_timer_event and related functions
to allow configuring timer events from any part of OpenSBI.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_timer.h    |  65 +++++++++++-
 lib/sbi/sbi_ecall_legacy.c |   4 +-
 lib/sbi/sbi_ecall_time.c   |   4 +-
 lib/sbi/sbi_timer.c        | 198 ++++++++++++++++++++++++++++++++++---
 4 files changed, 248 insertions(+), 23 deletions(-)

diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
index 2e1a7879..914a5f12 100644
--- a/include/sbi/sbi_timer.h
+++ b/include/sbi/sbi_timer.h
@@ -10,7 +10,60 @@
 #ifndef __SBI_TIMER_H__
 #define __SBI_TIMER_H__
 
-#include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
+
+/** Timer event re-start details */
+struct sbi_timer_event_restart {
+	/** Flag indicating whether event re-start is required */
+	bool required;
+	/** Next time stamp for event if re-start is required */
+	u64 next_event;
+};
+
+/** Timer event abstraction */
+struct sbi_timer_event {
+	/** List head for per-HART event list (Internal) */
+	struct sbi_dlist head;
+
+	/** Hart on which the event is started / running (Internal) */
+	int hart_index;
+
+	/** Time stamp when the event expires (Internal) */
+	u64 time_stamp;
+
+	/**
+	 * Event callback to be called upon expiry.
+	 *
+	 * If the callback wants to re-start the event then
+	 * it must update the event re-start details.
+	 *
+	 * NOTE: This will be called with the per-HART timer
+	 * event list lock held.
+	 */
+	void (*callback)(struct sbi_timer_event *ev,
+			 struct sbi_timer_event_restart *restart);
+
+	/**
+	 * Event cleanup to be called upon sbi_timer_exit()
+	 *
+	 * NOTE: This will be called with per-HART timer
+	 * event list lock held.
+	 */
+	void (*cleanup)(struct sbi_timer_event *ev);
+
+	/** Event specific private data */
+	void *priv;
+};
+
+#define SBI_INIT_TIMER_EVENT(__ptr, __callback, __cleanup, __priv)	\
+do {									\
+	SBI_INIT_LIST_HEAD(&(__ptr)->head);				\
+	(__ptr)->hart_index = -1;					\
+	(__ptr)->time_stamp = 0;					\
+	(__ptr)->callback = (__callback); 				\
+	(__ptr)->cleanup = (__cleanup); 				\
+	(__ptr)->priv = (__priv); 					\
+} while (0)
 
 /** Timer hardware device */
 struct sbi_timer_device {
@@ -86,8 +139,14 @@ void sbi_timer_set_delta(ulong delta);
 void sbi_timer_set_delta_upper(ulong delta_upper);
 #endif
 
-/** Start timer event for current HART */
-void sbi_timer_event_start(u64 next_event);
+/** Start timer event on current HART */
+void sbi_timer_event_start(struct sbi_timer_event *ev, u64 next_event);
+
+/** Stop timer event on current HART */
+void sbi_timer_event_stop(struct sbi_timer_event *ev);
+
+/** Start supervisor timer event on current HART */
+void sbi_timer_smode_event_start(u64 next_event);
 
 /** Process timer event for current HART */
 void sbi_timer_process(void);
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 50a7660d..4501c4ad 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -54,9 +54,9 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 	switch (extid) {
 	case SBI_EXT_0_1_SET_TIMER:
 #if __riscv_xlen == 32
-		sbi_timer_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
+		sbi_timer_smode_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
 #else
-		sbi_timer_event_start((u64)regs->a0);
+		sbi_timer_smode_event_start((u64)regs->a0);
 #endif
 		break;
 	case SBI_EXT_0_1_CONSOLE_PUTCHAR:
diff --git a/lib/sbi/sbi_ecall_time.c b/lib/sbi/sbi_ecall_time.c
index 6ea6f054..a0aa580d 100644
--- a/lib/sbi/sbi_ecall_time.c
+++ b/lib/sbi/sbi_ecall_time.c
@@ -22,9 +22,9 @@ static int sbi_ecall_time_handler(unsigned long extid, unsigned long funcid,
 
 	if (funcid == SBI_EXT_TIME_SET_TIMER) {
 #if __riscv_xlen == 32
-		sbi_timer_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
+		sbi_timer_smode_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
 #else
-		sbi_timer_event_start((u64)regs->a0);
+		sbi_timer_smode_event_start((u64)regs->a0);
 #endif
 	} else
 		ret = SBI_ENOTSUPP;
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 9806c033..4b16dbb2 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -10,9 +10,11 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_barrier.h>
 #include <sbi/riscv_encoding.h>
+#include <sbi/riscv_locks.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
@@ -20,6 +22,9 @@
 
 struct timer_state {
 	u64 time_delta;
+	spinlock_t event_list_lock;
+	struct sbi_dlist event_list;
+	struct sbi_timer_event smode_ev;
 };
 
 static unsigned long timer_state_off;
@@ -136,8 +141,130 @@ void sbi_timer_set_delta_upper(ulong delta_upper)
 }
 #endif
 
-void sbi_timer_event_start(u64 next_event)
+static void __sbi_timer_update_device(struct timer_state *tstate)
 {
+	struct sbi_timer_event *ev;
+
+	if (!timer_dev)
+		return;
+
+	if (sbi_list_empty(&tstate->event_list)) {
+		if (timer_dev->timer_event_stop)
+			timer_dev->timer_event_stop();
+		csr_clear(CSR_MIE, MIP_MTIP);
+	} else {
+		ev = sbi_list_first_entry(&tstate->event_list, struct sbi_timer_event, head);
+		if (timer_dev->timer_event_start)
+			timer_dev->timer_event_start(ev->time_stamp);
+		csr_set(CSR_MIE, MIP_MTIP);
+	}
+}
+
+static void __sbi_timer_event_stop(struct sbi_timer_event *ev)
+{
+	if (ev->hart_index > -1) {
+		sbi_list_del(&ev->head);
+		ev->hart_index = -1;
+	}
+}
+
+static void __sbi_timer_event_start(struct timer_state *tstate,
+				    struct sbi_timer_event *ev, u64 next_event)
+{
+	struct sbi_timer_event *tev, *next_ev = NULL;
+
+	/* Find where to insert the event in per-HART event list */
+	sbi_list_for_each_entry(tev, &tstate->event_list, head) {
+		if (next_event < tev->time_stamp) {
+			next_ev = tev;
+			break;
+		}
+	}
+
+	/* Insert the event in per-HART event list */
+	ev->hart_index = current_hartindex();
+	ev->time_stamp = next_event;
+	if (next_ev)
+		sbi_list_add(&ev->head, &next_ev->head);
+	else
+		sbi_list_add_tail(&ev->head, &tstate->event_list);
+}
+
+void sbi_timer_event_start(struct sbi_timer_event *ev, u64 next_event)
+{
+	struct timer_state *tstate;
+
+	if (!ev)
+		return;
+
+	/* Ensure that event is not on the per-HART event list */
+	if (ev->hart_index > -1) {
+		tstate = sbi_scratch_offset_ptr(sbi_hartindex_to_scratch(ev->hart_index),
+						timer_state_off);
+		spin_lock(&tstate->event_list_lock);
+		__sbi_timer_event_stop(ev);
+		spin_unlock(&tstate->event_list_lock);
+	}
+
+	tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
+	spin_lock(&tstate->event_list_lock);
+
+	__sbi_timer_event_start(tstate, ev, next_event);
+	__sbi_timer_update_device(tstate);
+
+	spin_unlock(&tstate->event_list_lock);
+}
+
+void sbi_timer_event_stop(struct sbi_timer_event *ev)
+{
+	struct timer_state *tstate;
+	int ev_hart_index;
+
+	if (!ev)
+		return;
+
+	/* Ensure that event is not on the per-HART event list */
+	ev_hart_index = ev->hart_index;
+	if (ev->hart_index > -1) {
+		tstate = sbi_scratch_offset_ptr(sbi_hartindex_to_scratch(ev->hart_index),
+						timer_state_off);
+		spin_lock(&tstate->event_list_lock);
+		__sbi_timer_event_stop(ev);
+		spin_unlock(&tstate->event_list_lock);
+	}
+
+	/* Re-program timer device on the current HART */
+	if (ev_hart_index == current_hartindex()) {
+		tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
+		spin_lock(&tstate->event_list_lock);
+		__sbi_timer_update_device(tstate);
+		spin_unlock(&tstate->event_list_lock);
+	}
+}
+
+static void sbi_timer_smode_event_callback(struct sbi_timer_event *ev,
+					   struct sbi_timer_event_restart *restart)
+{
+	/*
+	 * If sstc extension is available, supervisor can receive the timer
+	 * directly without M-mode come in between. This function should
+	 * only invoked if M-mode programs the timer for its own purpose.
+	 */
+	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC))
+		csr_set(CSR_MIP, MIP_STIP);
+}
+
+static void sbi_timer_smode_event_cleanup(struct sbi_timer_event *ev)
+{
+	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC))
+		csr_clear(CSR_MIP, MIP_STIP);
+}
+
+void sbi_timer_smode_event_start(u64 next_event)
+{
+	struct timer_state *tstate = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
+							    timer_state_off);
+
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SET_TIMER);
 
 	/**
@@ -146,23 +273,47 @@ void sbi_timer_event_start(u64 next_event)
 	 */
 	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC)) {
 		csr_write64(CSR_STIMECMP, next_event);
-	} else if (timer_dev && timer_dev->timer_event_start) {
-		timer_dev->timer_event_start(next_event);
+	} else {
 		csr_clear(CSR_MIP, MIP_STIP);
+		sbi_timer_event_start(&tstate->smode_ev, next_event);
 	}
-	csr_set(CSR_MIE, MIP_MTIP);
 }
 
 void sbi_timer_process(void)
 {
-	csr_clear(CSR_MIE, MIP_MTIP);
-	/*
-	 * If sstc extension is available, supervisor can receive the timer
-	 * directly without M-mode come in between. This function should
-	 * only invoked if M-mode programs the timer for its own purpose.
-	 */
-	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC))
-		csr_set(CSR_MIP, MIP_STIP);
+	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
+	struct sbi_timer_event_restart restart;
+	SBI_LIST_HEAD(restart_list);
+	struct sbi_timer_event *ev;
+
+	spin_lock(&tstate->event_list_lock);
+
+	while (!sbi_list_empty(&tstate->event_list)) {
+		ev = sbi_list_first_entry(&tstate->event_list, struct sbi_timer_event, head);
+		if (ev->time_stamp > sbi_timer_value())
+			break;
+
+		__sbi_timer_event_stop(ev);
+		if (ev->callback) {
+			restart.required = false;
+			restart.next_event = 0;
+			ev->callback(ev, &restart);
+			if (restart.required) {
+				ev->time_stamp = restart.next_event;
+				sbi_list_add_tail(&ev->head, &restart_list);
+			}
+		}
+	}
+
+	while (!sbi_list_empty(&restart_list)) {
+		ev = sbi_list_first_entry(&tstate->event_list, struct sbi_timer_event, head);
+		sbi_list_del(&ev->head);
+		__sbi_timer_event_start(tstate, ev, ev->time_stamp);
+	}
+
+	__sbi_timer_update_device(tstate);
+
+	spin_unlock(&tstate->event_list_lock);
 }
 
 const struct sbi_timer_device *sbi_timer_get_device(void)
@@ -204,6 +355,11 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 
 	tstate = sbi_scratch_offset_ptr(scratch, timer_state_off);
 	tstate->time_delta = 0;
+	SPIN_LOCK_INIT(tstate->event_list_lock);
+	SBI_INIT_LIST_HEAD(&tstate->event_list);
+	SBI_INIT_TIMER_EVENT(&tstate->smode_ev,
+			     sbi_timer_smode_event_callback,
+			     sbi_timer_smode_event_cleanup, NULL);
 
 	if (timer_dev && timer_dev->warm_init) {
 		ret = timer_dev->warm_init();
@@ -216,9 +372,19 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 
 void sbi_timer_exit(struct sbi_scratch *scratch)
 {
-	if (timer_dev && timer_dev->timer_event_stop)
-		timer_dev->timer_event_stop();
+	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
+	struct sbi_timer_event *ev;
+
+	spin_lock(&tstate->event_list_lock);
+
+	while (!sbi_list_empty(&tstate->event_list)) {
+		ev = sbi_list_first_entry(&tstate->event_list, struct sbi_timer_event, head);
+		__sbi_timer_event_stop(ev);
+		if (ev->cleanup)
+			ev->cleanup(ev);
+	}
+
+	__sbi_timer_update_device(tstate);
 
-	csr_clear(CSR_MIP, MIP_STIP);
-	csr_clear(CSR_MIE, MIP_MTIP);
+	spin_unlock(&tstate->event_list_lock);
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
