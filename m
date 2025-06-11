Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E623C71147
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWC3HIo5/Vy7iY/wJmSk669teh87Dh1xC2w3k2hLAQM=; b=GN36jhiQOkZopj
	s6XgUwRK0VhH9zWYqyvLuKQxO3QvMMUyT/rQzm62PCjeqXcFAY1yEC1fGSxX0wJ0tAAC+Iy1rxeC4
	rFuYUNRvG3LkEUOeo8bSJDlqBT8zT02tX76eFuV4lm195dKAQTxx7BEKoOh+WxQGLtu2f4s8fL6TS
	vasnwlh9iwmXRGVvoLe7XIJZ5+DV3hmfnMMp99l01JQHcLJUlRGl+Fakaz0lu7FDk4vXQXPi3Qexc
	VGGaSWaVl7pKRVmitdcuYCR3DysMqz2liQrEsF3PF+T1j9Ti3hxZo0QuHL2+USe2kUFfTHphhUtDN
	r9QOXr9XtUVputDCpsWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL6-0000000ANlo-1nNx;
	Wed, 11 Jun 2025 15:26:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKE-00000009p1M-2afr
	for opensbi@bombadil.infradead.org;
	Wed, 11 Jun 2025 12:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CeA8aCAo7cuqgu8IqLHijoGL9Lplu/HvJTz3PAtLBng=; b=G2QT6L7MqajZCNjmi3Fy5SQ2Uh
	L8lCdDNaL0HKskOIJcxs5Y+RiaGNKJ18Tka8qpWLqoJrgCcAdCEMR+0F787Y2Db6p9Xb7/dKaB69K
	D1vYN/IJcvWd4gWxWiQGxbawRa4UjGwBkV3I+bvu1vgQ1eZPQ7670SYoFexqf6YYnsGyceeZKumNU
	kbTVk6MKE8tWisJe1Btj+hm9G5c+YnyVwZfFkZkiEFk4dywEAMy+TQVPvx+C7X/TrIyd6tepCodJC
	pr4hnUyOL7ACJirtNJDP/0Tr07yGYr97biBzLrRmAmKgso+7XfjCSlar0sg+oUc8QzY7eyjIBXa/8
	+EBvYoCA==;
Received: from m16.mail.126.com ([117.135.210.8])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKB-00000002NeY-09b8
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ce
	A8aCAo7cuqgu8IqLHijoGL9Lplu/HvJTz3PAtLBng=; b=McOJFBK/ISANYJU64w
	T3V8hVse2rdSQ183O7ITp4pEAD1gQqZ7LlUMHy3bg3YVKKzeZm4eLwnHa0LfHndC
	9f6e8QmbUSrrH4OEP6MJoZbgWiuWzga7JiPp73Y3Q+iahEwiDpF11M2fkXyEEA1f
	lgF/BHc0aDEsDZvhB0eQFv5VI=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S11;
	Wed, 11 Jun 2025 20:12:43 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 09/12] lib: sbi: Ensure that all Harts complete sbi_hart_init
Date: Wed, 11 Jun 2025 20:12:26 +0800
Message-ID: <20250611121236.937455-10-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S11
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF48KFy7Jr1xur13Zr43Wrg_yoWkCrb_Zr
	18Aw18G393Ca1DXF1jkFnYkFWIvrs8ta4jqF4kXFsrAr47CrZ8JFWvqFnIyr95W3y7CrnF
	grs7uFWfAr1agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNnYFPUUUUU==
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5AFpOmhJaY15yAADsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131259_546202_220084AE 
X-CRM114-Status: UNSURE (   8.76  )
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
index 30149c36..9da54145 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -1038,6 +1038,7 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int rc;
 	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
+	static atomic_t sync_b = ATOMIC_INITIALIZER(0);
 
 	/*
 	 * Clear mip CSR before proceeding with init to avoid any spurious
@@ -1061,7 +1062,16 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
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
