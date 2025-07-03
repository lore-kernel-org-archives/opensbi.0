Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5209DC83F03
	for <opensbi@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SUzLKR9Z5KkSXQKt1O/1w7hw5xTe7lv8SplilkOMj8A=; b=rbkUokcy0FZ1mu
	1pEx348zJ1wSrepPyrHq5u64bpisjmOL+Biimms8WLyPFjs8nxa7CCI1YjTVEKnV6QY4OkwmkuL8W
	diQDa990xoeEz/1hpgLP4prDee3Iq/TBql02ABVXqwcm+RaoaQ9D46oljX739QV/4y/sHl02oaGlQ
	pAwQfn0aUavcOILUF50XLJ3lhq6TOIWuk7D9hKxPagL5VCQTXH9wG38kiAD61jna9KRMTYywOeea+
	iBwPiHrzebaQpC3Ve3qU0IWm4wuISSC16c/FhWmMBBwtC9mwyy7M9Zwp+sMtbobD2/JcVEe73MvcS
	MFeCBIkA3Jyu04wiEd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzg-0000000CTNt-1j3b;
	Thu, 03 Jul 2025 20:57:20 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLjo-0000000Bne5-3mkd
	for opensbi@lists.infradead.org;
	Thu, 03 Jul 2025 15:20:39 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 563FK4j0013425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 23:20:04 +0800 (+08)
	(envelope-from alvinga@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 3 Jul 2025
 23:20:04 +0800
From: Alvin Chang <alvinga@andestech.com>
To: <opensbi@lists.infradead.org>
CC: <anup@brainfault.org>, <peter.lin@sifive.com>, <wxjstz@126.com>,
        "Alvin
 Chang" <alvinga@andestech.com>
Subject: [PATCH v3 0/2] firmware: Initial compiler built-in stack protector support
Date: Thu, 3 Jul 2025 23:19:55 +0800
Message-ID: <20250703151957.2545958-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 563FK4j0013425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_082037_487415_031D5C07 
X-CRM114-Status: UNSURE (   7.90  )
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
Changes from v2
- Adopt Xiang's suggestion on __stack_chk_fail in fw_payload.bin
- Adopt Peter's suggestion to print error message

Changes from v1
- Fix boot hang when compiling with DEBUG=1 and -fstack-protector-all
- Move implementation to firmware

Alvin Chang (2):
  lib: sbi: Remove redundant call to sbi_hart_expected_trap_addr()
  firmware: Initial compiler built-in stack protector support

 firmware/Kconfig              | 27 +++++++++++++++++++++++++++
 firmware/fw_base.S            | 21 +++++++++++++++++++++
 firmware/objects.mk           |  9 +++++++++
 firmware/payloads/test_head.S | 15 +++++++++++++++
 include/sbi/sbi_csr_detect.h  |  4 ++--
 include/sbi/sbi_hart.h        |  4 ----
 lib/sbi/sbi_illegal_atomic.c  |  4 ++--
 lib/sbi/sbi_unpriv.c          |  6 +++---
 8 files changed, 79 insertions(+), 11 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
