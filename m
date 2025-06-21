Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC064C7EE31
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gc6w5/cxcZl4RjgGlDYXYxd0/WDYzFHJGRVF1SMrD6E=; b=CKAxVSXgoXZPcz
	VezlL7cqgoE28gVZrvuTSdGAW1wFZgdFSys6o2W5t4+1AiVZA7NT3PMQjh2lvBf5I9depwlbf/2x4
	GHaKQkNXLub/JkRDGMroeyQa8thN3CPYKbxSnj2ZyXwojcZhvYffhcAq+h76ebEAQtvJHjmJbnj2q
	v9HbNE6sNqoWaNvDO7nBmATOmcxYpc8DeSFcrRQnI8ptVCE6Epeg8wmDUSae3PUhqg+p9feZ+mmOO
	XeA0t4+3w6QYHqh7kT8h3QstYUiTCQv/p1+t0LP9uJ2gwYQC6uepzO+NDUTIIhVlikhvFUFctV2DJ
	qyMnhcY+xMx+lauZEM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpyl-0000000H60w-114Y;
	Sat, 21 Jun 2025 04:37:23 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSplr-0000000H54K-2xkD
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mw
	t0hGJFe+JOJ3L42kDIIgjSVBVAUIBVLBwM+t2UrXM=; b=Xgd0KpxdG4gISlgsMC
	tNQBgHwapmkHyBGZKVE2ORhsdiPb7g7hdSaIXS2MmrokqsnDbGKRL+YLNBsFiCLf
	hRLq1CVKjCHUcJ2fHzIBNXLnnFxH4odzrG0ZA5jn3j/x6yJS71P2F8TvP9oOJGmQ
	KqC6vqr2SZTjAa1QpYz87r9lc=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S3;
	Sat, 21 Jun 2025 12:23:07 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 1/9] lib: sbi: Implement synchronisation and wait between multiple HARTs
Date: Sat, 21 Jun 2025 12:22:49 +0800
Message-ID: <20250621042302.160802-2-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621042302.160802-1-wxjstz@126.com>
References: <20250621042302.160802-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1xuF48tw17Ar1kCFykXwb_yoW8Kw4xpF
	4jkF98JrWv93Z7tr9rA345Xr4fJFyvkwnrJry7Jryfur4Iya1rXFWj9w1FyFy5KrWkJF10
	93yYvFy5CF15ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziPfH8UUUUU=
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5BZzOmhWMwUHYAAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212404_064900_D22E0EBA 
X-CRM114-Status: UNSURE (   6.66  )
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
 include/sbi/sbi_hart.h |  4 ++++
 lib/sbi/sbi_hart.c     | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index dfbe8e4c..d0b08dca 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -12,6 +12,7 @@
 
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/riscv_atomic.h>
 
 /** Possible privileged specification versions of a hart */
 enum sbi_hart_priv_versions {
@@ -167,5 +168,8 @@ void __attribute__((noreturn))
 sbi_hart_switch_mode(unsigned long arg0, unsigned long arg1,
 		     unsigned long next_addr, unsigned long next_mode,
 		     bool next_virt);
+void sbi_wait_for_boot_hart_first(bool cold_boot, atomic_t *a);
+void sbi_signal_boot_hart_first_done(bool cold_boot, atomic_t *a);
+void sbi_sync_and_wait_all_harts(atomic_t *a);
 
 #endif
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 054a405c..61d3b26b 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -1145,3 +1145,32 @@ sbi_hart_switch_mode(unsigned long arg0, unsigned long arg1,
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
