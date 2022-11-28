From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon, 28 Nov 2022 10:14:20 +0100
Subject: [PATCH v2 6/6] lib: fix fdt_parse_aclint_node()
In-Reply-To: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
Message-ID: <20221128091420.30391-7-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After determining cpu_offset we have to check this variable and not
cpu_intc_offset.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
	new patch
---
 lib/utils/fdt/fdt_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 43d7857..d4b38dc 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -772,7 +772,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 			continue;
 
 		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_intc_offset < 0)
+		if (cpu_offset < 0)
 			continue;
 
 		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-- 
2.37.2


