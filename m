Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E414BC7115C
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8th1lymC9hmWlBusAcJl0o2tIut0ivfTvHuK8WUS7A=; b=wT/CHTKLuDFSST
	O7sPFwd+7ZKgwNKdAe09UT4is3WOegVPWNhxLpvW9KOKTdMuIoEacurnze1e1WTsjnE1LFcM/ucZ3
	RQKKuezIJKU65rqgPtHvUhySA3fxmx8vuiUi8uGZyFhUVQJszMolU146Di98SoXb13Zron+pE3jXk
	FIWOHzEQVwe203LG3MkmtZvu25hmhKzidh7A0r7BcB8M4mRZec5IAzY9r8XXggmacEaE5aAWpTVB4
	3Y4XwNcZ6zmC4NdTODYoNOd70a531du9jL6TdIrl3dwFAUA/F5+d6j1deuK+Bt4sB62DDWVbmEgqZ
	6T5H5nTIPTdoBbM9K58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpyj-0000000H5z3-0okC;
	Sat, 21 Jun 2025 04:37:21 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSplA-0000000H4zi-1ZOA
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nN
	ulBzZRy9qPL7FencOlaidqNQPTp7TqvFNjLwB0WZE=; b=AQ6ddoOhlUY3kZv7a7
	kzYHGypsXcLaXL0lQIhbza14s3w7KIHCnavFhIz2/C746TJueFBjAC68UVwhpyq2
	CD4XDrCVv4fNVdOzb8mIWxKvBUnkre/nNjcGTcXHy3B8/MGC1x6wOJinH8jJZf44
	d4+53Z8QFwoaWFg9XWKpT2T6c=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S8;
	Sat, 21 Jun 2025 12:23:11 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 6/9] lib: sbi: Ensure that all Harts complete sbi_hart_init
Date: Sat, 21 Jun 2025 12:22:54 +0800
Message-ID: <20250621042302.160802-7-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621042302.160802-1-wxjstz@126.com>
References: <20250621042302.160802-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF48KFy7Jr1xur13Zr43Wrg_yoWkCrb_ZF
	18Aw18C393Ca1DX3WUKrnYkFWI9rs8ta48XF4DXFsrAr47ArZ8XFWvqFnIy3s5W3y7CrnF
	grs7uFWSyr1agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRLF4RtUUUUU==
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1xFzOmhWM5sA8QABsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212320_716701_AAC4FCE0 
X-CRM114-Status: UNSURE (   8.70  )
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

Make sure all cores complete sbi_hart_init. This way, the boot
Hart in the subsequent code can detect the extensions of other
Hart.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_hart.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 86eedce3..40b9ddaa 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -1048,6 +1048,7 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int rc;
 	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
+	static atomic_t sync_b = ATOMIC_INITIALIZER(0);
 
 	/*
 	 * Clear mip CSR before proceeding with init to avoid any spurious
@@ -1071,7 +1072,16 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 	if (rc)
 		return rc;
 
-	return sbi_hart_reinit(scratch);
+	rc = sbi_hart_reinit(scratch);
+	if (rc)
+		return rc;
+
+	/*
+	 * Make sure all Harts complete sbi_hart_init so that the subsequent
+	 * code can detect the extensions of other Harts
+	 */
+	sbi_sync_and_wait_all_harts(&sync_b);
+	return 0;
 }
 
 void __attribute__((noreturn)) sbi_hart_hang(void)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
