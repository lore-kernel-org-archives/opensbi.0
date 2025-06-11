Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05C1C71133
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUuHWIl75ZNk0v+45KjUnyHd7RMBiLlXibFI5/2taqk=; b=nWiKDdv3+IuUXf
	fMqezHxrhOzhqQ1dzrLBOqsoHcPJcC4xVhz9KEIsCKx/VCQthgfM6N3AsLhdV6ZlsNXI7zWpnPKZo
	Kox7cLEFtKh9xeH0xc87DHzkQp3NV46F6q2DY8RfuUr/qy+/dKongeIUFt/sjmpCn0SdMZB/O7FpF
	YwM7mFnm2e8hVQXAUI5mN56b9pd51tw0EPRbphqmPQ4MXvj2zdxMmO/9QczX5GK6nvAjIiO/SlJh6
	ewIMoRFkbzxH8FBqGsRTd6HFf8Dfbjq1N/uc4i3/ZJiPDZ4Jv65rEqu+AHiDMhsC3QyFq/3Z3KrBR
	l1q52LoQ2n3gIVTX/Qrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL5-0000000ANlc-42ch;
	Wed, 11 Jun 2025 15:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKE-00000009p1L-1luo
	for opensbi@bombadil.infradead.org;
	Wed, 11 Jun 2025 12:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=slTeuN2hWZWuRQVhC1EC7U0KOgVH/XLIAdE810AoPEU=; b=Zr1qBwJ1MxO74LOcpLQx8LXvsS
	tnReWVIk/lk2Qy2l2CDqsC/JW0F7+NxLmL8TljU021lw1JljQq6+nh4Mj6oRvBiVtbT9gHmHQ8ico
	WePDxcnPfltFpTCHZ5T0B3Rgo7flRQ1lYaZCy23Du35pMxzizk3vpVq6IjrPsLLDUVjvNpjRHeGDH
	YoiGJfUHZGncsTrWkmjbdQGZLmsvj4qE/FInnMCwsgjQuqCKWGwj4m8Oey9mhG+t/63G3KppZpueM
	geKOnym09vFypZjo9daYa3JRVE+l4RAWZkwsY1EfSpRB6kul0mrUByzDDPWX5/lY+mPQItoExG3zm
	JzJxy3OA==;
Received: from m16.mail.126.com ([117.135.210.6])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKA-00000002NeX-22lx
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sl
	TeuN2hWZWuRQVhC1EC7U0KOgVH/XLIAdE810AoPEU=; b=hssceDvTFaLz+gXqjK
	0XctEDNsKqtISmRUWQz9SawQySQ8DElF/nGn7zXiEnO0eUV4syky2VVtsItmG+bs
	ZTIrwaOJnTNzSiN7SD8Myek5jnWZAryfJJXf0q9RNl/3gtNB7VRI8xNNDliLEUhk
	hf6XdRb7eZC8qOweDHPOkO9P8=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S5;
	Wed, 11 Jun 2025 20:12:41 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 03/12] lib: sbi: Implement synchronisation and wait between multiple HARTs
Date: Wed, 11 Jun 2025 20:12:20 +0800
Message-ID: <20250611121236.937455-4-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4fGr4rAw43KrWxKw4fAFb_yoW5ur4kpF
	4jkF95Jr4vg3Wxt3srC3y5Jr4fGFW0kasrJry7Xr1fZrs2yFs0qayj9w1rtF98KrZ7XFy0
	vrWY9Fy3CF15ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR9SdgUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1wdpOmhJZ0iZCwAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131259_085810_DD25DCEA 
X-CRM114-Status: UNSURE (   6.54  )
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

Implemented sbi_sync_and_wait_all_harts to synchronize and wait for
all HARTs to complete their tasks before proceeding.

Introduced sbi_wait_for_boot_hart_first and
sbi_signal_boot_hart_first_done to ensure that the coldboot HART
completes its initialization before other HARTs start executing.

Added sbi_wait_for_non_boot_harts and sbi_signal_non_boot_harts_done
to coordinate the execution of non-coldboot HARTs, ensuring they finish
their tasks before the coldboot HART continues.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_hart.h |  6 ++++
 lib/sbi/sbi_hart.c     | 62 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index dfbe8e4c..b7664dfa 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -12,6 +12,7 @@
 
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/riscv_atomic.h>
 
 /** Possible privileged specification versions of a hart */
 enum sbi_hart_priv_versions {
@@ -167,5 +168,10 @@ void __attribute__((noreturn))
 sbi_hart_switch_mode(unsigned long arg0, unsigned long arg1,
 		     unsigned long next_addr, unsigned long next_mode,
 		     bool next_virt);
+void sbi_wait_for_boot_hart_first(bool cold_boot, atomic_t *a);
+void sbi_signal_boot_hart_first_done(bool cold_boot, atomic_t *a);
+void sbi_wait_for_non_boot_harts(bool cold_boot, atomic_t *a);
+void sbi_signal_non_boot_harts_done(bool cold_boot, atomic_t *a);
+void sbi_sync_and_wait_all_harts(atomic_t *a);
 
 #endif
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 74ccdd84..04f04721 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -1135,3 +1135,65 @@ sbi_hart_switch_mode(unsigned long arg0, unsigned long arg1,
 	__asm__ __volatile__("mret" : : "r"(a0), "r"(a1));
 	__builtin_unreachable();
 }
+
+void sbi_wait_for_boot_hart_first(bool cold_boot, atomic_t *a)
+{
+	if (cold_boot)
+		return;
+	while (!atomic_read(a))
+		cpu_relax();
+}
+
+void sbi_signal_boot_hart_first_done(bool cold_boot, atomic_t *a)
+{
+	if (!cold_boot)
+		return;
+	atomic_write(a, 1);
+}
+
+void sbi_wait_for_non_boot_harts(bool cold_boot, atomic_t *a)
+{
+	long val;
+	u32 hart_count;
+	if (!cold_boot)
+		return;
+
+	hart_count = sbi_platform_hart_count(sbi_platform_thishart_ptr());
+	do {
+		val = atomic_read(a);
+		if (val >= hart_count)
+			return;
+	} while(atomic_cmpxchg(a, val, val + 1) != val);
+
+	while (atomic_read(a) < hart_count)
+		cpu_relax();
+}
+
+void sbi_signal_non_boot_harts_done(bool cold_boot, atomic_t *a)
+{
+	long val;
+	u32 hart_count;
+	if (cold_boot)
+		return;
+
+	hart_count = sbi_platform_hart_count(sbi_platform_thishart_ptr());
+	do {
+		val = atomic_read(a);
+		if (val >= hart_count)
+			return;
+	} while (atomic_cmpxchg(a, val, val + 1) != val);
+}
+
+void sbi_sync_and_wait_all_harts(atomic_t *a)
+{
+	long val;
+	u32 hart_count = sbi_platform_hart_count(sbi_platform_thishart_ptr());
+	do {
+		val = atomic_read(a);
+		if (val >= hart_count)
+			return;
+	} while (atomic_cmpxchg(a, val, val + 1) != val);
+
+	while (atomic_read(a) < hart_count)
+		cpu_relax();
+}
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
