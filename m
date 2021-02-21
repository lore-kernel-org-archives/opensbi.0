From: Anup Patel <anup.patel@wdc.com>
Date: Sun, 21 Feb 2021 14:23:16 +0530
Subject: [RFC PATCH 05/10] include: sbi: Add HSM suspend related defines
In-Reply-To: <20210221085321.180602-1-anup.patel@wdc.com>
References: <20210221085321.180602-1-anup.patel@wdc.com>
Message-ID: <20210221085321.180602-6-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds SBI HSM suspend related defines to ecall interface
header.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_ecall_interface.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index b272213..7fcb373 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -57,11 +57,28 @@
 #define SBI_EXT_HSM_HART_START			0x0
 #define SBI_EXT_HSM_HART_STOP			0x1
 #define SBI_EXT_HSM_HART_GET_STATUS		0x2
+#define SBI_EXT_HSM_HART_SUSPEND		0x3
 
 #define SBI_HSM_STATE_STARTED			0x0
 #define SBI_HSM_STATE_STOPPED			0x1
 #define SBI_HSM_STATE_START_PENDING		0x2
 #define SBI_HSM_STATE_STOP_PENDING		0x3
+#define SBI_HSM_STATE_SUSPENDED			0x4
+#define SBI_HSM_STATE_SUSPEND_PENDING		0x5
+#define SBI_HSM_STATE_RESUME_PENDING		0x6
+
+#define SBI_HSM_SUSP_BASE_MASK			0x7fffffff
+#define SBI_HSM_SUSP_NON_RET_BIT		0x80000000
+#define SBI_HSM_SUSP_PLAT_BASE			0x10000000
+
+#define SBI_HSM_SUSPEND_RET_DEFAULT		0x00000000
+#define SBI_HSM_SUSPEND_RET_PLATFORM		SBI_HSM_SUSP_PLAT_BASE
+#define SBI_HSM_SUSPEND_RET_LAST		SBI_HSM_SUSP_BASE_MASK
+#define SBI_HSM_SUSPEND_NON_RET_DEFAULT		SBI_HSM_SUSP_NON_RET_BIT
+#define SBI_HSM_SUSPEND_NON_RET_PLATFORM	(SBI_HSM_SUSP_NON_RET_BIT | \
+						 SBI_HSM_SUSP_PLAT_BASE)
+#define SBI_HSM_SUSPEND_NON_RET_LAST		(SBI_HSM_SUSP_NON_RET_BIT | \
+						 SBI_HSM_SUSP_BASE_MASK)
 
 /* SBI function IDs for SRST extension */
 #define SBI_EXT_SRST_RESET			0x0
-- 
2.25.1


