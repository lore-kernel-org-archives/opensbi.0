Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7454C83F17
	for <opensbi@archiver.kernel.org>; Mon, 28 Jul 2025 04:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dCaRFD8F1Pilp4nGXCEuPegLWD05JptoAr0a95LrFIw=; b=aUvchClJJ3wj4X
	oG5uTnQGQhME5b2BfPrnmClzmY/7cS+JEfIpdSDlKNJz7phEpSJxp3tpeQxheXDFUOY1xzCKXXsAS
	YmpP29XW7gGq4OjfSljWcomLy1UoXknKGaYFoplApciltpIANywaIyodMsSkXJRBwplRIavqm1fNp
	xBHJUpqwQ1zg1EWmsAZiG6QBNmWwfSVIhClUvGmNfUJ5RoH1JTkWCfs2IFi1mwrgjmIwx4SfsO0/m
	5FIIuyN60zLusEOxgeIO78TJeuBRkQtI7wpQeqzvVLphcG3gAQalxXdHCGaXO6wAL3PT+OQJCkGwA
	r3XlRVkXH/lQR6mYPnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugFuK-0000000DcBM-3nwy;
	Mon, 28 Jul 2025 04:56:16 +0000
Received: from m16.mail.126.com ([220.197.31.8])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugFuH-0000000DcA6-3wgy
	for opensbi@lists.infradead.org;
	Mon, 28 Jul 2025 04:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zL
	jZCgd+/8oM3soqTDUQEPOlkzRCnre7SBhpRZi4prU=; b=LQ1PUUO+NpEX1PyQcm
	Z+7AhQBD3gCerNhErCzyrcqEMIdnCje7OPIrv3WoENJW98jz/2C31zcHS015K2f/
	z69P7B9cl+trpW5tdb+JvnaE+xamIUskJHFaky6jUCzZ0C9N4IPKTofc2b76SPBO
	s4H7MnD4o+fBQePAgcEwzjlFM=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnL_TaAodoL5ISAw--.24789S2;
	Mon, 28 Jul 2025 12:55:55 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	Anup Patel <anup@brainfault.org>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] platform: andes:  Fix license to compatible GPL
Date: Mon, 28 Jul 2025 12:55:24 +0800
Message-ID: <20250728045551.355122-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDnL_TaAodoL5ISAw--.24789S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFykArWrKrykJF4ftF4Utwb_yoW8Zw43pF
	WxKrWftF4UWw1rtr48GF4DZrZxAF4agrWDKr13urZrZF9xXr1kKrs8XFyrW34DGFW0qa1Y
	vFn2grZrCF4j93JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRI1v-UUUUU=
X-Originating-IP: [2408:823c:b211:b11:c2d3:3557:acc7:1751]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFwWYOmiG+pdqpgAAs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_215614_337001_6E653656 
X-CRM114-Status: UNSURE (   8.46  )
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

Since platform/generic/include/andes/andes.h and
platform/generic/include/andes/andes_pma.h are licensed under the
GPL, any C files that use them should also be modified to comply
with the GPL. Otherwise, there may be potential legal issues.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 platform/generic/andes/ae350.c     | 2 +-
 platform/generic/andes/andes_pmu.c | 2 +-
 platform/generic/andes/andes_sbi.c | 2 +-
 platform/generic/andes/sleep.S     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index f06e207d..880d5803 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifier: BSD-2-Clause
+ * SPDX-License-Identifier: GPL-2.0
  *
  * Copyright (c) 2022 Andes Technology Corporation
  *
diff --git a/platform/generic/andes/andes_pmu.c b/platform/generic/andes/andes_pmu.c
index 9eee4edc..6099a73b 100644
--- a/platform/generic/andes/andes_pmu.c
+++ b/platform/generic/andes/andes_pmu.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: BSD-2-Clause
+// SPDX-License-Identifier: GPL-2.0
 /*
  * andes_pmu.c - Andes PMU device callbacks and platform overrides
  *
diff --git a/platform/generic/andes/andes_sbi.c b/platform/generic/andes/andes_sbi.c
index f68ac908..6c155e10 100644
--- a/platform/generic/andes/andes_sbi.c
+++ b/platform/generic/andes/andes_sbi.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: BSD-2-Clause
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2023 Renesas Electronics Corp.
  *
diff --git a/platform/generic/andes/sleep.S b/platform/generic/andes/sleep.S
index 361aff3a..967fdaef 100644
--- a/platform/generic/andes/sleep.S
+++ b/platform/generic/andes/sleep.S
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifier: BSD-2-Clause
+ * SPDX-License-Identifier: GPL-2.0
  *
  * Copyright (c) 2023 Andes Technology Corporation
  *
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
