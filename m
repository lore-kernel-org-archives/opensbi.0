From: Sunil V L <sunilvl@ventanamicro.com>
Date: Tue, 21 Mar 2023 09:50:51 +0530
Subject: [RFC PATCH v1 1/4] include: Add defines for SBI CPPC extension
In-Reply-To: <20230321042054.579520-1-sunilvl@ventanamicro.com>
References: <20230321042054.579520-1-sunilvl@ventanamicro.com>
Message-ID: <20230321042054.579520-2-sunilvl@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add SBI CPPC extension related defines to the
SBI ecall interface header.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/sbi/sbi_ecall_interface.h | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 4597358..3b0f3ab 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -31,6 +31,7 @@
 #define SBI_EXT_PMU				0x504D55
 #define SBI_EXT_DBCN				0x4442434E
 #define SBI_EXT_SUSP				0x53555350
+#define SBI_EXT_CPPC				0x43505043
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -256,6 +257,39 @@ enum sbi_pmu_ctr_type {
 #define SBI_SUSP_SLEEP_TYPE_LAST		SBI_SUSP_SLEEP_TYPE_SUSPEND
 #define SBI_SUSP_PLATFORM_SLEEP_START		0x80000000
 
+/* SBI function IDs for CPPC extension */
+#define SBI_EXT_CPPC_PROBE			0x0
+#define SBI_EXT_CPPC_READ			0x1
+#define SBI_EXT_CPPC_READ_HI			0x2
+#define SBI_EXT_CPPC_WRITE			0x3
+
+enum sbi_cppc_reg_id {
+	SBI_CPPC_HIGHEST_PERF		= 0x00000000,
+	SBI_CPPC_NOMINAL_PERF		= 0x00000001,
+	SBI_CPPC_LOW_NON_LINEAR_PERF	= 0x00000002,
+	SBI_CPPC_LOWEST_PERF		= 0x00000003,
+	SBI_CPPC_GUARANTEED_PERF	= 0x00000004,
+	SBI_CPPC_DESIRED_PERF		= 0x00000005,
+	SBI_CPPC_MIN_PERF		= 0x00000006,
+	SBI_CPPC_MAX_PERF		= 0x00000007,
+	SBI_CPPC_PERF_REDUC_TOLERANCE	= 0x00000008,
+	SBI_CPPC_TIME_WINDOW		= 0x00000009,
+	SBI_CPPC_CTR_WRAP_TIME		= 0x0000000A,
+	SBI_CPPC_REFERENCE_CTR		= 0x0000000B,
+	SBI_CPPC_DELIVERED_CTR		= 0x0000000C,
+	SBI_CPPC_PERF_LIMITED		= 0x0000000D,
+	SBI_CPPC_ENABLE			= 0x0000000E,
+	SBI_CPPC_AUTO_SEL_ENABLE	= 0x0000000F,
+	SBI_CPPC_AUTO_ACT_WINDOW	= 0x00000010,
+	SBI_CPPC_ENERGY_PERF		= 0x00000011,
+	SBI_CPPC_REFERENCE_PERF		= 0x00000012,
+	SBI_CPPC_LOWEST_FREQ		= 0x00000013,
+	SBI_CPPC_NOMINAL_FREQ		= 0x00000014,
+	SBI_CPPC_ACPI_LAST		= SBI_CPPC_NOMINAL_FREQ,
+	SBI_CPPC_TRANSITION_LATENCY	= 0x80000000,
+	SBI_CPPC_NON_ACPI_LAST		= SBI_CPPC_TRANSITION_LATENCY,
+};
+
 /* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
-- 
2.34.1


