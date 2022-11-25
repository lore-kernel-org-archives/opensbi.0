From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 25 Nov 2022 15:08:27 +0100
Subject: [PATCH 5/5] lib: simplify fdt_translate_address()
In-Reply-To: <20221125140827.47018-1-heinrich.schuchardt@canonical.com>
References: <20221125140827.47018-1-heinrich.schuchardt@canonical.com>
Message-ID: <20221125140827.47018-6-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't assign a value to offset which is never used.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/fdt/fdt_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index da96282..b8d0eea 100644
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


