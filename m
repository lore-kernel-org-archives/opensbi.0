From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 24 Mar 2025 08:48:05 -0700
Subject: [PATCH v2 1/5] lib utils/fdt: Drop fdt_parse_max_enabled_hart_id()
In-Reply-To: <20250324154858.4147529-1-samuel.holland@sifive.com>
References: <20250324154858.4147529-1-samuel.holland@sifive.com>
Message-ID: <20250324154858.4147529-2-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This function is not used anywhere.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 include/sbi_utils/fdt/fdt_helper.h |  2 --
 lib/utils/fdt/fdt_helper.c         | 31 ------------------------------
 2 files changed, 33 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index ff830025..f94e535f 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -51,8 +51,6 @@ bool fdt_node_is_enabled(const void *fdt, int nodeoff);
 
 int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
 
-int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
-
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
 int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index bc357b2f..232a1459 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -265,37 +265,6 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid)
 	return 0;
 }
 
-int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid)
-{
-	u32 hartid;
-	int err, cpu_offset, cpus_offset;
-
-	if (!fdt)
-		return SBI_EINVAL;
-	if (!max_hartid)
-		return 0;
-
-	*max_hartid = 0;
-
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return cpus_offset;
-
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
-			continue;
-
-		if (hartid > *max_hartid)
-			*max_hartid = hartid;
-	}
-
-	return 0;
-}
-
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
 {
 	const fdt32_t *val;
-- 
2.47.2


