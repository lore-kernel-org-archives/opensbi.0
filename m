Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56964C83F10
	for <opensbi@archiver.kernel.org>; Wed,  9 Jul 2025 23:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=As76Cy0NOvYq1bp7XXDrHJrC40LMJ9Bs8H4xYB4vY8Q=; b=t6zu0pHF8JJiW8
	pjqHa96qVqnQwvxYzbqOqEcuLkhG+dLxhkoWgdGfU/qkck/YhQImbYs/PCLwvXgstNwE3Q83EYdud
	0iOidEzHxO+y+PtQmKnGEHHLZzHn6mwAdtud/hkgfvetwhJrjkCYlbuIzZbkxd6K8Ug1Fxx8V8kKP
	rEUQxY/q3A/XxRjmC6WAkLY4eECNTTZPy2iXq+Y1YkBO7+eZLdtS9lixJQQAB+89+e8WYrFWIynGP
	RuvY6AS6VN35DP2KJ17hKk4QJTbV9x4kNCSJZQNg823pmzHr3f9Q6D8T80a8E0h915bBq9cUuFImX
	0+BWqU+f0GFRLayktlMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeDd-0000000AFh7-2TMA;
	Wed, 09 Jul 2025 23:28:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeDb-0000000AFgN-02Z2
	for opensbi@lists.infradead.org;
	Wed, 09 Jul 2025 23:28:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a5257748e1so344417f8f.2
        for <opensbi@lists.infradead.org>; Wed, 09 Jul 2025 16:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1752103729; x=1752708529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dsMFKkZrgcYPKHICoqM6uIrFfZ7oJa/1NQrOVRticiU=;
        b=IuC9t63eU9vLrGrplSVYupXhgejEohunYa9ZO20dLP26jHXxD0ykmEDlbUpk90vESA
         qKnF0MwQ1n/TNqhKpQzYfsYqk/Vv2qhX64ewbn9TbEZ6laCutfrQM6vi+xYs0r9vxuXF
         c8fiF9Q3Kjuw4qrgoOakjCKk0flkM2zSN1O2S0/Kn5KJMiSX7UUQ2qOSMACrr4W1PjSa
         LkglFmVg5vBoEIw1yNWPpT9GoOw93DQgtIz4N3iFcyLdMYfcWUCd0S2NGOXzdtSIXf96
         cTq79vTzQMw59pRkukmzTmzHj1oz7Mm9cbtbv3fAHpy/KP97q6XuEQrLh4O4GIfuless
         a3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752103729; x=1752708529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsMFKkZrgcYPKHICoqM6uIrFfZ7oJa/1NQrOVRticiU=;
        b=i5U51GdRFOLic+UGGjbcb3tFbRC2wam68lFhzQ4tpcSbXNuVx//49U3gITSws7lR+p
         585chgXT6vf/7araJKbwfaOOvNSW3mmg3aTwSbpi0ZDFLW+D1l48hTS9vknNN+ylZ8Mt
         qOrIjKGXpj5xhZHkMRHu5XEnqfem4+HVURc6eT7R5RHh6zf0h7HLl6F6y/cjmVcpvKZi
         jDHAqwhJCTnS6zT77DPPvA5jz8ksBBz3Iffcm+vFyky7GSO/oX1T+Zlf6ZSYOxQclHYY
         6aKb18ZeySh0M2siOWTe21mxaJE9PGkyJPuVijoIMzccrCUON3AhGk2kgHNAvwhYpWtj
         1Xzw==
X-Gm-Message-State: AOJu0YykPO6svhtESCDhhVIEb/wlRZr+2PQqbjAe03e/782Q2v3iSJq7
	uyVCCvxosD0UEJtffG8vIBZ4D8uRaLQVYhL9ztUYCqbIbm6XrOg6pigPpT/CCU91ebkoiYWoLW+
	iifrg
X-Gm-Gg: ASbGnctOcilLuNxTabT+DD70FRwkgTisWulEIyHqxZQjaHmlG7Jto2RzYybShSCdLZP
	orsqhblFcTeyygBLP6ukTJZJ8R2HFj9t9ZPAHKlQj/BOnsT2q4bYqcnTV4UZYLVS85ZDLv9zKB/
	T+UHO+UqI9WEO0E1LHs6geGEZX9Q2m78GBkIIUS+pSmIWzoYrPBOvJzubWkSFp9jn3zZsfbsV9g
	X92pDlV18UOPuBk7jGbrQUY943JCeRpoEnfAn7zqHxIdW98avcqmS9L6P632gQpDxVmKJiOT3W3
	LgYPp7KEI8rTluSRkccYnczP00g1r1UNjerLY2I7qT8CfgT4SG68md38KGIKHnclgZGVlyYUa1f
	RRxc2trnm5M7MiFminAne5IthjNUWj5cQyiVDBKkgqjvBCww=
X-Google-Smtp-Source: AGHT+IECXsGZFC7rmryV9vi2Fgo6FHGUullWfqmCqy5gBOiX6X9E7loI4i/9EvgPEBtvwYkIO9UuNg==
X-Received: by 2002:a05:6000:4a0c:b0:3a4:f35b:d016 with SMTP id ffacd0b85a97d-3b5e866c919mr507015f8f.11.1752103728978;
        Wed, 09 Jul 2025 16:28:48 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.localdomain ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2087sm242143f8f.30.2025.07.09.16.28.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Jul 2025 16:28:47 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
	id A389CE7BE7CC; Thu, 10 Jul 2025 00:28:46 +0100 (BST)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: opensbi@lists.infradead.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH] include: sbi: Don't use #pragma when preprocessing device tree sources
Date: Thu, 10 Jul 2025 00:28:39 +0100
Message-ID: <20250709232840.37551-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_162851_065217_B841753D 
X-CRM114-Status: GOOD (  10.90  )
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

Since this persists in the preprocessed output (so that it can affect
the subsequent compilation), it ends up in the input to dtc and is a
syntax error, breaking the k210 build. Ideally we wouldn't add the
-include flag to DTSCPPFLAGS in the first place as this header is wholly
pointless there, but that's a more invasive build system change compared
to just making this header safe to include there.

Fixes: 86c01a73ff9d ("lib: sbi: Avoid GOT indirection for global symbol references")
Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 include/sbi/sbi_visibility.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sbi/sbi_visibility.h b/include/sbi/sbi_visibility.h
index e9c401c..f900c44 100644
--- a/include/sbi/sbi_visibility.h
+++ b/include/sbi/sbi_visibility.h
@@ -7,10 +7,12 @@
 #ifndef __SBI_VISIBILITY_H__
 #define __SBI_VISIBILITY_H__
 
+#ifndef __DTS__
 /*
  * Declare all global objects with hidden visibility so access is PC-relative
  * instead of going through the GOT.
  */
 #pragma GCC visibility push(hidden)
+#endif
 
 #endif
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
