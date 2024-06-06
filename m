From: Xiang W <wxjstz@126.com>
Date: Thu,  6 Jun 2024 17:17:16 +0800
Subject: [PATCH 4/4] lib: sbi: Initialize the console as early as possible
In-Reply-To: <20240606091723.896477-1-wxjstz@126.com>
References: <20240606091723.896477-1-wxjstz@126.com>
Message-ID: <20240606091723.896477-5-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move console initialization to the front of init_coldboot so that
more information can be output

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 389172a..b14cd03 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -214,6 +214,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	unsigned long *count;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
+	rc = sbi_console_init(scratch);
+	if (rc)
+		sbi_hart_hang();
+
 	/* Note: This has to be first thing in coldboot init sequence */
 	rc = sbi_scratch_init(scratch);
 	if (rc)
@@ -260,10 +264,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_console_init(scratch);
-	if (rc)
-		sbi_hart_hang();
-
 	rc = sbi_sse_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
-- 
2.43.0


