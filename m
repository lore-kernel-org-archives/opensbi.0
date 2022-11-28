From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon, 28 Nov 2022 10:14:19 +0100
Subject: [PATCH v2 5/6] lib: simplify fdt_translate_address()
In-Reply-To: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
Message-ID: <20221128091420.30391-6-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't assign a value to offset which is never used.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
v2:
	Reviewed-by added
---
 lib/utils/fdt/fdt_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 674f17b..43d7857 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -124,7 +124,7 @@ static int fdt_translate_address(void *fdt, uint64_t reg, int parent,
 	int i, rlen;
 	int cell_addr, cell_size;
 	const fdt32_t *ranges;
-	uint64_t offset = 0, caddr = 0, paddr = 0, rsize = 0;
+	uint64_t offset, caddr = 0, paddr = 0, rsize = 0;
 
 	cell_addr = fdt_address_cells(fdt, parent);
 	if (cell_addr < 1)
-- 
2.37.2


