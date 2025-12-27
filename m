Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0647E92712
	for <opensbi@archiver.kernel.org>; Sat, 27 Dec 2025 12:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvRTNAw0Dx0wQn/fEDEW0NGMqg8JBZi7oHG83X06ZkI=; b=PkiIzjI3toj/gQ
	OcPbAZ0zaRR5+cGSPCPMxqcoimJC5TndRIkO4vJsgaeximNa7xB0fOiTWVYgi+yHeRcPxFxj5fEzm
	/7b7BTAyVdk8mssMXGOb+PAPhfnrYTkaQMSXWs+084gVmls9jloembfpkUdpDhFKfURbZ+XcwMC/8
	IOc/5R0ABASCY3LtntD5F7e7drRmAxH46o+1QcxtAcMsOMgtrbzLJDDePc+Jnu6UFprhrb2hw1WnX
	rAGxW/PCCEKW2uPD+958PtGpuOiwomTCPFM439EBW9pHduMCW6U/HowdFDZQd2fSOvVPOmO0fFGYn
	oEIYCpLdHiw15imz4O4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTGF-00000001wto-14oY;
	Sat, 27 Dec 2025 12:19:07 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTG8-00000001wlR-3x2H
	for opensbi@lists.infradead.org;
	Sat, 27 Dec 2025 12:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1766837939; x=1767442739; i=b.freisen@gmx.net;
	bh=2PZj6gTVQOZM9du9OyUvGE6wXtIVcBt94PtxpBVvY7I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tKzkfsZOwY0aPKVmAmtHyySt7f3vBzrsT+/UlBBvGf00709/buovfsrJwoPXc8q1
	 cRFQsdP95TATCLfpV+fpa/NHrq5o74yeXDK+IbRhwrohweDh/EqXLoViSEf6ec3iJ
	 1JjuNLmtozEUJR0KLIRYREcfqjDskCtOyHj0HiHXRRV2TgIp+G6rmPPLGH1hOLbhW
	 yTwUGkR0j5fT7YdrVz21Gh7YVHhg4KpxY3/22QlovrlqUwHi8G7nEs3RJJFS3DLcf
	 LchRsj66lwHlBd8EdlA80CxqadYItkNYlA6l8LUC2bnXdj6sy4uv/GKYoKh08PuXU
	 hE7O5bsWqalDjfLvaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.117]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf0U-1wGoPx0e4A-00lXpo; Sat, 27
 Dec 2025 13:18:59 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH v3 3/3] lib: sbi: ISA extension emulation (Zvbb).
Date: Sat, 27 Dec 2025 13:18:02 +0100
Message-ID: <20251227121802.15703-4-b.freisen@gmx.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227121802.15703-1-b.freisen@gmx.net>
References: <20251227121802.15703-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tvjaxkvy7DfeNvG5UoqlSZ2IW0QzgqJ2wNIeonF+BFDr9kzBdXd
 5H4bNMz7vWswnOssdaJrvC0Hjd0HKrSxncsveg5l1w4eu2aGjyKfbTlWjqxnWfORtbxkpxG
 YqAVxT+218ukXT1Ca/D3D6RQai1a5ve7PKZEOwllOt9EfA8aQurVUToQO0J+o4mu2cKp0ve
 Q+tnsfnJ6++S9o/Zwi4vw==
UI-OutboundReport: notjunk:1;M01:P0:bjOl7C0aiZg=;yKFcbvLfqdTPPJOAdqFghmGEb1w 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041901_470104_358BE299 
X-CRM114-Status: GOOD (  15.40  )
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
 include/sbi/sbi_platform.h   |    6 +
 lib/sbi/objects.mk           |    1 +
 lib/sbi/sbi_illegal_insn.c   |    3 +-
 lib/sbi/sbi_insn_emu.conf    |   24 +
 lib/sbi/sbi_insn_emu_v.c     | 1146 ++++++++++++++++++++++++++++++++++
 6 files changed, 1200 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi/sbi_insn_emu_v.h
 create mode 100644 lib/sbi/sbi_insn_emu_v.c

diff --git a/include/sbi/sbi_insn_emu_v.h b/include/sbi/sbi_insn_emu_v.h
new file mode 100644
index 00000000..0dfc9cce
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
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index e65d9877..3e681de4 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -151,8 +151,14 @@ struct sbi_platform_operations {
 	void (*pmp_disable)(unsigned int n);
 };
 
+#ifdef CONFIG_EMU_ZVBB
+/** Platform default per-HART stack size for exception/interrupt handling,
+ * tentatively enlarged for buffer arrays used for Zvbb emulation */
+#define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE	16384
+#else
 /** Platform default per-HART stack size for exception/interrupt handling */
 #define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE	8192
+#endif
 
 /** Platform default heap size */
 #define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)	\
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index ed48782c..9896effa 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -85,6 +85,7 @@ libsbi-objs-y += sbi_illegal_atomic.o
 libsbi-objs-y += sbi_illegal_insn.o
 libsbi-objs-y += sbi_insn_emu.o
 libsbi-objs-y += sbi_insn_emu_fp.o
+libsbi-objs-y += sbi_insn_emu_v.o
 libsbi-objs-y += sbi_init.o
 libsbi-objs-y += sbi_ipi.o
 libsbi-objs-y += sbi_irqchip.o
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 188bfd5f..47f050c1 100644
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
@@ -169,7 +170,7 @@ static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn,	/* 18 */
 	truly_illegal_insn,	/* 19 */
 	sbi_insn_emu_op_fp,	/* 20 */
-	truly_illegal_insn,	/* 21 */
+	sbi_insn_emu_op_v,	/* 21 */
 	truly_illegal_insn,	/* 22 */
 	truly_illegal_insn,	/* 23 */
 	truly_illegal_insn,	/* 24 */
diff --git a/lib/sbi/sbi_insn_emu.conf b/lib/sbi/sbi_insn_emu.conf
index 3aeaa344..bd35aa4a 100644
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
index 00000000..483b0ee6
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
+		     : "=&r"(result)
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
+		     : "=&r"(result)
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
+		     : "=&r"(result)
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
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
