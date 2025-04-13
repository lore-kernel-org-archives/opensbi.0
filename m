Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BE2C369B5
	for <opensbi@archiver.kernel.org>; Sun, 13 Apr 2025 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mamfbjqbo9f9g0m7jbz+d8XTaDWyfyookrxW1G/6140=; b=t7MU45g1U9IXlR
	9nuYUsBGmg7Rf1nh/dUaENxrP9tuy1TvWTp50Z0OhHtl28p8ie4tJ78MytmHbI50RRA7X4OGGvMV6
	j2rPvO3m9QjZIKkyXScu/ed7EAZg8LVvBlxY4m1m9Vqg4+RopiSAn2mlh4F58JtzEI1tcL2CyU3h7
	DH5s68YNR9AEzanlIJyFdscQOVNsHcqiO9v0RIjYR34XNJ0FhC/YIwBsb+czHisKdDQxe8nLqlVpA
	6ZSOaiUj0y5767cPqWtR+kr8PpZkHXhHmFM93PHNlZQ2qWLNYoh9MERlfQNmgQVWgv43uGLQN2KJo
	zB9yWd5m5XeNFKApktsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yv2-0000000HIhX-1Tga;
	Sun, 13 Apr 2025 15:06:48 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yuz-0000000HIfv-1HTD
	for opensbi@lists.infradead.org;
	Sun, 13 Apr 2025 15:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=e1ir7
	J7fnX/jHL6DKsBRmPEDAqq4VLcVrXCt5TJjk+o=; b=i0qbV+RLGGGDCsGCTe/29
	68Sh5OhQuadEK8CQCfzp/T5h2eWExqXxy0DtJUzZKurT8gn7tnc4DxswqQoZ4K+4
	aRitVZT/9hDtJ8c3moKu87acvkGNFhVWfdKpkjE+rLGgRyF91y8m+2eGLlOT3gZB
	aHHaccge1L7l7HOmmBKcFw=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P+H30vtnZUv4Aw--.52201S6;
	Sun, 13 Apr 2025 23:06:35 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 4/5] lib: sbi: Add error check for sbi_timer_waitms_until
Date: Sun, 13 Apr 2025 23:06:19 +0800
Message-ID: <20250413150628.75614-5-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250413150628.75614-1-wxjstz@126.com>
References: <20250413150628.75614-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3P+H30vtnZUv4Aw--.52201S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF13urWkAFyfur45tw1DWrg_yoW8Gr1rp3
	9xGF9rKrWIqrWIq34Iqw1kXF95Jr18Jw1xJr97Cr40ya1xJr95JFy7tr1qqFW3WF9FqFWx
	tr4F9FyrKF17X37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziGjgxUUUUU=
X-Originating-IP: [112.83.182.169]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1wUuOmf7x0DuEQAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_080645_730069_F553C414 
X-CRM114-Status: UNSURE (   7.87  )
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

sbi_timer_value may always return 0 when there is no suitable device,
which may cause sbi_timer_waitms_until to fall into an infinite loop.
Add error handling to prevent this from happening

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_timer.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 5266c612..5351e9e7 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -81,10 +81,19 @@ void sbi_timer_delay_loop(ulong units, u64 unit_freq,
 bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
 			    uint64_t timeout_ms)
 {
-	uint64_t start_time = sbi_timer_value();
-	uint64_t ticks =
-		(sbi_timer_get_device()->timer_freq / 1000) *
-		timeout_ms;
+	uint64_t start_time, ticks;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	/* Do nothing if we don't have timer device */
+	if (!timer_dev ||
+	    (!sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR) &&
+	     !timer_dev->timer_value)) {
+		sbi_printf("%s: called without timer device\n", __func__);
+		return;
+	}
+
+	start_time = sbi_timer_value();
+	ticks = (timer_dev->timer_freq / 1000) * timeout_ms;
 	while(!predicate(arg))
 		if (sbi_timer_value() - start_time  >= ticks)
 			return false;
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
