Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB8EC3ABC9
	for <opensbi@archiver.kernel.org>; Fri, 16 May 2025 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o/ciclc6J4u4fWC9t7HRM4tjLoarNaHbgdlpy7i7hts=; b=E9ZCSuBKvI1Y9y
	S+n52qalGNzUI52kEcBJY9m9o6c+OvuLAIqaPv3uY6H8dM3C9iopqZ4X4bp/9m9sf3nB839bwG0CY
	DDqPsbFeFDxRHfhsVZVIO9abo+P+2aLVfdNeUjnAUZexEyfesgZmJNfsW5Z7jEsSd9DX+oj0hPDV8
	4PghGgB6ESDUniHSjcoyvO4ZuvJAZxHzsT315Jv6KRchVjUKEhWAm0Ja+Uc4fPoSc+Wcq9OYP7vq9
	rJvFTv58bcdadTDaJM52VHKFHbm+sCdLI8QZcF28JRmrPgWIwnEyetVJ4bjzXBYgmTRqrQO9G+L+x
	cx71j+jCptYuknspK8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuDE-00000003Ne3-3ap7;
	Fri, 16 May 2025 12:30:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuBL-00000003NK2-2ebg
	for opensbi@lists.infradead.org;
	Fri, 16 May 2025 12:28:56 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7426159273fso2119668b3a.3
        for <opensbi@lists.infradead.org>; Fri, 16 May 2025 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747398534; x=1748003334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yI5eI17PZVsjJqXfUuDS4miPxxcG0VsYIrzuQ3oSY/Q=;
        b=J8SY6b3uU0upYrQ+VAnOYCjme+RtfvADvL4mLrkDfeLbuESTFXXbDweIMgSvtUPyIK
         b4uBugPhKky4GI3Y36ASSiqEcpXoVCBlspgqrKNesmqpBvmCz3sV8c4RtY4rEbvBzUzT
         eUmdLEmZBtnPShkzRcRR4fULDmgzsLG9RxEXaH5Aa4Q5YKTMCZafohkix67nu2gqE4CV
         DXAGOZpb4P61Q4rkz2e7Lo72ITgFQAxTG1TuwI0GMh7gbjtqfuGgXiUxgBaRcTuArX12
         /5E0dHO9AhoJxBASU3nGSs3pduhmEREtxVw844SB75KfPUSNctVdDQrLfAOW4VbC2mw8
         /rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747398534; x=1748003334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yI5eI17PZVsjJqXfUuDS4miPxxcG0VsYIrzuQ3oSY/Q=;
        b=kq988B+rvXYa/a8MayHeJauxt0LGCjr/I9Cas2y2ifNn/qoOzS/LufrIeDhR+PVINI
         yp+NFXy7WzE8p5gHjjcdMq5/3HREEVG8lxQvd5v1BrOysj0QBgqfcjtJN4TA+vpn2/8X
         m2ncAHOvlgTOS1qLn2qKlwDuFMAaf7wXdLEXnsBpnnK1rihUpU1Ikc3qiUxGj8pCdkNM
         g4c86HgZymHeGtir86zEpaj2RI9xbh6hEHAtMePxYNK14QbwSq6B2u2BuDuNrZxX1TnC
         7dFdhx9HpMG8KiYYphgQRQ9EqS7Dnt/OxJ9yiuA2T4LQ3QteX2hoqLjEZ7TmEG695fRg
         OmKw==
X-Forwarded-Encrypted: i=1; AJvYcCX6jJV3RkvjMbAc6OxOwDrwyHzdD5MAF6bCCW3r6ZljazJx7+MXc/SY8URlIhfqdhvzdSqEaXiK@lists.infradead.org
X-Gm-Message-State: AOJu0YwyocvlibpfOPJ2JrcS2wVaKDXBv7dHt/INDij6//HtdZU1nieG
	q0ZBlegHttROrdfQH7zYOe7IHfG5vPMSu78Aowd/WEenpugbo4oqmAprmA2zLsdrwxg=
X-Gm-Gg: ASbGncs+iUboNn4oSX3XIMV/xGN33uwYcyOXrUGpAuVoZ4n66vfRxrNGQPnoqNdw2dX
	j3/mNWAwpjFOu0p05qzXD9ignyJlo4m/OJGYDMbi65y8iB8FmVw32p7gKbt6NG2VBlk7F9We/iX
	+ZWpPleQL7VQUROsxVXBR7LV8K2GQ7ykECNDPchYdbb0oXK8i8r6NAjTALBrkLHqmWLNdCbLMS6
	nlJJ2rtd24pxnkujh3zOOPq/HrTeDH2Q+r5JbrmvbtpekGtIG2Wt82p8PWgwe3YwwP+3CM5wygY
	3BisLID/EUmzACX6LCLcrZW2N2G8lK/Nl02bY4tmYZpKt//VIqyulIkPCNuTtGlJMhxxX6RK79D
	nYrMZk4w/
X-Google-Smtp-Source: AGHT+IEnoxOsSA04HfhggiNwA9Bga6QfIbqQb3I3TKroOM9KhiK0uzM5L/qbzRr+ooovZT8PquFYsQ==
X-Received: by 2002:a05:6a00:b56:b0:740:a52f:a126 with SMTP id d2e1a72fcca58-742accc52cbmr2797231b3a.9.1747398534174;
        Fri, 16 May 2025 05:28:54 -0700 (PDT)
Received: from localhost.localdomain ([122.171.18.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a985e290sm1381616b3a.124.2025.05.16.05.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 05:28:53 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] include: sbi: Change SBI spec version to 3.0
Date: Fri, 16 May 2025 17:58:44 +0530
Message-ID: <20250516122844.113423-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_052855_669228_2E8B70D5 
X-CRM114-Status: GOOD (  10.64  )
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

Now that SBI v3.0 specification is frozen, change runtime SBI version
implemented by OpenSBI to v3.0. Also, mark extensions defined by the
SBI v3.0 specification as non-experimental.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ecall.h  | 2 +-
 lib/sbi/sbi_ecall_dbtr.c | 1 -
 lib/sbi/sbi_ecall_fwft.c | 1 -
 lib/sbi/sbi_ecall_mpxy.c | 1 -
 lib/sbi/sbi_ecall_sse.c  | 1 -
 5 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index 88a69bb3..15400e5a 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -13,7 +13,7 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_list.h>
 
-#define SBI_ECALL_VERSION_MAJOR		2
+#define SBI_ECALL_VERSION_MAJOR		3
 #define SBI_ECALL_VERSION_MINOR		0
 #define SBI_OPENSBI_IMPID		1
 
diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
index d28fd396..9c496c42 100644
--- a/lib/sbi/sbi_ecall_dbtr.c
+++ b/lib/sbi/sbi_ecall_dbtr.c
@@ -69,7 +69,6 @@ struct sbi_ecall_extension ecall_dbtr = {
 	.name			= "dbtr",
 	.extid_start		= SBI_EXT_DBTR,
 	.extid_end		= SBI_EXT_DBTR,
-	.experimental		= true,
 	.handle			= sbi_ecall_dbtr_handler,
 	.register_extensions	= sbi_ecall_dbtr_register_extensions,
 };
diff --git a/lib/sbi/sbi_ecall_fwft.c b/lib/sbi/sbi_ecall_fwft.c
index 3519285e..2277405e 100644
--- a/lib/sbi/sbi_ecall_fwft.c
+++ b/lib/sbi/sbi_ecall_fwft.c
@@ -45,7 +45,6 @@ struct sbi_ecall_extension ecall_fwft = {
 	.name			= "fwft",
 	.extid_start		= SBI_EXT_FWFT,
 	.extid_end		= SBI_EXT_FWFT,
-	.experimental		= true,
 	.register_extensions	= sbi_ecall_fwft_register_extensions,
 	.handle			= sbi_ecall_fwft_handler,
 };
diff --git a/lib/sbi/sbi_ecall_mpxy.c b/lib/sbi/sbi_ecall_mpxy.c
index 03ac71b2..0a5e3525 100644
--- a/lib/sbi/sbi_ecall_mpxy.c
+++ b/lib/sbi/sbi_ecall_mpxy.c
@@ -67,7 +67,6 @@ struct sbi_ecall_extension ecall_mpxy = {
 	.name			= "mpxy",
 	.extid_start		= SBI_EXT_MPXY,
 	.extid_end		= SBI_EXT_MPXY,
-	.experimental		= true,
 	.register_extensions	= sbi_ecall_mpxy_register_extensions,
 	.handle			= sbi_ecall_mpxy_handler,
 };
diff --git a/lib/sbi/sbi_ecall_sse.c b/lib/sbi/sbi_ecall_sse.c
index 303c0f2d..b7dbf072 100644
--- a/lib/sbi/sbi_ecall_sse.c
+++ b/lib/sbi/sbi_ecall_sse.c
@@ -59,7 +59,6 @@ struct sbi_ecall_extension ecall_sse = {
 	.name			= "sse",
 	.extid_start		= SBI_EXT_SSE,
 	.extid_end		= SBI_EXT_SSE,
-	.experimental		= true,
 	.register_extensions	= sbi_ecall_sse_register_extensions,
 	.handle			= sbi_ecall_sse_handler,
 };
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
