Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A910ECEACCE
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 20:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFvrbv4shUvO+N7kHR4n0xoWNrK8UceWy3t+TYkA3aw=; b=CZPt2ZwDnFjBIZ
	yrZ1jopQzFvtKLD6IK0LYRra68QQCrIIfJr3+Kh6bFUdtgYXasLN6OmRZ4E/v8nXXDYtytnoXsPCl
	xt/xuHgKqwL/iO2u/+iXNKfsxh1rmnPgFkpjhTs5H/ktJLyiiL4lBT+Wv/qSbD7tH3cT/JC7YBMGZ
	m29UWnI5+o1FC1Vaw4DayKKYUEjOBaQhQL5wvKLdRNRa1I2ny2+fscYMrjbdmCOXANVIt/XZOkOLp
	0xleo6ODVJr1riZusHJoPJj7nSgdHt5WZtjBt2pMzH8LzgDBM+kU7dYeueojhNcc92ZYCiWVB1w5B
	wU90WGPcurhSVOa9FyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZY-0000000D5oN-1joq;
	Fri, 14 Nov 2025 20:39:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZW-0000000D5lp-0zNz
	for opensbi@bombadil.infradead.org;
	Fri, 14 Nov 2025 20:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Fzu99abqfNPlSTwhMMCFjuPsvPIPRgjAEQHWVyGv3zA=; b=UF9SGgf6vMJw2kwCHMwA+PF5FD
	RNF3/ogBO7gkTCG/YWPso2HAiDLZY42vK4l1d9w0pwp+hs4oe+kRaLq8CgJxXrvdINaiSmwYSk1He
	tejsvFbKcVC7OpYQWR7KVh93WlHZG8M4frYzrxwyBLPQSEl5kcB63rjaClpiAC4GAfMjfTIcbay0P
	YeA5S7rlB1I1c5eLlCZv9fPk3AfYk9FnkpE8uYPZn5ZUw80o196zsJbibDR/I7ZQw9oXQL7kdDnRw
	GE7SooN/C4jrGVftiHCKfE5LGSTlDVqyOMmEkNQXnUi/i6g+ndXspI+T7OUCgdcEWW6RGYsbZ1HCR
	JjrNGetw==;
Received: from mout.gmx.net ([212.227.15.19])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzhn-00000003U03-2fRP
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 19:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1763152741; x=1763757541; i=b.freisen@gmx.net;
	bh=Fzu99abqfNPlSTwhMMCFjuPsvPIPRgjAEQHWVyGv3zA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e80Dx3+rCXfhDKqltQ45NwO5f7DWpBGWGYIUAKmHyVPP2Uyu8W7kR/QqikvYu5SJ
	 7GlQ6ydaW5LhTyZn5ncqdnXbylCONGY9d6wcx67UHAY7BoazCM10zW4YagUYxdSqI
	 nhMVTea5D5dkXrF0S1rB8IPOQf3BHBzhO6uU2WLqHh2+AUQsZ4PQdaPU5g4PjQUlH
	 1jaJoIafeYQ12NII80aH90RGvKRzNUY85BpIroklq1ZvMTVO1hdbmsYny6SuahnnW
	 oFKRZPJRLYI+bVJXjkLTfvgOSOKboJMv0YUhHqNQzV27awYSKgyXYMmHenHzyzX6m
	 dAP2vZDN1H2mLRxUFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.138]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVNAr-1viaME25xP-00K9oy; Fri, 14
 Nov 2025 21:39:01 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH v2 7/7] lib: sbi: ISA extension emulation (Zvbb).
Date: Fri, 14 Nov 2025 21:38:42 +0100
Message-ID: <20251114203842.13396-8-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114203842.13396-1-b.freisen@gmx.net>
References: <20251114203842.13396-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:HNMIxHquxDOjj4fHervJeIDo78w+oT2B5ZDIQDQPERt6Ve9e4ro
 /vELFax4BsUpQK99U6ydiVUD0oEqzdY0Kqe8B0uolSn7ZDclWy+d8Z5jC5UxSJQuQ0toENh
 SUlwylgJCK2Sb0qPJJFF4snJP39wnU8hiVyh7WaF0lmvh/ZpZBgt3LEpPGbBT8FSLAG+cpB
 J8xMX1AbbJTuRcRdDJvQg==
UI-OutboundReport: notjunk:1;M01:P0:m6kaJbe5ZRw=;E40nH8ls8fS2JSvSiXSqNpUhE6m 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 zN4UhCtH7ysaWFkTEKsdApVGFCYgd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_194335_909484_EB93E8BA 
X-CRM114-Status: GOOD (  13.90  )
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

Add trap-based emulation code for the ISA extension Zvbb based on RVV 1.0 and Zbb.

Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
---
 include/sbi/sbi_insn_emu_v.h |   21 +
 lib/sbi/objects.mk           |    1 +
 lib/sbi/sbi_illegal_insn.c   |    3 +-
 lib/sbi/sbi_insn_emu.conf    |   24 +
 lib/sbi/sbi_insn_emu_v.c     | 1146 ++++++++++++++++++++++++++++++++++
 5 files changed, 1194 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi/sbi_insn_emu_v.h
 create mode 100644 lib/sbi/sbi_insn_emu_v.c

diff --git a/include/sbi/sbi_insn_emu_v.h b/include/sbi/sbi_insn_emu_v.h
new file mode 100644
index 0000000..0dfc9cc
--- /dev/null
+++ b/include/sbi/sbi_insn_emu_v.h
@@ -0,0 +1,21 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Benedikt Freisen.
+ *
+ * Authors:
+ *   Benedikt Freisen <b.freisen@gmx.net>
+ */
+
+#ifndef __SBI_INSN_EMU_V_H__
+#define __SBI_INSN_EMU_V_H__
+
+#include <sbi/sbi_types.h>
+
+#if __riscv_xlen == 64 && CONFIG_EMU_ZVBB && defined(OPENSBI_CC_SUPPORT_VECTOR)
+int sbi_insn_emu_op_v(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_op_v truly_illegal_insn
+#endif
+
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07cfaa6..0da775c 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -83,6 +83,7 @@ libsbi-objs-y += sbi_illegal_atomic.o
 libsbi-objs-y += sbi_illegal_insn.o
 libsbi-objs-y += sbi_insn_emu.o
 libsbi-objs-y += sbi_insn_emu_fp.o
+libsbi-objs-y += sbi_insn_emu_v.o
 libsbi-objs-y += sbi_init.o
 libsbi-objs-y += sbi_ipi.o
 libsbi-objs-y += sbi_irqchip.o
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index a328f68..d22cdda 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -21,6 +21,7 @@
 #include <sbi/sbi_illegal_insn.h>
 #include <sbi/sbi_insn_emu.h>
 #include <sbi/sbi_insn_emu_fp.h>
+#include <sbi/sbi_insn_emu_v.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
@@ -171,7 +172,7 @@ static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn,	/* 18 */
 	truly_illegal_insn,	/* 19 */
 	sbi_insn_emu_op_fp,	/* 20 */
-	truly_illegal_insn,	/* 21 */
+	sbi_insn_emu_op_v,	/* 21 */
 	truly_illegal_insn,	/* 22 */
 	truly_illegal_insn,	/* 23 */
 	truly_illegal_insn,	/* 24 */
diff --git a/lib/sbi/sbi_insn_emu.conf b/lib/sbi/sbi_insn_emu.conf
index 3aeaa34..bd35aa4 100644
--- a/lib/sbi/sbi_insn_emu.conf
+++ b/lib/sbi/sbi_insn_emu.conf
@@ -139,6 +139,30 @@ config EMU_ZBS
 	  Single-bit instructions.
 	depends on SBI_ISA_EXT_EMU
 
+config EMU_ZVBB
+	bool "Zvbb (needs RVV 1.0 and Zbb)"
+	default n
+	help
+	  Vector basic bit-manipulation instructions.
+	  Zvbb emulation strictly requires RVV 1.0 hardware.
+	  It also uses (native or emulated) Zbb instructions.
+	depends on SBI_ISA_EXT_EMU
+
+if EMU_ZVBB
+choice EMU_ZVBB_VLMAX_BYTES
+	prompt "Reserve buffers for VLEN of at most:"
+	default EMU_ZVBB_VLEN_256
+	config EMU_ZVBB_VLEN_128
+		bool "128 bits"
+	config EMU_ZVBB_VLEN_256
+		bool "256 bits"
+	config EMU_ZVBB_VLEN_512
+		bool "512 bits"
+	config EMU_ZVBB_VLEN_1024
+		bool "1024 bits"
+endchoice
+endif
+
 config EMU_SUPM
 	bool "Supm"
 	default n
diff --git a/lib/sbi/sbi_insn_emu_v.c b/lib/sbi/sbi_insn_emu_v.c
new file mode 100644
index 0000000..517791e
--- /dev/null
+++ b/lib/sbi/sbi_insn_emu_v.c
@@ -0,0 +1,1146 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Benedikt Freisen.
+ *
+ * Authors:
+ *   Benedikt Freisen <b.freisen@gmx.net>
+ */
+
+#if __riscv_xlen == 64 && CONFIG_EMU_ZVBB
+
+#ifndef OPENSBI_CC_SUPPORT_VECTOR
+#error "Zvbb emulation requires a toolchain that supports the V extension!"
+#endif
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_illegal_insn.h>
+#include <sbi/sbi_trap.h>
+
+/* we need a buffer size of eight times VLEN bits */
+#if CONFIG_EMU_ZVBB_VLEN_128
+#define VLMAX_BYTES (8 * 16)
+#endif
+
+#if CONFIG_EMU_ZVBB_VLEN_256
+#define VLMAX_BYTES (8 * 32)
+#endif
+
+#if CONFIG_EMU_ZVBB_VLEN_512
+#define VLMAX_BYTES (8 * 64)
+#endif
+
+#if CONFIG_EMU_ZVBB_VLEN_1024
+#define VLMAX_BYTES (8 * 128)
+#endif
+
+typedef union {
+	u8 u8[VLMAX_BYTES];
+	u16 u16[VLMAX_BYTES / 2];
+	u32 u32[VLMAX_BYTES / 4];
+	u64 u64[VLMAX_BYTES / 8];
+} sbi_vector_data;
+
+#define INLINE_VSE8(nstr, dest)                    \
+	asm volatile(".option push\n\t"            \
+		     ".option arch, +v\n\t"        \
+		     "vse8.v " nstr ", (%0)\n\t"   \
+		     ".option pop\n\t" ::"r"(dest) \
+		     : "memory");
+
+#define CASE_N_INLINE_VSE8(n, nstr, dest) \
+	case n:                           \
+		INLINE_VSE8(nstr, dest);  \
+		break;
+
+#define INLINE_VSE16(nstr, dest)                   \
+	asm volatile(".option push\n\t"            \
+		     ".option arch, +v\n\t"        \
+		     "vse16.v " nstr ", (%0)\n\t"  \
+		     ".option pop\n\t" ::"r"(dest) \
+		     : "memory");
+
+#define CASE_N_INLINE_VSE16(n, nstr, dest) \
+	case n:                            \
+		INLINE_VSE16(nstr, dest);  \
+		break;
+
+#define INLINE_VSE32(nstr, dest)                   \
+	asm volatile(".option push\n\t"            \
+		     ".option arch, +v\n\t"        \
+		     "vse32.v " nstr ", (%0)\n\t"  \
+		     ".option pop\n\t" ::"r"(dest) \
+		     : "memory");
+
+#define CASE_N_INLINE_VSE32(n, nstr, dest) \
+	case n:                            \
+		INLINE_VSE32(nstr, dest);  \
+		break;
+
+#define INLINE_VSE64(nstr, dest)                   \
+	asm volatile(".option push\n\t"            \
+		     ".option arch, +v\n\t"        \
+		     "vse64.v " nstr ", (%0)\n\t"  \
+		     ".option pop\n\t" ::"r"(dest) \
+		     : "memory");
+
+#define CASE_N_INLINE_VSE64(n, nstr, dest) \
+	case n:                            \
+		INLINE_VSE64(nstr, dest);  \
+		break;
+
+static inline void get_vector_as_array_u8(int n, sbi_vector_data *dest)
+{
+	switch (n) {
+		CASE_N_INLINE_VSE8(0, "v0", dest);
+		CASE_N_INLINE_VSE8(1, "v1", dest);
+		CASE_N_INLINE_VSE8(2, "v2", dest);
+		CASE_N_INLINE_VSE8(3, "v3", dest);
+		CASE_N_INLINE_VSE8(4, "v4", dest);
+		CASE_N_INLINE_VSE8(5, "v5", dest);
+		CASE_N_INLINE_VSE8(6, "v6", dest);
+		CASE_N_INLINE_VSE8(7, "v7", dest);
+		CASE_N_INLINE_VSE8(8, "v8", dest);
+		CASE_N_INLINE_VSE8(9, "v9", dest);
+		CASE_N_INLINE_VSE8(10, "v10", dest);
+		CASE_N_INLINE_VSE8(11, "v11", dest);
+		CASE_N_INLINE_VSE8(12, "v12", dest);
+		CASE_N_INLINE_VSE8(13, "v13", dest);
+		CASE_N_INLINE_VSE8(14, "v14", dest);
+		CASE_N_INLINE_VSE8(15, "v15", dest);
+		CASE_N_INLINE_VSE8(16, "v16", dest);
+		CASE_N_INLINE_VSE8(17, "v17", dest);
+		CASE_N_INLINE_VSE8(18, "v18", dest);
+		CASE_N_INLINE_VSE8(19, "v19", dest);
+		CASE_N_INLINE_VSE8(20, "v20", dest);
+		CASE_N_INLINE_VSE8(21, "v21", dest);
+		CASE_N_INLINE_VSE8(22, "v22", dest);
+		CASE_N_INLINE_VSE8(23, "v23", dest);
+		CASE_N_INLINE_VSE8(24, "v24", dest);
+		CASE_N_INLINE_VSE8(25, "v25", dest);
+		CASE_N_INLINE_VSE8(26, "v26", dest);
+		CASE_N_INLINE_VSE8(27, "v27", dest);
+		CASE_N_INLINE_VSE8(28, "v28", dest);
+		CASE_N_INLINE_VSE8(29, "v29", dest);
+		CASE_N_INLINE_VSE8(30, "v30", dest);
+		CASE_N_INLINE_VSE8(31, "v31", dest);
+	}
+}
+
+static inline void get_vector_as_array_u16(int n, sbi_vector_data *dest)
+{
+	switch (n) {
+		CASE_N_INLINE_VSE16(0, "v0", dest);
+		CASE_N_INLINE_VSE16(1, "v1", dest);
+		CASE_N_INLINE_VSE16(2, "v2", dest);
+		CASE_N_INLINE_VSE16(3, "v3", dest);
+		CASE_N_INLINE_VSE16(4, "v4", dest);
+		CASE_N_INLINE_VSE16(5, "v5", dest);
+		CASE_N_INLINE_VSE16(6, "v6", dest);
+		CASE_N_INLINE_VSE16(7, "v7", dest);
+		CASE_N_INLINE_VSE16(8, "v8", dest);
+		CASE_N_INLINE_VSE16(9, "v9", dest);
+		CASE_N_INLINE_VSE16(10, "v10", dest);
+		CASE_N_INLINE_VSE16(11, "v11", dest);
+		CASE_N_INLINE_VSE16(12, "v12", dest);
+		CASE_N_INLINE_VSE16(13, "v13", dest);
+		CASE_N_INLINE_VSE16(14, "v14", dest);
+		CASE_N_INLINE_VSE16(15, "v15", dest);
+		CASE_N_INLINE_VSE16(16, "v16", dest);
+		CASE_N_INLINE_VSE16(17, "v17", dest);
+		CASE_N_INLINE_VSE16(18, "v18", dest);
+		CASE_N_INLINE_VSE16(19, "v19", dest);
+		CASE_N_INLINE_VSE16(20, "v20", dest);
+		CASE_N_INLINE_VSE16(21, "v21", dest);
+		CASE_N_INLINE_VSE16(22, "v22", dest);
+		CASE_N_INLINE_VSE16(23, "v23", dest);
+		CASE_N_INLINE_VSE16(24, "v24", dest);
+		CASE_N_INLINE_VSE16(25, "v25", dest);
+		CASE_N_INLINE_VSE16(26, "v26", dest);
+		CASE_N_INLINE_VSE16(27, "v27", dest);
+		CASE_N_INLINE_VSE16(28, "v28", dest);
+		CASE_N_INLINE_VSE16(29, "v29", dest);
+		CASE_N_INLINE_VSE16(30, "v30", dest);
+		CASE_N_INLINE_VSE16(31, "v31", dest);
+	}
+}
+
+static inline void get_vector_as_array_u32(int n, sbi_vector_data *dest)
+{
+	switch (n) {
+		CASE_N_INLINE_VSE32(0, "v0", dest);
+		CASE_N_INLINE_VSE32(1, "v1", dest);
+		CASE_N_INLINE_VSE32(2, "v2", dest);
+		CASE_N_INLINE_VSE32(3, "v3", dest);
+		CASE_N_INLINE_VSE32(4, "v4", dest);
+		CASE_N_INLINE_VSE32(5, "v5", dest);
+		CASE_N_INLINE_VSE32(6, "v6", dest);
+		CASE_N_INLINE_VSE32(7, "v7", dest);
+		CASE_N_INLINE_VSE32(8, "v8", dest);
+		CASE_N_INLINE_VSE32(9, "v9", dest);
+		CASE_N_INLINE_VSE32(10, "v10", dest);
+		CASE_N_INLINE_VSE32(11, "v11", dest);
+		CASE_N_INLINE_VSE32(12, "v12", dest);
+		CASE_N_INLINE_VSE32(13, "v13", dest);
+		CASE_N_INLINE_VSE32(14, "v14", dest);
+		CASE_N_INLINE_VSE32(15, "v15", dest);
+		CASE_N_INLINE_VSE32(16, "v16", dest);
+		CASE_N_INLINE_VSE32(17, "v17", dest);
+		CASE_N_INLINE_VSE32(18, "v18", dest);
+		CASE_N_INLINE_VSE32(19, "v19", dest);
+		CASE_N_INLINE_VSE32(20, "v20", dest);
+		CASE_N_INLINE_VSE32(21, "v21", dest);
+		CASE_N_INLINE_VSE32(22, "v22", dest);
+		CASE_N_INLINE_VSE32(23, "v23", dest);
+		CASE_N_INLINE_VSE32(24, "v24", dest);
+		CASE_N_INLINE_VSE32(25, "v25", dest);
+		CASE_N_INLINE_VSE32(26, "v26", dest);
+		CASE_N_INLINE_VSE32(27, "v27", dest);
+		CASE_N_INLINE_VSE32(28, "v28", dest);
+		CASE_N_INLINE_VSE32(29, "v29", dest);
+		CASE_N_INLINE_VSE32(30, "v30", dest);
+		CASE_N_INLINE_VSE32(31, "v31", dest);
+	}
+}
+
+static inline void get_vector_as_array_u64(int n, sbi_vector_data *dest)
+{
+	switch (n) {
+		CASE_N_INLINE_VSE64(0, "v0", dest);
+		CASE_N_INLINE_VSE64(1, "v1", dest);
+		CASE_N_INLINE_VSE64(2, "v2", dest);
+		CASE_N_INLINE_VSE64(3, "v3", dest);
+		CASE_N_INLINE_VSE64(4, "v4", dest);
+		CASE_N_INLINE_VSE64(5, "v5", dest);
+		CASE_N_INLINE_VSE64(6, "v6", dest);
+		CASE_N_INLINE_VSE64(7, "v7", dest);
+		CASE_N_INLINE_VSE64(8, "v8", dest);
+		CASE_N_INLINE_VSE64(9, "v9", dest);
+		CASE_N_INLINE_VSE64(10, "v10", dest);
+		CASE_N_INLINE_VSE64(11, "v11", dest);
+		CASE_N_INLINE_VSE64(12, "v12", dest);
+		CASE_N_INLINE_VSE64(13, "v13", dest);
+		CASE_N_INLINE_VSE64(14, "v14", dest);
+		CASE_N_INLINE_VSE64(15, "v15", dest);
+		CASE_N_INLINE_VSE64(16, "v16", dest);
+		CASE_N_INLINE_VSE64(17, "v17", dest);
+		CASE_N_INLINE_VSE64(18, "v18", dest);
+		CASE_N_INLINE_VSE64(19, "v19", dest);
+		CASE_N_INLINE_VSE64(20, "v20", dest);
+		CASE_N_INLINE_VSE64(21, "v21", dest);
+		CASE_N_INLINE_VSE64(22, "v22", dest);
+		CASE_N_INLINE_VSE64(23, "v23", dest);
+		CASE_N_INLINE_VSE64(24, "v24", dest);
+		CASE_N_INLINE_VSE64(25, "v25", dest);
+		CASE_N_INLINE_VSE64(26, "v26", dest);
+		CASE_N_INLINE_VSE64(27, "v27", dest);
+		CASE_N_INLINE_VSE64(28, "v28", dest);
+		CASE_N_INLINE_VSE64(29, "v29", dest);
+		CASE_N_INLINE_VSE64(30, "v30", dest);
+		CASE_N_INLINE_VSE64(31, "v31", dest);
+	}
+}
+
+#define INLINE_VLE8(nstr, src)                    \
+	asm volatile(".option push\n\t"           \
+		     ".option arch, +v\n\t"       \
+		     "vle8.v " nstr ", (%0)\n\t"  \
+		     ".option pop\n\t" ::"r"(src) \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE8(n, nstr, src) \
+	case n:                          \
+		INLINE_VLE8(nstr, src);  \
+		break;
+
+#define INLINE_VLE16(nstr, src)                   \
+	asm volatile(".option push\n\t"           \
+		     ".option arch, +v\n\t"       \
+		     "vle16.v " nstr ", (%0)\n\t" \
+		     ".option pop\n\t" ::"r"(src) \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE16(n, nstr, src) \
+	case n:                           \
+		INLINE_VLE16(nstr, src);  \
+		break;
+
+#define INLINE_VLE32(nstr, src)                   \
+	asm volatile(".option push\n\t"           \
+		     ".option arch, +v\n\t"       \
+		     "vle32.v " nstr ", (%0)\n\t" \
+		     ".option pop\n\t" ::"r"(src) \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE32(n, nstr, src) \
+	case n:                           \
+		INLINE_VLE32(nstr, src);  \
+		break;
+
+#define INLINE_VLE64(nstr, src)                   \
+	asm volatile(".option push\n\t"           \
+		     ".option arch, +v\n\t"       \
+		     "vle64.v " nstr ", (%0)\n\t" \
+		     ".option pop\n\t" ::"r"(src) \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE64(n, nstr, src) \
+	case n:                           \
+		INLINE_VLE64(nstr, src);  \
+		break;
+
+static inline void set_vector_from_array_u8(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		CASE_N_INLINE_VLE8(0, "v0", src);
+		CASE_N_INLINE_VLE8(1, "v1", src);
+		CASE_N_INLINE_VLE8(2, "v2", src);
+		CASE_N_INLINE_VLE8(3, "v3", src);
+		CASE_N_INLINE_VLE8(4, "v4", src);
+		CASE_N_INLINE_VLE8(5, "v5", src);
+		CASE_N_INLINE_VLE8(6, "v6", src);
+		CASE_N_INLINE_VLE8(7, "v7", src);
+		CASE_N_INLINE_VLE8(8, "v8", src);
+		CASE_N_INLINE_VLE8(9, "v9", src);
+		CASE_N_INLINE_VLE8(10, "v10", src);
+		CASE_N_INLINE_VLE8(11, "v11", src);
+		CASE_N_INLINE_VLE8(12, "v12", src);
+		CASE_N_INLINE_VLE8(13, "v13", src);
+		CASE_N_INLINE_VLE8(14, "v14", src);
+		CASE_N_INLINE_VLE8(15, "v15", src);
+		CASE_N_INLINE_VLE8(16, "v16", src);
+		CASE_N_INLINE_VLE8(17, "v17", src);
+		CASE_N_INLINE_VLE8(18, "v18", src);
+		CASE_N_INLINE_VLE8(19, "v19", src);
+		CASE_N_INLINE_VLE8(20, "v20", src);
+		CASE_N_INLINE_VLE8(21, "v21", src);
+		CASE_N_INLINE_VLE8(22, "v22", src);
+		CASE_N_INLINE_VLE8(23, "v23", src);
+		CASE_N_INLINE_VLE8(24, "v24", src);
+		CASE_N_INLINE_VLE8(25, "v25", src);
+		CASE_N_INLINE_VLE8(26, "v26", src);
+		CASE_N_INLINE_VLE8(27, "v27", src);
+		CASE_N_INLINE_VLE8(28, "v28", src);
+		CASE_N_INLINE_VLE8(29, "v29", src);
+		CASE_N_INLINE_VLE8(30, "v30", src);
+		CASE_N_INLINE_VLE8(31, "v31", src);
+	}
+}
+
+static inline void set_vector_from_array_u16(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		CASE_N_INLINE_VLE16(0, "v0", src);
+		CASE_N_INLINE_VLE16(1, "v1", src);
+		CASE_N_INLINE_VLE16(2, "v2", src);
+		CASE_N_INLINE_VLE16(3, "v3", src);
+		CASE_N_INLINE_VLE16(4, "v4", src);
+		CASE_N_INLINE_VLE16(5, "v5", src);
+		CASE_N_INLINE_VLE16(6, "v6", src);
+		CASE_N_INLINE_VLE16(7, "v7", src);
+		CASE_N_INLINE_VLE16(8, "v8", src);
+		CASE_N_INLINE_VLE16(9, "v9", src);
+		CASE_N_INLINE_VLE16(10, "v10", src);
+		CASE_N_INLINE_VLE16(11, "v11", src);
+		CASE_N_INLINE_VLE16(12, "v12", src);
+		CASE_N_INLINE_VLE16(13, "v13", src);
+		CASE_N_INLINE_VLE16(14, "v14", src);
+		CASE_N_INLINE_VLE16(15, "v15", src);
+		CASE_N_INLINE_VLE16(16, "v16", src);
+		CASE_N_INLINE_VLE16(17, "v17", src);
+		CASE_N_INLINE_VLE16(18, "v18", src);
+		CASE_N_INLINE_VLE16(19, "v19", src);
+		CASE_N_INLINE_VLE16(20, "v20", src);
+		CASE_N_INLINE_VLE16(21, "v21", src);
+		CASE_N_INLINE_VLE16(22, "v22", src);
+		CASE_N_INLINE_VLE16(23, "v23", src);
+		CASE_N_INLINE_VLE16(24, "v24", src);
+		CASE_N_INLINE_VLE16(25, "v25", src);
+		CASE_N_INLINE_VLE16(26, "v26", src);
+		CASE_N_INLINE_VLE16(27, "v27", src);
+		CASE_N_INLINE_VLE16(28, "v28", src);
+		CASE_N_INLINE_VLE16(29, "v29", src);
+		CASE_N_INLINE_VLE16(30, "v30", src);
+		CASE_N_INLINE_VLE16(31, "v31", src);
+	}
+}
+
+static inline void set_vector_from_array_u32(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		CASE_N_INLINE_VLE32(0, "v0", src);
+		CASE_N_INLINE_VLE32(1, "v1", src);
+		CASE_N_INLINE_VLE32(2, "v2", src);
+		CASE_N_INLINE_VLE32(3, "v3", src);
+		CASE_N_INLINE_VLE32(4, "v4", src);
+		CASE_N_INLINE_VLE32(5, "v5", src);
+		CASE_N_INLINE_VLE32(6, "v6", src);
+		CASE_N_INLINE_VLE32(7, "v7", src);
+		CASE_N_INLINE_VLE32(8, "v8", src);
+		CASE_N_INLINE_VLE32(9, "v9", src);
+		CASE_N_INLINE_VLE32(10, "v10", src);
+		CASE_N_INLINE_VLE32(11, "v11", src);
+		CASE_N_INLINE_VLE32(12, "v12", src);
+		CASE_N_INLINE_VLE32(13, "v13", src);
+		CASE_N_INLINE_VLE32(14, "v14", src);
+		CASE_N_INLINE_VLE32(15, "v15", src);
+		CASE_N_INLINE_VLE32(16, "v16", src);
+		CASE_N_INLINE_VLE32(17, "v17", src);
+		CASE_N_INLINE_VLE32(18, "v18", src);
+		CASE_N_INLINE_VLE32(19, "v19", src);
+		CASE_N_INLINE_VLE32(20, "v20", src);
+		CASE_N_INLINE_VLE32(21, "v21", src);
+		CASE_N_INLINE_VLE32(22, "v22", src);
+		CASE_N_INLINE_VLE32(23, "v23", src);
+		CASE_N_INLINE_VLE32(24, "v24", src);
+		CASE_N_INLINE_VLE32(25, "v25", src);
+		CASE_N_INLINE_VLE32(26, "v26", src);
+		CASE_N_INLINE_VLE32(27, "v27", src);
+		CASE_N_INLINE_VLE32(28, "v28", src);
+		CASE_N_INLINE_VLE32(29, "v29", src);
+		CASE_N_INLINE_VLE32(30, "v30", src);
+		CASE_N_INLINE_VLE32(31, "v31", src);
+	}
+}
+
+static inline void set_vector_from_array_u64(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		CASE_N_INLINE_VLE64(0, "v0", src);
+		CASE_N_INLINE_VLE64(1, "v1", src);
+		CASE_N_INLINE_VLE64(2, "v2", src);
+		CASE_N_INLINE_VLE64(3, "v3", src);
+		CASE_N_INLINE_VLE64(4, "v4", src);
+		CASE_N_INLINE_VLE64(5, "v5", src);
+		CASE_N_INLINE_VLE64(6, "v6", src);
+		CASE_N_INLINE_VLE64(7, "v7", src);
+		CASE_N_INLINE_VLE64(8, "v8", src);
+		CASE_N_INLINE_VLE64(9, "v9", src);
+		CASE_N_INLINE_VLE64(10, "v10", src);
+		CASE_N_INLINE_VLE64(11, "v11", src);
+		CASE_N_INLINE_VLE64(12, "v12", src);
+		CASE_N_INLINE_VLE64(13, "v13", src);
+		CASE_N_INLINE_VLE64(14, "v14", src);
+		CASE_N_INLINE_VLE64(15, "v15", src);
+		CASE_N_INLINE_VLE64(16, "v16", src);
+		CASE_N_INLINE_VLE64(17, "v17", src);
+		CASE_N_INLINE_VLE64(18, "v18", src);
+		CASE_N_INLINE_VLE64(19, "v19", src);
+		CASE_N_INLINE_VLE64(20, "v20", src);
+		CASE_N_INLINE_VLE64(21, "v21", src);
+		CASE_N_INLINE_VLE64(22, "v22", src);
+		CASE_N_INLINE_VLE64(23, "v23", src);
+		CASE_N_INLINE_VLE64(24, "v24", src);
+		CASE_N_INLINE_VLE64(25, "v25", src);
+		CASE_N_INLINE_VLE64(26, "v26", src);
+		CASE_N_INLINE_VLE64(27, "v27", src);
+		CASE_N_INLINE_VLE64(28, "v28", src);
+		CASE_N_INLINE_VLE64(29, "v29", src);
+		CASE_N_INLINE_VLE64(30, "v30", src);
+		CASE_N_INLINE_VLE64(31, "v31", src);
+	}
+}
+
+#define INLINE_VLE8_M(nstr, src)                       \
+	asm volatile(".option push\n\t"                \
+		     ".option arch, +v\n\t"            \
+		     "vle8.v " nstr ", (%0), v0.t\n\t" \
+		     ".option pop\n\t" ::"r"(src)      \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE8_M(n, nstr, src) \
+	case n:                            \
+		INLINE_VLE8_M(nstr, src);  \
+		break;
+
+#define INLINE_VLE16_M(nstr, src)                       \
+	asm volatile(".option push\n\t"                 \
+		     ".option arch, +v\n\t"             \
+		     "vle16.v " nstr ", (%0), v0.t\n\t" \
+		     ".option pop\n\t" ::"r"(src)       \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE16_M(n, nstr, src) \
+	case n:                             \
+		INLINE_VLE16_M(nstr, src);  \
+		break;
+
+#define INLINE_VLE32_M(nstr, src)                       \
+	asm volatile(".option push\n\t"                 \
+		     ".option arch, +v\n\t"             \
+		     "vle32.v " nstr ", (%0), v0.t\n\t" \
+		     ".option pop\n\t" ::"r"(src)       \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE32_M(n, nstr, src) \
+	case n:                             \
+		INLINE_VLE32_M(nstr, src);  \
+		break;
+
+#define INLINE_VLE64_M(nstr, src)                       \
+	asm volatile(".option push\n\t"                 \
+		     ".option arch, +v\n\t"             \
+		     "vle64.v " nstr ", (%0), v0.t\n\t" \
+		     ".option pop\n\t" ::"r"(src)       \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE64_M(n, nstr, src) \
+	case n:                             \
+		INLINE_VLE64_M(nstr, src);  \
+		break;
+
+static inline void set_masked_vector_from_array_u8(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		/* NOTE: v0 contains the mask */
+		CASE_N_INLINE_VLE8_M(1, "v1", src);
+		CASE_N_INLINE_VLE8_M(2, "v2", src);
+		CASE_N_INLINE_VLE8_M(3, "v3", src);
+		CASE_N_INLINE_VLE8_M(4, "v4", src);
+		CASE_N_INLINE_VLE8_M(5, "v5", src);
+		CASE_N_INLINE_VLE8_M(6, "v6", src);
+		CASE_N_INLINE_VLE8_M(7, "v7", src);
+		CASE_N_INLINE_VLE8_M(8, "v8", src);
+		CASE_N_INLINE_VLE8_M(9, "v9", src);
+		CASE_N_INLINE_VLE8_M(10, "v10", src);
+		CASE_N_INLINE_VLE8_M(11, "v11", src);
+		CASE_N_INLINE_VLE8_M(12, "v12", src);
+		CASE_N_INLINE_VLE8_M(13, "v13", src);
+		CASE_N_INLINE_VLE8_M(14, "v14", src);
+		CASE_N_INLINE_VLE8_M(15, "v15", src);
+		CASE_N_INLINE_VLE8_M(16, "v16", src);
+		CASE_N_INLINE_VLE8_M(17, "v17", src);
+		CASE_N_INLINE_VLE8_M(18, "v18", src);
+		CASE_N_INLINE_VLE8_M(19, "v19", src);
+		CASE_N_INLINE_VLE8_M(20, "v20", src);
+		CASE_N_INLINE_VLE8_M(21, "v21", src);
+		CASE_N_INLINE_VLE8_M(22, "v22", src);
+		CASE_N_INLINE_VLE8_M(23, "v23", src);
+		CASE_N_INLINE_VLE8_M(24, "v24", src);
+		CASE_N_INLINE_VLE8_M(25, "v25", src);
+		CASE_N_INLINE_VLE8_M(26, "v26", src);
+		CASE_N_INLINE_VLE8_M(27, "v27", src);
+		CASE_N_INLINE_VLE8_M(28, "v28", src);
+		CASE_N_INLINE_VLE8_M(29, "v29", src);
+		CASE_N_INLINE_VLE8_M(30, "v30", src);
+		CASE_N_INLINE_VLE8_M(31, "v31", src);
+	}
+}
+
+static inline void set_masked_vector_from_array_u16(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		/* NOTE: v0 contains the mask */
+		CASE_N_INLINE_VLE16_M(1, "v1", src);
+		CASE_N_INLINE_VLE16_M(2, "v2", src);
+		CASE_N_INLINE_VLE16_M(3, "v3", src);
+		CASE_N_INLINE_VLE16_M(4, "v4", src);
+		CASE_N_INLINE_VLE16_M(5, "v5", src);
+		CASE_N_INLINE_VLE16_M(6, "v6", src);
+		CASE_N_INLINE_VLE16_M(7, "v7", src);
+		CASE_N_INLINE_VLE16_M(8, "v8", src);
+		CASE_N_INLINE_VLE16_M(9, "v9", src);
+		CASE_N_INLINE_VLE16_M(10, "v10", src);
+		CASE_N_INLINE_VLE16_M(11, "v11", src);
+		CASE_N_INLINE_VLE16_M(12, "v12", src);
+		CASE_N_INLINE_VLE16_M(13, "v13", src);
+		CASE_N_INLINE_VLE16_M(14, "v14", src);
+		CASE_N_INLINE_VLE16_M(15, "v15", src);
+		CASE_N_INLINE_VLE16_M(16, "v16", src);
+		CASE_N_INLINE_VLE16_M(17, "v17", src);
+		CASE_N_INLINE_VLE16_M(18, "v18", src);
+		CASE_N_INLINE_VLE16_M(19, "v19", src);
+		CASE_N_INLINE_VLE16_M(20, "v20", src);
+		CASE_N_INLINE_VLE16_M(21, "v21", src);
+		CASE_N_INLINE_VLE16_M(22, "v22", src);
+		CASE_N_INLINE_VLE16_M(23, "v23", src);
+		CASE_N_INLINE_VLE16_M(24, "v24", src);
+		CASE_N_INLINE_VLE16_M(25, "v25", src);
+		CASE_N_INLINE_VLE16_M(26, "v26", src);
+		CASE_N_INLINE_VLE16_M(27, "v27", src);
+		CASE_N_INLINE_VLE16_M(28, "v28", src);
+		CASE_N_INLINE_VLE16_M(29, "v29", src);
+		CASE_N_INLINE_VLE16_M(30, "v30", src);
+		CASE_N_INLINE_VLE16_M(31, "v31", src);
+	}
+}
+
+static inline void set_masked_vector_from_array_u32(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		/* NOTE: v0 contains the mask */
+		CASE_N_INLINE_VLE32_M(1, "v1", src);
+		CASE_N_INLINE_VLE32_M(2, "v2", src);
+		CASE_N_INLINE_VLE32_M(3, "v3", src);
+		CASE_N_INLINE_VLE32_M(4, "v4", src);
+		CASE_N_INLINE_VLE32_M(5, "v5", src);
+		CASE_N_INLINE_VLE32_M(6, "v6", src);
+		CASE_N_INLINE_VLE32_M(7, "v7", src);
+		CASE_N_INLINE_VLE32_M(8, "v8", src);
+		CASE_N_INLINE_VLE32_M(9, "v9", src);
+		CASE_N_INLINE_VLE32_M(10, "v10", src);
+		CASE_N_INLINE_VLE32_M(11, "v11", src);
+		CASE_N_INLINE_VLE32_M(12, "v12", src);
+		CASE_N_INLINE_VLE32_M(13, "v13", src);
+		CASE_N_INLINE_VLE32_M(14, "v14", src);
+		CASE_N_INLINE_VLE32_M(15, "v15", src);
+		CASE_N_INLINE_VLE32_M(16, "v16", src);
+		CASE_N_INLINE_VLE32_M(17, "v17", src);
+		CASE_N_INLINE_VLE32_M(18, "v18", src);
+		CASE_N_INLINE_VLE32_M(19, "v19", src);
+		CASE_N_INLINE_VLE32_M(20, "v20", src);
+		CASE_N_INLINE_VLE32_M(21, "v21", src);
+		CASE_N_INLINE_VLE32_M(22, "v22", src);
+		CASE_N_INLINE_VLE32_M(23, "v23", src);
+		CASE_N_INLINE_VLE32_M(24, "v24", src);
+		CASE_N_INLINE_VLE32_M(25, "v25", src);
+		CASE_N_INLINE_VLE32_M(26, "v26", src);
+		CASE_N_INLINE_VLE32_M(27, "v27", src);
+		CASE_N_INLINE_VLE32_M(28, "v28", src);
+		CASE_N_INLINE_VLE32_M(29, "v29", src);
+		CASE_N_INLINE_VLE32_M(30, "v30", src);
+		CASE_N_INLINE_VLE32_M(31, "v31", src);
+	}
+}
+
+static inline void set_masked_vector_from_array_u64(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		/* NOTE: v0 contains the mask */
+		CASE_N_INLINE_VLE64_M(1, "v1", src);
+		CASE_N_INLINE_VLE64_M(2, "v2", src);
+		CASE_N_INLINE_VLE64_M(3, "v3", src);
+		CASE_N_INLINE_VLE64_M(4, "v4", src);
+		CASE_N_INLINE_VLE64_M(5, "v5", src);
+		CASE_N_INLINE_VLE64_M(6, "v6", src);
+		CASE_N_INLINE_VLE64_M(7, "v7", src);
+		CASE_N_INLINE_VLE64_M(8, "v8", src);
+		CASE_N_INLINE_VLE64_M(9, "v9", src);
+		CASE_N_INLINE_VLE64_M(10, "v10", src);
+		CASE_N_INLINE_VLE64_M(11, "v11", src);
+		CASE_N_INLINE_VLE64_M(12, "v12", src);
+		CASE_N_INLINE_VLE64_M(13, "v13", src);
+		CASE_N_INLINE_VLE64_M(14, "v14", src);
+		CASE_N_INLINE_VLE64_M(15, "v15", src);
+		CASE_N_INLINE_VLE64_M(16, "v16", src);
+		CASE_N_INLINE_VLE64_M(17, "v17", src);
+		CASE_N_INLINE_VLE64_M(18, "v18", src);
+		CASE_N_INLINE_VLE64_M(19, "v19", src);
+		CASE_N_INLINE_VLE64_M(20, "v20", src);
+		CASE_N_INLINE_VLE64_M(21, "v21", src);
+		CASE_N_INLINE_VLE64_M(22, "v22", src);
+		CASE_N_INLINE_VLE64_M(23, "v23", src);
+		CASE_N_INLINE_VLE64_M(24, "v24", src);
+		CASE_N_INLINE_VLE64_M(25, "v25", src);
+		CASE_N_INLINE_VLE64_M(26, "v26", src);
+		CASE_N_INLINE_VLE64_M(27, "v27", src);
+		CASE_N_INLINE_VLE64_M(28, "v28", src);
+		CASE_N_INLINE_VLE64_M(29, "v29", src);
+		CASE_N_INLINE_VLE64_M(30, "v30", src);
+		CASE_N_INLINE_VLE64_M(31, "v31", src);
+	}
+}
+
+static inline void foreach_velem_vv(int vl, int sew, bool masked, int vd,
+				    int vs1, int vs2, u64 op(u64, u64))
+{
+	sbi_vector_data vs1_data;
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs1, &vs1_data);
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u8[i] = op(vs1_data.u8[i], vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u8(vd, &vd_data);
+		else
+			set_vector_from_array_u8(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs1, &vs1_data);
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(vs1_data.u16[i], vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs1, &vs1_data);
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(vs1_data.u32[i], vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 3:
+		get_vector_as_array_u64(vs1, &vs1_data);
+		get_vector_as_array_u64(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(vs1_data.u64[i], vs2_data.u64[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+}
+
+static inline void foreach_velem_vi(int vl, int sew, bool masked, int vd,
+				    u64 imm, int vs2, u64 op(u64, u64))
+{
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u8[i] = op(imm, vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u8(vd, &vd_data);
+		else
+			set_vector_from_array_u8(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(imm, vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(imm, vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 3:
+		get_vector_as_array_u64(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(imm, vs2_data.u64[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+}
+
+static inline void foreach_velem_v(int vl, int sew, bool masked, int vd,
+				   int vs2, u64 op(u64))
+{
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u8[i] = op(vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u8(vd, &vd_data);
+		else
+			set_vector_from_array_u8(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 3:
+		get_vector_as_array_u64(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(vs2_data.u64[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+}
+
+static inline bool foreach_velem_wvv(int vl, int sew, bool masked, int vd,
+				     int vs1, int vs2, u64 op(u64, u64))
+{
+	sbi_vector_data vs1_data;
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return true;
+	/* back out if this VL combined with the widened SEW is too big */
+	if (vl * (2 << sew) > VLMAX_BYTES)
+		return false;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs1, &vs1_data);
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(vs1_data.u8[i], vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs1, &vs1_data);
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(vs1_data.u16[i], vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs1, &vs1_data);
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(vs1_data.u32[i], vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+	return true;
+}
+
+static inline bool foreach_velem_wvi(int vl, int sew, bool masked, int vd,
+				     u64 imm, int vs2, u64 op(u64, u64))
+{
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return true;
+	/* back out if this VL combined with the widened SEW is too big */
+	if (vl * (2 << sew) > VLMAX_BYTES)
+		return false;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(imm, vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(imm, vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(imm, vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+	return true;
+}
+
+static inline u64 op_andn(u64 op1, u64 op2)
+{
+	return ~op1 & op2;
+}
+
+static inline u64 op_rol_u8(u64 op1, u64 op2)
+{
+	op2 &= 0xff;
+	op1 &= 7;
+	return ((op2 << op1) | (op2 >> (8 - op1))) & 0xff;
+}
+
+static inline u64 op_rol_u16(u64 op1, u64 op2)
+{
+	op2 &= 0xffff;
+	op1 &= 0xf;
+	return ((op2 << op1) | (op2 >> (16 - op1))) & 0xffff;
+}
+
+static inline u64 op_rol_u32(u64 op1, u64 op2)
+{
+	op2 &= 0xffffffff;
+	op1 &= 0x1f;
+	return ((op2 << op1) | (op2 >> (32 - op1))) & 0xffffffff;
+}
+
+static inline u64 op_rol_u64(u64 op1, u64 op2)
+{
+	op1 &= 0x3f;
+	return (op2 << op1) | (op2 >> (64 - op1));
+}
+
+typeof(u64(u64, u64)) *ops_rol[4] = { op_rol_u8, op_rol_u16, op_rol_u32,
+				      op_rol_u64 };
+
+static inline u64 op_ror_u8(u64 op1, u64 op2)
+{
+	op2 &= 0xff;
+	op1 &= 7;
+	return ((op2 >> op1) | (op2 << (8 - op1))) & 0xff;
+}
+
+static inline u64 op_ror_u16(u64 op1, u64 op2)
+{
+	op2 &= 0xffff;
+	op1 &= 0xf;
+	return ((op2 >> op1) | (op2 << (16 - op1))) & 0xffff;
+}
+
+static inline u64 op_ror_u32(u64 op1, u64 op2)
+{
+	op2 &= 0xffffffff;
+	op1 &= 0x1f;
+	return ((op2 >> op1) | (op2 << (32 - op1))) & 0xffffffff;
+}
+
+static inline u64 op_ror_u64(u64 op1, u64 op2)
+{
+	op1 &= 0x3f;
+	return (op2 >> op1) | (op2 << (64 - op1));
+}
+
+typeof(u64(u64, u64)) *ops_ror[4] = { op_ror_u8, op_ror_u16, op_ror_u32,
+				      op_ror_u64 };
+
+static inline u64 op_wsll_u8(u64 op1, u64 op2)
+{
+	op1 &= 0xf;
+	return (op2 << op1) & 0xffff;
+}
+
+static inline u64 op_wsll_u16(u64 op1, u64 op2)
+{
+	op1 &= 0x1f;
+	return (op2 << op1) & 0xffffffff;
+}
+
+static inline u64 op_wsll_u32(u64 op1, u64 op2)
+{
+	op1 &= 0x3f;
+	return op2 << op1;
+}
+
+typeof(u64(u64, u64)) *ops_wsll[4] = { op_wsll_u8, op_wsll_u16, op_wsll_u32,
+				       op_wsll_u32 };
+
+static inline u64 op_brev8(u64 op)
+{
+	return ((op & 0x8080808080808080) >> 7) |
+	       ((op & 0x4040404040404040) >> 5) |
+	       ((op & 0x2020202020202020) >> 3) |
+	       ((op & 0x1010101010101010) >> 1) |
+	       ((op & 0x0808080808080808) << 1) |
+	       ((op & 0x0404040404040404) << 3) |
+	       ((op & 0x0202020202020202) << 5) |
+	       ((op & 0x0101010101010101) << 7);
+}
+
+static inline u64 op_rev8(u64 op1, u64 op2)
+{
+	u64 result;
+	asm volatile(".option push\n\t"
+		     ".option arch, +zbb\n\t"
+		     "rev8 %0, %2\n\t"
+		     "srl %0, %0, %1\n\t"
+		     ".option pop\n\t"
+		     : "=r"(result)
+		     : "r"(op1), "r"(op2));
+	return result;
+}
+
+static inline u64 op_brev(u64 op1, u64 op2)
+{
+	return op_rev8(op1, op_brev8(op2));
+}
+
+static inline u64 op_clz(u64 op1, u64 op2)
+{
+	u64 result;
+	asm volatile(".option push\n\t"
+		     ".option arch, +zbb\n\t"
+		     "clz %0, %2\n\t"
+		     "sub %0, %0, %1\n\t"
+		     ".option pop\n\t"
+		     : "=r"(result)
+		     : "r"(op1), "r"(op2));
+	return result;
+}
+
+static inline u64 op_ctz(u64 op1, u64 op2)
+{
+	u64 result;
+	asm volatile(".option push\n\t"
+		     ".option arch, +zbb\n\t"
+		     "ctz %0, %2\n\t"
+		     "minu %0, %0, %1\n\t"
+		     ".option pop\n\t"
+		     : "=r"(result)
+		     : "r"(op1), "r"(op2));
+	return result;
+}
+
+static inline u64 op_cpop(u64 op)
+{
+	u64 result;
+	asm volatile(".option push\n\t"
+		     ".option arch, +zbb\n\t"
+		     "cpop %0, %1\n\t"
+		     ".option pop\n\t"
+		     : "=r"(result)
+		     : "r"(op));
+	return result;
+}
+
+int sbi_insn_emu_op_v(ulong insn, struct sbi_trap_regs *regs)
+{
+	/* back out if vector unit is not available */
+	if ((regs->mstatus & MSTATUS_VS) == 0 ||
+	    (sbi_mstatus_prev_mode(regs->mstatus) == PRV_U &&
+	     (csr_read(CSR_SSTATUS) & SSTATUS_VS) == 0))
+		return truly_illegal_insn(insn, regs);
+
+	int vl	  = csr_read(CSR_VL);
+	int vs1	  = GET_VS1(insn);
+	int vs2	  = GET_VS2(insn);
+	int vd	  = GET_VD(insn);
+	u32 vtype = csr_read(CSR_VTYPE);
+	int sew	  = GET_VSEW(vtype);
+	bool m	  = IS_MASKED(insn);
+	u64 rs1	  = GET_RS1(insn, regs);
+
+	/* back out if this VL combined with this SEW is too big */
+	if (vl * (1 << sew) > VLMAX_BYTES)
+		return truly_illegal_insn(insn, regs);
+
+	switch (insn & INSN_MASK_VXUNARY0) {
+	/* Emulate Zvbb unary operations */
+	case INSN_MATCH_VBREVV:
+		foreach_velem_vi(vl, sew, m, vd, 64 - (8 << sew), vs2, op_brev);
+		break;
+	case INSN_MATCH_VBREV8V:
+		foreach_velem_v(vl, sew, m, vd, vs2, op_brev8);
+		break;
+	case INSN_MATCH_VREV8V:
+		foreach_velem_vi(vl, sew, m, vd, 64 - (8 << sew), vs2, op_rev8);
+		break;
+	case INSN_MATCH_VCLZV:
+		foreach_velem_vi(vl, sew, m, vd, 64 - (8 << sew), vs2, op_clz);
+		break;
+	case INSN_MATCH_VCTZV:
+		foreach_velem_vi(vl, sew, m, vd, 8 << sew, vs2, op_ctz);
+		break;
+	case INSN_MATCH_VCPOPV:
+		foreach_velem_v(vl, sew, m, vd, vs2, op_cpop);
+		break;
+	default:
+		switch (insn & INSN_MASK_VVBINARY0) {
+		/* Emulate Zvbb binary operations */
+		case INSN_MATCH_VANDNVV:
+			foreach_velem_vv(vl, sew, m, vd, vs1, vs2, op_andn);
+			break;
+		case INSN_MATCH_VANDNVX:
+			foreach_velem_vi(vl, sew, m, vd, rs1, vs2, op_andn);
+			break;
+		case INSN_MATCH_VROLVV:
+			foreach_velem_vv(vl, sew, m, vd, vs1, vs2,
+					 ops_rol[sew]);
+			break;
+		case INSN_MATCH_VROLVX:
+			foreach_velem_vi(vl, sew, m, vd, rs1, vs2,
+					 ops_rol[sew]);
+			break;
+		case INSN_MATCH_VRORVV:
+			foreach_velem_vv(vl, sew, m, vd, vs1, vs2,
+					 ops_ror[sew]);
+			break;
+		case INSN_MATCH_VRORVX:
+			foreach_velem_vi(vl, sew, m, vd, rs1, vs2,
+					 ops_ror[sew]);
+			break;
+		case INSN_MATCH_VRORVI:
+		case INSN_MATCH_VRORVI | 0x04000000:
+			foreach_velem_vi(vl, sew, m, vd,
+					 GET_RS1_NUM(insn) |
+						 ((insn & 0x04000000) >> 21),
+					 vs2, ops_ror[sew]);
+			break;
+		case INSN_MATCH_VWSLLVV:
+			if (!foreach_velem_wvv(vl, sew, m, vd, vs1, vs2,
+					       ops_wsll[sew]))
+				return truly_illegal_insn(insn, regs);
+			break;
+		case INSN_MATCH_VWSLLVX:
+			if (!foreach_velem_wvi(vl, sew, m, vd, rs1, vs2,
+					       ops_wsll[sew]))
+				return truly_illegal_insn(insn, regs);
+			break;
+		case INSN_MATCH_VWSLLVI:
+			if (!foreach_velem_wvi(vl, sew, m, vd,
+					       GET_RS1_NUM(insn), vs2,
+					       ops_wsll[sew]))
+				return truly_illegal_insn(insn, regs);
+			break;
+		default:
+			return truly_illegal_insn(insn, regs);
+		}
+	}
+
+	regs->mepc += 4;
+
+	return 0;
+}
+
+#endif
-- 
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
