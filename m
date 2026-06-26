Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B00CDE00B
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 02:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ye2qeWRZy/HZsj6Lrls4keftnqO44wgrR/+oaVnaFno=; b=PGW/lUOlkJqfON
	GYnFi7f4jYFdscEjWyzRKEOHzWWEqawsDBGFSIlh5AjwjTPeWPIWuxnP3/l4PKz8Mve/d8dRolZ0b
	2EGRLMxcB4VQyDL7HcEwlhbl3Ds1RG+16PagJlDQ7iSKROxX/JJUeLRK3ZQpJ9tlu1OCMIsCvbqQY
	eOzqLvQTS0o4Yvy1V4AU/LqDhHMdw8pdyCrQkHZsvNE7HHhbDCfhTGI7wZKyUAjccpmxd+56EF/SU
	mItv8frenfTGV60Il6VoeTvNzXiC1+tplKdT6MTZilbHAI6xXdUhaLSMyNzZVz5R6lYzAUG0ay5SA
	+NoY5/ZIsepG9DjCw4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwC8-0000000AGYv-2stv;
	Fri, 26 Jun 2026 02:21:28 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwC5-0000000AGY0-2ROu
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 02:21:27 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-30c9d648a3bso125779eec.1
        for <opensbi@lists.infradead.org>; Thu, 25 Jun 2026 19:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782440485; x=1783045285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lYi4gN+CHeThTUqmpDgPBOitDWCP89qf8dQGjUz9Zo=;
        b=GoBOflseEUgDD7q2gSV6y3I0V5qwfaybAc+1KYZwmNhpkXkuc6nfpeBzZAlw+qwmk8
         cZiRMLDYO1kvjTjNTHUrsLVLmFYKTkeNlR5ZNcyh4RHEotcqo1NHnwGP60W2zxn6mMT1
         fyA9JiZfn30tA9nmCVcTEsHmkD8CiajJ3Gt3BqOPnFh72UrwWppG63r6oeXpbSHtK7KP
         pFEkhlINzFnfjP2Y+VeieuNgQYKln0liwksMholO9+Yz+eqp1EOmjF567cFCCSwVvmwc
         RugNMuZII5hWPoOzzMerD4ftM5D5777V7ANQjkAYlSLUmPGkkizhP16CTMjeZhv4Rgds
         T9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782440485; x=1783045285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lYi4gN+CHeThTUqmpDgPBOitDWCP89qf8dQGjUz9Zo=;
        b=btQWyYpYbaQHW5ruku5HFfB9f3DzaBhhgcbpk7p1CQZg9TfPuXfntSJPkpZ59cPgNk
         bYktY91Ag66ugaqvqAg+JqFciVPLsCQFS0BYJHWSEfaqeBD8ALz9jX7dtURVkspW5y+X
         d6IDXFlTeS3Fr8PCCpPDVZwJaxrCIr8Oh2ysufLfUH75MVouaj+VzBDJtWujvIUNIGuI
         PD4whBccje/7eiHyUiREUDLFaDC3OaqhCLZHPjH+lR3Fnh2V0KFI+IRU37UyTq3Q/iLB
         zBUnTiwPxdmGEY7Tp/3woB8Vh6P+UgYcghRAQgn5nsaNOgS0e6z4saMDyn6cPjky5ZEA
         raPQ==
X-Gm-Message-State: AOJu0YyDORYTIIXGFEGv36/+E+b7qTf9HYDbVv4MdRcLBgvsLG6rNhFK
	/mpQEMYjycMaHRm5Xq3/LF3/fJ/9gESNVUEvpxIOdNmgcNzkkZLBbJQgKBe5QfSd0l9jjhQQGai
	7FcINxXxvMVV0c5kgXaFjbdAhLJg3vt0ERmp1agY29uCPz/D5j5ocgJkB9lBq2UGvNL31CWEG9h
	TaXk/J1i7LTJFF62tBmW9kXBDoslhyghJVbQBvCKFRSPtX3Q==
X-Gm-Gg: AfdE7ckKARTw6UEOM9cHwaqSh88PlXOQmLzK9vGhoHRpL7qoR3t+awvxTiPxWSz7El3
	JurvOAeb+d449Qn27zQficptmIS1nHS5SwKK+zTZx0d8in1SyxnIjzdxaKhZG+9jllxaMetPlbn
	SgznKifkKVUuNvBhPRNIR3UDf6cMQ8a5UuXoezXw6y8gJYHrAdd+sN1d0QiQ+iym4OZi6OanZkn
	GoV4iGFdBqGlSYf4j7yXYDyKALoQtqP0jsQNA4728Q9mWzzZBLuTRIWTtPLSL1jr69zrpQcmA5j
	PwpblkSXALEMMgZcwdRmmOwQ6KhsiT+3cpkAzNWY/vjc/4JyxoGmQR8XK9liXBxpoCUT7MYzm2w
	/dCzC1PurYCJhD6LMytpjytm1elOkekkV8dJ8RgT0QQN8dH5f9OH1EPcznVOV2g8i6NsuTUQfeJ
	IsAPLjFNnGpB4Tt7bAPtYasHAp
X-Received: by 2002:a05:7301:5f89:b0:302:b44b:b64a with SMTP id 5a478bee46e88-30c85467c98mr4688738eec.1.1782440484329;
        Thu, 25 Jun 2026 19:21:24 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8afca8sm12594718eec.17.2026.06.25.19.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 19:21:23 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] firmware: Fix comment after relocation completion
Date: Thu, 25 Jun 2026 19:21:21 -0700
Message-ID: <20260626022121.1885209-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_192125_630574_8213AB2F 
X-CRM114-Status: GOOD (  10.24  )
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

After relocation is done, the code is running from the load address,
not the link address. Fix the comment to correctly reflect this.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 firmware/fw_base.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 5d6540d7..0c5c65c1 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -93,7 +93,7 @@ _sc_fail:
 	addi	t0, t0, (__SIZEOF_LONG__ * 3)
 	blt	t0, t1, 2b
 _relocate_done:
-	/* At this point we are running from link address */
+	/* At this point we are running from load address */
 
 	/* Reset all registers except ra, a0, a1, a2, a3 and a4 for boot HART */
 	li	ra, 0
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
