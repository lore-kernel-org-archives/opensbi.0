Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30583C3601E
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 23:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0rgYw3H91CYzBZy7OEXg8UqMjs/yuuKyQd9NYpOuAs=; b=V8ycKYfUe1yanm
	yQBjT/XnbDVd79qutXCgCDh1S2WoMJzaxXKAqQYCpUEBgBQO/MJlLURxm4OzUmiXi0BAv+Ot6CSog
	i4E5dZXHiTX9SONtYcPWjLdCGvhL2fwxOqe/0Jc+NwW/OC4agdsXT3Pd7KKfM2g/R2zc9wAvw2ED7
	n5x43Kqzn37Ybb31UwrP3fsfWojNFv2dajWePW9+780PuzolPxzngCyLoaeVKiWUxN+Q2Cs+1oUp/
	KnDUI9wHFwE0YuM4k5s+4StnjstLiwY9nGlbmj7Tfp+jn14eEx2p0tI8GXcAl68Z7RxkmN7lkkgRo
	TVhx5dE0+Pa5clbZwvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Re-0000000C47U-3RYF;
	Thu, 10 Apr 2025 23:36:30 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Rc-0000000C45R-2dEd
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 23:36:29 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3035858c687so1086517a91.2
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 16:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328187; x=1744932987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2pY3Ky9WxSZ6AZ1zAk3vxRacPf7wSlUrKvlnkre/g4=;
        b=OaPEJHclnDi4BlNOn/cOmW1LdtFshFt5TrBcyLPZFC39hSmXhupBQMBg1FaB+58vVf
         wnX2FOyGewsRNgvoD8tZkmF0f0Tbt+DRFkOe7ekG9X3NTU67b+0/EBT0V0Pn9LVWdjHx
         33opzZE9Bzw/Sn+pyiD6Jh/5OeA65/5PYPg3uHUiRgRmpuElImHCkenU6B0PQh3PMJHI
         vh343Nva4RSBbvGJlzP9WYcca/yIuOE2FkOzGprkIk3oQIbD+IGWYrLd8pbpmOBpMjXh
         aBVd8nwBFrxsaPRsqm25o8P4mDTqjXxMs3cGEgTdpBVTy3vRGT1ssUF0uEJVmWgImN77
         P4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328187; x=1744932987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2pY3Ky9WxSZ6AZ1zAk3vxRacPf7wSlUrKvlnkre/g4=;
        b=mtYwd34WViW4Rqxu1fi/GJLeyDUrLq8INbACsyN0cokw5/QQts3BW0hJmYMUHRAQPr
         ZL3aRCBYOne3DfwRYstTC9/5sqNYSaVKg7yBuenes9ob7muPCmNGBsk590lIgv2+8Vd9
         DJUO671M3/b8HAYtu+dnWx/oNL3k0DXbIw3R42rNPX8s6LdaDCn51MzLiIH2GIGl6ghT
         FeKDzFrRRGloP4yiaOSehwXql2GzOhPA1grKa6mNuvGEC45HGZyek3kAz3ip9i5yU+Ui
         txEXcc+2D63Ndtdb/BHH6t3ZkQEwhI+GVulrUeD0TBD/8y8JX8MVW5GvrJ4RTrSXMp2h
         gNmA==
X-Gm-Message-State: AOJu0Yx5fvD/TB+0uFhozTK13yU5Nm7qQnpNfhRVF8HjoFEpj1cXGg9X
	hcp0oagC1/uZXzBcztL/iGT3bTV3vFQzO3W93aa1sFDB5fOly8l6XYKH4XKb
X-Gm-Gg: ASbGnctXWZt3RRpVDqw15lR13UWT5Eka15sOgzTmybZUEQm1Ia5ygf2PDP4uzwkQdo+
	98lreWrZdTEpojw6z6ITyOoWzHzlmxRkHtw/LzIOVRP8bD9KFt2rB51kCH3zkJLsl12VwswnG6V
	UTPTq+4wBc/2O1Nf6FRsjr/4K5eNu5orvf4tf9NRoYhnYMMuUvghVkhVJaq0fPe3vl51azOcmSr
	x7Ek2Oj/eIsCDOhlG5kam3CrmoY1v56oC0zAFQMOCadMLg/8RCSuMHkiUz5kLsGeqxnLAn4RRkd
	D2ddR0PVkkhSbCTUNPqbHB0dMoewk0/RRVPYLKnXouJveOfiuB30R9wh3sBVF7+RIC+dvqgma9I
	uEFElaCsoAjJb
X-Google-Smtp-Source: AGHT+IHjA6tid1m0uSVCk266Pzu04PfhnLIW95+vwLfTn7SW1GuFUzijzV5hjWe9Vfrh2N3NH4MQEg==
X-Received: by 2002:a17:90b:4c10:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-308237cf997mr975641a91.35.1744328186337;
        Thu, 10 Apr 2025 16:36:26 -0700 (PDT)
Received: from localhost.localdomain (36-231-65-80.dynamic-ip.hinet.net. [36.231.65.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c992aasm36686985ad.157.2025.04.10.16.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:36:25 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3 6/9] lib: Emulate amo instructions
Date: Thu, 10 Apr 2025 15:45:32 -0700
Message-ID: <20250410224536.25021-7-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_163628_683224_D9EED2FA 
X-CRM114-Status: GOOD (  14.00  )
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

Match amo instruction opcode to emulate from illegal instruction
exceptions.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 include/sbi/sbi_atomic.h   |  90 +++++++
 lib/sbi/objects.mk         |   1 +
 lib/sbi/sbi_atomic.c       | 182 ++++++++++++++
 lib/sbi/sbi_illegal_insn.c | 492 +++++++++++++++++++++++++++++++++++++
 4 files changed, 765 insertions(+)
 create mode 100644 include/sbi/sbi_atomic.h
 create mode 100644 lib/sbi/sbi_atomic.c

diff --git a/include/sbi/sbi_atomic.h b/include/sbi/sbi_atomic.h
new file mode 100644
index 0000000..561da89
--- /dev/null
+++ b/include/sbi/sbi_atomic.h
@@ -0,0 +1,90 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#ifndef __SBI_ATOMIC_H__
+#define __SBI_ATOMIC_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_trap_regs;
+
+int sbi_atomic_add_w(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_add_d(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_and_w(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_and_d(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_or_w(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_or_d(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_xor_w(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_xor_d(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_max_w(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_max_d(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_min_w(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_min_d(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_maxu_w(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_maxu_d(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_minu_w(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_minu_d(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_swap_w(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_swap_d(ulong insn, struct sbi_trap_regs *regs);
+
+int sbi_atomic_add_w_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_add_d_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_and_w_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_and_d_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_or_w_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_or_d_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_xor_w_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_xor_d_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_max_w_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_max_d_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_min_w_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_min_d_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_maxu_w_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_maxu_d_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_minu_w_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_minu_d_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_swap_w_aq(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_swap_d_aq(ulong insn, struct sbi_trap_regs *regs);
+
+int sbi_atomic_add_w_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_add_d_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_and_w_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_and_d_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_or_w_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_or_d_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_xor_w_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_xor_d_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_max_w_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_max_d_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_min_w_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_min_d_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_maxu_w_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_maxu_d_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_minu_w_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_minu_d_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_swap_w_rl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_swap_d_rl(ulong insn, struct sbi_trap_regs *regs);
+
+int sbi_atomic_add_w_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_add_d_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_and_w_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_and_d_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_or_w_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_or_d_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_xor_w_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_xor_d_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_max_w_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_max_d_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_min_w_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_min_d_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_maxu_w_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_maxu_d_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_minu_w_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_minu_d_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_swap_w_aqrl(ulong insn, struct sbi_trap_regs *regs);
+int sbi_atomic_swap_d_aqrl(ulong insn, struct sbi_trap_regs *regs);
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 9cb2842..af7a846 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -99,3 +99,4 @@ libsbi-objs-y += sbi_trap_v_ldst.o
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
 libsbi-objs-y += sbi_cppc.o
+libsbi-objs-y += sbi_atomic.o
diff --git a/lib/sbi/sbi_atomic.c b/lib/sbi/sbi_atomic.c
new file mode 100644
index 0000000..afd28d2
--- /dev/null
+++ b/lib/sbi/sbi_atomic.c
@@ -0,0 +1,182 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_hart.h>
+
+#define DEFINE_UNPRIVILEGED_LR_FUNCTION(type, aqrl, insn)                     \
+        type sbi_lr_##type##aqrl(const type *addr,                            \
+                           struct sbi_trap_info *trap)                        \
+        {                                                                     \
+                register ulong tinfo asm("a3");                               \
+                register ulong mstatus = 0;                                   \
+                register ulong mtvec = sbi_hart_expected_trap_addr();         \
+                type ret = 0;                                                 \
+                trap->cause = 0;                                              \
+                asm volatile(                                                 \
+                        "add %[tinfo], %[taddr], zero\n"                      \
+                        "csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"      \
+                        "csrrs %[mstatus], " STR(CSR_MSTATUS) ", %[mprv]\n"   \
+                        ".option push\n"                                      \
+                        ".option norvc\n"                                     \
+                        #insn " %[ret], %[addr]\n"                            \
+                        ".option pop\n"                                       \
+                        "csrw " STR(CSR_MSTATUS) ", %[mstatus]\n"             \
+                        "csrw " STR(CSR_MTVEC) ", %[mtvec]"                   \
+                    : [mstatus] "+&r"(mstatus), [mtvec] "+&r"(mtvec),         \
+                      [tinfo] "+&r"(tinfo), [ret] "=&r"(ret)                  \
+                    : [addr] "m"(*addr), [mprv] "r"(MSTATUS_MPRV),            \
+                      [taddr] "r"((ulong)trap)                                \
+                    : "a4", "memory");                                        \
+                return ret;                                                   \
+        }
+
+#define DEFINE_UNPRIVILEGED_SC_FUNCTION(type, aqrl, insn)                     \
+        type sbi_sc_##type##aqrl(type *addr, type val,                        \
+                           struct sbi_trap_info *trap)                        \
+        {                                                                     \
+                register ulong tinfo asm("a3");                               \
+                register ulong mstatus = 0;                                   \
+                register ulong mtvec = sbi_hart_expected_trap_addr();         \
+                type ret = 0;                                                 \
+                trap->cause = 0;                                              \
+                asm volatile(                                                 \
+                        "add %[tinfo], %[taddr], zero\n"                      \
+                        "csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"      \
+                        "csrrs %[mstatus], " STR(CSR_MSTATUS) ", %[mprv]\n"   \
+                        ".option push\n"                                      \
+                        ".option norvc\n"                                     \
+                        #insn " %[ret], %[val], %[addr]\n"                    \
+                        ".option pop\n"                                       \
+                        "csrw " STR(CSR_MSTATUS) ", %[mstatus]\n"             \
+                        "csrw " STR(CSR_MTVEC) ", %[mtvec]"                   \
+                    : [mstatus] "+&r"(mstatus), [mtvec] "+&r"(mtvec),         \
+                      [tinfo] "+&r"(tinfo), [ret] "=&r"(ret)                  \
+                    : [addr] "m"(*addr), [mprv] "r"(MSTATUS_MPRV),            \
+                      [val] "r"(val), [taddr] "r"((ulong)trap)                \
+                    : "a4", "memory");                                        \
+                return ret;                                                   \
+        }
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
+#define DEFINE_ATOMIC_FUNCTION(name, type, func)                              \
+	int sbi_atomic_##name(ulong insn, struct sbi_trap_regs *regs)         \
+	{                                                                     \
+		struct sbi_trap_info uptrap;                                  \
+		ulong addr = GET_RS1(insn, regs);                             \
+		ulong val = GET_RS2(insn, regs);                              \
+		ulong rd_val = 0;                                             \
+		ulong fail = 1;                                               \
+		while (fail) {                                                \
+			rd_val = sbi_lr_##type((void *)addr, &uptrap);        \
+			if (uptrap.cause) {                                   \
+				return sbi_trap_redirect(regs, &uptrap);      \
+			}                                                     \
+			fail = sbi_sc_##type((void *)addr, func, &uptrap);    \
+			if (uptrap.cause) {                                   \
+				return sbi_trap_redirect(regs, &uptrap);      \
+			}                                                     \
+		}                                                             \
+		SET_RD(insn, regs, rd_val);                                   \
+		regs->mepc += 4;                                              \
+		return 0;                                                     \
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
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 784bc4c..4a01f59 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -10,6 +10,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_barrier.h>
 #include <sbi/riscv_encoding.h>
+#include <sbi/sbi_atomic.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_emulate_csr.h>
 #include <sbi/sbi_error.h>
@@ -19,6 +20,13 @@
 #include <sbi/sbi_unpriv.h>
 #include <sbi/sbi_console.h>
 
+#define OPCODE_MASK 0x0000007f
+#define AMO_OPCODE 0x0000002f
+#define WD_MASK 0x00007000
+#define WD_SHIFT 12
+#define AQRL_MASK 0x06000000
+#define AQRL_SHIFT 25
+
 typedef int (*illegal_insn_func)(ulong insn, struct sbi_trap_regs *regs);
 
 static int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
@@ -146,6 +154,487 @@ static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn  /* 31 */
 };
 
+static int other_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	return illegal_insn_table[(insn & 0x7c) >> 2](insn, regs);
+}
+
+static const illegal_insn_func amoadd_table[32] = {
+	other_illegal_insn, /* 0 */
+	other_illegal_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	other_illegal_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	sbi_atomic_add_w, /* 8 */
+	sbi_atomic_add_w_rl, /* 9 */
+	sbi_atomic_add_w_aq, /* 10 */
+	sbi_atomic_add_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	sbi_atomic_add_d, /* 12 */
+	sbi_atomic_add_d_rl, /* 13 */
+	sbi_atomic_add_d_aq, /* 14 */
+	sbi_atomic_add_d_aqrl, /* 15 */
+#else
+	other_illegal_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+#endif
+	other_illegal_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	other_illegal_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	other_illegal_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	other_illegal_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amoswap_table[32] = {
+	other_illegal_insn, /* 0 */
+	other_illegal_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	other_illegal_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	sbi_atomic_swap_w, /* 8 */
+	sbi_atomic_swap_w_rl, /* 9 */
+	sbi_atomic_swap_w_aq, /* 10 */
+	sbi_atomic_swap_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	sbi_atomic_swap_d, /* 12 */
+	sbi_atomic_swap_d_rl, /* 13 */
+	sbi_atomic_swap_d_aq, /* 14 */
+	sbi_atomic_swap_d_aqrl, /* 15 */
+#else
+	other_illegal_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+#endif
+	other_illegal_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	other_illegal_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	other_illegal_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	other_illegal_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amoxor_table[32] = {
+	other_illegal_insn, /* 0 */
+	other_illegal_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	other_illegal_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	sbi_atomic_xor_w, /* 8 */
+	sbi_atomic_xor_w_rl, /* 9 */
+	sbi_atomic_xor_w_aq, /* 10 */
+	sbi_atomic_xor_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	sbi_atomic_xor_d, /* 12 */
+	sbi_atomic_xor_d_rl, /* 13 */
+	sbi_atomic_xor_d_aq, /* 14 */
+	sbi_atomic_xor_d_aqrl, /* 15 */
+#else
+	other_illegal_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+#endif
+	other_illegal_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	other_illegal_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	other_illegal_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	other_illegal_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amoor_table[32] = {
+	other_illegal_insn, /* 0 */
+	other_illegal_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	other_illegal_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	sbi_atomic_or_w, /* 8 */
+	sbi_atomic_or_w_rl, /* 9 */
+	sbi_atomic_or_w_aq, /* 10 */
+	sbi_atomic_or_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	sbi_atomic_or_d, /* 12 */
+	sbi_atomic_or_d_rl, /* 13 */
+	sbi_atomic_or_d_aq, /* 14 */
+	sbi_atomic_or_d_aqrl, /* 15 */
+#else
+	other_illegal_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+#endif
+	other_illegal_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	other_illegal_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	other_illegal_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	other_illegal_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amoand_table[32] = {
+	other_illegal_insn, /* 0 */
+	other_illegal_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	other_illegal_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	sbi_atomic_and_w, /* 8 */
+	sbi_atomic_and_w_rl, /* 9 */
+	sbi_atomic_and_w_aq, /* 10 */
+	sbi_atomic_and_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	sbi_atomic_and_d, /* 12 */
+	sbi_atomic_and_d_rl, /* 13 */
+	sbi_atomic_and_d_aq, /* 14 */
+	sbi_atomic_and_d_aqrl, /* 15 */
+#else
+	other_illegal_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+#endif
+	other_illegal_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	other_illegal_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	other_illegal_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	other_illegal_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amomin_table[32] = {
+	other_illegal_insn, /* 0 */
+	other_illegal_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	other_illegal_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	sbi_atomic_min_w, /* 8 */
+	sbi_atomic_min_w_rl, /* 9 */
+	sbi_atomic_min_w_aq, /* 10 */
+	sbi_atomic_min_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	sbi_atomic_min_d, /* 12 */
+	sbi_atomic_min_d_rl, /* 13 */
+	sbi_atomic_min_d_aq, /* 14 */
+	sbi_atomic_min_d_aqrl, /* 15 */
+#else
+	other_illegal_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+#endif
+	other_illegal_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	other_illegal_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	other_illegal_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	other_illegal_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amomax_table[32] = {
+	other_illegal_insn, /* 0 */
+	other_illegal_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	other_illegal_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	sbi_atomic_max_w, /* 8 */
+	sbi_atomic_max_w_rl, /* 9 */
+	sbi_atomic_max_w_aq, /* 10 */
+	sbi_atomic_max_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	sbi_atomic_max_d, /* 12 */
+	sbi_atomic_max_d_rl, /* 13 */
+	sbi_atomic_max_d_aq, /* 14 */
+	sbi_atomic_max_d_aqrl, /* 15 */
+#else
+	other_illegal_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+#endif
+	other_illegal_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	other_illegal_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	other_illegal_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	other_illegal_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amominu_table[32] = {
+	other_illegal_insn, /* 0 */
+	other_illegal_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	other_illegal_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	sbi_atomic_minu_w, /* 8 */
+	sbi_atomic_minu_w_rl, /* 9 */
+	sbi_atomic_minu_w_aq, /* 10 */
+	sbi_atomic_minu_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	sbi_atomic_minu_d, /* 12 */
+	sbi_atomic_minu_d_rl, /* 13 */
+	sbi_atomic_minu_d_aq, /* 14 */
+	sbi_atomic_minu_d_aqrl, /* 15 */
+#else
+	other_illegal_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+#endif
+	other_illegal_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	other_illegal_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	other_illegal_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	other_illegal_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn, /* 31 */
+};
+
+static const illegal_insn_func amomaxu_table[32] = {
+	other_illegal_insn, /* 0 */
+	other_illegal_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	other_illegal_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	sbi_atomic_maxu_w, /* 8 */
+	sbi_atomic_maxu_w_rl, /* 9 */
+	sbi_atomic_maxu_w_aq, /* 10 */
+	sbi_atomic_maxu_w_aqrl, /* 11 */
+#if __riscv_xlen == 64
+	sbi_atomic_maxu_d, /* 12 */
+	sbi_atomic_maxu_d_rl, /* 13 */
+	sbi_atomic_maxu_d_aq, /* 14 */
+	sbi_atomic_maxu_d_aqrl, /* 15 */
+#else
+	other_illegal_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+#endif
+	other_illegal_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	other_illegal_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	other_illegal_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	other_illegal_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn, /* 31 */
+};
+
+static int amoadd_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	int wd = ((insn & WD_MASK) >> WD_SHIFT) << 2;
+	int aqrl = (insn & AQRL_MASK) >> AQRL_SHIFT;
+	return amoadd_table[wd + aqrl](insn, regs);
+}
+
+static int amoswap_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	int wd = ((insn & WD_MASK) >> WD_SHIFT) << 2;
+	int aqrl = (insn & AQRL_MASK) >> AQRL_SHIFT;
+	return amoswap_table[wd + aqrl](insn, regs);
+}
+
+static int amoxor_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	int wd = ((insn & WD_MASK) >> WD_SHIFT) << 2;
+	int aqrl = (insn & AQRL_MASK) >> AQRL_SHIFT;
+	return amoxor_table[wd + aqrl](insn, regs);
+}
+
+static int amoor_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	int wd = ((insn & WD_MASK) >> WD_SHIFT) << 2;
+	int aqrl = (insn & AQRL_MASK) >> AQRL_SHIFT;
+	return amoor_table[wd + aqrl](insn, regs);
+}
+
+static int amoand_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	int wd = ((insn & WD_MASK) >> WD_SHIFT) << 2;
+	int aqrl = (insn & AQRL_MASK) >> AQRL_SHIFT;
+	return amoand_table[wd + aqrl](insn, regs);
+}
+
+static int amomin_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	int wd = ((insn & WD_MASK) >> WD_SHIFT) << 2;
+	int aqrl = (insn & AQRL_MASK) >> AQRL_SHIFT;
+	return amomin_table[wd + aqrl](insn, regs);
+}
+
+static int amomax_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	int wd = ((insn & WD_MASK) >> WD_SHIFT) << 2;
+	int aqrl = (insn & AQRL_MASK) >> AQRL_SHIFT;
+	return amomax_table[wd + aqrl](insn, regs);
+}
+
+static int amominu_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	int wd = ((insn & WD_MASK) >> WD_SHIFT) << 2;
+	int aqrl = (insn & AQRL_MASK) >> AQRL_SHIFT;
+	return amominu_table[wd + aqrl](insn, regs);
+}
+
+static int amomaxu_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	int wd = ((insn & WD_MASK) >> WD_SHIFT) << 2;
+	int aqrl = (insn & AQRL_MASK) >> AQRL_SHIFT;
+	return amomaxu_table[wd + aqrl](insn, regs);
+}
+
+static const illegal_insn_func amo_insn_table[32] = {
+	amoadd_insn, /* 0 */
+	amoswap_insn, /* 1 */
+	other_illegal_insn, /* 2 */
+	other_illegal_insn, /* 3 */
+	amoxor_insn, /* 4 */
+	other_illegal_insn, /* 5 */
+	other_illegal_insn, /* 6 */
+	other_illegal_insn, /* 7 */
+	amoor_insn, /* 8 */
+	other_illegal_insn, /* 9 */
+	other_illegal_insn, /* 10 */
+	other_illegal_insn, /* 11 */
+	amoand_insn, /* 12 */
+	other_illegal_insn, /* 13 */
+	other_illegal_insn, /* 14 */
+	other_illegal_insn, /* 15 */
+	amomin_insn, /* 16 */
+	other_illegal_insn, /* 17 */
+	other_illegal_insn, /* 18 */
+	other_illegal_insn, /* 19 */
+	amomax_insn, /* 20 */
+	other_illegal_insn, /* 21 */
+	other_illegal_insn, /* 22 */
+	other_illegal_insn, /* 23 */
+	amominu_insn, /* 24 */
+	other_illegal_insn, /* 25 */
+	other_illegal_insn, /* 26 */
+	other_illegal_insn, /* 27 */
+	amomaxu_insn, /* 28 */
+	other_illegal_insn, /* 29 */
+	other_illegal_insn, /* 30 */
+	other_illegal_insn  /* 31 */
+};
+
 int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx)
 {
 	struct sbi_trap_regs *regs = &tcntx->regs;
@@ -172,5 +661,8 @@ int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx)
 			return truly_illegal_insn(insn, regs);
 	}
 
+	if ((insn & OPCODE_MASK) == AMO_OPCODE)
+		return amo_insn_table[(insn >> 27) & 0x1f](insn, regs);
+
 	return illegal_insn_table[(insn & 0x7c) >> 2](insn, regs);
 }
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
