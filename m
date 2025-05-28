Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946FEC5B552
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 05:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxTqHLJ4SlEMhPkNpF9LYrc5uDHwnrz6HZ/8sI63Ip0=; b=0CmFuktfEYhn1Q
	qggz9+fawuMCWZRNS763bcr9ECYt2QWrJLg06XxtdqXwiuivx2Ae55VltcVxyVyOzuiRSsQVvowsb
	Qtzx+Uf0MtWkGPoWuzfFjlDBrSun/RQsdhI/RVXtgtRvgUEnpKz+OcMqLrDAnKMsmpfbU3xsEMkVv
	mm0J3MqI+Y4SuhwQzmjQfmbtmfOck0Ld2GuMQSgW5cO/Kq4zlIfjC2iyH+9Vw5eVD6ntJ84B0+LH1
	8ms5KxpOPjbr11ZO/Bm0BimlA9wgaAH6O0bOfyXdGKXNSykHJ8ZVGofCKVs1Dl9TMEAX2xkY66uYj
	qANraHArK83OJgEMaagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9k5-0000000CEvq-433E;
	Wed, 28 May 2025 05:54:21 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9jy-0000000CEsM-256r
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 05:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=iX
	tZxyo9MxMXawkDo4lp7+yNYHye0y+ypFh+Cd1H/9c=; b=Uqxsl6efUBTJ7hpOgV
	XMD4oZkrhLcLSP3wn2OHRqE0JmUYAU3vPiavog3MZpM3/iQtI/7u6K+nLhebRJXH
	8T332qts2cJGGghuLB8DS18mHtodzqms2KJYvpDjm4/qiuU7jxPfyOCpxm6/Nzib
	RYuuv+jxfh0w8EE1YuugIg+4E=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX_5j3pDZo96cmAw--.22074S3;
	Wed, 28 May 2025 13:54:01 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 1/4] lib: sbi: fix sbi_timer_event_start
Date: Wed, 28 May 2025 13:53:50 +0800
Message-ID: <20250528055356.547392-2-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250528055356.547392-1-wxjstz@126.com>
References: <20250528055356.547392-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_5j3pDZo96cmAw--.22074S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrAF13Zr48urW5XryxGFWxJFb_yoWxXFbEka
	18Aa4vgFsxXFZIv390yw40q3y2kw40ga18ur47CrnF9ay5tF4UAr1UA3WDuFykZa1aqFnF
	yFsxJFyYqrnxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM0PfJUUUUU==
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5ABbOmg2mIjpDgAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_225414_894057_7B401AB5 
X-CRM114-Status: UNSURE (   7.12  )
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

Only need set MTIE when used mtimer.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 4088a597..3530a005 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -143,8 +143,8 @@ void sbi_timer_event_start(u64 next_event)
 	} else if (timer_dev && timer_dev->timer_event_start) {
 		timer_dev->timer_event_start(next_event);
 		csr_clear(CSR_MIP, MIP_STIP);
+		csr_set(CSR_MIE, MIP_MTIP);
 	}
-	csr_set(CSR_MIE, MIP_MTIP);
 }
 
 void sbi_timer_process(void)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
