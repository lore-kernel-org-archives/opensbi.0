Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AC4C83F17
	for <opensbi@archiver.kernel.org>; Mon, 28 Jul 2025 05:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UHiQRm6XtCdoSdAH67GRtq+OmsOHiDxNIimAvbKLDm4=; b=B/coCSogt4aHio
	YdOz+1mX2OAN7XBArMyXf2GBXn9PIMFTmEMZH1Lj6PTzJzCYV0C1ujIRr+BeU78lv8+cmuchFgT2f
	acgDjpMd6i7W1T635tM0ICZOrZbJ3cEK91pLByrZoSIct172KvXS+3vIMhJnhrS/lqoD3yC7nugn2
	qzUYGe6+hyhLvoMTF/+ap9jJPD8JdC3vWJLgrF23iQotJG3EerAOofcPfNBoVloz7K6o2s7VLo3Vh
	q2dU8dosur7a4bGMG6vlGynbNmOzJY16jKYoRMpjvPb9dDsYBYRg9q6dT09ijSBqHu3acAJADKkP9
	xqotxeLBx8Qe5mU/g+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGQO-0000000DfOD-0jSB;
	Mon, 28 Jul 2025 05:29:24 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGQK-0000000DfNm-2qu7
	for opensbi@lists.infradead.org;
	Mon, 28 Jul 2025 05:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=iC
	phnl+qA2LIOoiruCAj9gwXtGuS38zo4FaaD4+mgKc=; b=SGTT8NwHXqDsQ0+3SL
	3oOjv7THJ/smiU216VB7pigoFH2TEiSbQW4vTJbnHcFFSHuLMa86d3nGP7jNBcfB
	Y9BY4x/anRcx+FeysFwr1GXvV4+OBFhjM5XC13GuSdQ8qxV7vuD6YCLEahi+BYls
	rLsJvQUxy0yxszLaIW7kFUSQs=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDH_+o0CodoG3I6Aw--.3951S2;
	Mon, 28 Jul 2025 13:27:17 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Hui Min Mina Chou <minachou@andestech.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH] Fix license to compatible BSD-2-Clause
Date: Mon, 28 Jul 2025 13:26:48 +0800
Message-ID: <20250728052713.361094-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDH_+o0CodoG3I6Aw--.3951S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4DArW7uw43uF17Ary7KFg_yoW5Jr4rpF
	ykKryfKF4UWa48Kw48GFnrZrsxAa1a9rWDKr15u348Zr9rXr40krs0qF15GFyDur4jqa1Y
	qFs2grW2ya1UZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRGXd8UUUUU=
X-Originating-IP: [2408:823c:b211:b11:c2d3:3557:acc7:1751]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5B+YOmiG983BpQACsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_222921_105395_9C3BD0C0 
X-CRM114-Status: UNSURE (   7.57  )
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

OpenBI is a BSD project. We need to modify some codes to compatible
with BSD protocol.

Signed-off-by: Xiang W <wxjstz@126.com>
---
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
