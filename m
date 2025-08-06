Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE11C87FCB
	for <opensbi@archiver.kernel.org>; Wed,  6 Aug 2025 00:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8GcytGx6MFVifZJzidUhgNN0iKYYNa4kdZ8lAtFbiM=; b=4V6jkj0Ouw8/yx
	8s5AHAzLEMarIy5qn1O7FotbYlvKMXnjROsnH4WDSquprbaPjVklP8B2iF8rCeCGvzB/hdOTLpsRq
	Nivohfj8dgg6YhGPIUB0b4tgoiEOm6s82hnkW5UAjekQIAAzBPJO+/9HnoJUsdBUYg7HR7mqS1Yo6
	bWs7IZEDk5NSE3YDeU1L4nGR/gkA0NLKX3zGM64B6MZoR3aInKZT6ukAsAtnG+6gYTlQvhiB8t/ya
	rs2d7WxCbWJo+uce63Ewut6gYgb0SSrc2VIyWm37ZWWUZb9fRtYY2nruH/yJpYk67CZYxpmAYbdsi
	Zn3Og9CyB9kUccDajRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSLz-0000000E55y-2SXl;
	Wed, 06 Aug 2025 00:50:03 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSLw-0000000E55H-10NE
	for opensbi@lists.infradead.org;
	Wed, 06 Aug 2025 00:50:01 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bxWsY5mbKz8Xs71
	for <opensbi@lists.infradead.org>; Wed, 06 Aug 2025 08:49:53 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 5760ns6g081356
	for <opensbi@lists.infradead.org>; Wed, 6 Aug 2025 08:49:54 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202508060049.5760ns6g081356@mse-fl2.zte.com.cn>
Received: from njy2app08.zte.com.cn ([10.40.13.206])
	by mse-fl2.zte.com.cn with SMTP id 5760evIB068945
	for <opensbi@lists.infradead.org>; Wed, 6 Aug 2025 08:41:22 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app02[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 6 Aug 2025 08:41:23 +0800 (CST)
Date: Wed, 6 Aug 2025 08:41:23 +0800 (CST)
X-Zmail-TransId: 2afa6892a4b3ffffffff86a-7692f
X-Mailer: Zmail v1.0
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <opensbi@lists.infradead.org>
Subject: =?UTF-8?B?W1BBVENIIDAvM10gU3VwcG9ydCAxMDI0IGhhcnRz?=
X-MAIL: mse-fl2.zte.com.cn 5760ns6g081356
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 06 Aug 2025 08:49:53 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6892A6B1.000/4bxWsY5mbKz8Xs71
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_175000_432100_0BFAA063 
X-CRM114-Status: UNSURE (   5.38  )
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

It is expected to have riscv server boards with many harts very soon,
lift the maximum hart number from 128 to 1024. Also, more heap memory is
added for housekeeping metadata or memory allocation cannot be satisfied
at the end.

Wu Fei (3):
  lib: sbi: Print error message during warm boot
  platform: generic: Extra memory for housekeeping
  include: sbi: Lift the maximum harts to 1024

 include/sbi/sbi_hartmask.h  |  2 +-
 include/sbi/sbi_heap.h      |  3 ++
 lib/sbi/sbi_heap.c          |  5 +++
 lib/sbi/sbi_init.c          | 65 +++++++++++++++++++++++++++++--------
 platform/generic/platform.c |  1 +
 5 files changed, 62 insertions(+), 14 deletions(-)

--
2.43.0

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
