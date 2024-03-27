From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Wed, 27 Mar 2024 11:11:29 +0100
Subject: [PATCH 1/9] sbi_platform: Add mechanism to handle CSR reads/writes in platform
In-Reply-To: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
Message-ID: <20240327101137.3644359-2-christoph.muellner@vrull.eu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Platforms may want to provide access to custom CSRs.
Let's add a layer that allows platforms to implement CSR read/write
handlers, where custom CSRs can be accessed.

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
---
 include/sbi/sbi_platform.h | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 581935a..5dbbfea 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -148,6 +148,12 @@ struct sbi_platform_operations {
 	/** platform specific handler to fixup store fault */
 	int (*emulate_store)(int wlen, unsigned long addr,
 			     union sbi_ldst_data in_val);
+	/** Platform-specific handler to read custom CSRs. */
+	int (*read_csr)(int csr_num, struct sbi_trap_regs *regs,
+			 ulong *csr_val);
+	/** Platform-specific handler to write custom CSRs. */
+	int (*write_csr)(int csr_num, struct sbi_trap_regs *regs,
+			  ulong csr_val);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
@@ -728,6 +734,48 @@ static inline int sbi_platform_emulate_store(const struct sbi_platform *plat,
 	return SBI_ENOTSUPP;
 }
 
+/**
+ * Ask platform to read from CSR.
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param csr_num CSR number
+ * @param regs Pointer to register state
+ * @param csr_val Pointer where the read value will be stored
+ *
+ * @return 0 on success and negative error code on failure
+ */
+static inline int sbi_platform_read_csr(const struct sbi_platform *plat,
+					int csr_num,
+					struct sbi_trap_regs *regs,
+					ulong *csr_val)
+{
+	if (plat && sbi_platform_ops(plat)->read_csr)
+		return sbi_platform_ops(plat)->read_csr(csr_num, regs, csr_val);
+
+	return SBI_ENOTSUPP;
+}
+
+/**
+ * Ask platform to write to CSR.
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param csr_num CSR number
+ * @param regs Pointer to register state
+ * @param csr_val Value to write
+ *
+ * @return 0 on success and negative error code on failure
+ */
+static inline int sbi_platform_write_csr(const struct sbi_platform *plat,
+					 int csr_num,
+					 struct sbi_trap_regs *regs,
+					 ulong csr_val)
+{
+	if (plat && sbi_platform_ops(plat)->write_csr)
+		return sbi_platform_ops(plat)->write_csr(csr_num, regs, csr_val);
+
+	return SBI_ENOTSUPP;
+}
+
 #endif
 
 #endif
-- 
2.44.0


