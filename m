From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu,  9 Jan 2025 15:08:53 -0800
Subject: [PATCH] Work with hartid equal to or greater than SBI_HARTMASK_MAX_BITS.
Message-ID: <20250109230853.2440-1-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some platforms use hartid that is equal to greater than SBI_HARTMASK_MAX_BITS,
so we should remove the check.
---
 lib/utils/fdt/fdt_domain.c  | 3 ---
 lib/utils/fdt/fdt_helper.c  | 9 ---------
 platform/generic/platform.c | 3 ---
 3 files changed, 15 deletions(-)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 4bc7ed8..6bc63c2 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -471,9 +471,6 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 		if (err)
 			continue;
 
-		if (SBI_HARTMASK_MAX_BITS <= val32)
-			continue;
-
 		if (!fdt_node_is_enabled(fdt, cpu_offset))
 			continue;
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index cb350e5..aec08fa 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -1032,9 +1032,6 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 		if (rc)
 			continue;
 
-		if (SBI_HARTMASK_MAX_BITS <= hartid)
-			continue;
-
 		if (match_hwirq == hwirq) {
 			if (hartid < first_hartid)
 				first_hartid = hartid;
@@ -1097,9 +1094,6 @@ int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_bas
 		if (rc)
 			continue;
 
-		if (SBI_HARTMASK_MAX_BITS <= hartid)
-			continue;
-
 		if (hwirq == IRQ_M_TIMER)
 			hcount++;
 	}
@@ -1153,9 +1147,6 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
 		if (rc)
 			continue;
 
-		if (SBI_HARTMASK_MAX_BITS <= hartid)
-			continue;
-
 		if (hwirq == IRQ_M_SOFT)
 			hcount++;
 	}
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index c03ed88..331ff8e 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -200,9 +200,6 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 		if (rc)
 			continue;
 
-		if (SBI_HARTMASK_MAX_BITS <= hartid)
-			continue;
-
 		if (!fdt_node_is_enabled(fdt, cpu_offset))
 			continue;
 
-- 
2.47.1


