Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3312AC369C2
	for <opensbi@archiver.kernel.org>; Sat,  3 May 2025 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y7eDC35ffQsqZxYTDjLLzHeXs6o72vinkIB9aaBECqs=; b=X+DOw1F4Jm5eLq
	Drgs4CpAFSdoa3Qp2hFcVTi5CuXBfbz9f7bV0ug4XbnVtV9fsxITM+nsDIAtKwlhKum6J1nXP+Ls+
	J8M4HkgG5kgtD6pj78xRuI1jYPhsrgDPQHgBYpCjglv8zxTfHd1Ft2slwO5awp+ueHJ1UUR/b+OzK
	kK11dlpU73jI3GA3iSqZSLnkTf7vfY2JRDg3/RRot5Zg3TiRWAHUtMDguCwHkZvgz8TFJlK2NCmgj
	INtqt7uVoSDD66jiOPMP2YFo07tKtKDC9jqI8ZM4q8itfZJgp69RCv0i5OpWvomLkA7yruEfnfeo2
	VIPkc42kBuXcX2tRQShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBFb3-0000000496C-3Vxw;
	Sat, 03 May 2025 16:20:13 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBFb0-00000004932-2rNZ
	for opensbi@lists.infradead.org;
	Sat, 03 May 2025 16:20:12 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 543GJnPH008205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 00:19:50 +0800 (+08)
	(envelope-from alvinga@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Sun, 4 May 2025
 00:19:49 +0800
From: Alvin Chang <alvinga@andestech.com>
To: <opensbi@lists.infradead.org>
CC: <anup@brainfault.org>, Alvin Chang <alvinga@andestech.com>
Subject: [PATCH] lib: utils: Initial compiler built-in stack protector support
Date: Sun, 4 May 2025 00:19:38 +0800
Message-ID: <20250503161938.646908-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 543GJnPH008205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_092011_035469_3F97C61C 
X-CRM114-Status: GOOD (  17.05  )
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

Add stack_protector.c which defines the stack guard variable and the
function which will be referenced by compiler built-in stack protector.

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
 Makefile                                    |  3 ++-
 lib/utils/Kconfig                           |  2 ++
 lib/utils/stack_protector/Kconfig           | 28 +++++++++++++++++++++
 lib/utils/stack_protector/objects.mk        | 18 +++++++++++++
 lib/utils/stack_protector/stack_protector.c | 18 +++++++++++++
 5 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 lib/utils/stack_protector/Kconfig
 create mode 100644 lib/utils/stack_protector/objects.mk
 create mode 100644 lib/utils/stack_protector/stack_protector.c

diff --git a/Makefile b/Makefile
index e90836c..eae6d16 100644
--- a/Makefile
+++ b/Makefile
@@ -360,7 +360,7 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
 GENFLAGS	+=	$(platform-genflags-y)
 GENFLAGS	+=	$(firmware-genflags-y)
 
-CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
+CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -ffunction-sections -fdata-sections
 CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
 # Optionally supported flags
 ifeq ($(CC_SUPPORT_VECTOR),y)
@@ -379,6 +379,7 @@ CFLAGS		+=	$(GENFLAGS)
 CFLAGS		+=	$(platform-cflags-y)
 CFLAGS		+=	-fPIE -pie
 CFLAGS		+=	$(firmware-cflags-y)
+CFLAGS		+=	$(stack-protector-cflags-y)
 
 CPPFLAGS	+=	$(GENFLAGS)
 CPPFLAGS	+=	$(platform-cppflags-y)
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 901ba56..40e5633 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -26,6 +26,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/serial/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/stack_protector/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/suspend/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/sys/Kconfig"
diff --git a/lib/utils/stack_protector/Kconfig b/lib/utils/stack_protector/Kconfig
new file mode 100644
index 0000000..c1fee19
--- /dev/null
+++ b/lib/utils/stack_protector/Kconfig
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: BSD-2-Clause
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
diff --git a/lib/utils/stack_protector/objects.mk b/lib/utils/stack_protector/objects.mk
new file mode 100644
index 0000000..d7563e3
--- /dev/null
+++ b/lib/utils/stack_protector/objects.mk
@@ -0,0 +1,18 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2025 Andes Technology Corporation
+#
+# Authors:
+#   Alvin Chang <alvinga@andestech.com>
+#
+
+libsbiutils-objs-$(CONFIG_STACK_PROTECTOR) += stack_protector/stack_protector.o
+
+ifeq ($(CONFIG_STACK_PROTECTOR),y)
+stack-protector-cflags-$(CONFIG_STACK_PROTECTOR) := -fstack-protector
+stack-protector-cflags-$(CONFIG_STACK_PROTECTOR_STRONG) := -fstack-protector-strong
+stack-protector-cflags-$(CONFIG_STACK_PROTECTOR_ALL) := -fstack-protector-all
+else
+stack-protector-cflags-y := -fno-stack-protector
+endif
diff --git a/lib/utils/stack_protector/stack_protector.c b/lib/utils/stack_protector/stack_protector.c
new file mode 100644
index 0000000..3088421
--- /dev/null
+++ b/lib/utils/stack_protector/stack_protector.c
@@ -0,0 +1,18 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Andes Technology Corporation
+ *
+ * Authors:
+ *   Alvin Chang <alvinga@andestech.com>
+ */
+
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_types.h>
+
+void *__stack_chk_guard = (void *)0x95B5FF5AUL;
+
+void __noreturn __stack_chk_fail(void)
+{
+	sbi_panic("Stack corruption detected\n");
+}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
