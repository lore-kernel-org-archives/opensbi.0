From: Jan Remes <jan.remes@codasip.com>
Date: Fri, 13 May 2022 12:58:43 +0200
Subject: [PATCH v4 4/4] lib: utils/fdt: rename fdt_parse_max_hart_id
In-Reply-To: <20220513105843.5139-1-jan.remes@codasip.com>
References: <20220513105843.5139-1-jan.remes@codasip.com>
Message-ID: <20220513105843.5139-5-jan.remes@codasip.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The function returns the highest hart-id of the harts actually used in
the system (enabled). Change the name to reflect this fact.

Signed-off-by: Jan Remes <jan.remes@codasip.com>
---
 include/sbi_utils/fdt/fdt_helper.h | 2 +-
 lib/utils/fdt/fdt_helper.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index a9c0a8a..74ea234 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -52,7 +52,7 @@ bool fdt_node_is_enabled(void *fdt, int nodeoff);
 
 int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid);
 
-int fdt_parse_max_hart_id(void *fdt, u32 *max_hartid);
+int fdt_parse_max_enabled_hart_id(void *fdt, u32 *max_hartid);
 
 int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 5db3fbe..2bdb1ef 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -262,7 +262,7 @@ int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid)
 	return 0;
 }
 
-int fdt_parse_max_hart_id(void *fdt, u32 *max_hartid)
+int fdt_parse_max_enabled_hart_id(void *fdt, u32 *max_hartid)
 {
 	u32 hartid;
 	int err, cpu_offset, cpus_offset;
-- 
2.36.1


