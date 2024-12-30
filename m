From: Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Mon, 30 Dec 2024 17:44:13 +0800
Subject: [PATCH 1/1] fdt: fdt_helper: fix typo har't'id
Message-ID: <20241230094413.885968-1-ycliang@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

s/hard_id/hartid/

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 include/sbi_utils/fdt/fdt_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 7329b84c..6a37d971 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -59,7 +59,7 @@ int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
 
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
-int fdt_parse_isa_extensions(const void *fdt, unsigned int hard_id,
+int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
 			     unsigned long *extensions);
 
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
-- 
2.34.1


