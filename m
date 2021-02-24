From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 24 Feb 2021 16:02:00 +0530
Subject: [RFC PATCH v2 08/11] include: sbi: Add hart_suspend() platform
 callback
In-Reply-To: <20210224103203.246229-1-anup.patel@wdc.com>
References: <20210224103203.246229-1-anup.patel@wdc.com>
Message-ID: <20210224103203.246229-9-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add hart_suspend() callback in platform operations which will
be used by HSM implementation to enter retentive or non-retentive
suspend state.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_platform.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index cc7e3ff..dadbc1e 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -139,6 +139,11 @@ struct sbi_platform_operations {
 	 * return if success.
 	 */
 	int (*hart_stop)(void);
+	/**
+	 * Put the current hart in platform specific suspend (or low-power)
+	 * state.
+	 */
+	int (*hart_suspend)(u32 suspend_type, ulong raddr);
 
 	/* Check whether reset type and reason supported by the platform */
 	int (*system_reset_check)(u32 reset_type, u32 reset_reason);
@@ -370,6 +375,31 @@ static inline int sbi_platform_hart_stop(const struct sbi_platform *plat)
 	return SBI_ENOTSUPP;
 }
 
+/**
+ * Put the current hart in platform specific suspend (or low-power) state.
+ *
+ * For successful retentive suspend, the call will return 0 when the hart
+ * resumes normal execution.
+ *
+ * For successful non-retentive suspend, the hart will resume from specified
+ * resume address
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param suspend_type the type of suspend
+ * @param raddr physical address where the hart can resume in M-mode after
+ * non-retantive suspend
+ *
+ * @return 0 if successful and negative error code on failure
+ */
+static inline int sbi_platform_hart_suspend(const struct sbi_platform *plat,
+					    u32 suspend_type, ulong raddr)
+{
+	if (plat && sbi_platform_ops(plat)->hart_suspend)
+		return sbi_platform_ops(plat)->hart_suspend(suspend_type,
+							    raddr);
+	return SBI_ENOTSUPP;
+}
+
 /**
  * Early initialization for current HART
  *
-- 
2.25.1


