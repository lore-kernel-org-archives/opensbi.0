Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E87C54799
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XeiAw5Yx1uscuwum8TXZUTsbtFXcQqflcU2QCx36ts=; b=kVxukXtmx1lQDy
	9g+psrm0zkL1A+qFi9gne9f0XtFlX0efd8+nGu1VDtEBaA4Q82IiPrJgal3yWF6fmsMOUo8FOB/uW
	h0sDAYkKEipoIYXrFjtpwyelMUHxWAztiUPOaR/8MK0sE3t7X7MV2yqnxiNAih2Gs+kWviQ0qlbdt
	rrurzJC4Xqydp/refVZ8YV6Tamvld8+FmtAfQYMG5AqE6czeiLSrpNm13qLrrWpPzUoFPCbYu2Maf
	CBv/Ggf9E2vVgYx6wv7pHoyWcQY9PosAic370kzyOxTJ7KRh+Du4MHQOM+Ipi71VXvEVKe8ZGSskV
	AH+7aAAKwtheG7avIvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vp-0000000AgBf-1NIw;
	Mon, 19 May 2025 21:59:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vi-0000000Ag8w-3owu
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23229fdaff4so22410015ad.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691941; x=1748296741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNQGjVkW+RmunsOiSptNEAeOKmaBV2SY38pDAyHeUKE=;
        b=befrK3ctdJ7JCkQ9CSIImHTWRbc8Ft6Qar79yy3598djsqV4woJ49vL+MrqDUuAwun
         o6J6iIt7MUYYorgdmLlgbKcwR0pkZP7oz9QpW6uegUGPJqYk55bumx5HH8+4zaVr+elV
         4XXkokE7T78KFCfLKGE6B1kz8k+pDHEnD0/+JRTLPGi/r2JXxJwSgysep9Uu5NRjtVel
         BuIVzbgmm7WUFy4b2aVEqfH0EmJRPUDs/qwrfvE6p/yamLzNOOEhwlz1nTsCQVPOtdvf
         Fb/xTuU58xvq3Fx1prZgmTwXLUXw30/DxXY7JRjU497JG4Do50a1WFxOiO3Zh35eI/hl
         2KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691941; x=1748296741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNQGjVkW+RmunsOiSptNEAeOKmaBV2SY38pDAyHeUKE=;
        b=K+RCAuBYUPtfY8OTGacBNwCaYAdBWOvGmieOD8ocEFJx/6mOA1LRQ2lGVZlsHz4onD
         YUNFo/EQbpS8IRysYwXcm7J2kujZ5MzZyXH+3kwl0K2Gd7EftVWdxglzV+bCPhvnUFBP
         PT9NakKUj+/cMPO2D8iYlvY3+zZwVZ56E4kl9Q9nzXivSaijKBQrw2XpKHC29+bcCv9Y
         ApAR8CZJNh72A1/wchBSdIZy5nsIECV2FTVd4h0E0H2wD8QvT0BsiTnmiT8CTjnF0Tyx
         cKZ59OhXHLf5MgusTR/wxtXux0CVu4y+sQzWt4sfjbAz3sSDFmPchmEOgBZFQYWbRCM0
         7fUw==
X-Gm-Message-State: AOJu0YwKLOt+gUXyGj9oTsYMDoWDdzFtvNj0e12ZK1CKh6Ym9HLdfdiC
	6XmLbNQjNM92mVU7izl06SS1Atzie9cfj9AGpW87voE7q3LvkAGrYMhqlGk6Ca8K
X-Gm-Gg: ASbGncvYbOBP7wEx2hq2H/RCtB+9KeutPWJXWaz5FNkL0wHNzW1t0iGsm+7bUBdTX6+
	+WgJJcAD8QGOGubVdgblhmaWgZzhb2gKR6R7Gi94vdaOBN+fiS8C9dqduL/xb0FW06/R2lnUP/7
	9DLrD4U8qUSe1h0MFLIL2zFYnYkkhoujnxiVBNYrps/I2UZTOK74qkKMZKG/1SMnVgzSkMF+Fd7
	MSJd3WthY0wQ+FGE8sT67P2s1KYCx7iSNo+Geiun1Cqlx2ubqxFSTq9hctJ1ctfFYbylcFD9I59
	k7XbbireUgSq0E3LsWzGzHYqw5wCyn9lJ6C37iGtdn9rtIOGLYA5ifgd94fKH3HJvg==
X-Google-Smtp-Source: AGHT+IGfnQpYwkBcdU0MUNgVc7vGtpi7+GzRc/fqV2PDl3W91JAtnhecijFG7GAoZJQlfsfPACompA==
X-Received: by 2002:a17:903:f8d:b0:224:f12:3734 with SMTP id d9443c01a7336-231d43d36ffmr179855515ad.30.1747691941506;
        Mon, 19 May 2025 14:59:01 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:59:00 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v5 02/10] platform: generic: mips: add header files
Date: Mon, 19 May 2025 14:58:39 -0700
Message-ID: <20250519215848.27569-3-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145902_961066_00BDAB20 
X-CRM114-Status: GOOD (  15.87  )
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

Add header files to define MIPS Custom CSRs and define for the board.
Add accessor functions for MIPS CM registers.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/include/mips/board.h   |  33 +++++++
 platform/generic/include/mips/mips-cm.h |  88 ++++++++++++++++++
 platform/generic/include/mips/p8700.h   | 113 ++++++++++++++++++++++++
 3 files changed, 234 insertions(+)
 create mode 100644 platform/generic/include/mips/board.h
 create mode 100644 platform/generic/include/mips/mips-cm.h
 create mode 100644 platform/generic/include/mips/p8700.h

diff --git a/platform/generic/include/mips/board.h b/platform/generic/include/mips/board.h
new file mode 100644
index 0000000..6fe7b8b
--- /dev/null
+++ b/platform/generic/include/mips/board.h
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#ifndef __BOARD_H__
+#define __BOARD_H__
+
+/* Please review all defines to change for your board. */
+
+/* Use in stw.S, p8700.c, p8700.h, mips-cm.h */
+#define CM_BASE			0x16100000
+
+/* Use in mips-cm.h, p8700.c */
+#define CLUSTERS_IN_PLATFORM	1
+#if CLUSTERS_IN_PLATFORM > 1
+/* Define global CM bases for cluster 0, 1, 2, and more. */
+#define GLOBAL_CM_BASE0		0
+#define GLOBAL_CM_BASE1		0
+#define GLOBAL_CM_BASE2		0
+#endif
+
+/* Use in stw.S */
+#define TIMER_ADDR		(CM_BASE + 0x8050)
+
+/* Use in cps-vec.S */
+#define DRAM_ADDRESS		0x80000000
+#define DRAM_SIZE		0x80000000
+#define DRAM_PMP_ADDR		((DRAM_ADDRESS >> 2) | ((DRAM_SIZE - 1) >> 3))
+
+#endif
diff --git a/platform/generic/include/mips/mips-cm.h b/platform/generic/include/mips/mips-cm.h
new file mode 100644
index 0000000..19b4384
--- /dev/null
+++ b/platform/generic/include/mips/mips-cm.h
@@ -0,0 +1,88 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#ifndef __MIPS_CM_H__
+#define __MIPS_CM_H__
+
+#include <mips/p8700.h>
+#include <sbi/sbi_console.h>
+
+/* Define 1 to print out CM read and write info */
+#define DEBUG_CM 0
+
+#if CLUSTERS_IN_PLATFORM > 1
+static long GLOBAL_CM_BASE[CLUSTERS_IN_PLATFORM] = {GLOBAL_CM_BASE0, GLOBAL_CM_BASE1, GLOBAL_CM_BASE2};
+#else
+static long GLOBAL_CM_BASE[CLUSTERS_IN_PLATFORM] = {CM_BASE};
+#endif
+
+#define CPS_ACCESSOR_R(unit, sz, base, off, name)			\
+static inline u##sz read_##unit##_##name(u32 hartid, bool local_p)	\
+{									\
+	u##sz value;							\
+	long cmd_reg;							\
+	int cl, co;							\
+	cl = cpu_cluster(hartid);					\
+	co = cpu_core(hartid);						\
+	cmd_reg = (local_p ? (base) : ((base) - CM_BASE + GLOBAL_CM_BASE[cl]))	\
+		  + (co << CM_BASE_CORE_SHIFT)				\
+		  + off;						\
+	if (DEBUG_CM)							\
+		sbi_printf("CM READ%d cmd_reg=%lx\n", sz, cmd_reg);	\
+	if (sz == 32)							\
+		asm volatile("lw %0,0(%1)":"=r"(value):"r"(cmd_reg));	\
+	else if (sz == 64)						\
+		asm volatile("ld %0,0(%1)":"=r"(value):"r"(cmd_reg));	\
+	asm volatile("fence");						\
+	return value;							\
+}
+
+#define CPS_ACCESSOR_W(unit, sz, base, off, name)			\
+static inline void write_##unit##_##name(u32 hartid, u##sz value, bool local_p)	\
+{									\
+	long cmd_reg;							\
+	int cl, co;							\
+	cl = cpu_cluster(hartid);					\
+	co = cpu_core(hartid);						\
+	cmd_reg = (local_p ? (base) : ((base) - CM_BASE +  GLOBAL_CM_BASE[cl]))	\
+		  + (co << CM_BASE_CORE_SHIFT)				\
+		  + off;						\
+	if (DEBUG_CM)							\
+		sbi_printf("CM WRITE%d cmd_reg=%lx value=%lx\n", sz, 	\
+			    cmd_reg, (u64)value);			\
+	if (sz == 32)							\
+		asm volatile("sw %0,0(%1)"::"r"(value),"r"(cmd_reg));	\
+	else if (sz == 64)						\
+		asm volatile("sd %0,0(%1)"::"r"(value),"r"(cmd_reg));	\
+	asm volatile("fence");						\
+}
+
+#define CPS_ACCESSOR_RW(unit, sz, base, off, name)			\
+	CPS_ACCESSOR_R(unit, sz, base, off, name)			\
+	CPS_ACCESSOR_W(unit, sz, base, off, name)
+
+#define CPC_CX_ACCESSOR_RW(sz, off, name)				\
+	CPS_ACCESSOR_RW(cpc, sz, CPC_BASE, CPC_OFF_LOCAL + (off), co_##name)
+
+#define GCR_CX_ACCESSOR_RW(sz, off, name)				\
+	CPS_ACCESSOR_RW(gcr, sz, CM_BASE, GCR_OFF_LOCAL + (off), co_##name)
+
+GCR_CX_ACCESSOR_RW(64, cpu_hart(hartid) << CM_BASE_HART_SHIFT, reset_base)
+GCR_CX_ACCESSOR_RW(32, GCR_CORE_COH_EN, coherence)
+
+CPC_CX_ACCESSOR_RW(32, CPC_Cx_VP_RUN, vp_run)
+CPC_CX_ACCESSOR_RW(32, CPC_Cx_VP_STOP, vp_stop)
+CPC_CX_ACCESSOR_RW(32, CPC_Cx_CMD, cmd)
+CPC_CX_ACCESSOR_RW(32, CPC_Cx_STAT_CONF, stat_conf)
+
+#define CPC_ACCESSOR_RW(sz, off, name)					\
+	CPS_ACCESSOR_RW(cpc, sz, CPC_BASE, off, name)
+
+CPC_ACCESSOR_RW(32, CPC_PWRUP_CTL, pwrup_ctl)
+CPC_ACCESSOR_RW(32, CPC_CM_STAT_CONF, cm_stat_conf)
+
+#endif
diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
new file mode 100644
index 0000000..b02aaed
--- /dev/null
+++ b/platform/generic/include/mips/p8700.h
@@ -0,0 +1,113 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#ifndef __P8700_H__
+#define __P8700_H__
+
+#include <mips/board.h>
+
+/* PMA */
+#define CSR_MIPSPMACFG0	0x7e0
+#define CSR_MIPSPMACFG1	0x7e1
+#define CSR_MIPSPMACFG2	0x7e2
+#define CSR_MIPSPMACFG3	0x7e3
+#define CSR_MIPSPMACFG4	0x7e4
+#define CSR_MIPSPMACFG5	0x7e5
+#define CSR_MIPSPMACFG6	0x7e6
+#define CSR_MIPSPMACFG7	0x7e7
+#define CSR_MIPSPMACFG8	0x7e8
+#define CSR_MIPSPMACFG9	0x7e9
+#define CSR_MIPSPMACFG10	0x7ea
+#define CSR_MIPSPMACFG11	0x7eb
+#define CSR_MIPSPMACFG12	0x7ec
+#define CSR_MIPSPMACFG13	0x7ed
+#define CSR_MIPSPMACFG14	0x7ee
+#define CSR_MIPSPMACFG15	0x7ef
+
+/* MIPS CCA */
+#define CCA_CACHE_ENABLE	0
+#define CCA_CACHE_DISABLE	2
+#define PMA_SPECULATION		(1 << 3)
+
+/* MIPS CSR */
+#define CSR_MIPSTVEC		0x7c0
+#define CSR_MIPSCONFIG0		0x7d0
+#define CSR_MIPSCONFIG1		0x7d1
+#define CSR_MIPSCONFIG2		0x7d2
+#define CSR_MIPSCONFIG3		0x7d3
+#define CSR_MIPSCONFIG4		0x7d4
+#define CSR_MIPSCONFIG5		0x7d5
+#define CSR_MIPSCONFIG6		0x7d6
+#define CSR_MIPSCONFIG7		0x7d7
+#define CSR_MIPSCONFIG8		0x7d8
+#define CSR_MIPSCONFIG9		0x7d9
+#define CSR_MIPSCONFIG10	0x7da
+#define CSR_MIPSCONFIG11	0x7db
+
+#define MIPSCONFIG5_MTW		4
+
+#define GEN_MASK(h, l)	(((1ul << ((h) + 1 - (l))) - 1) << (l))
+#define EXT(val, mask)	(((val) & (mask)) >> (__builtin_ffs(mask) - 1))
+
+/*
+ * We allocate the number of bits to encode clusters, cores, and harts
+ * from the original mhartid to a new dense index.
+ */
+#define NUM_OF_BITS_FOR_CLUSTERS	4
+#define NUM_OF_BITS_FOR_CORES		12
+#define NUM_OF_BITS_FOR_HARTS		4
+
+/* To get the field from new/hashed mhartid */
+#define NEW_CLUSTER_SHIFT	(NUM_OF_BITS_FOR_CORES + NUM_OF_BITS_FOR_HARTS)
+#define NEW_CLUSTER_MASK	((1 << NUM_OF_BITS_FOR_CLUSTERS) - 1)
+#define NEW_CORE_SHIFT		NUM_OF_BITS_FOR_HARTS
+#define NEW_CORE_MASK		((1 << NUM_OF_BITS_FOR_CORES) - 1)
+#define NEW_HART_MASK		((1 << NUM_OF_BITS_FOR_HARTS) - 1)
+#define cpu_cluster(i)		(((i) >> NEW_CLUSTER_SHIFT) & NEW_CLUSTER_MASK)
+#define cpu_core(i)		(((i) >> NEW_CORE_SHIFT) & NEW_CORE_MASK)
+#define cpu_hart(i)		((i) & NEW_HART_MASK)
+
+#define CPC_BASE		(CM_BASE + 0x8000)
+
+#define SIZE_FOR_CPC_MTIME	0x10000	/* The size must be 2^order */
+#define AIA_BASE		(CM_BASE + 0x40000)
+#define SIZE_FOR_AIA_M_MODE	0x20000	/* The size must be 2^order */
+#define P8700_ALIGN		0x10000
+
+#define CM_BASE_HART_SHIFT	3
+#define CM_BASE_CORE_SHIFT	8
+#define CM_BASE_CLUSTER_SHIFT	19
+
+/* GCR Block offsets */
+#define GCR_OFF_LOCAL		0x2000
+
+#define GCR_BASE_OFFSET		0x0008
+#define GCR_CORE_COH_EN		0x00f8
+#define GCR_CORE_COH_EN_EN	(0x1 << 0)
+
+#define L2_PFT_CONTROL_OFFSET	0x0300
+#define L2_PFT_CONTROL_B_OFFSET	0x0308
+
+/* CPC Block offsets */
+#define CPC_PWRUP_CTL		0x0030
+#define CPC_CM_STAT_CONF	0x1008
+
+#define CPC_OFF_LOCAL		0x2000
+
+#define CPC_Cx_VP_STOP		0x0020
+#define CPC_Cx_VP_RUN		0x0028
+#define CPC_Cx_CMD		0x0000
+
+#define CPC_Cx_CMD_PWRUP	0x3
+#define CPC_Cx_CMD_RESET	0x4
+
+#define CPC_Cx_STAT_CONF	0x0008
+#define CPC_Cx_STAT_CONF_SEQ_STATE	GEN_MASK(22, 19)
+#define CPC_Cx_STAT_CONF_SEQ_STATE_U5	6
+#define CPC_Cx_STAT_CONF_SEQ_STATE_U6	7
+
+#endif
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
