Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504B5606A321
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 03:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DE/KgTyq;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fB/g4XUZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Au7t/GEo4TfjgJnWlNN3lC5phzl1b3m7ikJ/xAwt/hQ=; b=DE/KgTyqCX38jvbb3FFIVDbKOw
	f6TVhLv4n23r+LxKRVI3eXMQ+0Nrys5YN5f0EjfeYtMvBPi4zQaRxTlsWLpG2GnS+2wUw8MWN5JyU
	3ZhJuoaWHLj3rSgjpVz7QFFPaVlE1YKh3u5o4YNoPnrVfKM5NqcIAt8JbXCGiKMgcAqw8FWuxYrG3
	PzbjQDOniOkJLJ19/yeG/66bedAYf0EvRsEf38k1Nx802Fh8hP2qEqhed00tkyN1bdoFXZwMlkTRa
	LSWxhsxEbE5szi1tzgkPxzTmZ0HSyzyT35NZq9U/IfhSLSrvwl6pn2duT+uZPitenLTDDiEkt8Igg
	mqiKI2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcwl-0000000Ai0A-46lp;
	Fri, 30 Oct 2026 03:06:28 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcwh-0000000Ahxx-0VwI
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 03:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793329580; bh=GGqWa07TfVclbOC55G82cxe7612/2OvaiO5oiHcVPqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fB/g4XUZb7Q/ffLNZuOmXu+YaWFtcGt29BYBXC1TR14iMZmzZ5dQateLQmmaNrkPC
	 dy89r3OofqRu29Qkepmjob9D7F8lmJzlW7H/aBnGOga9rkgeXfrOFEttDP6JbngH1l
	 JSOoZN92FOhp4RWnbD7aYIs09qrtQbJ/bRZO1rfc=
Received: from zs-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([202.120.37.188])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 18F8DE4F; Fri, 30 Oct 2026 11:06:15 +0800
X-QQ-mid: xmsmtpt1793329578tdmkxmbc3
Message-ID: <tencent_51917A6D560F01A5807180C13245E1717608@qq.com>
X-QQ-XMAILINFO: MJf32pulH4816AsqjtSipC/ECK11gFgB0QiRFFNLO9mvM4J4sTpdrHn8IiV7Wj
	 dJEW2wDCyBjYZWQwY47E6ZXHSGEVtLniRe2kWY2rDaWcOyw2Rj+mWDbQa0aunU8bdpFsMtQtEBar
	 6to0ikoQir+NSzP0k6ReikRIlGkAUC9CkXfQeSBkkuOXRIbps0OcSqZ08GqLshsbpyRTh3XaMFZS
	 yZQmn3+bNjhG2uchXWHyk7JMNPK9hFkXb0i8+U2SRHA6UpgkB3v26AEDxaaSdvS3VbRXHGOO8f6u
	 Zef0khN7QI8m6iQYRhPTzp8H3GHOq8S0VNc/Wpv+cSzTyQiBtl+RGcIZy++htglRlTFPv8K0G3pB
	 x8AgFs7lu1U8LkHmpXcCvP1RbqcuuJpPQ2srppePLp9G9b1KnhnKvlokYcPYRp/zCtbEl8gOXrDn
	 HWeSSBDCYMD/knIu0hy2wq+EIo7yCPb61OKd8flufFjtwRIZcVhX13U+dlbSgPfpnMSXUx2txCIf
	 ygDZbKB6t4jJ3tvyhKe4lfL7rJlkqrrHZ/P0PAwFF9gZ7sa5zpr42JeqdcTTQTD9TpyjfgzaRPIO
	 xhW+KWv7dn+K9oBmbOyHZgX7E73BNso4AtFMaBv39JEsXNcOWJ4MHMELZSvXmQa9yVw/H6v8R9Bo
	 iQq53F5Gliwy/Xn2kGt6bX7WDWXgOamxUVdiU6rs2j7myNRUOGULuVBa31MQMzOaAjlF+SrlD5qY
	 N0aeDUX+aEt3bstD4kcO34pYsOATWN9x8K5yiUtQ+Uj+gRLNzu7ykXXwXQm0Nmfquf1AsUQ4aWmo
	 wnuR+XQFSDHZy3nUB0q18DVgEfk6fqC1K/FeOh9Ae0+Tlmk4Is3YZg+s2ktDQzIKySOyw1NL89ck
	 iBHE0+bxioPvuhcW2ZHo/XiHIf4sdjZYp40zK5pLUs3BAP9SWJkHHp5kgI4XCaN1Y0biHgpY6Lox
	 X6T8tRrzwDeETcpxz7aG1VrTYHaTQHdPt4E+fouWQw5xSdSpZj1/0hr3YbPcL0VcNT9dWSYDv/Hh
	 blQAIwMcAlPZXy/UpYeb/SjgSFuUeOvdTwNttg1zvvONAJEmerJU0PO22Kihkv+Chn+P4eZSyRDN
	 Y45Tz33wQWdQGr8OuoLHdQ0exN8g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Shibo Zhu <3499129952@qq.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	Shibo Zhu <3499129952@qq.com>
Subject: [PATCH v2 2/2] lib: tests: Add HSM hart ID validation test
Date: Fri, 30 Oct 2026 11:05:03 +0800
X-OQ-MSGID: <20261030030503.334740-3-3499129952@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030030503.334740-1-3499129952@qq.com>
References: <20261030030503.334740-1-3499129952@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_200623_491195_7E2B8C3D 
X-CRM114-Status: GOOD (  12.74  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add SBIUnit coverage for HART_GET_STATUS with the current hart ID and,
on RV64, the same ID with bit 32 set. Verify that the oversized value is
rejected instead of aliasing the current hart.

Signed-off-by: Shibo Zhu <3499129952@qq.com>
---
 lib/sbi/tests/objects.mk           |  3 +++
 lib/sbi/tests/sbi_ecall_hsm_test.c | 41 ++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 lib/sbi/tests/sbi_ecall_hsm_test.c

diff --git a/lib/sbi/tests/objects.mk b/lib/sbi/tests/objects.mk
index 40c441e1..dce2016e 100644
--- a/lib/sbi/tests/objects.mk
+++ b/lib/sbi/tests/objects.mk
@@ -16,6 +16,9 @@ libsbi-objs-$(CONFIG_SBIUNIT) += tests/riscv_locks_test.o
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += math_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_math_test.o
 
+carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += hsm_test_suite
+libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_ecall_hsm_test.o
+
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += ecall_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_ecall_test.o
 
diff --git a/lib/sbi/tests/sbi_ecall_hsm_test.c b/lib/sbi/tests/sbi_ecall_hsm_test.c
new file mode 100644
index 00000000..93901a6d
--- /dev/null
+++ b/lib/sbi/tests/sbi_ecall_hsm_test.c
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_unit_test.h>
+
+static void hsm_hartid_test(struct sbiunit_test_case *test)
+{
+	struct sbi_ecall_extension *hsm_ext;
+	struct sbi_ecall_return out = { 0 };
+	struct sbi_trap_regs regs = { 0 };
+
+	hsm_ext = sbi_ecall_find_extension(SBI_EXT_HSM);
+	SBIUNIT_ASSERT_NE(test, hsm_ext, NULL);
+
+	regs.a0 = current_hartid();
+	SBIUNIT_ASSERT_EQ(test,
+			  hsm_ext->handle(SBI_EXT_HSM,
+					  SBI_EXT_HSM_HART_GET_STATUS,
+					  &regs, &out),
+			  SBI_OK);
+
+#if __riscv_xlen == 64
+	regs.a0 |= 1UL << 32;
+	SBIUNIT_EXPECT_EQ(test,
+			  hsm_ext->handle(SBI_EXT_HSM,
+					  SBI_EXT_HSM_HART_GET_STATUS,
+					  &regs, &out),
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
