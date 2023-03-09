From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  9 Mar 2023 11:21:07 +0530
Subject: [PATCH v3 3/8] lib: sbi_pmu: Reserve space for implementation specific firmware events
In-Reply-To: <20230309055112.1516581-1-mchitale@ventanamicro.com>
References: <20230309055112.1516581-1-mchitale@ventanamicro.com>
Message-ID: <20230309055112.1516581-4-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We reserve space for SBI implementation specific custom firmware
events which can be used by M-mode firmwares and HS-mode hypervisors
for their own use. This reserved space is intentionally large to
ensure that SBI implementation has enough space to accommodate
platform specific firmware events as well.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/sbi/sbi_ecall_interface.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index d448212..8d1cb97 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -185,6 +185,17 @@ enum sbi_pmu_fw_event_code_id {
 	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
 	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
 	SBI_PMU_FW_MAX,
+	/*
+	 * Event codes 22 to 255 are reserved for future use.
+	 * Event codes 256 to 65534 are reserved for SBI implementation
+	 * specific custom firmware events.
+	 */
+	SBI_PMU_FW_RESERVED_MAX = 0xFFFE,
+	/*
+	* Event code 0xFFFF is used for platform specific firmware
+	* events where the event data contains any event specific information.
+	*/
+	SBI_PMU_FW_PLATFORM = 0xFFFF,
 };
 
 /** SBI PMU event idx type */
-- 
2.34.1


