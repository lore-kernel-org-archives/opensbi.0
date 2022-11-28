From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon, 28 Nov 2022 10:14:17 +0100
Subject: [PATCH v2 3/6] lib: fix fdt_parse_plmt_node()
In-Reply-To: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
Message-ID: <20221128091420.30391-4-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

cpu_offset, cpu_intc_offset must be int to discover failed invocations of
fdt_node_offset_by_phandle() or fdt_parent_offset().

After determining cpu_offset we have to check this value and not
cpu_intc_offset.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
	check correct variable
---
 lib/utils/fdt/fdt_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 87b9fb2..976c96e 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -805,7 +805,7 @@ int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
 {
 	const fdt32_t *val;
 	int rc, i, count;
-	uint64_t reg_addr, reg_size, cpu_offset, cpu_intc_offset;
+	uint64_t reg_addr, reg_size;
 	u32 phandle, hwirq, hartid, hcount;
 
 	if (nodeoffset < 0 || !fdt || !plmt_base ||
@@ -826,6 +826,8 @@ int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
 
 	hcount = 0;
 	for (i = 0; i < (count / 2); i++) {
+		int cpu_offset, cpu_intc_offset;
+
 		phandle = fdt32_to_cpu(val[2 * i]);
 		hwirq = fdt32_to_cpu(val[2 * i + 1]);
 
@@ -834,7 +836,7 @@ int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
 			continue;
 
 		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_intc_offset < 0)
+		if (cpu_offset < 0)
 			continue;
 
 		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-- 
2.37.2


