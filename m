From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 May 2023 13:12:35 +0200
Subject: [PATCH v6 2/7] lib: sbi: Narrow vendor extension range
In-Reply-To: <20230515111240.95059-1-ajones@ventanamicro.com>
References: <20230515111240.95059-1-ajones@ventanamicro.com>
Message-ID: <20230515111240.95059-3-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The vendor extension ID range is large, but at runtime at most
a single ID will be available. Narrow the range in the
register_extensions callback. After narrowing, we no longer
need to check that the extension ID is correct in the other
callbacks, as those callbacks will never be invoked with
anything other than the single ID.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_ecall_vendor.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
index 126156f79a12..39c58c8b6fd5 100644
--- a/lib/sbi/sbi_ecall_vendor.c
+++ b/lib/sbi/sbi_ecall_vendor.c
@@ -25,8 +25,7 @@ static inline unsigned long sbi_ecall_vendor_id(void)
 static int sbi_ecall_vendor_probe(unsigned long extid,
 				  unsigned long *out_val)
 {
-	if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()) ||
-	    extid != sbi_ecall_vendor_id())
+	if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()))
 		*out_val = 0;
 	else
 		*out_val = 1;
@@ -38,8 +37,7 @@ static int sbi_ecall_vendor_handler(unsigned long extid, unsigned long funcid,
 				    unsigned long *out_val,
 				    struct sbi_trap_info *out_trap)
 {
-	if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()) ||
-	    extid != sbi_ecall_vendor_id())
+	if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()))
 		return SBI_ERR_NOT_SUPPORTED;
 
 	return sbi_platform_vendor_ext_provider(sbi_platform_thishart_ptr(),
@@ -51,6 +49,11 @@ struct sbi_ecall_extension ecall_vendor;
 
 static int sbi_ecall_vendor_register_extensions(void)
 {
+	unsigned long extid = sbi_ecall_vendor_id();
+
+	ecall_vendor.extid_start = extid;
+	ecall_vendor.extid_end = extid;
+
 	return sbi_ecall_register_extension(&ecall_vendor);
 }
 
-- 
2.40.0


