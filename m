Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126D3C54F4C
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfQsowv+iCIb7Wmk+CwGuFzXVSKRwaZC9bxcDPi208c=; b=tN+QoYdkc9L0hT
	auri/4lP9HRpFwd+50+JNXmHybdet8/FdtAN/c2vtYwkem3o9sCSKvUei9jUlFt/Mxm8yR5TMst/m
	souaGDgpfnjZnpF0UwQj6SMbECiyNKNMmjWVmtI3vxNj8Jl3LY4+E44zbItsq84ZNv5CIk2gMBmQp
	7Rri1kNKDlWHxlaMkZ/g+ICp84FZn+FqOc0cCQqe7+IX1oPM1w/YoDzgBEJftq9oaHtJXCj3x+NwL
	ecFfSY/kkmBNsUy8uVCHYWXNaZasMCjvTjj9cq1qv9ytD/Y//5J+ppOKwz7YHwDSXYYDIktbX94yr
	WcugeIp1/Kqu+61H49dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocuI-00000004gZK-2NzH;
	Tue, 28 Jul 2026 08:11:22 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocuF-00000004gVY-1VAT
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 08:11:21 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 66S8B6I6069311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 16:11:06 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jul
 2026 16:11:06 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 6/7] lib: utils/suspend: wait for the secondary Andes harts to sleep
Date: Tue, 28 Jul 2026 16:10:40 +0800
Message-ID: <20260728081041.2724668-7-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728081041.2724668-1-ben717@andestech.com>
References: <20260728081041.2724668-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 66S8B6I6069311
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_011119_735406_298A0759 
X-CRM114-Status: GOOD (  14.61  )
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

A secondary hart may not have reached the target sleep state by the time
the primary checks, so the one-shot check could fail spuriously. Poll
each PCS status instead and give up after HART_SLEEP_TIMEOUT_MS.

Rework atcsmu_pcs_is_sleep() into the atcsmu_hart_is_sleep() predicate so
sbi_timer_waitms_until() can drive it.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h |  7 ++++-
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c         | 22 ++++++----------
 lib/utils/suspend/fdt_suspend_andes_atcsmu.c | 27 +++++++++++++++-----
 3 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
index 20e6cea09379..bb9a2bc2e259 100644
--- a/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
+++ b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
@@ -9,6 +9,11 @@
 
 #include <sbi/sbi_types.h>
 
+struct atcsmu_sleep_arg {
+	u32 hartid;
+	bool deep_sleep;
+};
+
 /* clang-format off */
 
 #define SCRATCH_PAD_OFFSET		0x40
@@ -61,6 +66,6 @@ int atcsmu_set_reset_vector(u64 wakeup_addr, u32 hartid);
 u32 atcsmu_get_sleep_type(u32 hartid);
 void atcsmu_write_scratch(u32 value);
 u32 atcsmu_read_scratch(void);
-bool atcsmu_pcs_is_sleep(u32 hartid, bool deep_sleep);
+bool atcsmu_hart_is_sleep(void *opaque);
 
 #endif
diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
index dfbb425cd2ad..d57db8f881a6 100644
--- a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -94,23 +94,17 @@ u32 atcsmu_read_scratch(void)
 	return readl_relaxed((char *)atcsmu_base + SCRATCH_PAD_OFFSET);
 }
 
-bool atcsmu_pcs_is_sleep(u32 hartid, bool deep_sleep)
+bool atcsmu_hart_is_sleep(void *opaque)
 {
-	u32 pcs_status = readl_relaxed((char *)atcsmu_base + PCSm_STATUS_OFFSET(hartid));
-	u32 pd_status = deep_sleep ? PD_STATUS_DEEP_SLEEP : PD_STATUS_LIGHT_SLEEP;
+	struct atcsmu_sleep_arg *arg = opaque;
 
-	if (EXTRACT_FIELD(pcs_status, PD_TYPE_MASK) != PD_TYPE_SLEEP) {
-		sbi_printf("ATCSMU: hart%d (PCS%d): failed to sleep\n", hartid, hartid + 3);
-		return false;
-	}
-
-	if (EXTRACT_FIELD(pcs_status, PD_STATUS_MASK) != pd_status) {
-		sbi_printf("ATCSMU: hart%d (PCS%d): failed to enter %s sleep\n",
-			   hartid, hartid + 3, deep_sleep ? "deep" : "light");
-		return false;
-	}
+	u32 pcs_status = readl_relaxed((char *)atcsmu_base +
+				       PCSm_STATUS_OFFSET(arg->hartid));
+	u32 pd_status = arg->deep_sleep ? PD_STATUS_DEEP_SLEEP :
+					  PD_STATUS_LIGHT_SLEEP;
 
-	return true;
+	return EXTRACT_FIELD(pcs_status, PD_TYPE_MASK) == PD_TYPE_SLEEP &&
+	       EXTRACT_FIELD(pcs_status, PD_STATUS_MASK) == pd_status;
 }
 
 static int ae350_hart_start(u32 hartid, ulong saddr)
diff --git a/lib/utils/suspend/fdt_suspend_andes_atcsmu.c b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
index ced0eb41d5b7..8d15346afcfe 100644
--- a/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
+++ b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
@@ -12,22 +12,37 @@
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_system.h>
+#include <sbi/sbi_timer.h>
 #include <sbi_utils/cache/fdt_cmo_helper.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/hsm/fdt_hsm_andes_atcsmu.h>
 
-static int check_secondary_harts_sleep(u32 hartid, bool deep_sleep)
+#define HART_SLEEP_TIMEOUT_MS 1000
+
+static int wait_secondary_harts_sleep(u32 hartid, bool deep_sleep)
 {
 	const struct sbi_domain *dom = &root;
 	unsigned long i;
 	u32 target;
+	struct atcsmu_sleep_arg arg;
+
+	arg.deep_sleep = deep_sleep;
 
-	/* Ensure the secondary harts entering the corresponding sleep state */
+	/* Wait for the secondary harts entering the corresponding sleep state */
 	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
 		target = sbi_hartindex_to_hartid(i);
-		if (target != hartid && !atcsmu_pcs_is_sleep(target, deep_sleep))
-			return SBI_EFAIL;
+		if (target == hartid)
+			continue;
+
+		arg.hartid = target;
+		if (!sbi_timer_waitms_until(atcsmu_hart_is_sleep, &arg,
+					    HART_SLEEP_TIMEOUT_MS)) {
+			sbi_printf("ATCSMU: hart%u (PCS%u): timed out waiting for %s sleep\n",
+				   target, target + 3,
+				   deep_sleep ? "deep" : "light");
+			return SBI_ETIMEOUT;
+		}
 	}
 
 	return SBI_OK;
@@ -51,7 +66,7 @@ static int ae350_system_suspend(u32 sleep_type, unsigned long addr)
 	atcsmu_set_wakeup_events(PCS_WAKEUP_RTC_ALARM_MASK | PCS_WAKEUP_UART2_MASK, hartid);
 
 	if (sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP) {
-		rc = check_secondary_harts_sleep(hartid, false);
+		rc = wait_secondary_harts_sleep(hartid, false);
 		if (rc)
 			return rc;
 
@@ -59,7 +74,7 @@ static int ae350_system_suspend(u32 sleep_type, unsigned long addr)
 		csr_set(CSR_MIE, MIP_SEIP);
 		atcsmu_set_command(LIGHT_SLEEP_CMD, hartid);
 	} else if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) {
-		rc = check_secondary_harts_sleep(hartid, true);
+		rc = wait_secondary_harts_sleep(hartid, true);
 		if (rc)
 			return rc;
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
