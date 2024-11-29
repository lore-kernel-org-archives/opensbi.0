From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:43 +0530
Subject: [PATCH v2 08/17] lib: sbi: Add optional resume address to hart suspend
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Subrahmanya Lingappa <slingappa@ventanamicro.com>

Add an optional resume address to the platform specific hart suspend call.

Signed-off-by: Subrahmanya Lingappa <slingappa@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hsm.h                  | 6 +++++-
 lib/sbi/sbi_hsm.c                      | 6 +++---
 platform/generic/allwinner/sun20i-d1.c | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index ae098f45..38f90516 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -40,8 +40,12 @@ struct sbi_hsm_device {
 	 *
 	 * For successful non-retentive suspend, the hart will resume from
 	 * the warm boot entry point.
+	 *
+	 * NOTE: mmode_resume_addr(resume address) is optional hence it
+	 * may or may not be honored by the platform. If its not honored
+	 * then platform must ensure to resume from the warmboot address.
 	 */
-	int (*hart_suspend)(u32 suspend_type);
+	int (*hart_suspend)(u32 suspend_type, ulong mmode_resume_addr);
 
 	/**
 	 * Perform platform-specific actions to resume from a suspended state.
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index a3d6947a..cf0eb84b 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -223,10 +223,10 @@ static int hsm_device_hart_stop(void)
 	return SBI_ENOTSUPP;
 }
 
-static int hsm_device_hart_suspend(u32 suspend_type)
+static int hsm_device_hart_suspend(u32 suspend_type, ulong mmode_resume_addr)
 {
 	if (hsm_dev && hsm_dev->hart_suspend)
-		return hsm_dev->hart_suspend(suspend_type);
+		return hsm_dev->hart_suspend(suspend_type, mmode_resume_addr);
 	return SBI_ENOTSUPP;
 }
 
@@ -532,7 +532,7 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
 		__sbi_hsm_suspend_non_ret_save(scratch);
 
 	/* Try platform specific suspend */
-	ret = hsm_device_hart_suspend(suspend_type);
+	ret = hsm_device_hart_suspend(suspend_type, scratch->warmboot_addr);
 	if (ret == SBI_ENOTSUPP) {
 		/* Try generic implementation of default suspend types */
 		if (suspend_type == SBI_HSM_SUSPEND_RET_DEFAULT ||
diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index b65013c2..c31ebdb2 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -130,7 +130,7 @@ static void sun20i_d1_riscv_cfg_init(void)
 	writel_relaxed(entry >> 32, SUN20I_D1_RISCV_CFG_BASE + RESET_ENTRY_HI_REG);
 }
 
-static int sun20i_d1_hart_suspend(u32 suspend_type)
+static int sun20i_d1_hart_suspend(u32 suspend_type, ulong mmode_resume_addr)
 {
 	/* Use the generic code for retentive suspend. */
 	if (!(suspend_type & SBI_HSM_SUSP_NON_RET_BIT))
-- 
2.43.0


