From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  3 Mar 2021 17:25:12 +0530
Subject: [PATCH v3 11/11] lib: Remove redundant sbi_platform_ipi_clear() calls
In-Reply-To: <20210303115512.470786-1-anup.patel@wdc.com>
References: <20210303115512.470786-1-anup.patel@wdc.com>
Message-ID: <20210303115512.470786-12-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_platform_ipi_clear() called from wait_for_coldboot() and
sbi_hsm_hart_wait() is redundant because IPI will be automatically
cleared by sbi_platform_ipi_init() called from sbi_ipi_init().

Further, wait_for_coldboot() is common for warm startup and warm
resume path so the sbi_platform_ipi_clear() called in warm resume
path cause resuming HART to miss an IPI injected other HART to
wakeup the HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_hsm.c  |  7 ++++---
 lib/sbi/sbi_init.c | 11 ++++++++---
 lib/sbi/sbi_ipi.c  |  5 ++++-
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index ace6a9d..bbc4ce9 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -107,7 +107,6 @@ void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
 static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
 {
 	unsigned long saved_mie;
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 	/* Save MIE CSR */
@@ -124,8 +123,10 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
 	/* Restore MIE CSR */
 	csr_write(CSR_MIE, saved_mie);
 
-	/* Clear current HART IPI */
-	sbi_platform_ipi_clear(plat, hartid);
+	/*
+	 * No need to clear IPI here because the sbi_ipi_init() will
+	 * clear it for current HART via sbi_platform_ipi_init().
+	 */
 }
 
 int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 1d4a838..4de2dfa 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -130,7 +130,6 @@ static unsigned long coldboot_done;
 static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 {
 	unsigned long saved_mie, cmip;
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	/* Save MIE CSR */
 	saved_mie = csr_read(CSR_MIE);
@@ -167,8 +166,14 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	/* Restore MIE CSR */
 	csr_write(CSR_MIE, saved_mie);
 
-	/* Clear current HART IPI */
-	sbi_platform_ipi_clear(plat, hartid);
+	/*
+	 * The wait for coldboot is common for both warm startup and
+	 * warm resume path so clearing IPI here would result in losing
+	 * an IPI in warm resume path.
+	 *
+	 * Also, the sbi_platform_ipi_init() called from sbi_ipi_init()
+	 * will automatically clear IPI for current HART.
+	 */
 }
 
 static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index a3a6ce6..b50735e 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -230,7 +230,10 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
 	ipi_data = sbi_scratch_offset_ptr(scratch, ipi_data_off);
 	ipi_data->ipi_type = 0x00;
 
-	/* Platform init */
+	/*
+	 * Initialize platform IPI support. This will also clear any
+	 * pending IPIs for current/calling HART.
+	 */
 	ret = sbi_platform_ipi_init(sbi_platform_ptr(scratch), cold_boot);
 	if (ret)
 		return ret;
-- 
2.25.1


