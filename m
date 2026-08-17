Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FDFC5DF66
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 18:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5EiSZ4UJIfuq4z5XRv1PsjMUAfBEjUc8QK1RGXy/QNI=; b=XVO9P7aICUxzfx
	VHNwawPHmzGvEiR2+bg/fgy9Vi78utABRfu1yxqPHNFhL2MVz1l2F7cnWcQ6soYSZMDlxYeD1lxRl
	fabtAypNeJoQxfTJJTDmk2LAAxrIaagh3xfgar0QGlDbonb71o7+YjGWQzUUH/wyAQKzmSFjffE4Y
	lyNf+hiBC77ptjg8glQ4NVLYz7S0Q8kWKYglBf1GHLpltVJG8yNFjIj79ASNHNZt3CaEKSOPu3myR
	xyEk0Tv7P6Bmb/F3fmjjPmcrvECmAiI9ea48J50gUa00TDTUIIKHxMoMH6/aL6cUtbNd3F4jg+kyS
	JZIPHPb/TFS55cszYJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1om-00000006e4O-2FtC;
	Mon, 17 Aug 2026 18:12:16 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1oj-00000006e3l-1KD6
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 18:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786990326; bh=kjalKXTVMlHIvEUaS/A1psxPy7IBoEZRtfRiDOY7aOU=;
	h=From:To:Subject:Date;
	b=qAJ6Gopb6ZWtvI0Fx0GqwrssjKYFYVa5HZD2bdGst4AGcJm0BXH6NcDVViUf0yrg+
	 2/tDfmy/qJr0k/jdczi/x1DuSYyv1cxsQcmEMteUH155Da0l4K69CtgOYMjkqalopZ
	 ZnGM0BLyoon8kjB8orM+xwkDO8dOetiF6O422yR4=
Received: from zs-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.. ([124.79.168.208])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 304BFCBC; Tue, 18 Aug 2026 02:12:04 +0800
X-QQ-mid: xmsmtpt1786990324tr4ggny2r
Message-ID: <tencent_6E5FB89B1D999EB4155A8031201DE0BE0C06@qq.com>
X-QQ-XMAILINFO: OfxHHOU34G6p5olU0nK24f5udNzxpG65a/rNSzu+Qp65GDjCeQ60tqxj54yLua
	 goNzq7FR6dNwztsfMZn55NZYJYcvaXcsK73HQdWUSBcjaFW3n/gaDg+IZyWQp6caFwj/6JCe57Gg
	 fdbHNMH+Rzwi58hqxCq7RSqw6K0q1v6yzVqSRbv3viMWs3LyfWPr9/nSE0l5tx1angZqukTFTitd
	 MOfMzsTTTi01IEBkwjr13Hx+zB/hg1/s85w3XiPx4xH42MN4UQjc3o6TIox8Yk0BJachvfSwL+K4
	 Edv5O2crRYUNlA/d1+tlsLx/ySz+/cLLt8SZJiPaVCm9o1Rddnu10riRuumoMfO/vw2T1cPEuTui
	 YEuPS3Sa81RSRqVbx2//CLUHBadNB7nqFtdQpvq3ebcvQn0POfJIWXnhACsytwvUFRnIHIel6lts
	 BKMgEosUv836uh3IhMHqTDoDqk7PA2pWjnOpWyOUCIGYRxi/mDNXiwf4ajhsxeQZAPG4MoGlJQR1
	 4UcXWct9gZKbxeTOAY/vXexCdXV/4nJ/1XNsZ/NOxG2gg/iLg0vMwK5+lrFkZTlH2uKirQHm+TdQ
	 udsCUeIvuc+tK5om0A8r6GQgQyPsvtRNZEpAswDPW/qIxUBERffwAnfyphiFXPAacJiAwdAa6Soi
	 pKGOTnqbm491DoHy4eZRP52IZ/WkhbB99hXE/0mrW4eyyZAqS95OsjfPtsjNqMufUvP0frqlxBbN
	 AsX/3PffaB9VR7S9ICvt9dIcXtx2E7Z2wAKMtVGqhK9tod18bW+lPVO3slPuRXWqyTbcr5rUahlb
	 WQsQmUyfW2P/kgukK0iPIx8fXfKfnioEqHMlPkItSlSxVAPnwOwQkUxls7r1HmeufnSvH9DpsGEq
	 jL8lht+OuTHce7qmul9s9YMCf0hkgX25kepkX2JrzAIcyMY70UxJJpL7tN32shlE24ljzmmQQjtG
	 NZG3UOS8C2cfwr2JvtTE6sS0d6Gc7JlHRTi9Elks7sOcpau13ODhPghdlGV37pcVH1bGB+35XeID
	 yoW1o9vw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shibo Zhu <3499129952@qq.com>
To: opensbi@lists.infradead.org
Subject: [PATCH] lib: sbi_ecall_hsm: Reject oversized hart IDs
Date: Tue, 18 Aug 2026 02:12:02 +0800
X-OQ-MSGID: <20260817181202.235570-1-3499129952@qq.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_111213_928756_4D8A7E4B 
X-CRM114-Status: GOOD (  13.28  )
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

The HSM SBI interface passes hart IDs in XLEN-wide registers, while
OpenSBI's internal HSM APIs use u32 hart IDs. On RV64, values with upper
32 bits set are truncated before validation and can alias a valid hart.

Reject oversized target hart IDs at the ecall boundary for HART_START and
HART_GET_STATUS. Add SBIUnit coverage to ensure an oversized RV64 hart ID
does not alias the current hart. RV32 behavior is unchanged.

Fixes: e3f69fc1e934 ("lib: Implement Hart State Management (HSM) SBI extension")
Signed-off-by: Shibo Zhu <3499129952@qq.com>
---
 lib/sbi/sbi_ecall_hsm.c            |  9 +++++++++
 lib/sbi/tests/objects.mk           |  2 ++
 lib/sbi/tests/sbi_ecall_hsm_test.c | 32 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 lib/sbi/tests/sbi_ecall_hsm_test.c

diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index a6e83b05..b4f2b1bd 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -25,6 +25,11 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 	ulong smode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >>
 			MSTATUS_MPP_SHIFT;
 
+	if ((funcid == SBI_EXT_HSM_HART_START ||
+	     funcid == SBI_EXT_HSM_HART_GET_STATUS) &&
+	    (((u32)-1U) < ((u64)regs->a0)))
+		return SBI_EINVAL;
+
 	switch (funcid) {
 	case SBI_EXT_HSM_HART_START:
 		ret = sbi_hsm_hart_start(scratch, sbi_domain_thishart_ptr(),
@@ -67,3 +72,7 @@ struct sbi_ecall_extension ecall_hsm = {
 	.register_extensions	= sbi_ecall_hsm_register_extensions,
 	.handle			= sbi_ecall_hsm_handler,
 };
+
+#ifdef CONFIG_SBIUNIT
+#include "tests/sbi_ecall_hsm_test.c"
+#endif
diff --git a/lib/sbi/tests/objects.mk b/lib/sbi/tests/objects.mk
index 40c441e1..67316efb 100644
--- a/lib/sbi/tests/objects.mk
+++ b/lib/sbi/tests/objects.mk
@@ -16,6 +16,8 @@ libsbi-objs-$(CONFIG_SBIUNIT) += tests/riscv_locks_test.o
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += math_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_math_test.o
 
+carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += hsm_test_suite
+
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += ecall_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_ecall_test.o
 
diff --git a/lib/sbi/tests/sbi_ecall_hsm_test.c b/lib/sbi/tests/sbi_ecall_hsm_test.c
new file mode 100644
index 00000000..6bbcb99c
--- /dev/null
+++ b/lib/sbi/tests/sbi_ecall_hsm_test.c
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+
+#include <sbi/sbi_unit_test.h>
+
+static void hsm_hartid_test(struct sbiunit_test_case *test)
+{
+	struct sbi_ecall_return out = { 0 };
+	struct sbi_trap_regs regs = { 0 };
+
+	regs.a0 = current_hartid();
+	SBIUNIT_ASSERT_EQ(test,
+			  sbi_ecall_hsm_handler(SBI_EXT_HSM,
+						SBI_EXT_HSM_HART_GET_STATUS,
+						&regs, &out),
+			  SBI_OK);
+
+#if __riscv_xlen == 64
+	regs.a0 |= 1UL << 32;
+	SBIUNIT_EXPECT_EQ(test,
+			  sbi_ecall_hsm_handler(SBI_EXT_HSM,
+						SBI_EXT_HSM_HART_GET_STATUS,
+						&regs, &out),
+			  SBI_EINVAL);
+#endif
+}
+
+static struct sbiunit_test_case hsm_tests[] = {
+	SBIUNIT_TEST_CASE(hsm_hartid_test),
+	SBIUNIT_END_CASE,
+};
+
+SBIUNIT_TEST_SUITE(hsm_test_suite, hsm_tests);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
