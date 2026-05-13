Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430B9CD4F21
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 22:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lsQY1qzqrZY8CqIAe5ixpZpoRR4wnUxQIA5aO3ds97Y=; b=vqqEGXeuGOgDz8
	3mGLWPJbIh7XtepQVYzOnmn9COe3iksGsVp44oaV+by4jYP6CKRbqr+b/MlCZttN88d5Z26Z/YbS+
	J+7RDhj92Z3UVRLSLR4LTNAeMM6wLsL6RIcS/z6FefUEP3zkuC3VG1kANoifq3yNLOP6yqMpv4mXH
	aBjS65TFY/TJsJi7V7gfTZfFEkjyCGJe4WWe09sz82KMapkZ0ibEju083FyVZ3lGQ8hTMKPlA6LW3
	l8x8jjumRn6Nw57blAGHEn/K348zo+Bi9HXvq2wBMfzM574L/lcvdBrSETdLbp8aDxkUMuWa9j+jZ
	s7Pn6ctShRVoJWZYKycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIJO-00000003wpD-3qzB;
	Wed, 13 May 2026 22:44:18 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIJM-00000003wof-4C2F
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 22:44:18 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2ee990e8597so12501681eec.1
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 15:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778712256; x=1779317056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzeI4eG4SqG6LXlg9oV6j7TAHsBbxPOLPiWt8B2tXcQ=;
        b=Y+m0fBU0ub33gO9f4z/JejVB6extBKXzsfasAY31Hm+rOAQYopDnig8nRwCiDnkw4h
         MTXl8hBj6J+OmeWusmLmN7M0XHhLGsKXuuJoS1+Maz4XgMFIV1ok9g7cHIsvpSU1IkeW
         Rgjgh7Q36IP1/2It4gaXxvMTAaEUAcOl1XLA3AcFfOto4YEaFrmi2VZJjnMAakpwGCqN
         fmoFNusDdip+eRgV3aDY5VJA82vlTH9cXGRxhNniTn4QjpmjtMLnCz1lvQgu5rdOFyra
         9RqyeH2HOgccL8/jn5HGpB/bR48eoQO9rOlc2neTb6PWJEC0QdFV8z7OrymJAV+BqeKh
         AYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778712256; x=1779317056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzeI4eG4SqG6LXlg9oV6j7TAHsBbxPOLPiWt8B2tXcQ=;
        b=FRuow9EpEB+e9nBIvGlzcVGHcEibPMQnW6nuvdUy72+B8Mxea9xO1ui66FZmQ/eEZV
         gWUM6xRKpRq0iGe0//3XtnxSo9Ye3NHdoIE2UmTuq8dWuhYZ1o9jLnKtS2q+EwZM+00j
         FalSK9fcq3c4+e321HhZTw6DltoB4p1XujO+X6LIMfSDtwYBfSwALk2IZUo/Hnk7dLVS
         IS/MDuZMbf9fisp3xBJQS89V4E1bedky0XT8zkbqBHKGNqZlP4T6yUA4HdunPzDz3IsB
         K2d3TZG1f8tueDkObVKQayVHuRmnYsK9Nu+0yCmnQc1+9urt+5L2uS/IaX7g3Ona2aiF
         58MQ==
X-Gm-Message-State: AOJu0YwmuGvpIHv3Vq67QEDRDFsrhvUXIux9zzJb/3qmvbpx4PzYvxyL
	CMFvkKH7uX6DrCNC1Jqs4z5DljJ+Gs2VnPzEVCvXSP/I83AJDTJ2FdtB+Czxaa9z9jsH871kPDS
	+yxp/WmbcaIlKrGEn99pg4Xvjf+8XJXS0hcXaMkpNRU7TimQSkg7IMDUa/VH+f6eiwioDGvEzw0
	MsmfP4fDlHastPbyjTY3XAp2OM+DS10oubsM+9cF+RI6QfqbOelR9/uvg=
X-Gm-Gg: Acq92OHUzvvUumRx8XAru2UlPghLD4IlToRJO0SNj+WL/8UguzHZENvIxHTI4ihHq9K
	KD7Ki5Y3C9ykRSMciRrYjyEPjo9eerGF4bQyIVshG0Nt2Y5EOqGxrqQWcoJd3EBQCVKMProem6c
	xqzYPMJDOfDa20c6Lt2wDz1Y2An/duAbGpqw6kCmM4OlP7Z0GJQL3pBHFeNnpxybuN8UDYldU+7
	l+qwIpa9jmRqjbFkSpcAKVsBIegSdHsn91RHZCElSJ7hs+PV+h7zKQJhdOrLRKng+h0386e1nML
	Zp8Tl92hftZTdnzf27qOF3lzxFUB0/UartN+0Jb4LSxVRzcUSbGN2ySftjDaGgnDQGt2QBmrGcE
	G+RdYhcA2ys0iu06KErnyC94mHIBtkRbe049UcEF28apH+bxSa9WfeBU5xVsei2o1EkiVzIRzaA
	a+5Cs64IDH5DCxFgChOg/Rax87io5n9hmfcruHZDGPUbLm
X-Received: by 2002:a05:7300:6c21:b0:2e5:8ec2:82c9 with SMTP id 5a478bee46e88-30119391422mr3152085eec.26.1778712255507;
        Wed, 13 May 2026 15:44:15 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6f6sm916216eec.17.2026.05.13.15.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:44:15 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH] lib: utils/reset: Remove unused match data
Date: Wed, 13 May 2026 15:44:12 -0700
Message-ID: <20260513224414.1078791-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_154417_047409_CACC7394 
X-CRM114-Status: GOOD (  11.01  )
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

Some drivers inherited FDT match data from the GPIO/syscon reset
drivers, but do not use it for anything. Remove it to avoid confusion.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c | 2 +-
 lib/utils/reset/fdt_reset_spacemit_p1.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c b/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
index 94ac4162..bb180268 100644
--- a/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
+++ b/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
@@ -104,7 +104,7 @@ static int sg2042_mcu_reset_init(const void *fdt, int nodeoff,
 }
 
 static const struct fdt_match sg2042_mcu_reset_match[] = {
-	{ .compatible = "sophgo,sg2042-hwmon-mcu", .data = (void *)true},
+	{ .compatible = "sophgo,sg2042-hwmon-mcu" },
 	{ },
 };
 
diff --git a/lib/utils/reset/fdt_reset_spacemit_p1.c b/lib/utils/reset/fdt_reset_spacemit_p1.c
index 5312e741..d153f68b 100644
--- a/lib/utils/reset/fdt_reset_spacemit_p1.c
+++ b/lib/utils/reset/fdt_reset_spacemit_p1.c
@@ -102,7 +102,7 @@ static int p1_reset_init(const void *fdt, int nodeoff,
 }
 
 static const struct fdt_match p1_reset_match[] = {
-	{ .compatible = "spacemit,p1", .data = (void *)true },
+	{ .compatible = "spacemit,p1" },
 	{ },
 };
 
-- 
2.52.0

base-commit: 79e63bc8348df12835b5c264144e50d45abe72c8
branch: up/cleanup-reset

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
