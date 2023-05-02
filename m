From: Xiang W <wxjstz@126.com>
Date: Tue,  2 May 2023 23:51:30 +0800
Subject: [PATCH v3] lib: sbi: Optimize probe of srst/susp
Message-ID: <20230502155130.28979-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

No need to do a fully comprehensive count, just find a supported reset
or suspend type

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
V3:
Fixing missing {}
Fixing tags of Andrew

V2:
Add a similar optimization to susp as suggested by Andrew

lib/sbi/sbi_ecall_srst.c | 10 ++++++----
 lib/sbi/sbi_ecall_susp.c | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
index 93b012c..36f24e5 100644
--- a/lib/sbi/sbi_ecall_srst.c
+++ b/lib/sbi/sbi_ecall_srst.c
@@ -50,7 +50,7 @@ static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
 
 static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
 {
-	u32 type, count = 0;
+	u32 type;
 
 	/*
 	 * At least one standard reset types should be supported by
@@ -59,11 +59,13 @@ static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
 
 	for (type = 0; type <= SBI_SRST_RESET_TYPE_LAST; type++) {
 		if (sbi_system_reset_supported(type,
-					SBI_SRST_RESET_REASON_NONE))
-			count++;
+					SBI_SRST_RESET_REASON_NONE)) {
+			*out_val = 1;
+			return 0;
+		}
 	}
 
-	*out_val = (count) ? 1 : 0;
+	*out_val = 0;
 	return 0;
 }
 
diff --git a/lib/sbi/sbi_ecall_susp.c b/lib/sbi/sbi_ecall_susp.c
index f20126c..c8b8f64 100644
--- a/lib/sbi/sbi_ecall_susp.c
+++ b/lib/sbi/sbi_ecall_susp.c
@@ -25,18 +25,20 @@ static int sbi_ecall_susp_handler(unsigned long extid, unsigned long funcid,
 
 static int sbi_ecall_susp_probe(unsigned long extid, unsigned long *out_val)
 {
-	u32 type, count = 0;
+	u32 type;
 
 	/*
 	 * At least one suspend type should be supported by the
 	 * platform for the SBI SUSP extension to be usable.
 	 */
 	for (type = 0; type <= SBI_SUSP_SLEEP_TYPE_LAST; type++) {
-		if (sbi_system_suspend_supported(type))
-			count++;
+		if (sbi_system_suspend_supported(type)) {
+			*out_val = 1;
+			return 0;
+		}
 	}
 
-	*out_val = count ? 1 : 0;
+	*out_val = 0;
 	return 0;
 }
 
-- 
2.39.2


