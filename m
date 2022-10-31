From: Xiang W <wxjstz@126.com>
Date: Mon, 31 Oct 2022 19:21:45 +0800
Subject: [PATCH 2/2] lib: utils/fdt: Simplified code
In-Reply-To: <20221031112145.126615-1-wxjstz@126.com>
References: <20221031112145.126615-1-wxjstz@126.com>
Message-ID: <20221031112145.126615-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Simplified fdt_parse_xxx_uart_node which direct call
fdt_parse_uart_node_common.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/fdt/fdt_helper.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index cdd0b35..72d8635 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -350,43 +350,27 @@ static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
 int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
 				struct platform_uart_data *uart)
 {
-	int rc;
 
-	rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
+	return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
 					DEFAULT_UART_FREQ,
 					DEFAULT_UART_BAUD);
-
-	if (rc)
-		return rc;
-
-	return 0;
 }
 
 int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart)
 {
-	int rc;
 
-	rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
+	return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
 					DEFAULT_SHAKTI_UART_FREQ,
 					DEFAULT_SHAKTI_UART_BAUD);
-
-	return rc ? : 0;
 }
 
 int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart)
 {
-	int rc;
-
-	rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
+	return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
 					DEFAULT_SIFIVE_UART_FREQ,
 					DEFAULT_SIFIVE_UART_BAUD);
-
-	if (rc)
-		return rc;
-
-	return 0;
 }
 
 int fdt_parse_uart_node(void *fdt, int nodeoffset,
@@ -441,11 +425,7 @@ int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
 int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart)
 {
-	int rc;
-
-	rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart, 0, 0);
-
-	return rc ? : 0;
+	return fdt_parse_uart_node_common(fdt, nodeoffset, uart, 0, 0);
 }
 
 int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic)
-- 
2.30.2


