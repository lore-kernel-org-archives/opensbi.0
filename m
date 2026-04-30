Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4589BFF8875
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 04:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/iRiLKDN+I/hfCcnTfr0hOmad53lMc604Kn3zkLCPo=; b=FLYHX7IowjiH7G
	qQ5zFsYTd0UYbIr5ZdYC4cbg40JqxjUUAUxTv0TiJA5G/X9/Zgh8UJVmbQlABWtf2/Au8Yn4NIfIE
	nzLqdyea926LS2ZJH52N21XKgKVhLylb1oKLNgrBmfPTN61OWJGlpLgMie5w9HI9xFnJjOcXGsiYI
	JZzi1IV3aTGIRz8hxWTuNA2f7vTNMSnwL1HMfEpXBZU9CMajWqjYERfBHPgZl1ynW9vT4pRlyeStk
	qT0dHtBsfsyYlLCSJAVevTwTgZHqXHfkmi5X13gTW3FUIk+MLNs7L4H6XVafiFzrmd+gInSDk+5Sx
	fSpxODEm9xCuYvuA3Nxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRh-00000004gGf-204K;
	Thu, 30 Apr 2026 04:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRg-00000004gFg-1xsD
	for opensbi@bombadil.infradead.org;
	Thu, 30 Apr 2026 04:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hZxnkrx+q3r3GUhvWqZ8MCXy5Ku/x8WkE9Au9n1POVg=; b=FnycCKWj8pqYEYNJEccYhvjrtt
	w5MeQYjZ9rwDPeNWXHJNZzE38tQXoLeu76FVy6w/aoL+8V0nFe1QcTBKu1GIzaK9vcK9cfU3KS9cf
	RyM5G5ElYipySlSs+LXiKdjKaO5vGbQUHbh7TBmvI0wS9SUe0W4mDCtoGsnu9JIuT+FLxu0cYZO9H
	xlGXDLnOgUVXXDzlMkobwVeoN0yb2gX9Hub6QFQ0z+xRZP+inpZW00SDHEvipYy9Jx4pH9O+Tx9T7
	5ZpFDoC5OaUft2HwlLYSYKqhgS2pQQtA3d7phyXJOjVk4mbY8KDiRmp6nQK3o15IdYBshABnmiUg3
	VhhxA1GQ==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRY-00000006ddL-1V5v
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 04:56:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8296d553142so309725b3a.3
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 21:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777524965; x=1778129765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZxnkrx+q3r3GUhvWqZ8MCXy5Ku/x8WkE9Au9n1POVg=;
        b=rmrFiksiW2eaQ9XXZMpGLdfPt7FOTDDd+SBxooRW3xtHJ4xFp7flgf+4JsQjcfSti8
         AfcVX5/Cqf8Qr15wXBiNTETs66JGg/m75miuZuwUAk6FM9mK8T9g/7umkbP7Z8lfS/gQ
         lIMH3KlN/5E/6Nvm2NBmsJ6+DDir43o24BcwX1lPucXJppfyxrtO+VBQopPToX3h3ALR
         hD/B4wrFjAr7Y8m22hipeXVOlpcZPf22E7oOmD0AeuliT3v7/iuN7rIZv49yMhI2gJ6r
         Z2jod/s8He7tZL3gIKALOtHreDA0VU7VWg7ZKSx0Xbg1LwODpsHAM+k6hJSeI3M/xF2r
         FQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524965; x=1778129765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hZxnkrx+q3r3GUhvWqZ8MCXy5Ku/x8WkE9Au9n1POVg=;
        b=XXjBuya5l6Ybwg+uTaX8u55KzrXwtzj28TvquVt13gn/rdfhEd6yE1tWZ4we91LJC8
         q+Odwqy7IqgdSiKqCxaGW0tJOv50zVc+gzLtORPUPaXYoRx+kF8C9n6sHuxr4NM19k/J
         jWToKTBb6qQTxr+c/5+pTtRjxXPxF1U5bv3wSDT/8l3slxTGwmEB8QSFicFnnuc1ZBC3
         Dpu/o1qRQ/AkPKHGz8WPwLdjfy5WOG0Jj5XaNQetVy5RuyzijhqEoMw1p5eUP8NpGSYj
         J4qIIHyQmyuUZT/3k5ThWmbK2BpAzAQvTQbuFgmQuAC385EnVt6H5QSxkAPNf4Kae09G
         +FnA==
X-Gm-Message-State: AOJu0YzktZR3IL37mIoZZLD6MzHuZ61OLf8cGJN7us7OeX62LyH71MFI
	gT6Qpj2NKr+T4qvJtrAeBNc+CxSFklUely88U71dwJUE8yZ+0rBeRPkgBBkQow==
X-Gm-Gg: AeBDietu5dGCL+s6jGZwodzv+X342FCiA3aQLUePWDCcdYIHYQMFKaInYR+44P1pU37
	7EN5mf1qL8VwaR6izNYjGsWlT6pEWbI6D9MdgygkUx08+Q34Xk2fAatgboRvVTgkZPnuaJRKNoJ
	Bxx/U6DMdAWtHkhwY98osFEc+WO87+gQV+xc/wHBpqr7pYYp5K47rPoAzgQ71m3dj6CEQeuqwEL
	7lZPdsrPdgVG4IKq5EyRYJY1JMwBg1KO4M+A4eY/LcenaghUQE9TjCyKWRxH17MtkWBWYpNdsXx
	gTklDYyRpSNeeGA76qXc6gj9ltYoRp3iwWZT3Vs+6KSO1E6DxDvi/hHVSufPYlBqk/FWLzX2VkW
	uiONE3R8sb7k9jpbzAD0Gkvf3Oyj47YFbMo1aCQ72YVRclNgrHXkNSD/0aEKPWBdV362rxY6KKG
	AoTju+oBHnqdwx5ey0ym/62e0+E1QCGT3+J9efyEwRiMs=
X-Received: by 2002:a05:6a00:2293:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-834fdb55e67mr1743400b3a.4.1777524964816;
        Wed, 29 Apr 2026 21:56:04 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80dfbfsm3780665b3a.53.2026.04.29.21.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:56:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 5/7] lib: sbi: Add pmp_is_enabled() helper
Date: Thu, 30 Apr 2026 14:55:23 +1000
Message-ID: <20260430045528.420437-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430045528.420437-1-npiggin@gmail.com>
References: <20260430045528.420437-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_055609_253649_395BCB00 
X-CRM114-Status: GOOD (  11.54  )
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/sbi_pmp.h | 1 +
 lib/sbi/riscv_asm.c   | 6 +-----
 lib/sbi/sbi_pmp.c     | 9 +++++++++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/sbi/sbi_pmp.h b/include/sbi/sbi_pmp.h
index 66a5cc75..bce62d22 100644
--- a/include/sbi/sbi_pmp.h
+++ b/include/sbi/sbi_pmp.h
@@ -14,6 +14,7 @@ struct pmp {
 };
 typedef struct pmp pmp_t;
 
+bool pmp_is_enabled(pmp_t *pmp);
 int pmp_encode(pmp_t *pmp, unsigned long prot, unsigned long addr,
 	       unsigned long log2len);
 int pmp_decode(pmp_t *pmp, unsigned long *prot, unsigned long *addr,
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 2fb0f585..c0ad4dbe 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -353,11 +353,7 @@ int is_pmp_entry_mapped(unsigned long entry)
 	if (hart_pmp_read(&pmp, entry) != SBI_OK)
 		return false;
 
-	/* If address matching bits are non-zero, the entry is enable */
-	if (pmp.cfg & PMP_A)
-		return true;
-
-	return false;
+	return pmp_is_enabled(&pmp);
 }
 
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
diff --git a/lib/sbi/sbi_pmp.c b/lib/sbi/sbi_pmp.c
index 91eab87f..75b18764 100644
--- a/lib/sbi/sbi_pmp.c
+++ b/lib/sbi/sbi_pmp.c
@@ -28,6 +28,15 @@ static unsigned long ctz(unsigned long x)
 	return ret;
 }
 
+bool pmp_is_enabled(pmp_t *pmp)
+{
+	/* If address matching bits are non-zero, the entry is enable */
+	if (pmp->cfg & PMP_A)
+		return true;
+
+	return false;
+}
+
 int pmp_encode(pmp_t *pmp, unsigned long prot, unsigned long addr,
 	       unsigned long log2len)
 {
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
