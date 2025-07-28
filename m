Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DFCC83F26
	for <opensbi@archiver.kernel.org>; Mon, 28 Jul 2025 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eNvwxoFpln0HrX1qgmY+lvZeKxEWUp62w1IYuAWnpy8=; b=hltYZZUXnRtjIb
	tVGh5SUabl+w4y4MjADZbBVfce7QLf18FmnjJJ3v+8UxneS7134fQBZEFcEmmhNmC5ZsEWshtMFz2
	RvTLgJrN2pTmy94xnA+FaDUJ47c2plACr/dbSd0es71E9EqoSHEpbFRaPcLHVFMGzF+820/nCV+0r
	UMJIf/76bhZKvbm32DfURhQMgTgX6D77D4/J8EfXc5czgl8vCnE0ntso++loQoqUhs1OJZSrHauHm
	BxXCk1MLd4ZZOsMVIXUyxbg4qQXwCvRbz1T1bDoi1H6l4vCYv8WwITRGpBcuV3Q3cPLAh3q9kMfZw
	jlGNzf6xlozUv9hIdKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugInw-0000000DvHY-3GDl;
	Mon, 28 Jul 2025 08:01:52 +0000
Received: from m16.mail.126.com ([117.135.210.8])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugIWi-0000000DtCH-37AO
	for opensbi@lists.infradead.org;
	Mon, 28 Jul 2025 07:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Dv
	faAo4agHlBK6s7xV50MfcIFee4oD/y9coNy17PkqE=; b=PC8n52t7l//v0X55VC
	Q3FxvwWDxKxavcAIgOfj04YCHUFlYyD+wmb19OIdmcRLqw+ue7sty2DtajI/143y
	GRVbDTY814vlcN2mqlhAMNsq5IQHU1MBVuggyHoWIdKwpBIrFgKAI1lL3ight/7k
	PEFMbi/Y3ZObhm/d4P2PejGok=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnN+UpKodophI_Aw--.11026S2;
	Mon, 28 Jul 2025 15:43:39 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	Anup Patel <anup@brainfault.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Hui Min Mina Chou <minachou@andestech.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v2] Fix license to compatible BSD-2-Clause
Date: Mon, 28 Jul 2025 15:38:10 +0800
Message-ID: <20250728074334.372355-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDnN+UpKodophI_Aw--.11026S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFW7ZF4DGw1rJF47JFWfAFb_yoW5GFWkpF
	ykKrWfKF4UWa48K3y8GFsrZrsxAa1a9rWDKr15u34xZr9rXr4vkrs0qFy5GFyDur40va1Y
	qF1IgrW2ya1UZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRrnY7UUUUU=
X-Originating-IP: [2408:823c:b211:b11:c2d3:3557:acc7:1751]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5ByYOmiHHLDGbgAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_004405_134550_07A3E2DE 
X-CRM114-Status: UNSURE (   7.33  )
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

OpenSBI is a BSD project. We need to modify some codes to compatible
with BSD-2-Clause license.

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Ben Zong-You Xie <ben717@andestech.com>
---
v2 changes:
- fix typo and reword

Andes Technology agrees to change license.
We also need the consent of Renesas Electronics Corp.

 .editorconfig                              | 2 +-
 platform/generic/andes/andes_pma.c         | 2 +-
 platform/generic/include/andes/andes.h     | 2 +-
 platform/generic/include/andes/andes_pma.h | 2 +-
 platform/generic/renesas/rzfive/rzfive.c   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/.editorconfig b/.editorconfig
index e66b1ca3..26f90534 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: BSD-2-Clause
 # See here for more information about the format and editor support:
 # https://editorconfig.org/
 
diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
index 09e5a30c..eeeb110e 100644
--- a/platform/generic/andes/andes_pma.c
+++ b/platform/generic/andes/andes_pma.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: BSD-2-Clause
 /*
  * Copyright (C) 2023 Renesas Electronics Corp.
  * Copyright (c) 2024 Andes Technology Corporation
diff --git a/platform/generic/include/andes/andes.h b/platform/generic/include/andes/andes.h
index 3403a58b..bfedf034 100644
--- a/platform/generic/include/andes/andes.h
+++ b/platform/generic/include/andes/andes.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: BSD-2-Clause */
 /*
  * Copyright (C) 2024 Andes Technology Corporation
  */
diff --git a/platform/generic/include/andes/andes_pma.h b/platform/generic/include/andes/andes_pma.h
index be614964..4a66e1b6 100644
--- a/platform/generic/include/andes/andes_pma.h
+++ b/platform/generic/include/andes/andes_pma.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: BSD-2-Clause */
 /*
  * Copyright (C) 2023 Renesas Electronics Corp.
  */
diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
index 44db3671..6c3da095 100644
--- a/platform/generic/renesas/rzfive/rzfive.c
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: BSD-2-Clause
 /*
  * Copyright (C) 2022 Renesas Electronics Corp.
  *
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
