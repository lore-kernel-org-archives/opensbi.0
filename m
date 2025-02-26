From: Chao-ying Fu <icebergfu@gmail.com>
Date: Tue, 25 Feb 2025 16:53:26 -0800
Subject: [PATCH v2 02/11] platform: generic: mips: add header files
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
Message-ID: <20250226005335.19498-2-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add header files to define MIPS Custom CSRs and define for the board.
---
 platform/generic/include/mips/board.h |  33 +++++++
 platform/generic/include/mips/p8700.h | 122 ++++++++++++++++++++++++++
 2 files changed, 155 insertions(+)
 create mode 100644 platform/generic/include/mips/board.h
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


