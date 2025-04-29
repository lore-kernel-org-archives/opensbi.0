Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A55BC3ABA5
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 00:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvtzQJbRWlkvdJ4x1YJJX9/9C3siRAEXVNlwC4aNErU=; b=vqTd3i0W0ZfA7/
	vVpjWFDlNGLCG5of31miKB+jmhoiZj7FoYWzcpFGa45o4fLln4ekTlhysHUwpZfXMqFaEw3+HGpy4
	vmi6hS2UoKSeaPxDRw9Df0DHRXf9Enf33QvZak9vz9+jRtDqEWZuS8tiOVOGYWacTTQ4axwhXblGZ
	0/yV/PW/rQ3aM8UcACoLuqsU38eYxASXWWfT/fS2TqtMIktibqBuUpFMYLSUFAhjFGS08vTqnq9eO
	2JDMBLeY2vxvatIQfiQhN6MQknwpdGrQLqrvEDsK8CngHgfCgcedLpdrNxhl3MEYUSzPk72jEkP8H
	fWtgAmcD5fiCAcUHuQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyr-0000000BDj1-3W1Z;
	Wed, 30 Apr 2025 00:07:17 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyk-0000000BDeL-1XIm
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 00:07:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3085f827538so9056553a91.0
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 17:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745971628; x=1746576428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzTcaUPgXXHlKHrNNozTR2HlHwbJtQXpDvNSDLEOvqM=;
        b=MSpAKXEQfDb/9KuHYSgirbvHwFUr7iae4udUHrt4x5rT61s8JdTiWluKlMl4eb3S5F
         cb0dr+zinNB58WONbLUNk0Dw2RV178t6hI67Bi73Cn4NU5pPBdnEpI1fsMxA1lF5km0H
         xuWKK6ia61QqGr4jIncYaCoPt2jF0qb4otVgqIMiHuA4sjtIALxhn6meFHPoVWyB4hCy
         +aRTlormIr09KTFIvL52KvA+IpaQ5kSwJa3wX3c01N+1qs94OYkbDrp1hiCEDzBgNMaw
         vt1thKMr57+l2oJyyRCLfZ2HOlH9agRJ4uSVUHaWLhtrLm0fQdUxZ5M0fkMPdloBV5zw
         ZUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971628; x=1746576428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzTcaUPgXXHlKHrNNozTR2HlHwbJtQXpDvNSDLEOvqM=;
        b=YZIBf3D46K2pPQjQ2TCZqnWYB4rMocDwlrDS6FCVsxxIHcA+/X1XiEpJP3vlnonpXn
         sdclqrc2kXkr/caWDHEg0/qlfzFhMiETb9KChYy6byiz+YPZ1N5OExieg+VhIYs5Dzqa
         695P6C6AdwWZ+VSgHVWSe3PzyuHey0k3VJkcoyfOrCQFpS1eS85HGwejUVGCzdpbhsN2
         WQq6bkkdw9FOfQW7RPyLZmQ8jGxDBpIYxQsZTpXSE7toRpEmA4wBPGc7FYtVVdQzCX7B
         HoqX/EbsDKohQjFEnP120zYrIp0MACUE7YLF1m1xq9cTw/jC2E7IEN8MBeUGcstK1K3w
         J47A==
X-Gm-Message-State: AOJu0Yww7nneDliaPKDjLdF77hySJSWet5Li5DUhFfzNFCdzWTKT1OAW
	SbHcETc3MQLZevY4xn6/Pc8/oFyy0JGj1NvjuglAUjtv7fdOiAfm04tneA==
X-Gm-Gg: ASbGncsWPzp3nvpMHpQp4OXfRp3PYr3sYTKIefLSHcSbSzC2oWh6VEAwIq/DQ3CFBi5
	l4JTQpBBkMoNNkLjlYRN3cYFACU5SWorkFH7h/oTRaqoc/f4C6uE87gRTUYnILLzwTB8nQAENIR
	KbjxaOY+hnzqBbAY87FysFBMYL3F5LAXk24Xow4udLIFI7QmXqP0ik+kvHtb+TLfHcWKrDOw1z5
	yysiU/uqxv3lCOqcRF9wy4fxcqElmWTo8dU72tJpZA5h+URINWN7Fy+qOsa/Zui0H69RxEMQfyE
	0UkmBvj2j7gC1xGd+LLrvk3avf8YuygL5HmxP4RxHTv7AYbjH8eQJlW/OK6H4404
X-Google-Smtp-Source: AGHT+IECw/1xtEa8Eh1foHSg7m4q4cWW7rqnCskRFL9L8nGNtwqd7cT4NcZgQLf3+T6BkmQdC/FHUw==
X-Received: by 2002:a17:90b:2d8e:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-30a3441ea7fmr1077715a91.17.1745971628277;
        Tue, 29 Apr 2025 17:07:08 -0700 (PDT)
Received: from localhost.localdomain ([50.247.98.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b08sm108953815ad.114.2025.04.29.17.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:07:07 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v4 2/8] platform: generic: mips: add header files
Date: Tue, 29 Apr 2025 16:29:22 -0700
Message-ID: <20250429232928.6499-3-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_170710_405169_9EF47DF3 
X-CRM114-Status: GOOD (  15.79  )
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
 platform/generic/include/mips/mips-cm.h |  88 +++++++++++++++++
 platform/generic/include/mips/p8700.h   | 122 ++++++++++++++++++++++++
 3 files changed, 243 insertions(+)
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
index 0000000..6aa71d9
--- /dev/null
+++ b/platform/generic/include/mips/p8700.h
@@ -0,0 +1,122 @@
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
+/* mhartid field info */
+#define MHARTID_CORE_MASK	0xff
+#define MHARTID_CORE_SHIFT	4
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
+#define INDEXED(op, reg, idx, offset, base)	\
+	li	idx, offset	;\
+	add	idx, idx, base	;\
+	op	reg, (idx)
+
+#endif
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
