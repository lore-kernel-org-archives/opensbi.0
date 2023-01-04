From: Anup Patel <apatel@ventanamicro.com>
Date: Wed,  4 Jan 2023 20:20:00 +0530
Subject: [PATCH v4 1/7] include: Add defines for SBI debug console extension
In-Reply-To: <20230104145006.947830-1-apatel@ventanamicro.com>
References: <20230104145006.947830-1-apatel@ventanamicro.com>
Message-ID: <20230104145006.947830-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add SBI debug console extension related defines/enum to the
SBI ecall interface header.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_ecall_interface.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index a3f2bf4..224a3e2 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -29,6 +29,7 @@
 #define SBI_EXT_HSM				0x48534D
 #define SBI_EXT_SRST				0x53525354
 #define SBI_EXT_PMU				0x504D55
+#define SBI_EXT_DBCN				0x4442434E
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -230,6 +231,10 @@ enum sbi_pmu_ctr_type {
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
 
+/* SBI function IDs for DBCN extension */
+#define SBI_EXT_DBCN_CONSOLE_WRITE		0x0
+#define SBI_EXT_DBCN_CONSOLE_READ		0x1
+
 /* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
-- 
2.34.1


