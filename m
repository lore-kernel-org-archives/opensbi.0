Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79291C5DF66
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4CcQZfxzKMtoWP2rY9bALUOq1MbqSxwInGp7jzn9InY=; b=mnOgN14YY5hnOe
	NWOFl6+xpjAuUPIhkgmZmplnSL1tfEMqgLXe0clidvK1AuI56Ekze9sL20JOb94nbsFU5WgDbNNg8
	B22OCHiV3MLK1sFwwJ7bqMyWBZ6xc/RdVro7lfNi4Y/B4R/47ecS5ecZkESjcJambPaiK7k2u5FTr
	hYFjcz7NFTkHWD0HjcCcNmnKR6mPJ9fNeDn3J2VagukxYjt2UnZOGfP8tDGga6ERYRucZXRIEm+G+
	r+DX2cjneoU1N5dPXkxEjrh3vDJ0QzlCPCvFdgWEniaj8TSvXOIgRrYblvU6ZWTh+pmXLr0b4veJI
	DijYnV/KG/MrpqPB/rMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzgh-00000006SRP-17Yw;
	Mon, 17 Aug 2026 15:55:47 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzge-00000006SQZ-0vMO
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 15:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786982139; bh=1Y/RooDRHcYbU8HxGfMb2V8ZET4ojeMkqsAcWNnKDmI=;
	h=From:To:Subject:Date;
	b=O2PXTRUuUmgZ88PGS/HJ9y0O0SR/zraIjya7liaPfOpOKpfr8V2t1PkMJrEuvlWBu
	 SPeTHRFDh4EIiJOxvfdb4UcWGePyEEGfL7VP5wewfVjYsVYbQVPjjwvEaBmzTWohrt
	 yAASaNePUXo5GnMtEpAJAMFd2Y9LO7rG2z0uvThg=
Received: from zs-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.. ([124.79.168.208])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id DE62164D; Mon, 17 Aug 2026 23:55:38 +0800
X-QQ-mid: xmsmtpt1786982138tejc102sa
Message-ID: <tencent_14AA3BA0083001905C262A5CD64E442FC205@qq.com>
X-QQ-XMAILINFO: Me8mHstNM5a8474/1RRJR5VMcpWvqAXOEzc2y/aL6eB0F2Cw68jQJmLn2NhlKN
	 PduN2sTgxQsys5POLADOtvwZtwkriR7NJVU9oBKjvEMwJbLPobOs24b8hGHBoiJO6Iy2tLkN4xwR
	 ozUVRcapxrta0qFgr506aE/nnpR8x00s9SUkmgfsPUSTnqI1X1Z6/jZuMDwMTkGQAhUylsJvDa9A
	 j7NWM0C89Eub1+whd/CbpnXI19T18oPfVPQnU9R4VYioABQoMXNJunPPXBfATiB67iyMtIho242M
	 4QZZK/nK+i9ZxFO6hjJIv39ZlqFAbnZvqZuh5G/e+hy2G7O0OZAclNZBvkCVYL1bAuzPSQ4UyFor
	 eOcz4+gRky9V9JNmUrOiQBQ14zlDkvjdJDT2Sq9SnS+ZVM8U4yhN06ZKhgUXdhwok/UoXEBedOV7
	 WhmipJQRKZ9n0M1Ralahm3u7N3gNYW9zaZ4PNwMMZN59KYKEzPTQ0HAnWMlWy5/MbQyYDft9i1F2
	 u/xfBwbdQvRE3IWHJuQusJB9NKjQEK7JJlph1OKdkpXWaeRLVx2VR55wczSpZ4X7VgzWbrdOcbes
	 Lpi3TEPMtE/5HHQ65OQCzqNcECgZQ47e3L0hvkBKBRNEoQxnSAZPDAkjFzA1EvSqg6UhjMZZcY3C
	 6PRFauIUfDxOiF6DRWMShIgjXdzNse3/yCUt1BAwapEIrN/gvbWzebhhBuZh2l2eLtwnpcxiXwDD
	 7tVuGmTOYnF15bCU0BGXUIKi6EmEHm8u3PnT+Ux2hMLmhHTn9FPfTZhR2gkQS/dJOAb3xvytvVQo
	 HtsV9o925RLLnUon2YZtU7P9N5IKqYprrssZ8GOho0nPBLn9pCh4ti5sYntdqaz9oxei84kaXH1o
	 lIW7HWkrOdPmdAPxuqVdKwKXIYcsTbfftEvi9+3Ik/a7eRVO4d+hnWPW1mZ+eAJd0GvF3KZz1qo1
	 ln9WOrnWQc/Sxjup1SrZ8mt2IMc8rXrrP6Lrgf2BBwxQjl/sIHuXsNFFC7OPHv2zddU3a3us3eVN
	 XWuetQmRmHhrM8wTyIsEwo42POQ7Hxa1C4fmZXWrKfMTWEMMRcqxzsU2MFSTbtpZaxALnJCbzBc9
	 YPEIHyiDhC8aPl+TKro1Teyg2S9C0NjSkWx5cGDEWt3mNQPX8=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Shibo Zhu <3499129952@qq.com>
To: opensbi@lists.infradead.org
Subject: [PATCH] lib: sbi_mpxy: Fix shared memory size rounding
Date: Mon, 17 Aug 2026 23:55:37 +0800
X-OQ-MSGID: <20260817155537.115260-1-3499129952@qq.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_085544_789070_F5E3419C 
X-CRM114-Status: GOOD (  15.89  )
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

sbi_mpxy_register_channel() currently performs ceiling division by
PAGE_SIZE but stores the resulting page count in mpxy_shmem_size. All
consumers interpret mpxy_shmem_size as a byte count, so channels requiring
more than one page produce an undersized shared memory value.

Use ROUNDUP() to keep the rounded value in bytes. Add SBIUnit coverage for
page boundaries and ensure smaller channels do not reduce the shared memory
size.

Fixes: ec09918426a5 ("lib: sbi: Update MPXY framework and SBI extension as per latest spec")
Signed-off-by: Shibo Zhu <3499129952@qq.com>
---
 lib/sbi/sbi_mpxy.c            |  8 +++--
 lib/sbi/tests/objects.mk      |  2 ++
 lib/sbi/tests/sbi_mpxy_test.c | 64 +++++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 lib/sbi/tests/sbi_mpxy_test.c

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 19f59f3a..ed0e7807 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -257,8 +257,8 @@ int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
 
 	/* Update shared memory size if required */
 	if (mpxy_shmem_size < channel->attrs.msg_data_maxlen) {
-		mpxy_shmem_size = channel->attrs.msg_data_maxlen;
-		mpxy_shmem_size = (mpxy_shmem_size + (PAGE_SIZE - 1)) / PAGE_SIZE;
+		mpxy_shmem_size = ROUNDUP(channel->attrs.msg_data_maxlen,
+					  PAGE_SIZE);
 	}
 
 	sbi_list_add_tail(&channel->head, &mpxy_channel_list);
@@ -803,3 +803,7 @@ int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 
 	return SBI_SUCCESS;
 }
+
+#ifdef CONFIG_SBIUNIT
+#include "tests/sbi_mpxy_test.c"
+#endif
diff --git a/lib/sbi/tests/objects.mk b/lib/sbi/tests/objects.mk
index 40c441e1..888b4412 100644
--- a/lib/sbi/tests/objects.mk
+++ b/lib/sbi/tests/objects.mk
@@ -19,6 +19,8 @@ libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_math_test.o
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += ecall_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_ecall_test.o
 
+carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += mpxy_test_suite
+
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += bitops_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_bitops_test.o
 
diff --git a/lib/sbi/tests/sbi_mpxy_test.c b/lib/sbi/tests/sbi_mpxy_test.c
new file mode 100644
index 00000000..d96975b4
--- /dev/null
+++ b/lib/sbi/tests/sbi_mpxy_test.c
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+
+#include <sbi/sbi_unit_test.h>
+
+static u32 mpxy_test_unused_channel_id(void)
+{
+	u32 channel_id = 0;
+
+	while (sbi_mpxy_find_channel_any(channel_id))
+		channel_id++;
+
+	return channel_id;
+}
+
+static void mpxy_shmem_size_test(struct sbiunit_test_case *test)
+{
+	static const struct {
+		u32 msg_data_maxlen;
+		unsigned long expected;
+	} cases[] = {
+		{ 4095, PAGE_SIZE },
+		{ 4096, PAGE_SIZE },
+		{ 4097, 2 * PAGE_SIZE },
+		{ 8192, 2 * PAGE_SIZE },
+		{ 8193, 3 * PAGE_SIZE },
+	};
+	struct sbi_mpxy_channel channels[array_size(cases) + 1] = { 0 };
+	unsigned long saved_size = mpxy_shmem_size;
+	unsigned long previous = PAGE_SIZE;
+	u32 i;
+
+	mpxy_shmem_size = PAGE_SIZE;
+
+	for (i = 0; i < array_size(cases); i++) {
+		channels[i].channel_id = mpxy_test_unused_channel_id();
+		channels[i].owner_domain = sbi_domain_thishart_ptr();
+		channels[i].attrs.msg_data_maxlen = cases[i].msg_data_maxlen;
+
+		SBIUNIT_ASSERT_EQ(test,
+				  sbi_mpxy_register_channel(&channels[i]), SBI_OK);
+		SBIUNIT_EXPECT_EQ(test, sbi_mpxy_get_shmem_size(),
+				  cases[i].expected);
+		SBIUNIT_EXPECT(test, sbi_mpxy_get_shmem_size() >= previous);
+		previous = sbi_mpxy_get_shmem_size();
+	}
+
+	/* Registering a smaller channel must not decrease the shared memory. */
+	channels[i].channel_id = mpxy_test_unused_channel_id();
+	channels[i].owner_domain = sbi_domain_thishart_ptr();
+	channels[i].attrs.msg_data_maxlen = 4095;
+	SBIUNIT_ASSERT_EQ(test, sbi_mpxy_register_channel(&channels[i]), SBI_OK);
+	SBIUNIT_EXPECT_EQ(test, sbi_mpxy_get_shmem_size(), previous);
+
+	for (i = 0; i < array_size(channels); i++)
+		sbi_list_del_init(&channels[i].head);
+	mpxy_shmem_size = saved_size;
+}
+
+static struct sbiunit_test_case mpxy_tests[] = {
+	SBIUNIT_TEST_CASE(mpxy_shmem_size_test),
+	SBIUNIT_END_CASE,
+};
+
+SBIUNIT_TEST_SUITE(mpxy_test_suite, mpxy_tests);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
