Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7977FC7115C
	for <opensbi@archiver.kernel.org>; Wed, 25 Jun 2025 03:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rjVSEcdwKzP23ZiXFFpRxbnvIwHM7ezjU3IRSSffsIs=; b=aQTxXzjM1V/far
	Md/BrX5cDpBaIaksaZaImjQLl76rV9gfL5jQrObFmYrXjBm/747UUg0o2r6+7LkcOOFC1otu3rgNS
	FMOnVMTLIJrze6pcFw3PW+4ltOu6vUYq6KHpIUUJUQF6NdY9esyNR9fm1DoLuoph+7eEPz7uw+18e
	riX0pGcCP5D/pS7jJ7lwZnbMmj5F9xKLotBdcnmOqM8VZLGzwgHLFiSsRi2BvEq3sDV3/m8ZvQ2YA
	N2Q5fV7u8Tgqo/KQBRBZR6j5nVVz4sIQBtDTad+oVIFM+RsrMU3PFIrsw1UGgsRHqjAlJFXJPHPAG
	ssqi/Me84YSsm64I8KQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGcm-00000007OP4-1MQX;
	Wed, 25 Jun 2025 03:16:36 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGcj-00000007OOD-0d6U
	for opensbi@lists.infradead.org;
	Wed, 25 Jun 2025 03:16:34 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 55P3GLnt013574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 11:16:21 +0800 (+08)
	(envelope-from alvinga@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Wed, 25 Jun 2025
 11:16:18 +0800
From: Alvin Chang <alvinga@andestech.com>
To: <opensbi@lists.infradead.org>
CC: <anup@brainfault.org>, <peter.lin@sifive.com>,
        Alvin Chang
	<alvinga@andestech.com>
Subject: [PATCH v2 0/2] firmware: Initial compiler built-in stack protector support
Date: Wed, 25 Jun 2025 11:16:11 +0800
Message-ID: <20250625031613.1375191-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 55P3GLnt013574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_201633_696265_49B39151 
X-CRM114-Status: UNSURE (   7.19  )
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

This series add initial compiler built-in stack protector support into OpenSBI
firmware. The __stack_chk_fail() and __stack_chk_guard variable are added into
firmware assembly files accordingly.

Introduce three Kconfig configurations to enable the stack protector:
1. CONFIG_STACK_PROTECTOR to enable the stack protector feature by
   providing "-fstack-protector" compiler flag
2. CONFIG_STACK_PROTECTOR_STRONG to provide "-fstack-protector-strong"
3. CONFIG_STACK_PROTECTOR_ALL to provide "-fstack-protector-all"

---
Changes from v1
- Fix boot hang when compiling with DEBUG=1 and -fstack-protector-all
- Move implementation to firmware

---
Alvin Chang (2):
  lib: sbi: Remove redundant call to sbi_hart_expected_trap_addr()
  firmware: Initial compiler built-in stack protector support

 firmware/Kconfig              | 27 +++++++++++++++++++++++++++
 firmware/fw_base.S            | 17 +++++++++++++++++
 firmware/objects.mk           |  9 +++++++++
 firmware/payloads/test_head.S | 17 +++++++++++++++++
 include/sbi/sbi_csr_detect.h  |  4 ++--
 include/sbi/sbi_hart.h        |  4 ----
 lib/sbi/sbi_illegal_atomic.c  |  4 ++--
 lib/sbi/sbi_unpriv.c          |  6 +++---
 8 files changed, 77 insertions(+), 11 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
