From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 15 Oct 2020 18:56:56 +0530
Subject: [PATCH v2 12/16] lib: utils: Update fdt_cpu_fixup() to use current
 domain
In-Reply-To: <20201015132700.2232820-1-anup.patel@wdc.com>
References: <20201015132700.2232820-1-anup.patel@wdc.com>
Message-ID: <20201015132700.2232820-13-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fdt_cpu_fixup() should disable a HART in DT if the HART
is not assigned to the current HART domain. This patch updates
fdt_cpu_fixup() accordingly.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/utils/fdt/fdt_fixup.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index e9e1dff..eea450d 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -12,7 +12,6 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_math.h>
 #include <sbi/sbi_hart.h>
-#include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
@@ -20,8 +19,7 @@
 
 void fdt_cpu_fixup(void *fdt)
 {
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	int err, cpu_offset, cpus_offset, len;
 	const char *mmu_type;
 	u32 hartid;
@@ -41,12 +39,12 @@ void fdt_cpu_fixup(void *fdt)
 
 		/*
 		 * Disable a HART DT node if one of the following is true:
-		 * 1. The HART is marked invalid by platform support
+		 * 1. The HART is not assigned to the current domain
 		 * 2. MMU is not available for the HART
 		 */
 
 		mmu_type = fdt_getprop(fdt, cpu_offset, "mmu-type", &len);
-		if (sbi_platform_hart_invalid(plat, hartid) ||
+		if (!sbi_domain_is_assigned_hart(dom, hartid) ||
 		    !mmu_type || !len)
 			fdt_setprop_string(fdt, cpu_offset, "status",
 					   "disabled");
-- 
2.25.1


