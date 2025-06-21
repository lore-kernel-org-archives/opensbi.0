Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9967EC7115D
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=shoVdbUo3O+9GYsJ8dXsUzhGbYI0yNwwfjg2reDQPUM=; b=RlkitPlsE0XThY
	DEfcoMJAwUbYDTX3PMfAb3s7MbMuk1HjZC7NFqJ+to3aTE7brITkIPDgQLsZvFDbpQZyMxfPqA7ck
	4/q/hxmmsXWhN3qvx8k95ErXl211FNgiFaqgNxtLIqARLWjD+39xNhMk/RM2UFCD8u7pW2/64Ne+J
	fkzwVuCqBRmOp9utwBpF3GKnJyVtB+JJvgP1J8lcpQjV5MOHqIIA4a3G4UJFkOm1UA32CEw9tnDUa
	Xf44gMjgsVkHHl/bsxCktlXxXQLx+rK+0yJ1868zmbI37YwbQsijHq5ydokBcFFrb4dEx1in9tcVJ
	a4ECFv+u+cTK8/UoJYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpyi-0000000H5yg-18DE;
	Sat, 21 Jun 2025 04:37:20 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpl9-0000000H4zf-1KFE
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1N
	df2EOg/LqdNnu+6QZ5bSYk5riIPMd3DPzZgXXUSqs=; b=RPxy6hiqfuayUnmHzO
	5TL3O2lxXlIfSdpvML48TPIFP+OykM3DqEnEb8s52p18E74EHt/W3cvLYPKoj0bi
	trecBK7AysJfRtVsxHJtEdu8rtd2KaUe8LYeWgNhYkcopmD/N2gmOWAVXVyxsQDT
	5gIkxx6n9Qz4SPkhhFqwaMkJA=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S2;
	Sat, 21 Jun 2025 12:23:06 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 0/9] Some improvements on boot sequence
Date: Sat, 21 Jun 2025 12:22:48 +0800
Message-ID: <20250621042302.160802-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1xCF43XFyrAr17Gw1DGFg_yoW8WF4xpr
	13GFy3Gan2vr97K343Jw4jqr1fXa1rJ39rJry3Jw1Fyry8Aw18Xr45Kr1vy3y7trW8CF1D
	tw1jyr17Gr1UZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_pBTkUUUUU=
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFxZzOmhWAtw+BQACsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212319_693374_E251BC57 
X-CRM114-Status: UNSURE (   4.58  )
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

This series of patches are some multi-HARTs related optimizations, 
allowing non-coldboot HART to perform more initialization before 
entering HSM wait, and fixing some multi-HARTs expansion related 
issues.

V2 Change:
- Remove unused function sbi_wait_for_non_boot_harts and 
  sbi_signal_non_boot_harts_done
- Keep init_coldboot and init_warm_startup as suggested by anup

Xiang W (9):
  lib: sbi: Implement synchronisation and wait between multiple HARTs
  lib: sbi: Remove wait_for_coldboot and wake_coldboot_harts
  lib: sbi: Add wait operations in some initialization functions
  lib/utils: Make fdt_parse_isa_extensions reentrant
  lib: sbi: Initialize as much as possible on non-coldboot HART
  lib: sbi: Ensure that all Harts complete sbi_hart_init
  lib/utils: Fix Zicntr detection in fdt_cpu_fixup
  lib: sbi: Fix dtbr initialization
  lib: sbi: Add sbi_double_trap_init to init_warm_startup

 include/sbi/sbi_hart.h     |  4 ++++
 include/sbi/sbi_hsm.h      |  3 ++-
 lib/sbi/sbi_dbtr.c         | 32 +++++++++++++++++++++----
 lib/sbi/sbi_ecall_dbtr.c   |  2 +-
 lib/sbi/sbi_fwft.c         |  3 +++
 lib/sbi/sbi_hart.c         | 44 +++++++++++++++++++++++++++++++++-
 lib/sbi/sbi_hsm.c          | 49 ++++++++++++++++----------------------
 lib/sbi/sbi_init.c         | 40 ++++++++++---------------------
 lib/sbi/sbi_ipi.c          |  3 +++
 lib/sbi/sbi_irqchip.c      |  5 +++-
 lib/sbi/sbi_pmu.c          |  3 +++
 lib/sbi/sbi_sse.c          |  3 +++
 lib/sbi/sbi_timer.c        |  3 +++
 lib/sbi/sbi_tlb.c          |  3 +++
 lib/utils/fdt/fdt_fixup.c  | 24 +++++++++++--------
 lib/utils/fdt/fdt_helper.c |  4 ++++
 16 files changed, 150 insertions(+), 75 deletions(-)

-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
