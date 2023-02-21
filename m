From: Xiang W <wxjstz@126.com>
Date: Tue, 21 Feb 2023 12:12:03 +0800
Subject: [PATCH v3] lib: utils: fdt_fixup: Fix compile error
Message-ID: <20230221041203.819559-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When building with GCC-10 or older versions, it throws the following
error:

 CC-DEP    platform/generic/lib/utils/fdt/fdt_fixup.dep
 CC        platform/generic/lib/utils/fdt/fdt_fixup.o
lib/utils/fdt/fdt_fixup.c: In function 'fdt_reserved_memory_fixup':
lib/utils/fdt/fdt_fixup.c:376:2: error: label at end of compound statement
  376 |  next_entry:
      |  ^~~~~~~~~~

Remove the goto statement. Resolves issue#288 [1]

[1]: https://github.com/riscv-software-src/opensbi/issues/288

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes in v3:
- Fix a comment issue raised by Bin Meng
- Changed the type of "overlap" from int to bool as suggested by Bin Meng

Changes in v2:
- Fix a comment issue raised by Andreas Schwab
 lib/utils/fdt/fdt_fixup.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 619e4f5..c10179b 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -361,19 +361,22 @@ int fdt_reserved_memory_fixup(void *fdt)
 			return SBI_ENOSPC;
 		}
 
+		bool overlap = false;
 		addr = reg->base;
 		for (j = 0; j < i; j++) {
 			if (addr == filtered_base[j]
 			    && filtered_order[j] < reg->order) {
+				overlap = true;
 				filtered_order[j] = reg->order;
-				goto next_entry;
+				break;
 			}
 		}
 
-		filtered_base[i] = reg->base;
-		filtered_order[i] = reg->order;
-		i++;
-	next_entry:
+		if (!overlap) {
+			filtered_base[i] = reg->base;
+			filtered_order[i] = reg->order;
+			i++;
+		}
 	}
 
 	for (j = 0; j < i; j++) {
-- 
2.39.1


