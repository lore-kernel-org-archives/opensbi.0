Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493E0C83030
	for <opensbi@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrsumNuh5oAG5WZI1/2j6cjsRwIc0vK2uptYCdUksUg=; b=cWa0wArxKwWby0
	Es0AsLFXX65Pb7fX4/ktwubSSEMVphJeNDBtFsW9m5aIWHOI6m5ohNAKRNr7ipxXboIrV5Xw5dBVD
	DxdV6b/0lXZhXBAxlGGHkxo3MEpj0g8GQTDqnr8Ie7ydpEjpsBm80V8V6GPRwcCx6b8JJwd/WCFn9
	9izdccgY3BMx8+wv8vzJ5RiDEazgyTKUffUj2RdFmghFTgHY+oWqkOrxqXGtyLxaRinzRXeZ7d6aI
	d2fYa+IhSBA/Hjetc9fAD0TV1HAOMHZJL933miBHXFJP91zmVdkFLpjtyCx5J5o/DL4Ezf5DOFD+3
	oWmSIJDfJ6jZHh2aAiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzg-0000000CTOU-3xXg;
	Thu, 03 Jul 2025 20:57:20 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLjo-0000000Bne4-3nBZ
	for opensbi@lists.infradead.org;
	Thu, 03 Jul 2025 15:20:40 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 563FKDFY014175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 23:20:13 +0800 (+08)
	(envelope-from alvinga@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 3 Jul 2025
 23:20:13 +0800
From: Alvin Chang <alvinga@andestech.com>
To: <opensbi@lists.infradead.org>
CC: <anup@brainfault.org>, <peter.lin@sifive.com>, <wxjstz@126.com>,
        "Alvin
 Chang" <alvinga@andestech.com>
Subject: [PATCH v3 2/2] firmware: Initial compiler built-in stack protector support
Date: Thu, 3 Jul 2025 23:19:57 +0800
Message-ID: <20250703151957.2545958-3-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703151957.2545958-1-alvinga@andestech.com>
References: <20250703151957.2545958-1-alvinga@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 563FKDFY014175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_082037_491985_86229319 
X-CRM114-Status: GOOD (  13.79  )
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

Add __stack_chk_fail() and __stack_chk_guard variable which are used by
compiler built-in stack protector.

This patch just try to support stack-protector so the value of the stack
guard variable is simply fixed for now. It could be improved by
deriving from a random number generator, such as Zkr extension or any
platform-specific random number sources.

Introduce three configurations for the stack protector:
1. CONFIG_STACK_PROTECTOR to enable the stack protector feature by
   providing "-fstack-protector" compiler flag
2. CONFIG_STACK_PROTECTOR_STRONG to provide "-fstack-protector-strong"
3. CONFIG_STACK_PROTECTOR_ALL to provide "-fstack-protector-all"

Instead of fixing the compiler flag of stack-protector feature as
"-fstack-protector", we derive it from the introduced Kconfig
configurations. The compiler flag "stack-protector-cflags-y" is defined
as Makefile "immediately expanded variables" with ":=". Thus, the
stronger configuration of the stack protector can overwrite the
preceding one.

Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
 firmware/Kconfig              | 27 +++++++++++++++++++++++++++
 firmware/fw_base.S            | 21 +++++++++++++++++++++
 firmware/objects.mk           |  9 +++++++++
 firmware/payloads/test_head.S | 15 +++++++++++++++
 4 files changed, 72 insertions(+)

diff --git a/firmware/Kconfig b/firmware/Kconfig
index d6e0506..c1fee19 100644
--- a/firmware/Kconfig
+++ b/firmware/Kconfig
@@ -1 +1,28 @@
 # SPDX-License-Identifier: BSD-2-Clause
+
+menu "Stack Protector Support"
+
+config STACK_PROTECTOR
+	bool "Stack Protector buffer overflow detection"
+	default n
+	help
+	  This option turns on the "stack-protector" compiler feature.
+
+config STACK_PROTECTOR_STRONG
+	bool "Strong Stack Protector"
+	depends on STACK_PROTECTOR
+	default n
+	help
+	  Turn on the "stack-protector" with "-fstack-protector-strong" option.
+	  Like -fstack-protector but includes additional functions to be
+	  protected.
+
+config STACK_PROTECTOR_ALL
+	bool "Almighty Stack Protector"
+	depends on STACK_PROTECTOR
+	default n
+	help
+	  Turn on the "stack-protector" with "-fstack-protector-all" option.
+	  Like -fstack-protector except that all functions are protected.
+
+endmenu
diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 2498797..a008fa7 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -736,6 +736,27 @@ _reset_regs:
 
 	ret
 
+	.section .rodata
+.Lstack_corrupt_msg:
+	.string "stack smashing detected\n"
+
+	/* This will be called when the stack corruption is detected */
+	.section .text
+	.align 3
+	.globl __stack_chk_fail
+	.type __stack_chk_fail, %function
+__stack_chk_fail:
+	la	a0, .Lstack_corrupt_msg
+	call	sbi_panic
+
+	/* Initial value of the stack guard variable */
+	.section .data
+	.align 3
+	.globl __stack_chk_guard
+	.type __stack_chk_guard, %object
+__stack_chk_guard:
+	RISCV_PTR	0x95B5FF5A
+
 #ifdef FW_FDT_PATH
 	.section .rodata
 	.align 4
diff --git a/firmware/objects.mk b/firmware/objects.mk
index a90485d..bfec467 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -66,3 +66,12 @@ endif
 ifdef FW_OPTIONS
 firmware-genflags-y += -DFW_OPTIONS=$(FW_OPTIONS)
 endif
+
+ifeq ($(CONFIG_STACK_PROTECTOR),y)
+stack-protector-cflags-$(CONFIG_STACK_PROTECTOR) := -fstack-protector
+stack-protector-cflags-$(CONFIG_STACK_PROTECTOR_STRONG) := -fstack-protector-strong
+stack-protector-cflags-$(CONFIG_STACK_PROTECTOR_ALL) := -fstack-protector-all
+else
+stack-protector-cflags-y := -fno-stack-protector
+endif
+firmware-cflags-y += $(stack-protector-cflags-y)
diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
index 7d25e07..070ce8a 100644
--- a/firmware/payloads/test_head.S
+++ b/firmware/payloads/test_head.S
@@ -97,3 +97,18 @@ _boot_a0:
 	RISCV_PTR	0
 _boot_a1:
 	RISCV_PTR	0
+
+	/* This will be called when the stack corruption is detected */
+	.section .text
+	.align 3
+	.globl __stack_chk_fail
+	.type __stack_chk_fail, %function
+	.equ  __stack_chk_fail, _start_hang
+
+	/* Initial value of the stack guard variable */
+	.section .data
+	.align 3
+	.globl __stack_chk_guard
+	.type __stack_chk_guard, %object
+__stack_chk_guard:
+	RISCV_PTR	0x95B5FF5A
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
