From: Xiang W <wxjstz@126.com>
Date: Tue,  9 May 2023 22:47:32 +0800
Subject: [PATCH 1/4] lib: sbi: Fix the hang condition of console init
In-Reply-To: <20230509144735.72059-1-wxjstz@126.com>
References: <20230509144735.72059-1-wxjstz@126.com>
Message-ID: <20230509144735.72059-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

console is not a required device and should not hang when
sbi_console_init returns SBI_ENODEV

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5db8e7f..ec0bcb0 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -286,7 +286,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 
 	rc = sbi_console_init(scratch);
-	if (rc)
+	if (rc && rc != SBI_ENODEV)
 		sbi_hart_hang();
 
 	rc = sbi_pmu_init(scratch, true);
-- 
2.39.2


