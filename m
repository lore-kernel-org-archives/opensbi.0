Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84016C77B7C
	for <opensbi@archiver.kernel.org>; Tue, 24 Jun 2025 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LkrFvtlpp1sKI1JqbNIBiQc/+LbPLC+E/vconl5jdB0=; b=BYK+rnfl+C5Gun
	6dqckeNncGPD0iDFbSS558bQbgGW2rYiAp5d0ePpXFqTk8lpFUdMF7Hwz408TW87kWp73HU1EefiP
	CytG2Oqd4n7B4516crnnabNMZ/A3RsW247B65+fO6M/c3wD7n2Ay5ouT/gQOOh3UVoGI2zL0qJ9GH
	G/R+Bd4B2ediEhL3zx55ixBnVhclT/83Ehil2M1j4jVif+WcrGlOB0/R+FvZQ1RX5OxZUnD2y4g0Z
	CVqvMvjVDFbnmtbq86NffapAbErI59yWlbI/O8yvW39Ri6dAuxcTTCjbkt603ObbbECkfZWrMZOdp
	StUO7tSYIS6D6lEhEAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzVP-000000056Zp-0RJQ;
	Tue, 24 Jun 2025 08:59:51 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzFQ-0000000545K-2bg5
	for opensbi@lists.infradead.org;
	Tue, 24 Jun 2025 08:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sY
	zIuLsWcBx/QLFpBd2Hb+XcnWqNnd5hba6DKb5bgYI=; b=AFcvyrwYtJjx/rbhzg
	qkT5YocKPBXzc3C6/xwnGkLCAZX1TiSI1VBw5L7O4OLtHd7CuVgoNTKHVcoaB+I7
	x3U36wJ5g+sxYcIR3POSvoGuXj8PZ3zKqH3JUn0zyVmaqG6qncUtkmjwUMQsqWLw
	U7WGR5v30PaQDVcoZTfTCNYVc=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnf1fqZFpoVe+WAQ--.60624S2;
	Tue, 24 Jun 2025 16:42:18 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Xiang W <wxjstz@126.com>
Subject: [PATCH] firmware: payload: test: Add SBI shutdown call after test message
Date: Tue, 24 Jun 2025 16:41:46 +0800
Message-ID: <20250624084210.229564-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDnf1fqZFpoVe+WAQ--.60624S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWfZF48Kw15Wr48Ar48Xrb_yoWkWFg_Wa
	48ArWkWrZ5XF9xZF1xAa4FqrWkX3yjv3ZrCF17Gay3u347JwsxXFy8Jr1Yyw1xWrZIgFy2
	k3WDXFW0kw10kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRCPfQ5UUUUU==
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFwh2OmhaXuleLgAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_014321_053013_988FCFB2 
X-CRM114-Status: UNSURE (   5.61  )
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
 firmware/payloads/test_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/firmware/payloads/test_main.c b/firmware/payloads/test_main.c
index 194dbbe6..021bc3b8 100644
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
@@ -54,6 +61,7 @@ static inline void sbi_ecall_console_puts(const char *str)
 void test_main(unsigned long a0, unsigned long a1)
 {
 	sbi_ecall_console_puts("\nTest payload running\n");
+	sbi_ecall_shutdown();
 
 	while (1)
 		wfi();
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
