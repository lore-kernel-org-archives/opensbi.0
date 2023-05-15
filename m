From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 May 2023 13:12:37 +0200
Subject: [PATCH v6 4/7] lib: sbi: Only register available extensions
In-Reply-To: <20230515111240.95059-1-ajones@ventanamicro.com>
References: <20230515111240.95059-1-ajones@ventanamicro.com>
Message-ID: <20230515111240.95059-5-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When an extension implements a probe function it means there's a
chance that the extension is not available. Use this function in the
register_extensions callback to determine if the extension should be
registered at all. Where the probe implementation is simple, just
open code the check.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_ecall_cppc.c   |  3 +++
 lib/sbi/sbi_ecall_dbcn.c   |  3 +++
 lib/sbi/sbi_ecall_srst.c   |  6 ++++++
 lib/sbi/sbi_ecall_susp.c   |  6 ++++++
 lib/sbi/sbi_ecall_vendor.c | 17 +++--------------
 5 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/lib/sbi/sbi_ecall_cppc.c b/lib/sbi/sbi_ecall_cppc.c
index 42ec744c22ba..a6398ac78226 100644
--- a/lib/sbi/sbi_ecall_cppc.c
+++ b/lib/sbi/sbi_ecall_cppc.c
@@ -59,6 +59,9 @@ struct sbi_ecall_extension ecall_cppc;
 
 static int sbi_ecall_cppc_register_extensions(void)
 {
+	if (!sbi_cppc_get_device())
+		return 0;
+
 	return sbi_ecall_register_extension(&ecall_cppc);
 }
 
diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index 58b19e4468ef..cbb2e802e615 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -68,6 +68,9 @@ struct sbi_ecall_extension ecall_dbcn;
 
 static int sbi_ecall_dbcn_register_extensions(void)
 {
+	if (!sbi_console_get_device())
+		return 0;
+
 	return sbi_ecall_register_extension(&ecall_dbcn);
 }
 
diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
index ad31537604a3..ea0dc73f010d 100644
--- a/lib/sbi/sbi_ecall_srst.c
+++ b/lib/sbi/sbi_ecall_srst.c
@@ -71,6 +71,12 @@ struct sbi_ecall_extension ecall_srst;
 
 static int sbi_ecall_srst_register_extensions(void)
 {
+	unsigned long out_val;
+
+	sbi_ecall_srst_probe(SBI_EXT_SRST, &out_val);
+	if (!out_val)
+		return 0;
+
 	return sbi_ecall_register_extension(&ecall_srst);
 }
 
diff --git a/lib/sbi/sbi_ecall_susp.c b/lib/sbi/sbi_ecall_susp.c
index bfbdbe648625..c4124046b929 100644
--- a/lib/sbi/sbi_ecall_susp.c
+++ b/lib/sbi/sbi_ecall_susp.c
@@ -44,6 +44,12 @@ struct sbi_ecall_extension ecall_susp;
 
 static int sbi_ecall_susp_register_extensions(void)
 {
+	unsigned long out_val;
+
+	sbi_ecall_susp_probe(SBI_EXT_SUSP, &out_val);
+	if (!out_val)
+		return 0;
+
 	return sbi_ecall_register_extension(&ecall_susp);
 }
 
diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
index 39c58c8b6fd5..700f475f0a86 100644
--- a/lib/sbi/sbi_ecall_vendor.c
+++ b/lib/sbi/sbi_ecall_vendor.c
@@ -22,24 +22,11 @@ static inline unsigned long sbi_ecall_vendor_id(void)
 		 (SBI_EXT_VENDOR_END - SBI_EXT_VENDOR_START));
 }
 
-static int sbi_ecall_vendor_probe(unsigned long extid,
-				  unsigned long *out_val)
-{
-	if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()))
-		*out_val = 0;
-	else
-		*out_val = 1;
-	return 0;
-}
-
 static int sbi_ecall_vendor_handler(unsigned long extid, unsigned long funcid,
 				    const struct sbi_trap_regs *regs,
 				    unsigned long *out_val,
 				    struct sbi_trap_info *out_trap)
 {
-	if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()))
-		return SBI_ERR_NOT_SUPPORTED;
-
 	return sbi_platform_vendor_ext_provider(sbi_platform_thishart_ptr(),
 						funcid, regs,
 						out_val, out_trap);
@@ -51,6 +38,9 @@ static int sbi_ecall_vendor_register_extensions(void)
 {
 	unsigned long extid = sbi_ecall_vendor_id();
 
+	if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()))
+		return 0;
+
 	ecall_vendor.extid_start = extid;
 	ecall_vendor.extid_end = extid;
 
@@ -61,6 +51,5 @@ struct sbi_ecall_extension ecall_vendor = {
 	.extid_start		= SBI_EXT_VENDOR_START,
 	.extid_end		= SBI_EXT_VENDOR_END,
 	.register_extensions	= sbi_ecall_vendor_register_extensions,
-	.probe			= sbi_ecall_vendor_probe,
 	.handle			= sbi_ecall_vendor_handler,
 };
-- 
2.40.0


