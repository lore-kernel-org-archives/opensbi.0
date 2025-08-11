Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85559CA0ED1
	for <opensbi@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dLzTfcfvz3cZxhchxQuL0QUGXHzzS2ZepzkI9+4HqOw=; b=NDUggaonSnzkeL
	5a+7AtNOamb4ztohJzw3k7yjxsVoWkMJKJd64W3ZYyzvxqYlG90LwMmuIG/JflKC1p1hv3QZlwP0z
	iYPcec2ZKKrFBlK8L61DTIDlYp2p9vgNcweidB1E9cACP5Aa0gAE2rvju5+NqDORLXnO26EOLEJjZ
	cW/+gMhkKm+miSiWOlcABzDk7w2MewOXH0nb0JYBEL5CU8WXuNqU9zfGS91AAvQDeiEWpS2/XSYld
	MB2t5+RdRD4DYNgdz2VCAHKj0J8aVFx0EUxDR5DXPaYATTodNoIOhNkYzi/+7WLjhsxwLDR1K98lG
	sCjVSnxdZqOEyaZ3s7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaaY-0000000992F-1Nuc;
	Mon, 11 Aug 2025 22:01:54 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUTC-00000008Ckf-1Ekm
	for opensbi@lists.infradead.org;
	Mon, 11 Aug 2025 15:29:55 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7e691926a6aso470881785a.3
        for <opensbi@lists.infradead.org>; Mon, 11 Aug 2025 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754926193; x=1755530993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol0JAVqviD2q4x/of4QxljWLpV4NoQGQxtXYRuyg93k=;
        b=PGmiA72F1IIJS1AVmbPr0ksC31QWbsKLs7V+qKHcPc9q13cq1aohM2zkx1j+0mX0u1
         c1oV5zJ2j+UQBSgIwoMzDvJrdoTqpFwEFTyzqL9iaNIBT5ILs1sKWjZQS+drM6IG52BX
         bp6A0cr2LZbkQ3hjYFni00Yjx/ZCOcqyyUjcIwBw0ntPEjWwvxokfFMaEjpliPIuBfZv
         1NdgJRxVIDRLn25YRGpt9ij6RCjApAYNhrdXzpcMP2BdXYG9BeyDicLOOOXVCX4IoDpv
         Tn1UEHTeEFza2rhGs+oTf6NqZOQEfJf0KlTQaBULvJ0gj63EC1j0Ys8Jx/BySWRe7XwE
         AsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926193; x=1755530993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol0JAVqviD2q4x/of4QxljWLpV4NoQGQxtXYRuyg93k=;
        b=VmvUkloJuW/V0wf5leQB0NaWs6QD1p1XfvyqpQkWe6uihXtk2OgJdxmdI72OYPMVtS
         ED9OwPbpWCTMCGw0/To9hEpgmD2Qfc3ueQk+F2sHC2pU8twhlD/8djw5II7dT6+mAQtm
         ekyBm8vVsiPXf1bPrB9bWsvftqAaP50G8yaxKfc5fmb+dHu5vZ7G/+lIKLEutlN/Mr+U
         mpOmbHXuXSU7LPRlPwx6nj8G0CWOulT05RJH/d2dBNA2dY0Vch8O95TR9ACxcVQkrJh5
         SJ11wQg8BDBflsOGHgGu3kLYJtWpDCwuefOVU2cH2xYktJ9yhi7+QrrUtXs/1zSx2w+x
         v1yg==
X-Gm-Message-State: AOJu0YxUF11r9Qzy6dlpQRn6oHeNwodCenkbOnBDj2N7jOTl6ZCHtQkw
	gilq6SW/ASve33a/u8WVV4OIghtba7tNFsmcKm1KNlvUgH69Jjj99jFD7FP0N298HOy4ZrqPoMw
	0voix
X-Gm-Gg: ASbGncsHSfwEX3TIYWJTV63DSxaD840qqhKXM1+WXtBzOm7rmQvtysr6L438asRjOjE
	7MknF7l59GlUUFlgt7R4FZqFYSboFFQbiUL+jM8y0C4aTzEQ/yOS6bWhzYG1wmchNR8JPAK/q3r
	0FhQb55w9lnaySUbZi2F4zQEcIWhwqfOZfZ/fVJUudlC4hS6ut/IxC2OZoy3aIkOCUWPo0glU12
	fdxnT4uUqFhyCkFPn5MvSt/Y5yCMkqAYeFhGLDTMBOWUMPVYi9NRXPoSrA3CxcO637qYDYqRs/c
	KJIuxgvKmqrwauOc5xRQaGgNbClOf+NOL8gqxmKZvYN63cv11CNnFuJpT+r/0vwIyM/d5ugs4Dv
	nuxLBvxaXEiNmCKogP9zX1uodW0e5mzrJJJbjaqKeh5OXjwxC2BPQnC2aBlDKn0Cgn8ywEW4hbv
	AoBSZ/EZ/mdE9OXRX4
X-Google-Smtp-Source: AGHT+IFvXAIC3lE2/+37trhQr/EqRZkBoFIIXD4etx+IEuNS98BTCU2RUAiTPkDoRjahXtCn82qVtA==
X-Received: by 2002:a05:620a:904:b0:7e8:43af:e884 with SMTP id af79cd13be357-7e8587e972bmr38598485a.10.1754926192796;
        Mon, 11 Aug 2025 08:29:52 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e7f7e277besm1193407985a.57.2025.08.11.08.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:29:52 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH v2] dbtr: Fix sbi_dbtr_read_trig to read from CSRs
Date: Mon, 11 Aug 2025 08:29:47 -0700
Message-ID: <20250811152947.851208-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_082954_334067_E3B6BD26 
X-CRM114-Status: UNSURE (   9.39  )
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

sbi_dbtr_read_trig returned the saved state of tdata{1-3}, when it
should have returned the updated state read from CSRs.

Update sbi_dbtr_read_trig to return updated state read from CSRs.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V1 -> V2:
 - Add back missing cpu_to_lle
---
 lib/sbi/sbi_dbtr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index a832c7f1..c6b04aab 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -529,9 +529,9 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		xmit = &entry->data;
 		trig = INDEX_TO_TRIGGER((_idx + trig_idx_base));
 		xmit->tstate = cpu_to_lle(trig->state);
-		xmit->tdata1 = cpu_to_lle(trig->tdata1);
-		xmit->tdata2 = cpu_to_lle(trig->tdata2);
-		xmit->tdata3 = cpu_to_lle(trig->tdata3);
+		xmit->tdata1 = cpu_to_lle(csr_read(CSR_TDATA1));
+		xmit->tdata2 = cpu_to_lle(csr_read(CSR_TDATA2));
+		xmit->tdata3 = cpu_to_lle(csr_read(CSR_TDATA1));
 	}
 	sbi_hart_unmap_saddr();
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
