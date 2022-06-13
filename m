From: Samuel Holland <samuel@sholland.org>
Date: Sun, 12 Jun 2022 20:03:47 -0500
Subject: [PATCH v3 1/9] lib: sbi_hsm: Call a device hook during hart resume
In-Reply-To: <20220613010355.28014-1-samuel@sholland.org>
References: <20220613010355.28014-1-samuel@sholland.org>
Message-ID: <20220613010355.28014-2-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Non-retentive suspend states may require platform-specific actions
during resume. For example, firmware may need to save and restore the
values of custom CSRs. Add a hook to support this.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 include/sbi/sbi_hsm.h | 8 ++++++++
 lib/sbi/sbi_hsm.c     | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index c16e871..6da8cee 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -37,6 +37,14 @@ struct sbi_hsm_device {
 	 * specified resume address
 	 */
 	int (*hart_suspend)(u32 suspend_type, ulong raddr);
+
+	/**
+	 * Perform platform-specific actions to resume from a suspended state.
+	 *
+	 * This includes restoring any platform state that was lost during
+	 * non-retentive suspend.
+	 */
+	void (*hart_resume)(void);
 };
 
 struct sbi_domain;
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index c4d2c6d..a7b6a80 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -178,6 +178,12 @@ static int hsm_device_hart_suspend(u32 suspend_type, ulong raddr)
 	return SBI_ENOTSUPP;
 }
 
+static void hsm_device_hart_resume(void)
+{
+	if (hsm_dev && hsm_dev->hart_resume)
+		hsm_dev->hart_resume();
+}
+
 int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 {
 	u32 i;
@@ -384,6 +390,8 @@ void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
 			   __func__, oldstate);
 		sbi_hart_hang();
 	}
+
+	hsm_device_hart_resume();
 }
 
 void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch)
-- 
2.35.1


