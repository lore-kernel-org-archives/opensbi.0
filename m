From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Wed, 27 Mar 2024 11:11:30 +0100
Subject: [PATCH 2/9] platform: generic: Add mechanism to handle CSR reads/writes in overrides
In-Reply-To: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
Message-ID: <20240327101137.3644359-3-christoph.muellner@vrull.eu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Overrides may want to provide access to custom CSRs.
Let's add a layer that allows platform overrides to implement CSR read/write
handlers, where custom CSRs can be accessed.
This utilizes the corresponding platform hooks to access CSRs.

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
---
 platform/generic/include/platform_override.h |  4 ++++
 platform/generic/platform.c                  | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index b0585c2..6802126 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -34,6 +34,10 @@ struct platform_override {
 				   struct sbi_trap_regs *regs,
 				   struct sbi_ecall_return *out,
 				   const struct fdt_match *match);
+	int (*read_csr)(int csr_num, struct sbi_trap_regs *regs,
+			ulong *csr_val);
+	int (*write_csr)(int csr_num, struct sbi_trap_regs *regs,
+			 ulong csr_val);
 };
 
 #endif
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1f46b76..07fa9cc 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -273,6 +273,24 @@ static int generic_vendor_ext_provider(long funcid,
 						 generic_plat_match);
 }
 
+static int generic_read_csr(int csr_num, struct sbi_trap_regs *regs,
+			    ulong *csr_val)
+{
+	if (generic_plat && generic_plat->read_csr)
+		return generic_plat->read_csr(csr_num, regs, csr_val);
+
+	return SBI_ENOTSUPP;
+}
+
+static int generic_write_csr(int csr_num, struct sbi_trap_regs *regs,
+			     ulong csr_val)
+{
+	if (generic_plat && generic_plat->write_csr)
+		return generic_plat->write_csr(csr_num, regs, csr_val);
+
+	return SBI_ENOTSUPP;
+}
+
 static void generic_early_exit(void)
 {
 	if (generic_plat && generic_plat->early_exit)
@@ -408,6 +426,8 @@ const struct sbi_platform_operations platform_ops = {
 	.timer_exit		= fdt_timer_exit,
 	.vendor_ext_check	= generic_vendor_ext_check,
 	.vendor_ext_provider	= generic_vendor_ext_provider,
+	.read_csr		= generic_read_csr,
+	.write_csr		= generic_write_csr,
 };
 
 struct sbi_platform platform = {
-- 
2.44.0


