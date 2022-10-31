From: Xiang W <wxjstz@126.com>
Date: Mon, 31 Oct 2022 19:21:44 +0800
Subject: [PATCH 1/2] lib: utils/fdt: Remove redundant code
In-Reply-To: <20221031112145.126615-1-wxjstz@126.com>
References: <20221031112145.126615-1-wxjstz@126.com>
Message-ID: <20221031112145.126615-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

uart->reg_offset and uart->reg_io_width are only used on uart8250 and
not required on other platforms. Remove for sifive and gaisler.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/fdt/fdt_helper.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index d390436..cdd0b35 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -25,10 +25,6 @@
 
 #define DEFAULT_SIFIVE_UART_FREQ		0
 #define DEFAULT_SIFIVE_UART_BAUD		115200
-#define DEFAULT_SIFIVE_UART_REG_SHIFT		0
-#define DEFAULT_SIFIVE_UART_REG_IO_WIDTH	4
-
-#define DEFAULT_GAISLER_UART_REG_IO_WIDTH	4
 
 #define DEFAULT_SHAKTI_UART_FREQ		50000000
 #define DEFAULT_SHAKTI_UART_BAUD		115200
@@ -363,10 +359,6 @@ int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
 	if (rc)
 		return rc;
 
-	/* For Gaisler APBUART, the reg-shift and reg-io-width are fixed .*/
-	uart->reg_shift	   = DEFAULT_UART_REG_SHIFT;
-	uart->reg_io_width = DEFAULT_GAISLER_UART_REG_IO_WIDTH;
-
 	return 0;
 }
 
@@ -394,10 +386,6 @@ int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
 	if (rc)
 		return rc;
 
-	/* For SiFive UART, the reg-shift and reg-io-width are fixed .*/
-	uart->reg_shift = DEFAULT_SIFIVE_UART_REG_SHIFT;
-	uart->reg_io_width = DEFAULT_SIFIVE_UART_REG_IO_WIDTH;
-
 	return 0;
 }
 
-- 
2.30.2


