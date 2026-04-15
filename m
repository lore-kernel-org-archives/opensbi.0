Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DB9F41990
	for <opensbi@archiver.kernel.org>; Wed, 15 Apr 2026 11:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+8jx+hjc6Pink4wB6rSGONMkGD10CyfJI4VFPKBOM4=; b=4xdD/jyYjFx9Wb
	mSy8QDxb5gqXxEfOfTfmMwXmy6VzwXiHwND1jlF55TId7Hz4ZgJMrY/JeOqOmmTBJWx3h/ihxoMQZ
	snucRktsnRfhWjm/uinTfYKmTl6SaKGLRoxmFgLGNMVZQ7Ym5L1Zaf3CjZAKmNOqxDpZ5p4JBvlNt
	RclECcV576Wk66wo53OUyOWnN42gr/Ac1+9LG1OnGF7bVZ6n7HALID8boKYjU85plpFMLOnvqTZQB
	PMpBGwlTpO2Or9ERSiy6hUDeHIwEHtlH9mNZkHsbg0RtJAdwgGA1y5B66S3gkKQAgvHgCfKVJVtxl
	x9AFn1P0LLx9kadtVurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxyi-000000010Tx-2P49;
	Wed, 15 Apr 2026 11:00:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxyg-000000010Sx-0WHN
	for opensbi@lists.infradead.org;
	Wed, 15 Apr 2026 11:00:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9fBbG1778836;
	Wed, 15 Apr 2026 11:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KenWwB23DOw
	93neXtj0yfWx/iD2IE/OALb2E0lh+ouA=; b=iJf0izzWcaXaVAXXfHE1mC54AqV
	SVTm9eBvh3+dRQBgy5syOXJY3TeCxsUUf5fMjA/NKuCcuMDqHoPw8UVJunItkIj+
	qsJ955V02XV4HkE4v2/lXm4P7FiPgEuTfhJimko2gxny8JPWztX/x89zTM2O+NlO
	qJ6cV4wyfjsyw7UM+cp+wNjkC6lDMb7VkV7Y+Xeel/DbfRReeZ+UBJFQAobtz+X/
	zzxemerOLEmfcIhmXiBhs++tceMJva/JCKV0W/rGQPEa2NMN0z76inv4x5vh8J7I
	hEob/4rcIB7SWjPsJdFWJ5FHfWh7E9zn82qiAGO4pnq9b8ahYJ4B9qErZQg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw0395u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63FB03vb029580;
	Wed, 15 Apr 2026 11:00:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dg5d11e7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:03 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63FB03Fa029549;
	Wed, 15 Apr 2026 11:00:03 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63FB03G9029527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:03 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D995F21AC3; Wed, 15 Apr 2026 16:30:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 3/3] lib: sbi_timer: Add support for timer events
Date: Wed, 15 Apr 2026 16:30:02 +0530
Message-ID: <20260415110002.2610929-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: j6z9_XtRwGiT7EBefjBpVHAtfx6CeR41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwMSBTYWx0ZWRfX+JF6NfR06NxA
 fQ+URMojvpzj4942V6gCFkeySm5dGNgljKjdOFKVFJAmq8BvdsT4MlfznDp1e0LhW877wr9Ag0y
 vlXa/k3tu840B+wJlAl/4l5ZNeNqXl1XQRv5ssArrDm1cdJp8jO+GWuikTJ2lj8QCPDl7mt0y7S
 G5CjPY8UvoaCKzrSH6nvVONfion1CVJ6Y+nAroLz61bRzaRzWAs1lnu1FOKFXgOpWvOUgxiekvo
 FxJ6VV9DkmOQtAaf1Jn8kUtJeFrbuUnaTF9VaqFgEEt0EgZylbiOus39yf5iFcoxqz0qYJryt57
 HKuH2xHWU2PYjKdM+POf4u6wkQcZCldLf/Iqc6PCB0/6GQ1agea4KckGdK0yOZGPQhNGrwrBZV5
 Z54G75sry5ifkgo+85PCntt051do4rFgqC36YmBaKJrcHTmVZrQlYVZVakIqv6KKOuWQdHITSya
 UdygeDRx6tGs3iE6AZw==
X-Proofpoint-ORIG-GUID: j6z9_XtRwGiT7EBefjBpVHAtfx6CeR41
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df6fb7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=SJzZRhbQ-NMWuBS7QtEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_040014_170026_017865A9 
X-CRM114-Status: GOOD (  25.21  )
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
 include/sbi/sbi_timer.h    |  43 ++++++++-
 lib/sbi/sbi_ecall_legacy.c |   4 +-
 lib/sbi/sbi_ecall_time.c   |   4 +-
 lib/sbi/sbi_timer.c        | 177 +++++++++++++++++++++++++++++++++----
 4 files changed, 205 insertions(+), 23 deletions(-)

diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
index 2e1a7879..f23d72db 100644
--- a/include/sbi/sbi_timer.h
+++ b/include/sbi/sbi_timer.h
@@ -10,7 +10,38 @@
 #ifndef __SBI_TIMER_H__
 #define __SBI_TIMER_H__
 
-#include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
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
+	/** Event callback to be called upon expiry */
+	void (*callback)(struct sbi_timer_event *ev);
+
+	/** Event cleanup to be called upon sbi_hart_exit() */
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
@@ -86,8 +117,14 @@ void sbi_timer_set_delta(ulong delta);
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
index 9806c033..539157fa 100644
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
@@ -136,8 +141,119 @@ void sbi_timer_set_delta_upper(ulong delta_upper)
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
+void sbi_timer_event_start(struct sbi_timer_event *ev, u64 next_event)
+{
+	struct sbi_timer_event *tev, *next_ev = NULL;
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
+
+	__sbi_timer_update_device(tstate);
+
+	spin_unlock(&tstate->event_list_lock);
+}
+
+void sbi_timer_event_stop(struct sbi_timer_event *ev)
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
+	/* Re-program timer device on the current HART */
+	tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
+	spin_lock(&tstate->event_list_lock);
+	__sbi_timer_update_device(tstate);
+	spin_unlock(&tstate->event_list_lock);
+}
+
+static void sbi_timer_smode_event_callback(struct sbi_timer_event *ev)
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
@@ -146,23 +262,34 @@ void sbi_timer_event_start(u64 next_event)
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
+	struct sbi_timer_event *ev;
+
+	spin_lock(&tstate->event_list_lock);
+
+	while (!sbi_list_empty(&tstate->event_list)) {
+		ev = sbi_list_first_entry(&tstate->event_list, struct sbi_timer_event, head);
+		if (ev->time_stamp <= sbi_timer_value()) {
+			__sbi_timer_event_stop(ev);
+			if (ev->callback) {
+				spin_unlock(&tstate->event_list_lock);
+				ev->callback(ev);
+				spin_lock(&tstate->event_list_lock);
+			}
+		}
+	}
+
+	__sbi_timer_update_device(tstate);
+
+	spin_unlock(&tstate->event_list_lock);
 }
 
 const struct sbi_timer_device *sbi_timer_get_device(void)
@@ -204,6 +331,11 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 
 	tstate = sbi_scratch_offset_ptr(scratch, timer_state_off);
 	tstate->time_delta = 0;
+	SPIN_LOCK_INIT(tstate->event_list_lock);
+	SBI_INIT_LIST_HEAD(&tstate->event_list);
+	SBI_INIT_TIMER_EVENT(&tstate->smode_ev,
+			     sbi_timer_smode_event_callback,
+			     sbi_timer_smode_event_cleanup, NULL);
 
 	if (timer_dev && timer_dev->warm_init) {
 		ret = timer_dev->warm_init();
@@ -216,9 +348,22 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 
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
+		if (ev->cleanup) {
+			spin_unlock(&tstate->event_list_lock);
+			ev->cleanup(ev);
+			spin_lock(&tstate->event_list_lock);
+		}
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
