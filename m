Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BC4C369B2
	for <opensbi@archiver.kernel.org>; Sun, 13 Apr 2025 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4V2ppVFBZo4g0Ciz/KkPqohtW1zpE7dJPKbJzN1FZ4I=; b=RP+nCDRXL8bZv9
	oW/8AYLKBOsf5FBOtLb+7XxbO9j6bRb4YFjPfuPnKL9YYUr8u60iYAz+nqvdPamRonSlVqx0KfwOZ
	W+HqOleyVzG2NNB5gWACszl38k1fAAO/jnUtAMYj9tOMpNtUDmbHWzOCVSFcKtRAj0mdqN05KOGGa
	zltdOijrkIdnszLiYYH1D7JL4z19y2gyf/e7l+HePwaIyIiDDU4IydmDmp7xgGd+8OHiJzHfQnq/0
	1SthehpRLUY1k1a9WbkA05NSW8vYxOo7+IX8vBkduYhZxPJhZqNxF6Z0YZBgD/H161CtJC88Rzoes
	oDR3AJyYCf9riRrmvpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yv5-0000000HIjR-3Jmz;
	Sun, 13 Apr 2025 15:06:51 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yuz-0000000HIft-1SeF
	for opensbi@lists.infradead.org;
	Sun, 13 Apr 2025 15:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=24ZNN
	k6UvLO7RjcQuH1Rrm1nDoTiSLHG96P2A6R4pZU=; b=Cf1RUxhbxoijMovp3z4IE
	eNXGdKjMJhwP9vo0dWzkvbvJLGI6l8blil0rVryaynudIuzp/0CovvKfBQt5gLFd
	C6SXjXgrLWT/p8+7Np9BklOS50/yLJdzcf78p7Q/8FHQPTLVm6FevY+EBJjAtYNI
	FVpoYhLEe6LKxOmOi9f5+4=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P+H30vtnZUv4Aw--.52201S3;
	Sun, 13 Apr 2025 23:06:34 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 1/5] lib: sbi: fix sbi_timer_event_start
Date: Sun, 13 Apr 2025 23:06:16 +0800
Message-ID: <20250413150628.75614-2-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250413150628.75614-1-wxjstz@126.com>
References: <20250413150628.75614-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3P+H30vtnZUv4Aw--.52201S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrAF13Zr48urW5XryxGFWxJFb_yoWxXFbEka
	18Aa4vgFs3XFZFv390kw4jq3y2kw40ga18ur47CrnFkayrtF4UAr1UA3WkuFykZ3yagFnF
	yrs8GFyFvF15ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNBT5JUUUUU==
X-Originating-IP: [112.83.182.169]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5BcuOmf7rvXghAACsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_080645_791643_36FA01E3 
X-CRM114-Status: UNSURE (   6.75  )
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
index 86e0db5a..7ad12bff 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -148,8 +148,8 @@ void sbi_timer_event_start(u64 next_event)
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
