Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E930C44501
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 03:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGROHrMjCvY35VK4qRr9Uc2KFvyywGQWD/bMLvmeciA=; b=dBrZAq+lMkDZe+
	yYOrmofGkmHUq7HdBkSvuspQjtyWlJJEf6LJncN665SSszVjcfzhM+fc0fAUR6uMxY/FplWBRs2Lj
	Wqbkh6dp4LOpHNHRy5BQjPKcqbuzumijl/InQGc7s+txmha6eauJCOxtKF02ZpW+il+0725I4wzbS
	kjbrKdPrOsnoxtEr3wfsqkczhq87pREo8kRVsGpyKiuD1OOTcz7HCd6ngyQ4DRKLgDSxurcWSyqYK
	BmndnHrshHzl07U2W827ysc54b4gU/MlhUgn6okf7sH5Tw2mmkfrTLcCT6yk2KWlMe9AsK6tdT/eX
	/qtqTEWd8mIpPGySWCSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfI-0000000E18n-1lz0;
	Tue, 07 Jul 2026 03:40:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfA-0000000E15e-3vqy
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 03:40:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso2645640a91.1
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 20:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1783395600; x=1784000400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgjlMq8qFaGPIaatvoERNosPAIZaA38C7uxJ87iEe1s=;
        b=bqSSvqJiL5V4rqJHNgDt08o41wB8COv9lEV9CHapfvpUdk0Cx6VhnMw7dbzPoxng7y
         9T3Ui0uBoprA5S9vn1dNnvlFpAptmKhOOTeDJpvdDIjkPjMh7tE1G6sjilGJew7zW9Gu
         0pTYa6wPasSYWGKBLPmn55a7ZzhV+82f5xsn6lUq02mrGBLI6lPzmB7fZZfCFZGJvnrx
         6dOSt2ocZT1J6a+HyeOqwZwkwlALcDggLGTCiAwOvEGCFTQ8tWwUQM8Cev3JCNmXa+By
         Wp5OGpK+q0f7slcVnxWBfkLpO5981maXgIGJ+qOI/FX5ITectia2wPM1Eg4djCOmtkyy
         ZRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395600; x=1784000400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dgjlMq8qFaGPIaatvoERNosPAIZaA38C7uxJ87iEe1s=;
        b=iSMyyvZ+bGA2eEkCsxSk1L1fgT5YS7vGaoSWa2wCh7dT5yNnZ3v7OQjFSKGtsMW8xw
         8/yB0+0FgRR4Na0u2NG/901/HnD9fU/aiq+RJNLQKNVMt62drbBAJUdN5Z/zmZqRZSIu
         2LXbaz69f4D4WCtjeUrZUeosmhaX0ld7FGsXhgSntpADLl7mREx5XuDwevWb9uFR9dWv
         JsclwxlASqRJE/j/Mz2Ac+osfYMeTc1hOwSBZ2Txr2xS/tpBTIZ7hxczx94v1Af/PWcn
         i1nB16OaLii2eqD4wJokaFjW+cy9iQu+vx7JCCKiNxmFQb0YVOOawQbJuCYTaSqCjD6N
         O/Mw==
X-Gm-Message-State: AOJu0YwA6QndQ/kpG3OznLSnaxQW3AHoKc5TtInstC8z58VKY2AnSV/+
	g2f/4XaP8lQkqn1emZ0GScBcGrx/twqYko5AcoilRrnL3QMaSEkzjFPkBStkxeiHj4mWM1C1lQo
	xNcQSHNTi/E3EFGDpJMp3oDmqzqfECHqDfXwe//QX8GQICjF1Wt+5IyQJb1U+7TK+Esi/I3Tc5w
	JYnwWFJ9bPstOi9W2PJD4jLo1Qi/zQ+LsC1gdd1i78pBRRWBAJ
X-Gm-Gg: AfdE7cnHFK1GSQxAnbi4j4PV5RIFPi9qwQrXuk9bYM7I9DB63qHHgVuiiCITxp2hVIp
	14gJwv7FDSqqU8MMUWuwxU3EV6U+FwWxuWG1ARhoWoH6VmCdCcULPgRB+n4FoMh0l2QQ9xrxqm7
	ENKiZ+ae8AHpxgBUw3dtnNZX+AvJPeqe2kq/1mAF+OqXa1Rz242r+0NDMYh3jlHnNe/XurVHdF/
	OCYv5mSQ7hjHLPfYwdje4kbFZx9dcnq0DbXcPV6REv3BkcwxMPSMp2ZiAoipaYKZYRcSOO5LW0U
	XhZChCmt2YiQ7erIhlshjHIoW4A5w4E2wokav5q43bIXavIkQQVMM0OioWOTCU/u6egA5Tav/m0
	NIaFFkFEkWt/HXVwpX6V+PzebvEJzl4qLaHSKKPfOtbttV1WTJ/Zk67LJx0dH8tamWBn9IBFR0b
	gBeR8TitLn8FVX3msITru2IbxK
X-Received: by 2002:a17:90b:58c4:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-38756ce14f5mr3331538a91.17.1783395599641;
        Mon, 06 Jul 2026 20:39:59 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm2904096eec.2.2026.07.06.20.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:39:59 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 3/7] firmware: add fw_dynamic_append firmware type
Date: Mon,  6 Jul 2026 20:39:50 -0700
Message-ID: <20260707033954.2054859-4-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260707033954.2054859-1-zong.li@sifive.com>
References: <20260707033954.2054859-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_204001_430747_CF182AE9 
X-CRM114-Status: GOOD (  22.26  )
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

Add a fourth firmware type, FW_DYNAMIC_APPEND, alongside FW_DYNAMIC,
FW_JUMP and FW_PAYLOAD.

fw_dynamic_append.S reuses all the dynamic-info hook functions from
fw_dynamic.S, and additionally reserves a struct fw_dynamic_info
instance in the .fw_dynamic_info section, and provides
'fw_dynamic_append_boot_args', which clears the GPRs and sets
a0=mhartid, a2=&struct and a1=boot_dtb. boot_dtb is read only when
the struct reports version >= FW_DYNAMIC_INFO_VERSION_3. For an
older layout a1 is left at 0 instead of reading past it. That section
is laid out right before .bss by fw_base.ldS, i.e. at the very tail of
the flat binary, where the previous booting stage can find and patch it.

The previous booting stage needs to be responsible for patching the
whole structure at runtime. Because the section is %progbits and KEEP().
the zero-initialised reservation is still emitted to the tail of the
.bin. Defining FW_DYNAMIC_APPEND before including fw_dynamic.S turns on
the matching entry fixup in fw_base.S for this object only.

fw_dynamic_append.elf.ldS mirrors fw_dynamic.elf.ldS, but additionally
defines 'FW_DYNAMIC_APPEND' before including fw_base.ldS; that is what
turns on the .fw_dynamic_info output section for this firmware type only.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 firmware/fw_dynamic_append.S       | 106 +++++++++++++++++++++++++++++
 firmware/fw_dynamic_append.elf.ldS |  24 +++++++
 2 files changed, 130 insertions(+)
 create mode 100644 firmware/fw_dynamic_append.S
 create mode 100644 firmware/fw_dynamic_append.elf.ldS

diff --git a/firmware/fw_dynamic_append.S b/firmware/fw_dynamic_append.S
new file mode 100644
index 00000000..31eee099
--- /dev/null
+++ b/firmware/fw_dynamic_append.S
@@ -0,0 +1,106 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 SiFive
+ *
+ * Authors:
+ *   Zong Li <zong.li@sifive.com>
+ *
+ * This firmware type behaves like FW_DYNAMIC, except that the
+ * struct fw_dynamic_info is appended at the tail of the OpenSBI binary
+ * (placed before .bss so that it is part of the flat binary file size)
+ * instead of being passed by pointer in a2 by the previous booting stage.
+ *
+ * The previous booting stage is expected to locate the structure at the
+ * end of the .bin image and patch ALL of its fields at runtime (magic,
+ * version, next_addr, next_mode, options, boot_hart and boot_dtb) before
+ * jumping to _start. fw_base.S then synthesizes a0 (mhartid), a1 (boot_dtb)
+ * and a2 (&fw_dynamic_info_append) from this appended structure.
+ */
+
+#include <sbi/fw_dynamic.h>
+
+/* Enable the FW_DYNAMIC_APPEND entry fixup inside fw_base.S */
+#define FW_DYNAMIC_APPEND
+
+/*
+ * Reuse every fw_* hook implementation (fw_boot_hart, fw_save_info,
+ * fw_next_arg1, fw_next_addr, fw_next_mode, fw_options) from fw_dynamic.S.
+ * fw_dynamic.S pulls in fw_base.S for us, with FW_DYNAMIC_APPEND defined.
+ */
+#include "fw_dynamic.S"
+
+	/*
+	 * fw_dynamic_append_boot_args - synthesize the boot register state.
+	 *
+	 * Called once from the cold _start path in fw_base.S (guarded by
+	 * FW_DYNAMIC_APPEND). It runs BEFORE relocation, so only PC-relative
+	 * addressing (lla) and CSR reads are used.
+	 *
+	 * It establishes a0-a4 (the registers _reset_regs does NOT clear) and
+	 * rebuilds the same arguments the other firmware types receive from
+	 * the previous stage; the remaining GPRs are cleared by _reset_regs
+	 * later in the cold path:
+	 *   a0 = mhartid
+	 *   a2 = &fw_dynamic_info_append (the appended structure)
+	 *   a1 = boot_dtb loaded from that structure
+	 *
+	 * ra is intentionally NOT zeroed: it holds the return address for the
+	 * ret below. It is overwritten by the next call in fw_base.S before
+	 * being used, so no stale value is ever observed.
+	 */
+	.section .entry, "ax", %progbits
+	.align 3
+	.global fw_dynamic_append_boot_args
+fw_dynamic_append_boot_args:
+	/* a0 = mhartid */
+	csrr	a0, CSR_MHARTID
+
+	/* a2 = address of the appended fw_dynamic_info */
+	lla	a2, fw_dynamic_info_append
+
+	/*
+	 * a0-a4 are exactly the registers _reset_regs leaves untouched, so
+	 * they are established here. Every other GPR is cleared later by
+	 * _reset_regs in the cold path. a1 defaults to 0 (no dtb) and a3/a4
+	 * are reserved boot args that this firmware type does not use.
+	 */
+	li	a1, 0
+	li	a3, 0
+	li	a4, 0
+
+	/*
+	 * a1 = boot_dtb, but only when the appended structure is version 3
+	 * or newer. boot_dtb was introduced in FW_DYNAMIC_INFO_VERSION_3, so
+	 * an older layout does not carry that field. In that case a1 stays 0
+	 * instead of reading past the end of the struct and handing a garbage
+	 * pointer to the next stage.
+	 */
+	li	t0, FW_DYNAMIC_INFO_VERSION_3
+	REG_L	t1, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
+	blt	t1, t0, 1f
+	REG_L	a1, FW_DYNAMIC_INFO_BOOT_DTB_OFFSET(a2)
+1:	ret
+
+	/*
+	 * Reserve one struct fw_dynamic_info at the tail of the .bin image.
+	 *
+	 * The previous booting stage finds this block at the end of the file
+	 * and fills in every field at runtime.
+	 * The zeros below are placeholders that only reserve file space.
+	 * The section is %progbits (so the bytes are stored in the falt
+	 * binary, unlike .bss) and is KEEP() in fw_base.ldS (so it is never
+	 * garbage-collected), which guarantees the reservation always
+	 * lands at the very tail of the .bin.
+	 */
+	.section .fw_dynamic_info, "aw", %progbits
+	.align 3
+	.global fw_dynamic_info_append
+fw_dynamic_info_append:
+	RISCV_PTR 0x0	/* magic     (patched by prev stage) */
+	RISCV_PTR 0x0	/* version   (patched by prev stage) */
+	RISCV_PTR 0x0	/* next_addr (patched by prev stage) */
+	RISCV_PTR 0x0	/* next_mode (patched by prev stage) */
+	RISCV_PTR 0x0	/* options   (patched by prev stage) */
+	RISCV_PTR 0x0	/* boot_hart (patched by prev stage) */
+	RISCV_PTR 0x0	/* boot_dtb  (patched by prev stage) */
diff --git a/firmware/fw_dynamic_append.elf.ldS b/firmware/fw_dynamic_append.elf.ldS
new file mode 100644
index 00000000..fbc27fc1
--- /dev/null
+++ b/firmware/fw_dynamic_append.elf.ldS
@@ -0,0 +1,24 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 SiFive
+ *
+ * Authors:
+ *   Zong Li <zong.li@sifive.com>
+ */
+
+OUTPUT_ARCH(riscv)
+ENTRY(_start)
+
+/*
+ * Enable the .fw_dynamic_info output section inside fw_base.ldS. This must
+ * be defined before the #include below so the #ifdef in fw_base.ldS sees it
+ */
+#define FW_DYNAMIC_APPEND
+
+SECTIONS
+{
+	#include "fw_base.ldS"
+
+	PROVIDE(_fw_reloc_end = .);
+}
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
