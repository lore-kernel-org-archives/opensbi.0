Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F52C369AB
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JurBrSI/2du7tiyy8XCsgQmDQ63YtpU1HoK4tjhXCU=; b=POQsYhCYrDCTnc
	phxOXzSZdWSAMkH1Kx7UWMdjco8edqElt1y1cBq2wr3S+6pApvEbxEfjxcffZhTb5dYf7ZV6M08jH
	4of+B/ixUxacFH11zc3ePzhIeVT4hbzdMLu05Moyt5ufKjJhHRPz6CPbFlMhekk/NXPSifqgvAvyL
	Y8FTxV/pdt5LoaG6MymcgIfe8XHZxRv2HBS7wfjGHEO0j880wFR4bc2ktODd3LxhCo6mbK19qRD1y
	TF4foAO98qgXjAqZIh2VxfapzXFgCvE2FIc1o0BAvVeHfIPK8r7PR6N3eGSvxlKo2S1U5n28RpP59
	eyKzkMetWq9xwNilwdkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31RZ-0000000C43Z-1wu9;
	Thu, 10 Apr 2025 23:36:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31RW-0000000C41d-1Dlp
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 23:36:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-227c7e57da2so13459405ad.0
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 16:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328181; x=1744932981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCinSM/GQFzmvQGN7JCodoCrDpkcJ4r1jyjVhme7iOc=;
        b=dcpRlGKcX/rNlbEChCsu41SeuPgK8eVBY2jCiN8dHg+Lmo3nMwFtQB/zfOTEoJ8Ywn
         Pnsb4fzO1M5ENyGU8/2dVTJ+9oG4gqVrJ1dd4V5rVUe+G+vALP1lVoTjXaBf6SbdV0J9
         z83KZR1k9wjxhnWvpjqzMLJLYPBQLTsY5E7NP3eTkBqAir2jhO663MF9XXl7JouqiLsD
         zFxkX7G5fc+h6ng2kP1r48YraM4H8Sq+tyKdZiQYDEL2/gqDYFC4UwrpZPQxizHIRkH7
         ftp1qS1JJLm0QuLQsc/faZjIimgzeZLv3ET/58qzbFSHy4x041jQjQO+IDpW4rY9u9vf
         QJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328181; x=1744932981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCinSM/GQFzmvQGN7JCodoCrDpkcJ4r1jyjVhme7iOc=;
        b=CweKuZ0R5xDKNs+rx7p/P1TBf+HU5zshOt8Q+He8UgjKum4BMGmcNQEa2PqqddYSUo
         IrB7NoadkfGb0y+AfXFQKfsI2sslMChcPfMSWwandC0AoJqdDqzB0Y+wuZYrqD4ljzwx
         AwpMZw3csNlHnyWsbz0lw7f0xhsKIoD9UO/m8U9VlMfVJaVrL7BR3BnB8vvWJC1O/Cuk
         SA7YG9gkT5lWN+BUySPXVSTxHdUboib8UP7QDhYZitqsdl0olqwHNVM0iss/M+GRooR8
         4ndNNGaUa7SgMwohfcUGv/hk+uRUqyL6GGK+n/D0tsxuo7x1770e8znyKS1hmRjeysPJ
         aSug==
X-Gm-Message-State: AOJu0Yz2Yf5eWnEmiC0s0VB2DzFbICdoAjuOquSiMC4LzAIz3NDSpJ0s
	5BX60Q2zyJ/RzhcGysMcI+ls0i7AS7UcCP28LnCBRnfOJoSOukIWCvDDaeZY
X-Gm-Gg: ASbGncsSqKUKxokc4IoAB1VipLMuAWq3toV8INNQfVMCWwmWeUUbMNGhji9OGuDbOFj
	Tdgc/6zG9+XTGRrjqhUwVKy/OnuiWuZ+5SA4ZCDDpRWnBR6Ba4IytFzLNTIO5jQwMv1bozDtzX0
	As4C2NKr/Y+t7P9jb83CO8ALgg4uS4p7i01VaAjguKHlhRVc3IvN7GCIMfcqYd1OMTJiu5CDrv5
	QVxELkNQAXcEfIXv01FnaVCXWWBiUrJr7XI9RK2CU4sHFydJevziRchNs4nJUPatyKkpgBku7ec
	NV6a07bG1bNVL2CRLh5OCx1PURGDDh1N1eAn5j9GAcE+V2c/IRaJIVpwUdzaK9khnrllXzrlcy9
	uPz+9K7sra6EZ
X-Google-Smtp-Source: AGHT+IGnxDysq4iSOKlYWczi7A7z95MJicgjla7SF5mqYvsAw0Ky545TxmuC2jR129pgqaiF5r5slw==
X-Received: by 2002:a17:903:2345:b0:224:2384:5b40 with SMTP id d9443c01a7336-22bea4c3b41mr11934105ad.24.1744328180653;
        Thu, 10 Apr 2025 16:36:20 -0700 (PDT)
Received: from localhost.localdomain (36-231-65-80.dynamic-ip.hinet.net. [36.231.65.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c992aasm36686985ad.157.2025.04.10.16.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:36:20 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3 3/9] platform: generic: mips: add an entry function
Date: Thu, 10 Apr 2025 15:45:29 -0700
Message-ID: <20250410224536.25021-4-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_163622_340221_E1C21581 
X-CRM114-Status: GOOD (  10.69  )
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

The entry function is minimum boot code for harts to execute after
reset, nmi, cache error, and debug exception.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/mips/cps-vec.S | 75 +++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 platform/generic/mips/cps-vec.S

diff --git a/platform/generic/mips/cps-vec.S b/platform/generic/mips/cps-vec.S
new file mode 100644
index 0000000..9309e20
--- /dev/null
+++ b/platform/generic/mips/cps-vec.S
@@ -0,0 +1,75 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <mips/p8700.h>
+
+	.text
+	.align	12
+	.globl	mips_cps_core_entry
+mips_cps_core_entry:
+	j	1f
+
+	.align	2
+nmi_vector:
+	j	1f
+
+	.align	2
+cacheerr_vector:
+	j	1f
+
+	.align	2
+debugexc_vector:
+	j	1f
+
+	.align	2
+1:
+	li	x1, 0
+	li	x2, 0
+	li	x3, 0
+	li	x4, 0
+	li	x5, 0
+	li	x6, 0
+	li	x7, 0
+	li	x8, 0
+	li	x9, 0
+	li	x10, 0
+#ifdef FW_FDT_PATH
+	li	x11, 0
+#endif
+	li	x12, 0
+	li	x13, 0
+	li	x14, 0
+	li	x15, 0
+	li	x16, 0
+	li	x17, 0
+	li	x18, 0
+	li	x19, 0
+	li	x20, 0
+	li	x21, 0
+	li	x22, 0
+	li	x23, 0
+	li	x24, 0
+	li	x25, 0
+	li	x26, 0
+	li	x27, 0
+	li	x28, 0
+	li	x29, 0
+	li	x30, 0
+	li	x31, 0
+
+	/* a0 has mhartid */
+	csrr	a0, CSR_MHARTID
+
+	/* Let hart 0 jump to _start */
+	beqz	a0, 1f
+	lla	t0, _start_warm
+	jr	t0
+1:
+	lla	t0, _start
+	jr	t0
+
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
