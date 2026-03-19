Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91371090223
	for <opensbi@archiver.kernel.org>; Thu, 19 Mar 2026 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wVKTVjLdDdBnmQhHsgIjJ1u4NFgXmjAK2ouUx8rX/Wk=; b=X50Zc8bZHXonDs
	KOpDhElKQpblI54ShGpOK0ESit1gcgLmkQY3Db07F9azN4Wld6Jq/jPNZHIYM6v/H9q91zm77cX0p
	4etfpCgJSDgwyvSKG+o8s0YEuryjrtGXuE4eL06H0dw9VgFHpja6anCJn4MtR7l1zVPA5WJ35eDRo
	vUtmJ4zkc43/ErNSGxIg0RmdYOEekyOPwUkNpDGKTE5QL26Hg4Vy6+To1mFMlxsall3wgZ2Of5k5p
	Y5QzL+IOERtXEty56wjwToqpkApN920Mza7tSU3maUC9Mb6DCDZ8U94ahbi6VAnQsE2oVQgAdPNro
	0SQGH2XYXSxR0zef9mig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Cwy-0000000AeGw-2IQP;
	Thu, 19 Mar 2026 12:58:08 +0000
Received: from mail.ingenic.cn ([106.37.171.196] helo=mail.ingenic.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Cwu-0000000AeEO-1VdX
	for opensbi@lists.infradead.org;
	Thu, 19 Mar 2026 12:58:06 +0000
Received: from ingenic.com (unknown [47.100.164.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.ingenic.com (Postfix) with ESMTPSA id 1C8F72700156;
	Thu, 19 Mar 2026 20:57:42 +0800 (CST)
From: runmin.zhang@ingenic.com
To: opensbi@lists.infradead.org
Cc: fmrt19zrmin@163.com,
	Zhang RunMin <runmin.zhang@ingenic.com>
Subject: [PATCH] docs: platform: update qemu_virt.md
Date: Thu, 19 Mar 2026 20:56:24 +0800
Message-ID: <20260319125641.480161-1-runmin.zhang@ingenic.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_055804_579275_628A406F 
X-CRM114-Status: UNSURE (   8.32  )
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

From: Zhang RunMin <runmin.zhang@ingenic.com>

When using GDB for debugging, if FW_TEXT_START is not set to 0x80000000
during compilation, the following error occurs:

Reading symbols from build/platform/generic/firmware/fw_payload.elf...
Remote debugging using localhost:1234
mips_warm_boot ()
    at /home/zrmin/opensbi/platform/generic/mips/mips_warm_boot.S:11
11      j       _start_warm
(gdb) b _start
Breakpoint 1 at 0x0: file /home/zrmin/opensbi/firmware/fw_base.S, line 50.
(gdb) c
Continuing.
Remote connection closed
(gdb)

With FW_TEXT_START=0x80000000, debugging works correctly:
Reading symbols from build/platform/generic/firmware/fw_payload.elf...
Remote debugging using localhost:1234
0x0000000000001000 in ?? ()
(gdb) b _start
Breakpoint 1 at 0x80000000: file /home/zrmin/opensbi/firmware/fw_base.S, line 50.
(gdb) c
Continuing.

Breakpoint 1, _start () at /home/zrmin/opensbi/firmware/fw_base.S:50
50      MOV_3R  s0, a0, s1, a1, s2, a2
(gdb)

This is because QEMU loads OpenSBI at address 0x80000000. When
FW_TEXT_START does not match this address, the debug symbols are
incorrectly offset, causing GDB to fail to set breakpoints properly.

Signed-off-by: Zhang RunMin <runmin.zhang@ingenic.com>
---
 docs/platform/qemu_virt.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/platform/qemu_virt.md b/docs/platform/qemu_virt.md
index fd87ee5a..4513df8b 100644
--- a/docs/platform/qemu_virt.md
+++ b/docs/platform/qemu_virt.md
@@ -158,6 +158,9 @@ qemu-system-riscv32 -M virt -m 256M -nographic \
 Debugging with GDB
 ------------------
 
+Note: the command line examples here assume that OpenSBI was compiled using
+the `DEBUG=1 FW_TEXT_START=0x80000000` configuration.
+
 In a first console start OpenSBI with QEMU:
 
 ```
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
