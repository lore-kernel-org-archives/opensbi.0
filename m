From: Bo Gan <ganboing@gmail.com>
Date: Tue,  5 Mar 2024 18:35:39 -0800
Subject: [PATCH v4 6/7] include: sbi: add emulate_load/store handler to platform ops
In-Reply-To: <1709692540-77803-1-git-send-email-ganboing@gmail.com>
References: <1709692540-77803-1-git-send-email-ganboing@gmail.com>
Message-ID: <1709692540-77803-7-git-send-email-ganboing@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch allows the platform to define load/store emulators. This
enables a platform to trap-and-emulate special devices or filter
access to existing physical devices.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_platform.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 2fb33e1..f962aa4 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -53,6 +53,7 @@ struct sbi_domain_memregion;
 struct sbi_ecall_return;
 struct sbi_trap_regs;
 struct sbi_hart_features;
+union sbi_ldst_data;
 
 /** Possible feature flags of a platform */
 enum sbi_platform_features {
@@ -139,6 +140,13 @@ struct sbi_platform_operations {
 	int (*vendor_ext_provider)(long funcid,
 				   struct sbi_trap_regs *regs,
 				   struct sbi_ecall_return *out);
+
+	/** platform specific handler to fixup load fault */
+	int (*emulate_load)(int rlen, unsigned long addr,
+			    union sbi_ldst_data *out_val);
+	/** platform specific handler to fixup store fault */
+	int (*emulate_store)(int wlen, unsigned long addr,
+			     union sbi_ldst_data in_val);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
-- 
2.7.4


