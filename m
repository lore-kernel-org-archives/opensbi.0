Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3F4C3DA6D
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JurBrSI/2du7tiyy8XCsgQmDQ63YtpU1HoK4tjhXCU=; b=P4tnQuDCzca5kX
	gnyJoGcbis4YSexCn75hzZaiYfKTRncXg4qV/M+MnG0CskZgSoiWGHg+Bzt9fKqh0anB+XP9kx+Qn
	xt7qOyTcHDItuWlq+aP2zEbR1JcPF+FKNwr+fSYcbvVXwKGLpWKJ7IRRrnryYlXGcOHAxOPtrmGUD
	ajVsZBSOlfvk/MOz69GIYNqhiRsy81Tim/vBs29HHTHL36U8qP+Dukn1zaiiKFFOPwEK7ymSIqY4u
	JQcChOE6rqBcF5Ib0RYsEwZFrJoGsHXOVQHvkVAPchsfVOnG1Q/IikfoQ3N9lSKAO1pL8PESmomn1
	6czpwqBXV3BNtbANZI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vp-0000000AgBw-3kam;
	Mon, 19 May 2025 21:59:09 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vk-0000000Ag9K-00KE
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22e331215dbso44769075ad.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691943; x=1748296743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCinSM/GQFzmvQGN7JCodoCrDpkcJ4r1jyjVhme7iOc=;
        b=cEUQYvcutdOrldguLENTm7SXQo+TSi88xuZb9K1e1wLGYyjR1ip+5S7X6wHG0V0oES
         5+b6BS0Yum4bCqgrMRUvj/98oTeUmPme47sYpzGmVo49v3ZTBl1HFBr+aoFJGdHHnmbU
         G0nlhVJhVk0EMNBApe40HYl+NuG4YL4ukITzSaRDD8klkXDQw4BEqDvPKkDFNX0W1S+f
         HfkkXOMiNgrS5BaPLYDSrrDU9/TqzQau67IP8PhALHH6TphyPFNbwcjQFfkhPa9C+QS5
         Qmb0UilHF3c9MZZyIIJeFuWOWkH+4kg0jcRF30vBag+MR1Jdcx6YdfAFuvMbxYQKSVul
         0tQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691943; x=1748296743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCinSM/GQFzmvQGN7JCodoCrDpkcJ4r1jyjVhme7iOc=;
        b=Htm+IGu9lykhoXsHBloPcLaTIQKa+SvGuTtlpOQ3aP4gcn7KUhqDfF3NtB+iZq9H8R
         m+sjmNCqZ/nnRztS3W0T6ZIilIcoOZOvNO8KwqDtC/zFgTfanqVmZpi7GCE24WegyZtR
         wfcdsvE9ARcdApb2DSwAIHG+SW5DWFXfbo7AET9cOqSiygrJwK8S94/G0AnveqRXfHkc
         /2CDFvnUlwIM60PFymP6pxJjmafV6yYwfXc7wuHQvwZ2hP9M0TgAR82KLZtR9S/dZmxN
         ZzU7d2eG+E1NQmRPZYnHW8AIAxsY57sYnKLM99S4vbDMNd5zdJPc5xhKQdjId6mvkijY
         rbxw==
X-Gm-Message-State: AOJu0YyCR1ACGBj7UD7Ay/O4wvw4A2BsUFASg2MGjk6xxp0RrMdBTzXd
	YhdMTbf3VbMfAFUGN1HfPLMGccjsZa56xELRPxLxcBF6OpSnCdnQ33HnknWmNnbI
X-Gm-Gg: ASbGncsENimRo1HnuJbRpxOIZ2ddW4iAM7VXwojvFiq73XMYQ2XIYtXWY9XfKu45MFm
	qobVSummwyPDlTenfq5vAnUDbnfpzG+68TvxEMSjIf+gLNUlLX/bB5Zzxpngj+K1Y9te1i7tdTJ
	j9Vw29TELj0CQYh/G2ii1wvKDR/1Sw0Pn1IYeEBWcLNd4z8ci4QSsVlHieBXiXGCFTvqMhdLpDs
	c9fwAyUFKVhmBBTuc+DtGg+y/Kw1oP5dmIhaGXkkZyaNHPwLzlwl1BnkGXGGEjTFJtdHBhh0vnD
	JgxILOQ0+edhE3gEYyvfLVco4uL8JwpnGZZqFqz/kLknJmRGQQiYB4sOMEmpLkktZg==
X-Google-Smtp-Source: AGHT+IF71ZStdYkwNidgRIGIrOAYBzTcZmdq7ORH7OeCYyQAvd3YYFFeHRl6w3ep2WvXnHSBRgVNaA==
X-Received: by 2002:a17:902:f543:b0:21f:1348:10e6 with SMTP id d9443c01a7336-231d4d2041dmr218028705ad.13.1747691942668;
        Mon, 19 May 2025 14:59:02 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:59:02 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v5 03/10] platform: generic: mips: add an entry function
Date: Mon, 19 May 2025 14:58:40 -0700
Message-ID: <20250519215848.27569-4-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145904_043193_61590329 
X-CRM114-Status: GOOD (  11.13  )
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
