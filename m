Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52438C83F1A
	for <opensbi@archiver.kernel.org>; Wed, 23 Jul 2025 20:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5cDUwg8BnZbWvzZnyYsXOWna+T7DqAT06yeTjQnauZM=; b=bLM8Vs4AHQgbfd
	0lzG7YA6RmfnBTw5Jvs7/u6+FwL53PBINhVPr/7AKPJC7i7rpMrEDmGakB7avf2dpXR/8zIsNXMz4
	agJGdr0Psj0EWnaloAASQpjrcVzeZL7KrLEUHtrt7DEFZ2vshSdFNcKlVtUwJwHRy0Se4tZDw8DXe
	ZFApHOYgDuWBuLZbIO5gnCLo11PEKGkUkMvEVxGfVB6KFzXhcnAz6b8LrKpfMK0v5Bv4xg0PkjK9F
	hxEE0CZ8RdcoDd4vW+taydjyWlSGKVePo25343lbt/q8rZEQdoloj4GUvURctD1lDUYNb1+IWqM49
	DdAWC7yY45Vx9u0UNcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uegGL-00000005vUD-11Em;
	Wed, 23 Jul 2025 20:40:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uegGI-00000005vTQ-3tXz
	for opensbi@lists.infradead.org;
	Wed, 23 Jul 2025 20:40:27 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2350b1b9129so1763045ad.0
        for <opensbi@lists.infradead.org>; Wed, 23 Jul 2025 13:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753303225; x=1753908025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eutMZ1NPGVsA/LXIPzKiJVin94bLdmM4zmRyn1y3AzE=;
        b=NXY60NyYFp5RwBTO47p9x1NRhgIgRfRtRbmvhp7OPvKo45IZU+GZ+MA4ieZsJ/FtUQ
         kKanwO8o245heouv6MI0jnCOBCNE4YpW+UAO2LiIt356rENcPxxSYwaCe6kCkVDCewFQ
         hp7q3FnqM2oa8SQWqWIwX/yEP7nqBf78+wk3S331QEleSWv4ybSay5bohYhDXKvQ3Vtx
         6J2m1zTg5gwROwi4ISyXRaFMljFtfWUJUEWOyFS++8ds/vfo0qQvhn3NdcTAdYNVCJef
         dlDrghNw6/g7pm5oQI0GnS5IP6XdvZfoNS+21xxsSBU3fn0h5WAxzBo5cQZOZsvBTp99
         BLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753303225; x=1753908025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eutMZ1NPGVsA/LXIPzKiJVin94bLdmM4zmRyn1y3AzE=;
        b=pfbugcCIlwDG/ln/yunBA39JKi0mUQTrPo2lF6bVyfMN1HOwhBalz8TgdkLZ9/lRug
         gwjAcHYVJ/IsgzqePQWayNLl4Oc1JEG9v5K2OPBRKe54/tmVwUdxNz042KDaglL2QpBW
         DGEDVbB1G56EMVlG8mkZ93fLfzesz8PC5NrsZXcdMApDE8tfL/mfomZJZ6gtT3z7g/F+
         gzZUHqc5l9+8+VKt0GJWvT1BA+h3ILB0LoKwcQAFpMXTsKpwAyHhiaSrCAyA2Nm5CIHS
         zQJ0pij/fXL9/ELgAkn4kso8RhGEjDZQo9LTEIHf0yr6+wKt0IAcRRPNOy0af/pFUWg+
         ZYTg==
X-Gm-Message-State: AOJu0YwwtqsL89Jk1C4vjeAtpmsOfGhRIHSJMGu70qX/CoBG6VLbtFBX
	ClcVLsa/gEDJOgb/EXe/XzfESc8jYKY2FwcSgb592DEVVk/74mPhVLqB5TcwuEfv
X-Gm-Gg: ASbGncsled7gCm/Gx/ChDNg4m1vy+HVfFd9m+JC6xB0u8s5jCRSjMD5wC7QU4i4bAAC
	IdUKBSY2Z6mfhrGi/SxP9iGfoWmlFJWqpX6rsTwYvrC2gVZWymn9SIPw8LoCAWKYtb/yeF4GUF5
	jjomjEP6bZTrBvlenMxNWwDJlClzVq9HkbNK/rGT/PsyFT9Cwt35EKCLlmTw68MM7+J1HzMXTum
	2Cvp5Cli5vm2faXDgOvkj/iVI8GQKWuoPifl2kazXoIc+v4aaAXkb7YJTn0xwJGAvNP/6HZEMCR
	YyYzpmpcgZxyFr/BJOf+hNQNwo2Ap2F5tGF7+zKnSGDL3Pt8EdUPy8W0HdNJARLvCidqujtkUXM
	067rnAKrT8T0jYI5ahhLx0S5/TMVVAz85k8xP
X-Google-Smtp-Source: AGHT+IE4azOs/MICASHahGYa0WCOzcTOHmgtN3GQzgjWP68OOKLuhZ+m6QT489Dg7Q3WRRc4vzQlhw==
X-Received: by 2002:a17:903:2cd:b0:235:e1d6:f98b with SMTP id d9443c01a7336-23f9818e959mr75074935ad.22.1753303225433;
        Wed, 23 Jul 2025 13:40:25 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4c81sm102398255ad.114.2025.07.23.13.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 13:40:24 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3] generic: mips: support harts to boot from mips_warm_boot
Date: Wed, 23 Jul 2025 13:40:10 -0700
Message-ID: <20250723204010.9927-1-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_134026_963949_3B6F7044 
X-CRM114-Status: GOOD (  15.47  )
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

We program reset base for harts (other than hart 0) to boot at
mips_warm_boot that jumps to _start_warm. This helps to skip some code
sequence to speed up.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/mips/mips_warm_boot.S | 20 ++++++++++++++++++++
 platform/generic/mips/objects.mk       |  2 +-
 platform/generic/mips/p8700.c          |  5 +++++
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 platform/generic/mips/mips_warm_boot.S

diff --git a/platform/generic/mips/mips_warm_boot.S b/platform/generic/mips/mips_warm_boot.S
new file mode 100644
index 0000000..25cdb83
--- /dev/null
+++ b/platform/generic/mips/mips_warm_boot.S
@@ -0,0 +1,20 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+	.text
+	.align	12
+	.globl	mips_warm_boot
+mips_warm_boot:
+	j	_start_warm
+	.align	2
+nmi_vector:
+	j	_start_warm
+	.align	2
+cacheerr_vector:
+	j	_start_warm
+	.align	2
+debugexc_vector:
+	j	_start_warm
diff --git a/platform/generic/mips/objects.mk b/platform/generic/mips/objects.mk
index bbbc15a..a08c4c6 100644
--- a/platform/generic/mips/objects.mk
+++ b/platform/generic/mips/objects.mk
@@ -4,5 +4,5 @@
 
 ifeq ($(PLATFORM_RISCV_XLEN), 64)
 carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700) += mips_p8700
-platform-objs-$(CONFIG_PLATFORM_MIPS_P8700) += mips/p8700.o
+platform-objs-$(CONFIG_PLATFORM_MIPS_P8700) += mips/p8700.o mips/mips_warm_boot.o
 endif
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 888a45c..d3e015b 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -16,6 +16,8 @@
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
 
+extern void mips_warm_boot(void);
+
 static unsigned long mips_csr_read_num(int csr_num)
 {
 #define switchcase_csr_read(__csr_num, __val)		\
@@ -150,6 +152,9 @@ static int mips_hart_start(u32 hartid, ulong saddr)
 	if (hartid == 0)
 		return SBI_ENOTSUPP;
 
+	/* Change reset base to mips_warm_boot */
+	write_gcr_co_reset_base(hartid, (unsigned long)mips_warm_boot, local_p);
+
 	if (cpu_hart(hartid) == 0) {
 		/* Ensure its coherency is disabled */
 		write_gcr_co_coherence(hartid, 0, local_p);
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
