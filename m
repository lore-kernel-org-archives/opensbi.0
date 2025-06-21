Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC897C7EE33
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViH3VyHjOUerO6+H01ZjsJ0X96KasBbSEXejGKC5pA8=; b=GdjHdeRMU/5Amt
	kr32eTBciItLRKFQrgI2aqJYh5rQ9s/dJQbZDJgXWu0worDxx1nn0r4jr1jbABfED+vZpOTGjd+e/
	RVY6Cz4CEWkjOfIWSILGMdeWngVWLPDSJYSdP9FHFLO6f2e8uGnUQsK6jfQjsVMqoxiKcHivV7kjf
	+bW8Fp8+C8T1UctWmlmdLQzTj7VwLpSO1P9EMko81lsI0oqNXGp037u8kLJq3BepzWus7iRbl2dMm
	YXcxK0kr8WYH4xeGL1yS+beA7cZTSbeDJf3TfMo0FroqmGfwxPI4Bz1rukU4Nk/4JvsrGAtSsOja5
	1S4Orn4hGcKkcjXurBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpyl-0000000H61O-3EM6;
	Sat, 21 Jun 2025 04:37:23 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSplt-0000000H54t-2NYn
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5i
	RbUKChLXB9EEFj33QokeKA9ikqwV4lsUQ5et68iJE=; b=lR4qOUG+d8FNkaM6l2
	tZ9lM0Y2ZYzgVNR1EpGGvSNfWyuuNxV2wzDa9Wuze7RP2LVptEGcmcB983MBHD3+
	E20mAiRd5ComRlb98wlduSOCsF6X+OwjQdaJX8qO+UmOq8gXeIMBjO1+nKHdlUc/
	Aseu5IK+6wYTWFm/8g0QtRKZw=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S6;
	Sat, 21 Jun 2025 12:23:09 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 4/9] lib/utils: Make fdt_parse_isa_extensions reentrant
Date: Sat, 21 Jun 2025 12:22:52 +0800
Message-ID: <20250621042302.160802-5-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621042302.160802-1-wxjstz@126.com>
References: <20250621042302.160802-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4UZr4rAF15GF17urW5GFg_yoW8GF4rp3
	WDKa15Kr4xtFyrua9FgrWvqr4xAwsFgwsrGrZ3tw15JF98ArnxX392kFy29w1UJ34Fv3W3
	Z39YgryDuFs8XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE18BUUUUUU=
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5AlzOmhWMwUHfQAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212405_931961_09754E78 
X-CRM114-Status: UNSURE (   7.01  )
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

The fdt_parse_isa_extensions function accesses a static variable,
fdt_isa_bitmap_offset, which has reentry issues when concurrent on
multiple cores. This patch fixes this issue.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/fdt/fdt_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 0f4859c1..f80928b0 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -325,6 +325,8 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
 static unsigned long fdt_isa_bitmap_offset;
+static spinlock_t fdt_isa_bitmap_offset_lock = SPIN_LOCK_INITIALIZER;
+
 
 static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
 {
@@ -461,6 +463,7 @@ int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
 	unsigned long *hart_exts;
 	struct sbi_scratch *scratch;
 
+	spin_lock(&fdt_isa_bitmap_offset_lock);
 	if (!fdt_isa_bitmap_offset) {
 		fdt_isa_bitmap_offset = sbi_scratch_alloc_offset(
 					sizeof(*hart_exts) *
@@ -472,6 +475,7 @@ int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
 		if (rc)
 			return rc;
 	}
+	spin_unlock(&fdt_isa_bitmap_offset_lock);
 
 	scratch = sbi_hartid_to_scratch(hartid);
 	if (!scratch)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
