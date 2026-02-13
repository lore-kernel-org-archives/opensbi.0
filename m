Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7D6EDF17D
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GxXKQMZgRZF/ClfD+x3cDRo6bcYGxXoWhkbl2A7SDhA=; b=RlAHCzhQJvljwv
	KyVHH/Ebnb0OUKN/1Up2gK3/wEucfEOE5z7RCZ98VPcWPqM2VqxFGY0n/wbbVVjk8j4NsQpC0/brN
	hR55YYy5UW7T8XltAguhyw9lPkKtLQfaxL5InaLD5eb7I8p786taqbsh5EGZGBHWiVp7fRyyLZcb9
	Bzeq19CeXPOVDRAG3JYt/bBm9H1uLAmxn5icM/rrmg3cz0kX/RP1OiGF8F8LdHAbjfNs9G6MLLy+H
	B0RKWDBHIxEE7RXT2CPacLg5vkzzSRFz5XqQGNGqq4Mybdwlk53fL92uYKIX5wx/+ch8Y0+f3dpKp
	j++GuOlu2ppc2VRVF7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwk4-00000003jD7-1Gps;
	Fri, 13 Feb 2026 17:14:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwk2-00000003jCf-0gM7
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 17:14:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4327790c4e9so888951f8f.2
        for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1771002844; x=1771607644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Env/s5NPd8ap8n11XTGghpFimOuIGepAKXPSOc5rzo=;
        b=jHQE9F+le8JWHmhQg7mJHCFx0/XxAveudoV/PJAXu/CseGotdWxr4tvOiP1vSTUIZQ
         jRcZMeI4VIneZwE3et/uFeOV8sHSRVH78/GdsjTjYgUabZRx/Op5Qp1+Fe+pfF8DyZG6
         5hxYpWNN+x9QVAIzJXXpp5vU1mwsRrGmuSczi92e/zlaKTjQ4i0Sifbq2yE+PzkmM2WQ
         ocOIXXrj5InZGS1pUtNkAPfLYb43IxrHPIth89W9Eytq5x/+MHnVApRO7EU+ZK/iQCym
         i584f/DKp5EZd4/BdpxeDnfzOr+gWub7fV5d7F8nVfZg4ay5qVuMLCrlNu+2sLwt9aoc
         VaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771002844; x=1771607644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Env/s5NPd8ap8n11XTGghpFimOuIGepAKXPSOc5rzo=;
        b=DXZXLRQRkJKHLei/Vxyg/WjvfvktdXMmotv+lUrgDOw3cxiznzgFL/mYYEFnTk8kI3
         +aYId/xrs4inb7LOMJQC9rQ9zPK1142afEEs48e1pul0w96cG7FVaiArYG3czilGfcJ1
         YblgszvxvOxvFu/5PBGWu4k9QHwdSu+jHnXgVCfPIKNLsDTZj0QZctLsDWzsldlRyevm
         BrTkDVC3WBOdVdCB4UofgYoMvCZURgc6J7RJmwuY/90+vulyqVk2OlBgTYcBPxvFSDTV
         l4ntf2WCoCiffPQrDBIAdztn5B9JE0Eq3YfFMY7/qcZZYOhE2TEIew36vDfCavnSgaEL
         4ySw==
X-Gm-Message-State: AOJu0YwVDnqMrbn5WharBOijWXRpeP458WG/MaClelhIZX9HLXWqvBsY
	E8wxlOAVNstg9ZYZodlGPayWJpQhHAh97K0BtuSjoUinVyWkXvtsfWOeh9/zCck83R5bzgeK+PL
	0nLUA00E=
X-Gm-Gg: AZuq6aLmmwzWxwLXk5pCZ/PxPQUMpNqJHz4j8XtJ6noV/hCW8S8V2PE6mfK3igSi/I0
	MlFoIwVFpI4EZ0mISBi9L8nDRBZZF6tqiviRPhB4ml/N25M49b7z0yFyVcJE4n55OMz3YrJEtVQ
	llqh10eEKa5Ev3lozm9Lql3wWrHK56+CmtpKENWmV2E37EEVqAYI2AwY0SOddKJBRSZKyfqz8Xf
	73Mo057FR5wXO/6WVGBdsxl9eMV48RScGFLyL8nqZqcNLjjj+HK4+pcJuXR2euMmruwblAyBp6v
	MSr8857yOwj1s8dfundKNcwae1zejPm0KmNb7gmLEija6T2k/6nyn/YjUXDvX50ZZ73QI8O4Ujt
	yZmqpXWuMUU+vd5evRbtAKvEkcYWkgltnfGXkaTVzgl5YQNrdnB1mVCL1Wh0NYdYWOFzF++20XP
	bmc7p6SR1Bo3rA32cYy7H/Yy40w9/WTMgIY1YX5aS0obNPGSu1c0zoSsbsRJh2W37w5Rg=
X-Received: by 2002:a05:6000:26cb:b0:436:307c:b756 with SMTP id ffacd0b85a97d-43796afa0d3mr5648547f8f.47.1771002843738;
        Fri, 13 Feb 2026 09:14:03 -0800 (PST)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abd259sm6853190f8f.24.2026.02.13.09.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:14:03 -0800 (PST)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [PATCH] paravirt place holder for ecall
Date: Fri, 13 Feb 2026 17:13:59 +0000
Message-ID: <20260213171359.244248-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_091406_224462_191939E7 
X-CRM114-Status: GOOD (  14.70  )
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

From: Dave Patel <dave.patel@riscstar.com>

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_ecall_interface.h |  2 ++
 lib/sbi/Kconfig                   |  4 +++
 lib/sbi/objects.mk                |  3 ++
 lib/sbi/sbi_ecall_addn.c          | 54 +++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 lib/sbi/sbi_ecall_addn.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 76624e3f..5abfee28 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -38,6 +38,7 @@
 #define SBI_EXT_SSE				0x535345
 #define SBI_EXT_FWFT				0x46574654
 #define SBI_EXT_MPXY				0x4D505859
+#define SBI_EXT_ADDN				0x3342634E
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -468,6 +469,7 @@ enum sbi_sse_state {
 #define SBI_EXT_MPXY_SEND_MSG_WITH_RESP		0x5
 #define SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP	0x6
 #define SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS	0x7
+#define MPXY_FUNC_ADD 0x8
 
 /* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index c6cc04bc..e9117046 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -10,6 +10,10 @@ config SBI_ECALL_TIME
 	bool "Timer extension"
 	default y
 
+config SBI_ECALL_ADDN
+	bool "Debug ADDN extension"
+	default y
+
 config SBI_ECALL_RFENCE
 	bool "RFENCE extension"
 	default y
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index bfe196c9..3e9d1569 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -19,6 +19,9 @@ libsbi-objs-y += sbi_ecall_exts.carray.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_TIME) += ecall_time
 libsbi-objs-$(CONFIG_SBI_ECALL_TIME) += sbi_ecall_time.o
 
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_DBCN) += ecall_addn
+libsbi-objs-$(CONFIG_SBI_ECALL_DBCN) += sbi_ecall_addn.o
+
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_RFENCE) += ecall_rfence
 libsbi-objs-$(CONFIG_SBI_ECALL_RFENCE) += sbi_ecall_rfence.o
 
diff --git a/lib/sbi/sbi_ecall_addn.c b/lib/sbi/sbi_ecall_addn.c
new file mode 100644
index 00000000..73e7dd53
--- /dev/null
+++ b/lib/sbi/sbi_ecall_addn.c
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2026 RISCstar Solutions.
+ *
+ * Authors:
+ *     Dave Patel <dave.patel@riscstar.com>
+ */
+
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_hart_protection.h>
+#include <sbi_utils/irqchip/aplic.h>
+
+static int sbi_ecall_addn_handler(unsigned long extid,
+                                 unsigned long funcid,
+                                 struct sbi_trap_regs *regs,
+                                 struct sbi_ecall_return *out)
+{
+       /*
+       // This is were the virtirq vlaue is fetched
+       if (prev_mode == PRV_S && sbi_emulate_irq_read(&irq_val))
+               return truly_illegal_insn(insn, regs);
+       */
+
+    unsigned long a = regs->a0;
+    unsigned long b = regs->a1;
+
+    unsigned long result = a + b;
+
+    out->value = result;
+
+    return SBI_SUCCESS;
+}
+
+
+struct sbi_ecall_extension ecall_addn;
+
+static int sbi_ecall_addn_register_extensions(void)
+{
+    return sbi_ecall_register_extension(&ecall_addn);
+}
+
+struct sbi_ecall_extension ecall_addn = {
+    .name                   = "addn",
+    .extid_start            = SBI_EXT_ADDN,
+    .extid_end              = SBI_EXT_ADDN,
+    .register_extensions    = sbi_ecall_addn_register_extensions,
+    .handle         = sbi_ecall_addn_handler,
+};
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
