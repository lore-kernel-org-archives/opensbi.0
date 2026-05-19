Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33560CD4F5B
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 20:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NpO+6ANBKMdm33DAnMDCeRryJnwOw9Sa8yeXa10mEG8=; b=RtXG9xCSGf1LgE
	/z/Q5cqmNlhH+Bi3JK3hQ+NH28ZwGPWISt+cde2D3zRia+ckCHuPMDrAu2i2zAEm9wnyuMJ/31N+7
	NJRdlwjrxil3PANxuCwST1M5HCQxayzGBV/ehuFx2h7CpfouXzTP99ggm+0eJu7wSlns2o3ICWcWz
	eTM4G7FDPtjOq7sPIyuH0MU83yj63e1lEMNeLwy6BLxMMm8dzIVpye3S1jmX9vmqxCpjfhqci2BQh
	r53QMfEd46AsIN6+PReMitSH+b2eZ4oNBNx/TiAdtyoqj2oAR7RHo2D84j341NMrVxPVqBM6moLQE
	Ziqk0XQ65qwEJXWDyM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8h-00000002j8O-3r5B;
	Tue, 19 May 2026 20:34:07 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8d-00000002j4l-2Mlu
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 20:34:04 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50d87610513so49525951cf.3
        for <opensbi@lists.infradead.org>; Tue, 19 May 2026 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779222842; x=1779827642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cDLUtXNbpGFl4V0gIYixLKHny/NXotLtX2tgYtXlxQ=;
        b=C8nlqHCW1M7D5uKvZWeUAQOkl5MiVE6QMTrYEkrM4bfoglrqtyxNCANBWT03aVK1IA
         P+g+vLbj19LPEZEati469DhFPXcAjzrUXfYPam4sY1Naf8P7W8FCZ5nHzdCIv/ypTZ1W
         NiRBp0z74BroS8SSgNh5MbPBtEwh/qlcE8ZQMHUXBBxHK9+jEVDE/Wd5xZP2xDK4yVQO
         zg0baFm/PKATejnU21zw9w0IXSHPSBFQRo78jE2pkr4h1vQhYsurD31oyRWHcy/dn/8Z
         BHLBFEZ2+x6PsfMFha/SqRMnZtZ1UdirE7ZMY6+kQ0pecpeGTnLlB0eVsR1hmAthPmc0
         bWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222842; x=1779827642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7cDLUtXNbpGFl4V0gIYixLKHny/NXotLtX2tgYtXlxQ=;
        b=hNQscKq3i0qHsehu2Ranm4w8tx7OwXFPZqaOmtDqIaSVaBmyQCiFXogxPHUyVmsR9+
         FY3PB/FQaAHLq9B/B7oiFlRyW/O5ZOhEvjRb7HpA1gaghRWMd+xOisMxsmtxHGxOU86r
         05wIeJLEqVy1p8AXYgTZPkE0RrNasMvWMVCn6IL4F5EATwVoXi6G/Xox70Q4z2Tzdjrp
         VHRpVTEKl1oBuVvV2+L67EYhSuU5xTQmQLNc5Oj1CyR9LoNJEqJsyqvUh06oSOxeyzJd
         tvWNU/s51fZrFMsz1kxUzccD955uS1CcSiTHw2Z0T5gsvZWKRUrTwG4QXPvA9kSt3191
         AoRg==
X-Gm-Message-State: AOJu0YxPO3gDAvCm0+n7R4ryluIObzhKVtpihOmL/pVZr5qsct2AT6YM
	r9ZK85jNwYiYXrFWa0cGcS+QxaD00VzX3GDQSoU+e5Ht90v82pCJPPJP40e43w==
X-Gm-Gg: Acq92OGG+uJSw1WRrMxrt+ue6KmHVDfa2VgORnU4DzOjT0CoyvbyMlCDiEZdjZ4MZk/
	njlnw6VqMryrlyi4p3W7ddf3KiUsAeoWBJ6GP4uLyz9kM0PRhHC1E6ygHGNQYahpBrzpXR1oZko
	SWIh1YUOkrynKQQqIUJ1tMpjUn3rE/Rv6YLumQ2kGnaS5PZ6wRVDqXaAyAdcy+ZyZ83crmX9J58
	Wcrta3tf6mQa/A4/FfPAmFrclAdQL+TwCXN+srvh+Vs8Skg13oDQDMqpSW0FI7mYVMVybKOZ6jA
	k+aNB3CBW8j3roZzELHyClDbDFP4uVfTRg2qwnGpWviDWwZurrMgBBjSDYM7Sbgvke1d3ycrxq5
	pv7VX+X8m+ktNdrQ5vMKJ8oGW8p6dRm4wMrXM5u1pOU5dGRpFBJbAh3XQEWt7e3ttiqatw4AeFH
	HfJfdXPa1IFtayKqaCVm1OUIuvNrdkOPv3UN/lSQ4NYy62hhm8XYTf7BkUnymuP1bHoDopdeHQP
	ZPr4EA8QJo=
X-Received: by 2002:a05:622a:4112:b0:50d:8049:2f22 with SMTP id d75a77b69052e-5165a0072ddmr279053551cf.3.1779222842555;
        Tue, 19 May 2026 13:34:02 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581aed3sm173787461cf.23.2026.05.19.13.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:34:02 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 7/7] platform: virt: add WorldGuard HWISO failure-mode SBIUNIT test
Date: Tue, 19 May 2026 16:33:31 -0400
Message-Id: <20260519203331.2773185-8-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519203331.2773185-1-raymondmaoca@gmail.com>
References: <20260519203331.2773185-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133403_630757_0D653D90 
X-CRM114-Status: GOOD (  13.87  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Extend the generic HWISO SBIUNIT test hook interface with a
failure-test callback and invoke it from a new hwiso_failure_mode_test
case.

Implement the QEMU virt WorldGuard failure-mode test by switching into
domain@0's WorldGuard state, issuing an intentional denied store to a
protected DRAM address, and verifying that the access raises the
expected store access fault with the faulting address recorded in
tval.
Also print the captured trap cause and trap value so the negative-path
result is visible in the runtime log.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_hwiso_test.h                  |  2 ++
 lib/sbi/sbi_hwiso_test.c                      |  6 ++++
 lib/sbi/sbi_hwiso_testlib.c                   | 11 ++++++
 .../generic/virt/qemu_virt_wgchecker_test.c   | 35 +++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/include/sbi/sbi_hwiso_test.h b/include/sbi/sbi_hwiso_test.h
index 3970df5a..354e8d17 100644
--- a/include/sbi/sbi_hwiso_test.h
+++ b/include/sbi/sbi_hwiso_test.h
@@ -15,6 +15,7 @@
 #ifdef CONFIG_SBIUNIT
 struct sbi_hwiso_test_ops {
 	void (*boot_test)(struct sbiunit_test_case *test);
+	void (*failure_test)(struct sbiunit_test_case *test);
 	void (*domain_state_test)(struct sbiunit_test_case *test,
 				 const struct sbi_domain *dom, void *ctx);
 	void (*domain_quiesce_test)(struct sbiunit_test_case *test,
@@ -24,6 +25,7 @@ struct sbi_hwiso_test_ops {
 int sbi_hwiso_test_register(const struct sbi_hwiso_ops *ops,
 			    const struct sbi_hwiso_test_ops *test_ops);
 void sbi_hwiso_test_boot(struct sbiunit_test_case *test);
+void sbi_hwiso_test_failure(struct sbiunit_test_case *test);
 void sbi_hwiso_test_domain_state(struct sbiunit_test_case *test,
 				 const struct sbi_domain *dom);
 void sbi_hwiso_test_domain_quiesced(struct sbiunit_test_case *test,
diff --git a/lib/sbi/sbi_hwiso_test.c b/lib/sbi/sbi_hwiso_test.c
index 716596e2..6b8384d4 100644
--- a/lib/sbi/sbi_hwiso_test.c
+++ b/lib/sbi/sbi_hwiso_test.c
@@ -96,6 +96,11 @@ static void hwiso_boot_test(struct sbiunit_test_case *test)
 	sbi_hwiso_test_boot(test);
 }
 
+static void hwiso_failure_mode_test(struct sbiunit_test_case *test)
+{
+	sbi_hwiso_test_failure(test);
+}
+
 static void hwiso_domain_switch_test(struct sbiunit_test_case *test)
 {
 	struct sbi_domain *cur_dom = sbi_domain_thishart_ptr();
@@ -160,6 +165,7 @@ out:
 
 static struct sbiunit_test_case hwiso_test_cases[] = {
 	SBIUNIT_TEST_CASE(hwiso_boot_test),
+	SBIUNIT_TEST_CASE(hwiso_failure_mode_test),
 	SBIUNIT_TEST_CASE(hwiso_domain_switch_test),
 	SBIUNIT_END_CASE,
 };
diff --git a/lib/sbi/sbi_hwiso_testlib.c b/lib/sbi/sbi_hwiso_testlib.c
index 2a988088..2dfb8646 100644
--- a/lib/sbi/sbi_hwiso_testlib.c
+++ b/lib/sbi/sbi_hwiso_testlib.c
@@ -64,6 +64,17 @@ void sbi_hwiso_test_boot(struct sbiunit_test_case *test)
 	}
 }
 
+void sbi_hwiso_test_failure(struct sbiunit_test_case *test)
+{
+	struct sbi_hwiso_test_node *entry;
+
+	sbi_list_for_each_entry(entry, &hwiso_test_ops_list, node) {
+		if (!entry->test_ops->failure_test)
+			continue;
+		entry->test_ops->failure_test(test);
+	}
+}
+
 void sbi_hwiso_test_domain_state(struct sbiunit_test_case *test,
 				 const struct sbi_domain *dom)
 {
diff --git a/platform/generic/virt/qemu_virt_wgchecker_test.c b/platform/generic/virt/qemu_virt_wgchecker_test.c
index 0eeaa3a0..eaaa39f7 100644
--- a/platform/generic/virt/qemu_virt_wgchecker_test.c
+++ b/platform/generic/virt/qemu_virt_wgchecker_test.c
@@ -7,14 +7,17 @@
 #include <libfdt.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hwiso.h>
 #include <sbi/sbi_hwiso_test.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_trap.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_unpriv.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <wgchecker2.h>
 #include <worldguard.h>
@@ -40,6 +43,8 @@ struct qemu_virt_wg_expect {
 	u32 slwid;
 };
 
+#define QEMU_VIRT_WG_DENIED_STORE_ADDR		0xc0001000UL
+
 static u64 qemu_virt_wg_mmio_read64(unsigned long addr)
 {
 #if __riscv_xlen != 32
@@ -314,8 +319,38 @@ static void qemu_virt_wg_boot_test(struct sbiunit_test_case *test)
 			  0);
 }
 
+static void qemu_virt_wg_failure_test(struct sbiunit_test_case *test)
+{
+	struct sbi_domain *cur_dom = sbi_domain_thishart_ptr();
+	struct sbi_domain *dom0 = qemu_virt_wg_find_domain("domain@0");
+	struct sbi_trap_info trap = { 0 };
+
+	SBIUNIT_ASSERT_NE(test, cur_dom, NULL);
+	SBIUNIT_ASSERT_NE(test, dom0, NULL);
+
+	if (cur_dom != dom0) {
+		sbi_hwiso_domain_exit(cur_dom, dom0);
+		sbi_hwiso_domain_enter(dom0, cur_dom);
+	}
+
+	sbi_store_u32((u32 *)QEMU_VIRT_WG_DENIED_STORE_ADDR, 0x5a5aa5a5U,
+		      &trap);
+
+	if (cur_dom != dom0) {
+		sbi_hwiso_domain_exit(dom0, cur_dom);
+		sbi_hwiso_domain_enter(cur_dom, dom0);
+	}
+
+	sbi_printf("[WG TEST] failure trap cause=0x%lx tval=0x%lx\n",
+		   trap.cause, trap.tval);
+
+	SBIUNIT_ASSERT_EQ(test, trap.cause, CAUSE_STORE_ACCESS);
+	SBIUNIT_ASSERT_EQ(test, trap.tval, QEMU_VIRT_WG_DENIED_STORE_ADDR);
+}
+
 const struct sbi_hwiso_test_ops qemu_virt_worldguard_test_ops = {
 	.boot_test = qemu_virt_wg_boot_test,
+	.failure_test = qemu_virt_wg_failure_test,
 	.domain_state_test = qemu_virt_wg_assert_state,
 	.domain_quiesce_test = qemu_virt_wg_assert_quiesced,
 };
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
