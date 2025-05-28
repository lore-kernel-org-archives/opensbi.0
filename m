Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D953CC3ABB2
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BlLbdw10Xzv1cGJZuEUcF+NLxLdO0IdQGDdf/cp/DrM=; b=uDDqsudDsmumX6
	u23bR1jKNCnQeA8oDeGm8qj1mCxAtkO7y4PjG02fPPhpxzXW2rqEZihtQ8gjyPfAX+2crTmWbrJQM
	3ZoR4y/U2BhBBSKyhOnAgJfLlbACYh+0oFrC2fo0uG2nsbhLwpyKCIK8bKeReoH7N89qq/7X8zygi
	yEqu6QbQzV8lASKbAnlPyoTeMyiksB0XHkstaunEodo9RMuIMQ3iC7F8gVHCLmstPs9NcX9EFCNCP
	yKST54v9SLPfgdXp+SJXB6PybHpdaTLs/aW/5MQtRTjK7JO8LFWgtJ2UVtAX9NwazHlStPYeI9MLE
	D5RWE2njAD4AbTH0YaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9k4-0000000CEuv-0FEK;
	Wed, 28 May 2025 05:54:20 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9jy-0000000CEsR-25CM
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 05:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ms
	yn10/anbOI1uUmvJYzdTe7GvWeaRsHwFC/2BihCnI=; b=pIaNxh3lGpGsYyRsM6
	ZedsiJ2B3cWvC2H1ggrtoGEMtIz6J0EupEQgquiD6TD8x8bBr9/8U7kugdF4cP8A
	1R73Yc8Bbqi9uyfAETZBunZpl2T1D29NOlP50jrlzKsUqnv5Hg3jHNBac6JGYR14
	Id0ovIGMmNTVj7rGSiq8xRsoA=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX_5j3pDZo96cmAw--.22074S2;
	Wed, 28 May 2025 13:54:00 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 0/4] Some updates about sbi_timer
Date: Wed, 28 May 2025 13:53:49 +0800
Message-ID: <20250528055356.547392-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_5j3pDZo96cmAw--.22074S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw47Xr15tFyUtr4rJrWDJwb_yoWDJrb_Ca
	s2vas8tr4DWFZ8ta9xGw4kKrW5Cr48Zr1qq3WUtr47Ar1ayFWUCr47A3y0vF17Za13ZF17
	A3yfXry8JryxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRCPfQ5UUUUU==
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFwBaOmg2DE6gvgAEsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_225414_894616_4406518D 
X-CRM114-Status: UNSURE (   5.30  )
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

PATCH0-3 are some bug fixes and improvements
PATCH4 adds memory-mapped stimecmp support

The description of T-Head stimecmp can be found in the following document
https://occ-intl-prod.oss-ap-southeast-1.aliyuncs.com/resource/XuanTie-OpenC910-UserManual.pdf

Xiang W (4):
  lib: sbi: fix sbi_timer_event_start
  lib: sbi: Add error check for sbi_timer_waitms_until
  lib: utils: Simplify time_event_stop
  lib/utils: Add memory-mapped stimecmp support

 include/sbi_utils/fdt/fdt_helper.h      |  1 +
 include/sbi_utils/timer/aclint_mtimer.h |  2 ++
 lib/sbi/sbi_timer.c                     | 18 +++++++++++------
 lib/utils/fdt/fdt_helper.c              | 21 ++++++++++++++++++--
 lib/utils/ipi/fdt_ipi_mswi.c            |  2 +-
 lib/utils/timer/aclint_mtimer.c         | 26 ++++++++-----------------
 lib/utils/timer/andes_plmt.c            | 21 +++++---------------
 lib/utils/timer/fdt_timer_mtimer.c      |  8 ++++++--
 8 files changed, 54 insertions(+), 45 deletions(-)

-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
