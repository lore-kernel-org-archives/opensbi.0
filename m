From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 May 2023 11:34:44 +0200
Subject: [PATCH v5 5/7] lib: sbi: Optimize probe of srst/susp
In-Reply-To: <20230515093446.73123-1-ajones@ventanamicro.com>
References: <20230515093446.73123-1-ajones@ventanamicro.com>
Message-ID: <20230515093446.73123-6-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Xiang W <wxjstz@126.com>

No need to do a fully comprehensive count, just find a supported reset
or suspend type

Signed-off-by: Xiang W <wxjstz@126.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_ecall_srst.c | 10 ++++++----
 lib/sbi/sbi_ecall_susp.c | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
index ea0dc73f010d..fd2dc0d251f3 100644
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
index c4124046b929..716a6d585af7 100644
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
2.40.0


