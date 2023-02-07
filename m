From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Tue,  7 Feb 2023 22:23:26 +0530
Subject: [PATCH 3/3] lib: sbi_pmu: Reserve space for implementation specific firmware events
In-Reply-To: <20230207165326.3205728-1-mchitale@ventanamicro.com>
References: <20230207165326.3205728-1-mchitale@ventanamicro.com>
Message-ID: <20230207165326.3205728-4-mchitale@ventanamicro.com>
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
---
 include/sbi/sbi_ecall_interface.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index f5d6667..32923a8 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -182,7 +182,11 @@ enum sbi_pmu_fw_event_code_id {
 	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
 	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
 	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
-	SBI_PMU_FW_MAX,
+	/*
+	 * Event codes from 22 to 127 are reserved for
+	 * SBI implementation specific custom firmware events.
+	 */
+	SBI_PMU_FW_MAX = 128,
 };
 
 /** SBI PMU event idx type */
-- 
2.34.1


