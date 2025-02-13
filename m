From: Raj Vishwanathan <raj.vishwanathan@gmail.com>
Date: Thu, 13 Feb 2025 11:52:11 -0800
Subject: [PATCH v2] lib: utils: Make sure that hartid and the scratch are aligned
In-Reply-To: <0250109233241.2491-1-cfu@mips.com>
References: <0250109233241.2491-1-cfu@mips.com>
Message-ID: <20250213195211.15587-1-Raj.Vishwanathan@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Harts associated with an ACLINT_MSWI need not have sequential hartids.
It is insufficient to use first_hartid and hart_count. To account for
non-sequential hart ids, include the empty hard-ids' generate hart-count.

Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
---

hart_count = last_hart_id - first_hart_id +1
count = number of harts
For sequential hart_id's, count = hart_count
For non-sequential hart_id's, count  < hart_count
---
 lib/utils/fdt/fdt_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index cb350e5..bb3fddd 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -1046,8 +1046,7 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 
 	if ((last_hartid >= first_hartid) && first_hartid != -1U) {
 		*out_first_hartid = first_hartid;
-		count = last_hartid - first_hartid + 1;
-		*out_hart_count = (hart_count < count) ? hart_count : count;
+		*out_hart_count  = last_hartid - first_hartid + 1;
 	}
 
 	return 0;
-- 
2.43.0


