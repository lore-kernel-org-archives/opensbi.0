Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E74C7113E
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HHQWD+TZlh4xP2OLOYD/hS88x07LVvaOnYAWrGmxLIo=; b=FUnzspB8/WEB8r
	TTIpmQvwRl62ZSqehGplWzaQQeCZaKrCRo8OSPV3f89dy+3HOkAFGLl+h7+viFb6ITnBF4WtSgGrc
	Gpf69o5MVvdLSlFlV2UdEjoTuUHZnqeEzvPSJikd1amUNlgUZQ470iBsgMEUyGkGtFbo+zns7eVJ1
	Txh8rE5ReKGB9s+U/MPfKOHOaQoYfzYLxS0hu3kiCJs2rmq2rwGIzJY2hyDwGrC+khNNiBdFBymoA
	b/nhG7kBfLR6ymMhe4zkvPT9M06MJSgKJVxUXjPWaRJB3dWV3vIFackm0lL2LekCZPkHYYRNxHwps
	TalrX9uqVMk8841aZI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL4-0000000ANks-2ejc;
	Wed, 11 Jun 2025 15:26:06 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKK6-00000009oyr-1KE8
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=xV
	g8aYtla7LLvBlt2PHh/surihZJqjQBMrSbfMIdgyI=; b=mEIKYFtwRlYgXyoYL3
	v6EfiTVcrnEGipEkI+B52vnGkbIzqlv4IC9IvkbGCksCwrbZpJtngFMoOQ768/+5
	Wb93657oLyKFtyF2HThjttKylMB+EEmpzTYYCeZWKOpH/ZpDUlU88dNO9t/R6j60
	jbh1rNzi2sOiP1+Pfx+GYk3mU=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S2;
	Wed, 11 Jun 2025 20:12:40 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 00/12] Some improvements on boot sequence
Date: Wed, 11 Jun 2025 20:12:17 +0800
Message-ID: <20250611121236.937455-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw43JryUXr1rGFyrXF4ruFg_yoW8Ar4rpF
	13GFsxKws2vrZ2vw17Xw48t34rZa1rWay7J343Arn5trWkC348Xr4UtrnYk3y7tFWUAF18
	K3W2vryxWrn8ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE-eOgUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1wNpOmhJVH6Z5wABsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_051254_657431_607EE59E 
X-CRM114-Status: UNSURE (   4.26  )
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

This series of patches mainly merges init_coldboot and init_warm_startup,
and separates sbi_hsm_hart_wait from sbi_hsm_init, so that non-coldboot
HART can perform more initialization tasks before entering HSM wait. In
order to improve some multi HARTs related codes.

Xiang W (12):
  lib: sbi: Add coldboot parameters to some initialization functions
  lib: sbi: Optimise the boot sequence
  lib: sbi: Implement synchronisation and wait between multiple HARTs
  lib: sbi: Remove wait_for_coldboot and wake_coldboot_harts
  lib: sbi: Add wait operations in some initialization functions
  lib/utils: Make fdt_parse_isa_extensions reentrant
  lib: sbi: Initialize as much as possible before sbi_hsm_init
  lib: sbi: Remove cold_boot from sbi_hsm_init
  lib: sbi: Ensure that all Harts complete sbi_hart_init
  lib/utils: Fix Zicntr detection in fdt_cpu_fixup
  lib: sbi: Fix dtbr initialization
  lib: sbi: Remove cold_boot from sbi_double_trap_init

 include/sbi/sbi_domain.h   |   2 +-
 include/sbi/sbi_hart.h     |   6 +
 include/sbi/sbi_hsm.h      |   5 +-
 include/sbi/sbi_mpxy.h     |   2 +-
 lib/sbi/sbi_dbtr.c         |  32 +++-
 lib/sbi/sbi_domain.c       |   9 +-
 lib/sbi/sbi_double_trap.c  |   7 +-
 lib/sbi/sbi_ecall_dbtr.c   |   2 +-
 lib/sbi/sbi_fwft.c         |   3 +
 lib/sbi/sbi_hart.c         |  77 +++++++++-
 lib/sbi/sbi_hsm.c          |  51 +++----
 lib/sbi/sbi_init.c         | 306 +++++++++++++------------------------
 lib/sbi/sbi_ipi.c          |   3 +
 lib/sbi/sbi_irqchip.c      |   5 +-
 lib/sbi/sbi_mpxy.c         |   4 +-
 lib/sbi/sbi_pmu.c          |   3 +
 lib/sbi/sbi_sse.c          |   3 +
 lib/sbi/sbi_timer.c        |   3 +
 lib/sbi/sbi_tlb.c          |   3 +
 lib/utils/fdt/fdt_fixup.c  |  24 +--
 lib/utils/fdt/fdt_helper.c |   4 +
 21 files changed, 300 insertions(+), 254 deletions(-)

-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
