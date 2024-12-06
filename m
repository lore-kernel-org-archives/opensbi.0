From: Clément Léger <cleger@rivosinc.com>
Date: Fri,  6 Dec 2024 21:59:57 +0100
Subject: [PATCH 3/3] lib: sbi: pmu: Set a SSE register_cb() for event availability
In-Reply-To: <20241206205958.1055770-1-cleger@rivosinc.com>
References: <20241206205958.1055770-1-cleger@rivosinc.com>
Message-ID: <20241206205958.1055770-4-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since the SSE event can work only when the LCOFIP interrupt is available,
check for the Sscofpmf extension to be available in the SSE register
callback.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 0696ab5e..0851abad 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1110,7 +1110,18 @@ static void pmu_sse_complete(uint32_t event_id)
 	csr_set(CSR_MIE, MIP_LCOFIP);
 }
 
+static int pmu_sse_register(uint32_t event_id)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+		return SBI_ERR_FAILED;
+
+	return SBI_SUCCESS;
+}
+
 static const struct sbi_sse_cb_ops pmu_sse_cb_ops = {
+	.register_cb = pmu_sse_register,
 	.enable_cb = pmu_sse_enable,
 	.disable_cb = pmu_sse_disable,
 	.complete_cb = pmu_sse_complete,
-- 
2.45.2


