From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 25 Nov 2020 10:46:43 +0530
Subject: [PATCH v3 1/5] include: sbi: Add SBI SRST extension related defines
In-Reply-To: <20201125051647.295472-1-anup.patel@wdc.com>
References: <20201125051647.295472-1-anup.patel@wdc.com>
Message-ID: <20201125051647.295472-2-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We extend the SBI ecall interface header for the SBI SRST extension
recently accepted in SBI specification v0.3-draft.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_ecall_interface.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index af30500..002c6f9 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -27,6 +27,7 @@
 #define SBI_EXT_IPI				0x735049
 #define SBI_EXT_RFENCE				0x52464E43
 #define SBI_EXT_HSM				0x48534D
+#define SBI_EXT_SRST				0x53525354
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -62,6 +63,17 @@
 #define SBI_HSM_HART_STATUS_START_PENDING	0x2
 #define SBI_HSM_HART_STATUS_STOP_PENDING	0x3
 
+/* SBI function IDs for SRST extension */
+#define SBI_EXT_SRST_RESET			0x0
+
+#define SBI_SRST_RESET_TYPE_SHUTDOWN		0x0
+#define SBI_SRST_RESET_TYPE_COLD_REBOOT	0x1
+#define SBI_SRST_RESET_TYPE_WARM_REBOOT	0x2
+#define SBI_SRST_RESET_TYPE_LAST	SBI_SRST_RESET_TYPE_WARM_REBOOT
+
+#define SBI_SRST_RESET_REASON_NONE	0x0
+#define SBI_SRST_RESET_REASON_SYSFAIL	0x1
+
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
 #define SBI_SPEC_VERSION_MINOR_MASK		0xffffff
-- 
2.25.1


