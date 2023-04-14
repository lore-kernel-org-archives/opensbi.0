From: Tan En De <ende.tan@starfivetech.com>
Date: Fri, 14 Apr 2023 13:13:11 +0800
Subject: [1/1] lib: sbi: Add debug print when sbi_pmu_init fails
Message-ID: <20230414051312.458-1-ende.tan@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since sbi_pmu_init is called after sbi_console_init,
the sbi_printf can be called when sbi_pmu_init fails.

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
---
 lib/sbi/sbi_init.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a031336..5db8e7f 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -290,8 +290,11 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 
 	rc = sbi_pmu_init(scratch, true);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: pmu init failed (error %d)\n",
+			   __func__, rc);
 		sbi_hart_hang();
+	}
 
 	sbi_boot_print_banner(scratch);
 
-- 
2.34.1


