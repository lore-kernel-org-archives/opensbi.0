Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC201C83F22
	for <opensbi@archiver.kernel.org>; Mon, 21 Jul 2025 01:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uu+ss7LvtbbynYxsEWuBDZkpo3kIDcfqJoIkAdWip3o=; b=rOokNWNzrbYUcd
	o/esI7Nb8CyZXb8rIpWdEj/UT3nkSEpz0cuzZeVWOZWvowVJWF2534D0OMeuSld4Jds/hGIy4yzis
	tei+oNIGvX2ZFxVnUIltBA3Jvx4BUaoe/vdcKQKTI8jPuv6hv8BYq+wDS7HTde9JVmxFMYtAeWH8C
	3KHiWRK6qg1ucXhUP0QSmQyaPbPHJg9uvw1FkP5ZOhxaQnyOpE3PlLOc6mjXUDuVKlA2ompJlZxCs
	n4cpUhGMR/7r3SGge8EbARkV6opx0Lvx2tfPQbqXdcF9JhszG2DWNeZi55xJ1hzNI12Rvm8r/mhVa
	VzsT0LU/lv83SLa1M1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udf1z-0000000Fuc3-3yB7;
	Mon, 21 Jul 2025 01:09:27 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udf1x-0000000Fubh-041k
	for opensbi@lists.infradead.org;
	Mon, 21 Jul 2025 01:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4T
	4LmLpgzZL6/DLQRnNBHHC0xzIoHroa9CHrQ1z4/eQ=; b=DbwZUPbYGKOJOfOuNn
	vZzx/5To5yY7UTcrpCE7F4r1xBVaLbUChKZo0ruTVoej3p5nQz7XwUVCZzGrh640
	5afq0YLbH07MYY5u037TCbzQvitQ16iJpNL3OSCsVnW5TEMBonuVTrcOLN3i2rjy
	wfdq0OTiGDnLSgGFYqgkfKFp8=
Received: from T490.lan (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSkvCgDnL5kFk31oTXGIAQ--.41079S2;
	Mon, 21 Jul 2025 09:08:22 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Xiang W <wxjstz@126.com>
Subject: [PATCH v2] firmware: payload: test: Add SBI shutdown call after test message
Date: Mon, 21 Jul 2025 09:02:21 +0800
Message-ID: <20250721010807.460788-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: PSkvCgDnL5kFk31oTXGIAQ--.41079S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWDCrW3ZryxKr45tF4xJFb_yoW8Jw4rpr
	ZxKFn8KrWFgry3XFy7CF13Xa4rGF95JF9Fya17Ars3ZayDAr1vvry3KryUX3WDCrWFq3y3
	Aan8tr1rGF4DGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMq2MZUUUUU=
X-Originating-IP: [2408:823c:b211:167d:fa0d:f332:45d5:d459]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5AKROmh9fEX85gAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_180925_490149_A813EC4F 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

Previously, 'make run' would hang in WFI after printing the test message.
This commit adds an SBI ecall to ensure QEMU exits cleanly after the test
payload runs.

Signed-off-by: Xiang W <wxjstz@126.com>
---
v2 changes:
- Remove the while loop and print the error message as suggested 
  by Anup.

 firmware/payloads/test_main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/firmware/payloads/test_main.c b/firmware/payloads/test_main.c
index 194dbbe6..03f6ba39 100644
--- a/firmware/payloads/test_main.c
+++ b/firmware/payloads/test_main.c
@@ -46,6 +46,13 @@ static inline void sbi_ecall_console_puts(const char *str)
 		  sbi_strlen(str), (unsigned long)str, 0, 0, 0, 0);
 }
 
+static inline void sbi_ecall_shutdown(void)
+{
+	sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_RESET,
+		  SBI_SRST_RESET_TYPE_SHUTDOWN, SBI_SRST_RESET_REASON_NONE,
+		  0, 0, 0, 0);
+}
+
 #define wfi()                                             \
 	do {                                              \
 		__asm__ __volatile__("wfi" ::: "memory"); \
@@ -54,7 +61,6 @@ static inline void sbi_ecall_console_puts(const char *str)
 void test_main(unsigned long a0, unsigned long a1)
 {
 	sbi_ecall_console_puts("\nTest payload running\n");
-
-	while (1)
-		wfi();
+	sbi_ecall_shutdown();
+	sbi_ecall_console_puts("sbi_ecall_shutdown failed to execute.\n");
 }
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
