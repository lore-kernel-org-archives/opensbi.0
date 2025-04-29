Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11083C3ABA5
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 00:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JurBrSI/2du7tiyy8XCsgQmDQ63YtpU1HoK4tjhXCU=; b=F8+UnyAYhVXnXn
	WcpSKrPTsVfixFfM6+RQ88o6QAA2ka1RwlcJlPk86kvZocInruKdd92tewcjCIxazn61tzFZUPoh9
	/gDsll+xPMst2K/6Sxmm79Ifp4Lc6Ca1L4WI9t/DLn3R2z0LQrw8j7UExF/OpGilOCk8Cv30xmwUL
	QZHfCukuo1xRK8vVIyGpxaoIdllCTxlKOICfBR+pqIcJQMx58djc8XxRWBqacwTZeKr6ySaUJjQDn
	EllD0VKpxfTzOdxpG31hJd6wRVmYVF6/9dvJVHtrVaGw5Yu82QJLO92bzolGxAsuNK6BOmlKtcAcD
	r/V04+AZQK+a29j3RluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyq-0000000BDhz-1bWX;
	Wed, 30 Apr 2025 00:07:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyl-0000000BDer-0tNV
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 00:07:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-227c7e57da2so56931325ad.0
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745971630; x=1746576430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCinSM/GQFzmvQGN7JCodoCrDpkcJ4r1jyjVhme7iOc=;
        b=Emp2Cep8IBUx2NvQPBd5Y45mVH3VCjVDzV8curap+7GXTi2I5ej06oJ80m5sjrYK0x
         oOFCqwti8ZOTT6zs+Nw0xZ1dIsP3M8kxGxd6yOB0ro/rMy0/kfgjFUbPth7UbJbj0oR8
         ON35ByWH4UyHwnFMrUDQqo1SsjXN4t6h+FzFKTzrCoE7GZmwaXxb1gzVJKNPNZYY2MPC
         ofqNk/8dIIMkScR3z1Eh2lw9rCV1WU+kGGsfVsJ6KTpcojqqgpWqn3D1lOUMIR/GOxWm
         aKHSqm3OUfCU3h0eliOknC39NeTiH+SxPC8U6EVVuSclivNze6bBylKk/SCkKBNoPkZ9
         Gg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971630; x=1746576430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCinSM/GQFzmvQGN7JCodoCrDpkcJ4r1jyjVhme7iOc=;
        b=Q+1LohtYMKZzj6nTe/Oho82TPbBKP1FMu5LZK3bl5rsKmtru5dtppGN78XPSRsXEwu
         LH4hdRBm2QRGrIkuWmgx5jQUNj8PrlZNKkRoOCoKoaLs0WRpSwfAw3TO1gKSPWCrw5/E
         SNYgXDYUU638BMv0XJmCwvtUJ83sWd4jH43W/YutSO/+OgasqmUCoKJ6+mjM75yNTswp
         Q2ForhBkoSv25AGE7zJ5fSMJQjn6Khg1fT4efPsjqxLKiNZkNTuWZsZ/lRQl+WV2vZi5
         sSeiai6HJsggQznVM4Mxw8RCvTYwBXX2OC601iiGZ7RL1c9NMuW6AxJIuCKYfjjDAzja
         lGOQ==
X-Gm-Message-State: AOJu0YxL88BUINqs1QNVYpdZZ5eCgJHNVPEUftrbkv4hnsY8GgFRwtrc
	kqonWZOiB5Ik6i2Z1/3Vyu6cWTyIc0Lwkara5e541aICKz2dcNI/9FOzbg==
X-Gm-Gg: ASbGncvQAtXym5v6x3XKEWPh0hIDFY+ErPoeyk9nD8/Yg6FLhhCO2tnkJBndDf8qJ6/
	eFbMTFLNO+S3xTvaevb+t6OyxWbBhgdSzlLgple4y61hGCfeTii4QV+vTYpJ1of22ORSv/QgNbI
	Qw4KDxT/AuWXsIDZWCdGvc9HAqtl7EndmUdnj1Ly5f4RjtSi+vPoUdB8PWXPM7QfIx1H3hwhtwk
	780rw9+8zTj33+HqchlIPUnZewtrsqREtF+u8l0kFLLLsjUg7fhkRk8yFJSnyetn0XrDd7Ky8ZG
	NubKYg7sDleYhNKa68rGcSt/oivpooAr7FE4o0l84D1lGWww41lVDg==
X-Google-Smtp-Source: AGHT+IHQvwFe2lEjpYyiCA7JJlDzNritncHJWolaA4kKsTsTdYzgXUR0YV4yHSTfGffQSwraScFoIg==
X-Received: by 2002:a17:902:f54a:b0:224:d72:920d with SMTP id d9443c01a7336-22df5827c36mr7081975ad.37.1745971629992;
        Tue, 29 Apr 2025 17:07:09 -0700 (PDT)
Received: from localhost.localdomain ([50.247.98.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b08sm108953815ad.114.2025.04.29.17.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:07:08 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v4 3/8] platform: generic: mips: add an entry function
Date: Tue, 29 Apr 2025 16:29:23 -0700
Message-ID: <20250429232928.6499-4-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_170711_247765_6FD69D2C 
X-CRM114-Status: GOOD (  11.14  )
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
