Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8E7C369B7
	for <opensbi@archiver.kernel.org>; Sun, 13 Apr 2025 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1sMZIh98gWmKmh0fZYYb8vSxKHmlwAeGu3dDDpTSsU=; b=BeQlfrq+U4QAiu
	P5h8gG1zK1eqaC0nJXHfI1wxFjXGJ2IDHcWnCONVVcw+zLexmPkWERpJ8coTBKFVjsBtNhWYKWnVp
	bA+ydir9zS6+TgoHl5PXCzoFwfU6K1c4p3GNFOWiaZ5iDOi3Yum3yUGs7kLH4HWe75iBfucl9o0Fs
	j+HOKQflprgGdNkYNNIfthgu1+97+poqK6jOhVGHgpdsqdxAmu5DdTbsNbck0ygvg2CEbddpwC2AB
	qL7PGrVhcfcD+1hqrQyPE4l/NTAFnpXttb6putdV3HL/L80i+lGfr6c7MAOovXypRjzABnvZfLGRo
	FHg7ovB4BzFfiYyHqiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yv2-0000000HIht-3GQ9;
	Sun, 13 Apr 2025 15:06:48 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yuz-0000000HIfu-1Dqt
	for opensbi@lists.infradead.org;
	Sun, 13 Apr 2025 15:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=brjD7
	S6npqFANlUKUVKyirYvH4FbWIIXF+SmI/nhZbU=; b=n8mfGXUJLD5raq21KJQA0
	NYwimN2oAeW0jd2G0Pzu0NIXX2qQwP5FCzrFvw+YWE9yR9xnGb7kgoD2/wSZvwES
	D0rPv4QIdEuvPw9OtLCHEDuFfiuAewE0OPelcWLHYb/3c/YjEjtGAa7yaTnElEjQ
	I53eYcAnYUd3Orbd0CK530=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P+H30vtnZUv4Aw--.52201S7;
	Sun, 13 Apr 2025 23:06:35 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 5/5] lib: sbi: add Xtheadsstc support
Date: Sun, 13 Apr 2025 23:06:20 +0800
Message-ID: <20250413150628.75614-6-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250413150628.75614-1-wxjstz@126.com>
References: <20250413150628.75614-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3P+H30vtnZUv4Aw--.52201S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3WrWxtryDXFy5Kr18tw1xAFb_yoWxAr48pa
	9F9F13Kr4vvFW0qas7AayDuryfJw4kJw1DJ3s7C3W0yF429ryrGF17GFyjyFW7GFWvgFWS
	yayrtr13CayUXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piFApOUUUUU=
X-Originating-IP: [112.83.182.169]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1x8uOmf7x0DuEwABs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_080645_729956_3CFCE88E 
X-CRM114-Status: GOOD (  17.49  )
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

There is an implementation similar to sstc on thead. The difference
between it and sstc is that stimecmp is a memory-mapped register on
thead.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_hart.h          |  2 ++
 lib/sbi/sbi_hart.c              |  1 +
 lib/sbi/sbi_timer.c             | 18 ++++++++++-
 lib/utils/timer/aclint_mtimer.c | 55 ++++++++++++++++++---------------
 4 files changed, 50 insertions(+), 26 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 4c36c778..ba6debb8 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -37,6 +37,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCOFPMF,
 	/** HART has Sstc extension */
 	SBI_HART_EXT_SSTC,
+	/** HART has Xtheadsstc extension */
+	SBI_HART_EXT_XTHEADSSTC,
 	/** HART has Zicntr extension (i.e. HW cycle, time & instret CSRs) */
 	SBI_HART_EXT_ZICNTR,
 	/** HART has Zihpm extension */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 8e2979b5..32726916 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -669,6 +669,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smstateen, SBI_HART_EXT_SMSTATEEN),
 	__SBI_HART_EXT_DATA(sscofpmf, SBI_HART_EXT_SSCOFPMF),
 	__SBI_HART_EXT_DATA(sstc, SBI_HART_EXT_SSTC),
+	__SBI_HART_EXT_DATA(xtheadsstc, SBI_HART_EXT_XTHEADSSTC),
 	__SBI_HART_EXT_DATA(zicntr, SBI_HART_EXT_ZICNTR),
 	__SBI_HART_EXT_DATA(zihpm, SBI_HART_EXT_ZIHPM),
 	__SBI_HART_EXT_DATA(zkr, SBI_HART_EXT_ZKR),
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 5351e9e7..e299721d 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -146,13 +146,28 @@ void sbi_timer_set_delta_upper(ulong delta_upper)
 
 void sbi_timer_event_start(u64 next_event)
 {
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SET_TIMER);
 
+	/**
+	 * xtheadsstc is implemented earlier than sstc. Accessing stimecmp on
+	 * thead does not trigger an exception, so opensbi will succeed in
+	 * detecting sstc on thead, but the stimecmp csr is not positive and
+	 * valid. Therefore, this code needs to be reversed before checking the
+	 * sstc extension. */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_XTHEADSSTC)) {
+		if (timer_dev && timer_dev->timer_event_start) {
+			timer_dev->timer_event_start(next_event);
+			return;
+		}
+		goto notfound_device;
+	}
+
 	/**
 	 * Update the stimecmp directly if available. This allows
 	 * the older software to leverage sstc extension on newer hardware.
 	 */
-	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC)) {
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSTC)) {
 #if __riscv_xlen == 32
 		csr_write(CSR_STIMECMP, next_event & 0xFFFFFFFF);
 		csr_write(CSR_STIMECMPH, next_event >> 32);
@@ -169,6 +184,7 @@ void sbi_timer_event_start(u64 next_event)
 		return;
 	}
 
+notfound_device:
 	sbi_printf("%s: called without timer device\n", __func__);
 }
 
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 3db3c3be..573b9313 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_timer.h>
 #include <sbi_utils/timer/aclint_mtimer.h>
@@ -56,7 +57,7 @@ static void mtimer_time_wr32(bool timecmp, u64 value, volatile u64 *addr)
 	writel_relaxed((u32)value, (void *)(addr));
 }
 
-static u64 mtimer_value(void)
+static u64 timer_value(void)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct aclint_mtimer_data *mt;
@@ -69,7 +70,7 @@ static u64 mtimer_value(void)
 	return mt->time_rd((void *)mt->mtime_addr);
 }
 
-static void mtimer_event_stop(void)
+static void timercmp_write(bool has_xtheadsstc, u64 val)
 {
 	u32 target_hart = current_hartid();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
@@ -80,33 +81,37 @@ static void mtimer_event_stop(void)
 	if (!mt)
 		return;
 
-	/* Clear MTIMER Time Compare */
-	time_cmp = (void *)mt->mtimecmp_addr;
-	mt->time_wr(true, -1ULL, &time_cmp[target_hart - mt->first_hartid]);
+	/*
+	 * On xtheadsstc, stimecmp is a memory mapped register like mtimecmp,
+	 * and the address of stimecmp is offset from the address of mtimecmp
+	 * by 0x9000.
+	 */
+	if (has_xtheadsstc)
+		time_cmp = (void *)(mt->mtimecmp_addr + 0x9000);
+	else
+		time_cmp = (void *)mt->mtimecmp_addr;
+
+	mt->time_wr(true, val, &time_cmp[target_hart - mt->first_hartid]);
 }
 
-static void mtimer_event_start(u64 next_event)
+static void timer_event_start(u64 next_event)
 {
-	u32 target_hart = current_hartid();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-	struct aclint_mtimer_data *mt;
-	u64 *time_cmp;
-
-	mt = mtimer_get_hart_data_ptr(scratch);
-	if (!mt)
-		return;
+	bool has_xtheadsstc =
+		sbi_hart_has_extension(scratch, SBI_HART_EXT_XTHEADSSTC);
+	timercmp_write(has_xtheadsstc, next_event);
+}
 
-	/* Program MTIMER Time Compare */
-	time_cmp = (void *)mt->mtimecmp_addr;
-	mt->time_wr(true, next_event,
-		    &time_cmp[target_hart - mt->first_hartid]);
+static void timer_event_stop(void)
+{
+	timer_event_start(__UINT64_MAX__);
 }
 
-static struct sbi_timer_device mtimer = {
+static struct sbi_timer_device timer_dev = {
 	.name = "aclint-mtimer",
-	.timer_value = mtimer_value,
-	.timer_event_start = mtimer_event_start,
-	.timer_event_stop = mtimer_event_stop
+	.timer_value = timer_value,
+	.timer_event_start = timer_event_start,
+	.timer_event_stop = timer_event_stop
 };
 
 void aclint_mtimer_sync(struct aclint_mtimer_data *mt)
@@ -219,7 +224,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 
 	if (!mt->mtime_size) {
 		/* Disable reading mtime when mtime is not available */
-		mtimer.timer_value = NULL;
+		timer_dev.timer_value = NULL;
 	}
 
 	/* Add MTIMER regions to the root domain */
@@ -259,9 +264,9 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 			return rc;
 	}
 
-	mtimer.timer_freq = mt->mtime_freq;
-	mtimer.warm_init = aclint_mtimer_warm_init;
-	sbi_timer_set_device(&mtimer);
+	timer_dev.timer_freq = mt->mtime_freq;
+	timer_dev.warm_init = aclint_mtimer_warm_init;
+	sbi_timer_set_device(&timer_dev);
 
 	return 0;
 }
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
