Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AF1C3ABD8
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 12:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uj+mGLGRgRZuoGns49sBjnW5h9DztPP04Kc8jwizQvs=; b=uj4WLIoZ45knj1
	WWESptboezx1CqQrdKWK/sdjvTexKr/sJmTAAUNEF4GZMX+dURXXDXcg2LgfMk/U5qSNzlovJY+kB
	atN1c7sRu8vfXDEfPl5SxicTxNJPcGzLw/7BmCHMEML2k1QCw4rmchsQeBm5lnz2ekxKK0JyvVrWv
	PmMC5qs0ZBZ7kSiDJY8qgCxXCTgjMb/hRjT5lP0nYyrVhcbJo4QgY3VnG3Xq/O/ZbgmR3/8sFLwSF
	usluEHX0RrtqYJm0ueHrg+L5/GqoZrwsK3P5C5OE3QZ8pismEWxmt1EwQCdSuKZcOCmY3Ds2Fpm/f
	x1GMHbb+iZ2+T0rhQ/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzOM-000000096p4-3ATK;
	Mon, 19 May 2025 12:14:50 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzMJ-000000096ZY-2Unf
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 12:12:44 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3831030b3a.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 05:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747656762; x=1748261562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1iNIycIIGg5U+FbjPpfKjMmrMsxbGVNdxReLcK0DxEo=;
        b=VVEAfkpz6U2TSgcUImsVpauSCgGCvNRUFZaj4vpQtQGFAM5VRzZpCRpw+oqlPrqhhx
         AfgzKXlAVBCRckcnWKCoQnIodiixTiUThUo3a56MNGrvlkoCWk87B9PFRpqmUhS+XlZo
         Akk1BM5ymDuRw3W6i6DzJCvDn2yr7Qg13rqtmsoSlRehwkcwNisuca2KA/wbaq6MJ/vY
         SU1KLJQKoPrtoZCEqa7uoPps9LSvbCF6N5qwioL6XpC2Hx+hDemFyKZBY7objhm3xfCc
         qlpeHVfgd5YTnqg0XNPAY384g71HviSSGD28ixfCZjIWYZdR7qD5jrhuqCKh3ycD2iIZ
         tX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747656762; x=1748261562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iNIycIIGg5U+FbjPpfKjMmrMsxbGVNdxReLcK0DxEo=;
        b=rXf0smg9K3Tf+ziRoshsIBO2rEGkx+N93yL8eVRL98zDQ0p9Waj0ZYWmf0F24/ynP/
         QOYLkuD4dmmm7uQkMF/aHQJ4z8kexZQmwu7V1Vh6YIB4+0KfAPp/mBbh96uuW0V8PVYE
         Fe0QIGs6+gWdfwKUzFEwj6n/8FuA2qigvbH4PGqHoQPbHBy+cDWT99LDKrQFJO1PNADm
         pwtzItTDOHw7ujIpIVzJahN51kvOvkLCrn36Fd/793p9i7NRfXRPwbYwBfKE7lb4QlJn
         xYhPRz7q/dYVsBs3y19V5LATkTDBwJpCWTw961E6k31Lph1MtLOs65wYaqnVt/afqBYj
         HBXg==
X-Forwarded-Encrypted: i=1; AJvYcCUNLDysevtRG+bPdcsuLn8gTDwAUZe+PVOC07TtKRZ8FDjyLJUXHqDrrXe+A8xUqgc0mq75gPo9@lists.infradead.org
X-Gm-Message-State: AOJu0YxOYE+uOj0MvOLj61OhR+trAN0r3Di30HETp/BWBWYuPckgenR0
	vVPPMwVj1hbNppFgR2cKATD7dyKpH6fg4/Hm0WyyK9jsz3nw+HFk+PWZTfd+683CHpY=
X-Gm-Gg: ASbGncslRY75OQKufByPpn5l4NYo8S0KT0KfslxJyrE0MgJCdlVaye6LY9kQRWgT7iA
	3c1QEsVxxzh30YT0ZRLcnnACq95d3JhGm5/wlmLIpimKBJQkIg4o4/zKzvbETLzITNcXB1z2eSd
	sYcYdV6wb7LVwvaercVlsS9KDxkAOazndfk9gzA/LY9k+7twkhWjeyHi6eHF4US++goSMh2wd2t
	pxv4gAuCScfXXxW969CGDEFk8vABN5NIlaRlNMeS+IUxK3ybxK+KIeOeOhfKCPST8+lmm/Id3JU
	Sj9w2tU/aiAEZAMwYGCO+9RTj2SlTFeEo904XNklF/GWVl+TnhBmcmWWRR8wuqe48otopTEm+mm
	sh0lAsXnQaCsKDyI=
X-Google-Smtp-Source: AGHT+IFsE0k1xSY7ZVULwmp/1hVTkZkezMrdiwGgHeL9uK/yFr0ovo3X+G1se+vKKLmhlnXMBuFk/g==
X-Received: by 2002:a05:6a00:2da5:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-742a98d4943mr17133514b3a.23.1747656761930;
        Mon, 19 May 2025 05:12:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d75csm6288355b3a.69.2025.05.19.05.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:12:41 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Chao-ying Fu <icebergfu@gmail.com>,
	Chao-ying Fu <cfu@mips.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5] lib: Emulate AMO instructions when Zaamo is not available
Date: Mon, 19 May 2025 17:42:06 +0530
Message-ID: <20250519121207.976949-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051243_646877_59B2A78C 
X-CRM114-Status: GOOD (  17.21  )
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

From: Chao-ying Fu <icebergfu@gmail.com>

The AMO instructions are very critical for Linux so allow low-end
RISC-V implementations without Zaamo boot Linux by emulating AMO
instructions using Zalrsc when OpenSBI is compiled without Zaamo.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/riscv_encoding.h     |  34 +-
 include/sbi/sbi_illegal_atomic.h |  17 +
 include/sbi/sbi_illegal_insn.h   |   4 +
 lib/sbi/objects.mk               |   1 +
 lib/sbi/sbi_illegal_atomic.c     | 664 +++++++++++++++++++++++++++++++
 lib/sbi/sbi_illegal_insn.c       |   7 +-
 6 files changed, 709 insertions(+), 18 deletions(-)
 create mode 100644 include/sbi/sbi_illegal_atomic.h
 create mode 100644 lib/sbi/sbi_illegal_atomic.c

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 2082783c..e1256e31 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -986,13 +986,14 @@
 #define INSN_MATCH_VS4RV		0x62800027
 #define INSN_MATCH_VS8RV		0xe2800027
 
-#define INSN_MASK_VECTOR_LOAD_STORE	0x7f
-#define INSN_MATCH_VECTOR_LOAD		0x07
-#define INSN_MATCH_VECTOR_STORE		0x27
+#define INSN_OPCODE_MASK		0x7f
+#define INSN_OPCODE_VECTOR_LOAD		0x07
+#define INSN_OPCODE_VECTOR_STORE	0x27
+#define INSN_OPCODE_AMO			0x2f
 
 #define IS_VECTOR_LOAD_STORE(insn) \
-	((((insn) & INSN_MASK_VECTOR_LOAD_STORE) == INSN_MATCH_VECTOR_LOAD) || \
-	(((insn) & INSN_MASK_VECTOR_LOAD_STORE) == INSN_MATCH_VECTOR_STORE))
+	((((insn) & INSN_OPCODE_MASK) == INSN_OPCODE_VECTOR_LOAD) || \
+	(((insn) & INSN_OPCODE_MASK) == INSN_OPCODE_VECTOR_STORE))
 
 #define IS_VECTOR_INSN_MATCH(insn, match, mask) \
 	(((insn) & (mask)) == ((match) & (mask)))
@@ -1286,6 +1287,17 @@
 #error "Unexpected __riscv_xlen"
 #endif
 
+#define MASK_FUNCT3			0x7000
+#define SHIFT_FUNCT3			12
+
+#define MASK_RS1			0xf8000
+
+#define MASK_CSR			0xfff00000
+#define SHIFT_CSR			20
+
+#define MASK_AQRL			0x06000000
+#define SHIFT_AQRL			25
+
 #define VM_MASK				0x1
 #define VIEW_MASK				0x3
 #define VSEW_MASK				0x3
@@ -1353,10 +1365,11 @@
 #define REG_PTR(insn, pos, regs)	\
 	(ulong *)((ulong)(regs) + REG_OFFSET(insn, pos))
 
-#define GET_RM(insn)			((insn & MASK_FUNCT3) >> SHIFT_FUNCT3)
-
+#define GET_FUNC3(insn)			((insn & MASK_FUNCT3) >> SHIFT_FUNCT3)
+#define GET_RM(insn)			GET_FUNC3(insn)
 #define GET_RS1_NUM(insn)		((insn & MASK_RS1) >> 15)
 #define GET_CSR_NUM(insn)		((insn & MASK_CSR) >> SHIFT_CSR)
+#define GET_AQRL(insn)			((insn & MASK_AQRL) >> SHIFT_AQRL)
 
 #define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
 #define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
@@ -1381,13 +1394,6 @@
 #define GET_VEMUL(vlmul, view, vsew)	((vlmul + view - vsew) & 7)
 #define GET_EMUL(vemul)		(1UL << ((vemul) >= 4 ? 0 : (vemul)))
 
-#define MASK_FUNCT3			0x7000
-#define MASK_RS1			0xf8000
-#define MASK_CSR			0xfff00000
-
-#define SHIFT_FUNCT3			12
-#define SHIFT_CSR			20
-
 #define CSRRW 1
 #define CSRRS 2
 #define CSRRC 3
diff --git a/include/sbi/sbi_illegal_atomic.h b/include/sbi/sbi_illegal_atomic.h
new file mode 100644
index 00000000..e25ecadf
--- /dev/null
+++ b/include/sbi/sbi_illegal_atomic.h
@@ -0,0 +1,17 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#ifndef __SBI_ILLEGAL_ATOMIC_H__
+#define __SBI_ILLEGAL_ATOMIC_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_trap_regs;
+
+int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs);
+
+#endif
diff --git a/include/sbi/sbi_illegal_insn.h b/include/sbi/sbi_illegal_insn.h
index 7be72ac0..5732e3cd 100644
--- a/include/sbi/sbi_illegal_insn.h
+++ b/include/sbi/sbi_illegal_insn.h
@@ -14,6 +14,10 @@
 
 struct sbi_trap_context;
 
+typedef int (*illegal_insn_func)(ulong insn, struct sbi_trap_regs *regs);
+
+int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs);
+
 int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx);
 
 #endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 9cb28422..8abe1e8e 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -79,6 +79,7 @@ libsbi-objs-y += sbi_heap.o
 libsbi-objs-y += sbi_math.o
 libsbi-objs-y += sbi_hfence.o
 libsbi-objs-y += sbi_hsm.o
+libsbi-objs-y += sbi_illegal_atomic.o
 libsbi-objs-y += sbi_illegal_insn.o
 libsbi-objs-y += sbi_init.o
 libsbi-objs-y += sbi_ipi.o
diff --git a/lib/sbi/sbi_illegal_atomic.c b/lib/sbi/sbi_illegal_atomic.c
new file mode 100644
index 00000000..2161b237
--- /dev/null
+++ b/lib/sbi/sbi_illegal_atomic.c
@@ -0,0 +1,664 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_illegal_atomic.h>
+#include <sbi/sbi_illegal_insn.h>
+
+#if !defined(__riscv_atomic) && !defined(__riscv_zalrsc)
+#error "opensbi strongly relies on the A extension of RISC-V"
+#endif
+
+#ifdef __riscv_atomic
+
+int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
+{
+	return truly_illegal_insn(insn, regs);
+}
+
+#elif __riscv_zalrsc
+
+#define DEFINE_UNPRIVILEGED_LR_FUNCTION(type, aqrl, insn)			\
+	static type lr_##type##aqrl(const type *addr,				\
+				struct sbi_trap_info *trap)			\
+	{									\
+		register ulong tinfo asm("a3");					\
+		register ulong mstatus = 0;					\
+		register ulong mtvec = sbi_hart_expected_trap_addr();		\
+		type ret = 0;							\
+		trap->cause = 0;						\
+		asm volatile(							\
+			"add %[tinfo], %[taddr], zero\n"			\
+			"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"	\
+			"csrrs %[mstatus], " STR(CSR_MSTATUS) ", %[mprv]\n"	\
+			".option push\n"					\
+			".option norvc\n"					\
+			#insn " %[ret], %[addr]\n"				\
+			".option pop\n"						\
+			"csrw " STR(CSR_MSTATUS) ", %[mstatus]\n"		\
+			"csrw " STR(CSR_MTVEC) ", %[mtvec]"			\
+		    : [mstatus] "+&r"(mstatus), [mtvec] "+&r"(mtvec),		\
+		      [tinfo] "+&r"(tinfo), [ret] "=&r"(ret)			\
+		    : [addr] "m"(*addr), [mprv] "r"(MSTATUS_MPRV),		\
+		      [taddr] "r"((ulong)trap)					\
+		    : "a4", "memory");						\
+		return ret;							\
+	}
+
+#define DEFINE_UNPRIVILEGED_SC_FUNCTION(type, aqrl, insn)			\
+	static type sc_##type##aqrl(type *addr, type val,			\
+				struct sbi_trap_info *trap)			\
+	{									\
+		register ulong tinfo asm("a3");					\
+		register ulong mstatus = 0;					\
+		register ulong mtvec = sbi_hart_expected_trap_addr();		\
+		type ret = 0;							\
+		trap->cause = 0;						\
+		asm volatile(							\
+			"add %[tinfo], %[taddr], zero\n"			\
+			"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"	\
+			"csrrs %[mstatus], " STR(CSR_MSTATUS) ", %[mprv]\n"	\
+			".option push\n"					\
+			".option norvc\n"					\
+			#insn " %[ret], %[val], %[addr]\n"			\
+			".option pop\n"						\
+			"csrw " STR(CSR_MSTATUS) ", %[mstatus]\n"		\
+			"csrw " STR(CSR_MTVEC) ", %[mtvec]"			\
+		    : [mstatus] "+&r"(mstatus), [mtvec] "+&r"(mtvec),		\
+		      [tinfo] "+&r"(tinfo), [ret] "=&r"(ret)			\
+		    : [addr] "m"(*addr), [mprv] "r"(MSTATUS_MPRV),		\
+		      [val] "r"(val), [taddr] "r"((ulong)trap)			\
+		    : "a4", "memory");						\
+		return ret;							\
+	}
+
+DEFINE_UNPRIVILEGED_LR_FUNCTION(s32, , lr.w);
+DEFINE_UNPRIVILEGED_LR_FUNCTION(s32, _aq, lr.w.aq);
+DEFINE_UNPRIVILEGED_LR_FUNCTION(s32, _rl, lr.w.rl);
+DEFINE_UNPRIVILEGED_LR_FUNCTION(s32, _aqrl, lr.w.aqrl);
+DEFINE_UNPRIVILEGED_SC_FUNCTION(s32, , sc.w);
+DEFINE_UNPRIVILEGED_SC_FUNCTION(s32, _aq, sc.w.aq);
+DEFINE_UNPRIVILEGED_SC_FUNCTION(s32, _rl, sc.w.rl);
+DEFINE_UNPRIVILEGED_SC_FUNCTION(s32, _aqrl, sc.w.aqrl);
+#if __riscv_xlen == 64
+DEFINE_UNPRIVILEGED_LR_FUNCTION(s64, , lr.d);
+DEFINE_UNPRIVILEGED_LR_FUNCTION(s64, _aq, lr.d.aq);
+DEFINE_UNPRIVILEGED_LR_FUNCTION(s64, _rl, lr.d.rl);
+DEFINE_UNPRIVILEGED_LR_FUNCTION(s64, _aqrl, lr.d.aqrl);
+DEFINE_UNPRIVILEGED_SC_FUNCTION(s64, , sc.d);
+DEFINE_UNPRIVILEGED_SC_FUNCTION(s64, _aq, sc.d.aq);
+DEFINE_UNPRIVILEGED_SC_FUNCTION(s64, _rl, sc.d.rl);
+DEFINE_UNPRIVILEGED_SC_FUNCTION(s64, _aqrl, sc.d.aqrl);
+#endif
+
+#define DEFINE_ATOMIC_FUNCTION(name, type, func)				\
+	static int atomic_##name(ulong insn, struct sbi_trap_regs *regs)	\
+	{									\
+		struct sbi_trap_info uptrap;					\
+		ulong addr = GET_RS1(insn, regs);				\
+		ulong val = GET_RS2(insn, regs);				\
+		ulong rd_val = 0;						\
+		ulong fail = 1;							\
+		while (fail) {							\
+			rd_val = lr_##type((void *)addr, &uptrap);		\
+			if (uptrap.cause) {					\
+				return sbi_trap_redirect(regs, &uptrap);	\
+			}							\
+			fail = sc_##type((void *)addr, func, &uptrap);	\
+			if (uptrap.cause) {					\
+				return sbi_trap_redirect(regs, &uptrap);	\
+			}							\
+		}								\
+		SET_RD(insn, regs, rd_val);					\
+		regs->mepc += 4;						\
+		return 0;							\
+	}
+
+DEFINE_ATOMIC_FUNCTION(add_w, s32, rd_val + val);
+DEFINE_ATOMIC_FUNCTION(add_w_aq, s32_aq, rd_val + val);
+DEFINE_ATOMIC_FUNCTION(add_w_rl, s32_rl, rd_val + val);
+DEFINE_ATOMIC_FUNCTION(add_w_aqrl, s32_aqrl, rd_val + val);
+DEFINE_ATOMIC_FUNCTION(and_w, s32, rd_val & val);
+DEFINE_ATOMIC_FUNCTION(and_w_aq, s32_aq, rd_val & val);
+DEFINE_ATOMIC_FUNCTION(and_w_rl, s32_rl, rd_val & val);
+DEFINE_ATOMIC_FUNCTION(and_w_aqrl, s32_aqrl, rd_val & val);
+DEFINE_ATOMIC_FUNCTION(or_w, s32, rd_val | val);
+DEFINE_ATOMIC_FUNCTION(or_w_aq, s32_aq, rd_val | val);
+DEFINE_ATOMIC_FUNCTION(or_w_rl, s32_rl, rd_val | val);
+DEFINE_ATOMIC_FUNCTION(or_w_aqrl, s32_aqrl, rd_val | val);
+DEFINE_ATOMIC_FUNCTION(xor_w, s32, rd_val ^ val);
+DEFINE_ATOMIC_FUNCTION(xor_w_aq, s32_aq, rd_val ^ val);
+DEFINE_ATOMIC_FUNCTION(xor_w_rl, s32_rl, rd_val ^ val);
+DEFINE_ATOMIC_FUNCTION(xor_w_aqrl, s32_aqrl, rd_val ^ val);
+DEFINE_ATOMIC_FUNCTION(swap_w, s32, val);
+DEFINE_ATOMIC_FUNCTION(swap_w_aq, s32_aq, val);
+DEFINE_ATOMIC_FUNCTION(swap_w_rl, s32_rl, val);
+DEFINE_ATOMIC_FUNCTION(swap_w_aqrl, s32_aqrl, val);
+DEFINE_ATOMIC_FUNCTION(max_w, s32, (s32)rd_val > (s32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(max_w_aq, s32_aq, (s32)rd_val > (s32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(max_w_rl, s32_rl, (s32)rd_val > (s32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(max_w_aqrl, s32_aqrl, (s32)rd_val > (s32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(maxu_w, s32, (u32)rd_val > (u32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(maxu_w_aq, s32_aq, (u32)rd_val > (u32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(maxu_w_rl, s32_rl, (u32)rd_val > (u32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(maxu_w_aqrl, s32_aqrl, (u32)rd_val > (u32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(min_w, s32, (s32)rd_val < (s32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(min_w_aq, s32_aq, (s32)rd_val < (s32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(min_w_rl, s32_rl, (s32)rd_val < (s32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(min_w_aqrl, s32_aqrl, (s32)rd_val < (s32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(minu_w, s32, (u32)rd_val < (u32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(minu_w_aq, s32_aq, (u32)rd_val < (u32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(minu_w_rl, s32_rl, (u32)rd_val < (u32)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(minu_w_aqrl, s32_aqrl, (u32)rd_val < (u32)val ? rd_val : val);
+
+#if __riscv_xlen == 64
+DEFINE_ATOMIC_FUNCTION(add_d, s64, rd_val + val);
+DEFINE_ATOMIC_FUNCTION(add_d_aq, s64_aq, rd_val + val);
+DEFINE_ATOMIC_FUNCTION(add_d_rl, s64_rl, rd_val + val);
+DEFINE_ATOMIC_FUNCTION(add_d_aqrl, s64_aqrl, rd_val + val);
+DEFINE_ATOMIC_FUNCTION(and_d, s64, rd_val & val);
+DEFINE_ATOMIC_FUNCTION(and_d_aq, s64_aq, rd_val & val);
+DEFINE_ATOMIC_FUNCTION(and_d_rl, s64_rl, rd_val & val);
+DEFINE_ATOMIC_FUNCTION(and_d_aqrl, s64_aqrl, rd_val & val);
+DEFINE_ATOMIC_FUNCTION(or_d, s64, rd_val | val);
+DEFINE_ATOMIC_FUNCTION(or_d_aq, s64_aq, rd_val | val);
+DEFINE_ATOMIC_FUNCTION(or_d_rl, s64_rl, rd_val | val);
+DEFINE_ATOMIC_FUNCTION(or_d_aqrl, s64_aqrl, rd_val | val);
+DEFINE_ATOMIC_FUNCTION(xor_d, s64, rd_val ^ val);
+DEFINE_ATOMIC_FUNCTION(xor_d_aq, s64_aq, rd_val ^ val);
+DEFINE_ATOMIC_FUNCTION(xor_d_rl, s64_rl, rd_val ^ val);
+DEFINE_ATOMIC_FUNCTION(xor_d_aqrl, s64_aqrl, rd_val ^ val);
+DEFINE_ATOMIC_FUNCTION(swap_d, s64, val);
+DEFINE_ATOMIC_FUNCTION(swap_d_aq, s64_aq, val);
+DEFINE_ATOMIC_FUNCTION(swap_d_rl, s64_rl, val);
+DEFINE_ATOMIC_FUNCTION(swap_d_aqrl, s64_aqrl, val);
+DEFINE_ATOMIC_FUNCTION(max_d, s64, (s64)rd_val > (s64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(max_d_aq, s64_aq, (s64)rd_val > (s64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(max_d_rl, s64_rl, (s64)rd_val > (s64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(max_d_aqrl, s64_aqrl, (s64)rd_val > (s64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(maxu_d, s64, (u64)rd_val > (u64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(maxu_d_aq, s64_aq, (u64)rd_val > (u64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(maxu_d_rl, s64_rl, (u64)rd_val > (u64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(maxu_d_aqrl, s64_aqrl, (u64)rd_val > (u64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(min_d, s64, (s64)rd_val < (s64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(min_d_aq, s64_aq, (s64)rd_val < (s64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(min_d_rl, s64_rl, (s64)rd_val < (s64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(min_d_aqrl, s64_aqrl, (s64)rd_val < (s64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(minu_d, s64, (u64)rd_val < (u64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(minu_d_aq, s64_aq, (u64)rd_val < (u64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(minu_d_rl, s64_rl, (u64)rd_val < (u64)val ? rd_val : val);
+DEFINE_ATOMIC_FUNCTION(minu_d_aqrl, s64_aqrl, (u64)rd_val < (u64)val ? rd_val : val);
+#endif
+
+static const illegal_insn_func amoadd_table[32] = {
+	truly_illegal_insn, /* 0 */
+	truly_illegal_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	truly_illegal_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	atomic_add_w, /* 8 */
+	atomic_add_w_rl, /* 9 */
+	atomic_add_w_aq, /* 10 */
+	atomic_add_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	atomic_add_d, /* 12 */
+	atomic_add_d_rl, /* 13 */
+	atomic_add_d_aq, /* 14 */
+	atomic_add_d_aqrl, /* 15 */
+#else
+	truly_illegal_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+#endif
+	truly_illegal_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	truly_illegal_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	truly_illegal_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	truly_illegal_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amoswap_table[32] = {
+	truly_illegal_insn, /* 0 */
+	truly_illegal_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	truly_illegal_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	atomic_swap_w, /* 8 */
+	atomic_swap_w_rl, /* 9 */
+	atomic_swap_w_aq, /* 10 */
+	atomic_swap_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	atomic_swap_d, /* 12 */
+	atomic_swap_d_rl, /* 13 */
+	atomic_swap_d_aq, /* 14 */
+	atomic_swap_d_aqrl, /* 15 */
+#else
+	truly_illegal_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+#endif
+	truly_illegal_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	truly_illegal_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	truly_illegal_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	truly_illegal_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amoxor_table[32] = {
+	truly_illegal_insn, /* 0 */
+	truly_illegal_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	truly_illegal_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	atomic_xor_w, /* 8 */
+	atomic_xor_w_rl, /* 9 */
+	atomic_xor_w_aq, /* 10 */
+	atomic_xor_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	atomic_xor_d, /* 12 */
+	atomic_xor_d_rl, /* 13 */
+	atomic_xor_d_aq, /* 14 */
+	atomic_xor_d_aqrl, /* 15 */
+#else
+	truly_illegal_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+#endif
+	truly_illegal_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	truly_illegal_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	truly_illegal_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	truly_illegal_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amoor_table[32] = {
+	truly_illegal_insn, /* 0 */
+	truly_illegal_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	truly_illegal_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	atomic_or_w, /* 8 */
+	atomic_or_w_rl, /* 9 */
+	atomic_or_w_aq, /* 10 */
+	atomic_or_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	atomic_or_d, /* 12 */
+	atomic_or_d_rl, /* 13 */
+	atomic_or_d_aq, /* 14 */
+	atomic_or_d_aqrl, /* 15 */
+#else
+	truly_illegal_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+#endif
+	truly_illegal_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	truly_illegal_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	truly_illegal_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	truly_illegal_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amoand_table[32] = {
+	truly_illegal_insn, /* 0 */
+	truly_illegal_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	truly_illegal_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	atomic_and_w, /* 8 */
+	atomic_and_w_rl, /* 9 */
+	atomic_and_w_aq, /* 10 */
+	atomic_and_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	atomic_and_d, /* 12 */
+	atomic_and_d_rl, /* 13 */
+	atomic_and_d_aq, /* 14 */
+	atomic_and_d_aqrl, /* 15 */
+#else
+	truly_illegal_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+#endif
+	truly_illegal_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	truly_illegal_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	truly_illegal_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	truly_illegal_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amomin_table[32] = {
+	truly_illegal_insn, /* 0 */
+	truly_illegal_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	truly_illegal_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	atomic_min_w, /* 8 */
+	atomic_min_w_rl, /* 9 */
+	atomic_min_w_aq, /* 10 */
+	atomic_min_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	atomic_min_d, /* 12 */
+	atomic_min_d_rl, /* 13 */
+	atomic_min_d_aq, /* 14 */
+	atomic_min_d_aqrl, /* 15 */
+#else
+	truly_illegal_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+#endif
+	truly_illegal_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	truly_illegal_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	truly_illegal_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	truly_illegal_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amomax_table[32] = {
+	truly_illegal_insn, /* 0 */
+	truly_illegal_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	truly_illegal_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	atomic_max_w, /* 8 */
+	atomic_max_w_rl, /* 9 */
+	atomic_max_w_aq, /* 10 */
+	atomic_max_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	atomic_max_d, /* 12 */
+	atomic_max_d_rl, /* 13 */
+	atomic_max_d_aq, /* 14 */
+	atomic_max_d_aqrl, /* 15 */
+#else
+	truly_illegal_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+#endif
+	truly_illegal_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	truly_illegal_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	truly_illegal_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	truly_illegal_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amominu_table[32] = {
+	truly_illegal_insn, /* 0 */
+	truly_illegal_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	truly_illegal_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	atomic_minu_w, /* 8 */
+	atomic_minu_w_rl, /* 9 */
+	atomic_minu_w_aq, /* 10 */
+	atomic_minu_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	atomic_minu_d, /* 12 */
+	atomic_minu_d_rl, /* 13 */
+	atomic_minu_d_aq, /* 14 */
+	atomic_minu_d_aqrl, /* 15 */
+#else
+	truly_illegal_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+#endif
+	truly_illegal_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	truly_illegal_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	truly_illegal_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	truly_illegal_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amomaxu_table[32] = {
+	truly_illegal_insn, /* 0 */
+	truly_illegal_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	truly_illegal_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	atomic_maxu_w, /* 8 */
+	atomic_maxu_w_rl, /* 9 */
+	atomic_maxu_w_aq, /* 10 */
+	atomic_maxu_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	atomic_maxu_d, /* 12 */
+	atomic_maxu_d_rl, /* 13 */
+	atomic_maxu_d_aq, /* 14 */
+	atomic_maxu_d_aqrl, /* 15 */
+#else
+	truly_illegal_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+#endif
+	truly_illegal_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	truly_illegal_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	truly_illegal_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	truly_illegal_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn, /* 31 */
+};
+
+static int amoadd_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amoadd_table[(GET_FUNC3(insn) << 2) + GET_AQRL(insn)](insn, regs);
+}
+
+static int amoswap_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amoswap_table[(GET_FUNC3(insn) << 2) + GET_AQRL(insn)](insn, regs);
+}
+
+static int amoxor_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amoxor_table[(GET_FUNC3(insn) << 2) + GET_AQRL(insn)](insn, regs);
+}
+
+static int amoor_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amoor_table[(GET_FUNC3(insn) << 2) + GET_AQRL(insn)](insn, regs);
+}
+
+static int amoand_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amoand_table[(GET_FUNC3(insn) << 2) + GET_AQRL(insn)](insn, regs);
+}
+
+static int amomin_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amomin_table[(GET_FUNC3(insn) << 2) + GET_AQRL(insn)](insn, regs);
+}
+
+static int amomax_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amomax_table[(GET_FUNC3(insn) << 2) + GET_AQRL(insn)](insn, regs);
+}
+
+static int amominu_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amominu_table[(GET_FUNC3(insn) << 2) + GET_AQRL(insn)](insn, regs);
+}
+
+static int amomaxu_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amomaxu_table[(GET_FUNC3(insn) << 2) + GET_AQRL(insn)](insn, regs);
+}
+
+static const illegal_insn_func amo_insn_table[32] = {
+	amoadd_insn, /* 0 */
+	amoswap_insn, /* 1 */
+	truly_illegal_insn, /* 2 */
+	truly_illegal_insn, /* 3 */
+	amoxor_insn, /* 4 */
+	truly_illegal_insn, /* 5 */
+	truly_illegal_insn, /* 6 */
+	truly_illegal_insn, /* 7 */
+	amoor_insn, /* 8 */
+	truly_illegal_insn, /* 9 */
+	truly_illegal_insn, /* 10 */
+	truly_illegal_insn, /* 11 */
+	amoand_insn, /* 12 */
+	truly_illegal_insn, /* 13 */
+	truly_illegal_insn, /* 14 */
+	truly_illegal_insn, /* 15 */
+	amomin_insn, /* 16 */
+	truly_illegal_insn, /* 17 */
+	truly_illegal_insn, /* 18 */
+	truly_illegal_insn, /* 19 */
+	amomax_insn, /* 20 */
+	truly_illegal_insn, /* 21 */
+	truly_illegal_insn, /* 22 */
+	truly_illegal_insn, /* 23 */
+	amominu_insn, /* 24 */
+	truly_illegal_insn, /* 25 */
+	truly_illegal_insn, /* 26 */
+	truly_illegal_insn, /* 27 */
+	amomaxu_insn, /* 28 */
+	truly_illegal_insn, /* 29 */
+	truly_illegal_insn, /* 30 */
+	truly_illegal_insn  /* 31 */
+};
+
+int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
+{
+	return amo_insn_table[(insn >> 27) & 0x1f](insn, regs);
+}
+
+#else
+#error "need a or zalrsc"
+#endif
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 784bc4c0..fa82264a 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -13,15 +13,14 @@
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_emulate_csr.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_illegal_atomic.h>
 #include <sbi/sbi_illegal_insn.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
 #include <sbi/sbi_console.h>
 
-typedef int (*illegal_insn_func)(ulong insn, struct sbi_trap_regs *regs);
-
-static int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
+int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
 {
 	struct sbi_trap_info trap;
 
@@ -123,7 +122,7 @@ static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn, /* 8 */
 	truly_illegal_insn, /* 9 */
 	truly_illegal_insn, /* 10 */
-	truly_illegal_insn, /* 11 */
+	sbi_illegal_atomic, /* 11 */
 	truly_illegal_insn, /* 12 */
 	truly_illegal_insn, /* 13 */
 	truly_illegal_insn, /* 14 */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
