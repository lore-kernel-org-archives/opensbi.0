From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 22 Nov 2023 15:36:13 +0800
Subject: [PATCH v3 11/15] platform: andes: Factor out is_andes() helper
In-Reply-To: <20231122073617.379441-1-peterlin@andestech.com>
References: <20231122073617.379441-1-peterlin@andestech.com>
Message-ID: <20231122073617.379441-12-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We will need is_andes(45) in the following patch,
so factor out the code that parses marchid to make
it reusable for checking any Andes CPU variants.

Also improves the comment in ae350_hart_start().

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes v1 -> v2:
  - New patch
Changes v2 -> v3:
  - Include Anup's RB tag
---
 platform/generic/andes/ae350.c           | 16 +++++++---------
 platform/generic/include/andes/andes45.h |  6 ++++++
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index dc769b7..088ec07 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -24,16 +24,14 @@ static struct smu_data smu = { 0 };
 extern void __ae350_enable_coherency_warmboot(void);
 extern void __ae350_disable_coherency(void);
 
-static __always_inline bool is_andes25(void)
-{
-	ulong marchid = csr_read(CSR_MARCHID);
-	return !!(EXTRACT_FIELD(marchid, CSR_MARCHID_MICROID) == 0xa25);
-}
-
 static int ae350_hart_start(u32 hartid, ulong saddr)
 {
-	/* Don't send wakeup command at boot-time */
-	if (!sbi_init_count(hartid) || (is_andes25() && hartid == 0))
+	/*
+	 * Don't send wakeup command when:
+	 * 1) boot-time
+	 * 2) the target hart is non-sleepable 25-series hart0
+	 */
+	if (!sbi_init_count(hartid) || (is_andes(25) && hartid == 0))
 		return sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid));
 
 	/* Write wakeup command to the sleep hart */
@@ -52,7 +50,7 @@ static int ae350_hart_stop(void)
 	 * L2-cache, instead of turning it off, it should fall
 	 * through and jump to warmboot_addr.
 	 */
-	if (is_andes25() && hartid == 0)
+	if (is_andes(25) && hartid == 0)
 		return SBI_ENOTSUPP;
 
 	if (!smu_support_sleep_mode(&smu, DEEPSLEEP_MODE, hartid))
diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes45.h
index ce31617..01f63d4 100644
--- a/platform/generic/include/andes/andes45.h
+++ b/platform/generic/include/andes/andes45.h
@@ -43,6 +43,12 @@
 
 #ifndef __ASSEMBLER__
 
+#define is_andes(series)				\
+({							\
+	char value = csr_read(CSR_MARCHID) & 0xff;	\
+	(series) == (value >> 4) * 10 + (value & 0x0f);	\
+})
+
 #define has_andes_pmu()					\
 ({							\
 	(((csr_read(CSR_MMSC_CFG) &			\
-- 
2.34.1


