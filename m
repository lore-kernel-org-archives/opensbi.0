From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 15 Oct 2020 18:56:54 +0530
Subject: [PATCH v2 10/16] lib: sbi: Extend sbi_system_reset() for domains
In-Reply-To: <20201015132700.2232820-1-anup.patel@wdc.com>
References: <20201015132700.2232820-1-anup.patel@wdc.com>
Message-ID: <20201015132700.2232820-11-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_system_reset() should issue platform system reset only if
domain of current HART is allowed to do system reset.

This patch extends sbi_system_reset() as-per above.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/sbi/sbi_system.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index a938003..96290b3 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -37,9 +37,10 @@ void __noreturn sbi_system_reset(u32 platform_reset_type)
 	/* Stop current HART */
 	sbi_hsm_hart_stop(scratch, FALSE);
 
-	/* Platform specific reset */
-	sbi_platform_system_reset(sbi_platform_ptr(scratch),
-				  platform_reset_type);
+	/* Platform specific reset if domain allowed system reset */
+	if (dom->system_reset_allowed)
+		sbi_platform_system_reset(sbi_platform_ptr(scratch),
+					  platform_reset_type);
 
 	/* If platform specific reset did not work then do sbi_exit() */
 	sbi_exit(scratch);
-- 
2.25.1


