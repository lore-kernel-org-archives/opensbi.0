From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 10 Dec 2024 18:05:52 +0100
Subject: [PATCH v2 4/4] lib: sbi: pmu: add an sse .is_supported_cb callback implementation
In-Reply-To: <20241210170553.1034872-1-cleger@rivosinc.com>
References: <20241210170553.1034872-1-cleger@rivosinc.com>
Message-ID: <20241210170553.1034872-5-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since the PMU overflow event can only be generated if a PMU overflow irq
is implemented, add a pmu_sse_is_supported() function to check for the
PMU irq presence.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 6f192440..46dbcc9a 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1110,7 +1110,16 @@ static void pmu_sse_complete(uint32_t event_id)
 	csr_set(CSR_MIE, MIP_LCOFIP);
 }
 
+static bool pmu_sse_is_supported(uint32_t event_id)
+{
+	if (!sbi_pmu_irq_bit())
+		return false;
+
+	return true;
+}
+
 static const struct sbi_sse_cb_ops pmu_sse_cb_ops = {
+	.is_supported_cb = pmu_sse_is_supported,
 	.enable_cb = pmu_sse_enable,
 	.disable_cb = pmu_sse_disable,
 	.complete_cb = pmu_sse_complete,
-- 
2.45.2


