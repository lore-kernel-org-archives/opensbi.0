From: Anup Patel <apatel@ventanamicro.com>
Date: Fri,  8 Jul 2022 17:22:44 +0530
Subject: [PATCH v3] lib: utils/serial: Update Shakti UART based on latest implementation
Message-ID: <20220708115244.556074-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Prasanna T <ptprasanna@gmail.com>

The age old version of Shakti UART was upgraded long back, but we missed
updating the driver in OpenSBI. The old version of UART is not supported
anymore, hence removed the inline comment which is also outdated now.

Signed-off-by: Prasanna T <ptprasanna@gmail.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v2:
 - Updated patch subject and description
 - Minor fix in shakti_uart_getc()
---
 lib/utils/serial/shakti-uart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/utils/serial/shakti-uart.c b/lib/utils/serial/shakti-uart.c
index 5f2fe75..3556935 100644
--- a/lib/utils/serial/shakti-uart.c
+++ b/lib/utils/serial/shakti-uart.c
@@ -19,21 +19,21 @@
 #define REG_RX_THRES	0x20
 
 #define UART_TX_FULL  0x2
+#define UART_RX_NOT_EMPTY 0x4
 #define UART_RX_FULL  0x8
 
 static volatile char *uart_base;
 
 static void shakti_uart_putc(char ch)
 {
-	while((readw(uart_base + REG_STATUS) & UART_TX_FULL))
+	while ((readb(uart_base + REG_STATUS) & UART_TX_FULL))
 		;
 	writeb(ch, uart_base + REG_TX);
 }
 
 static int shakti_uart_getc(void)
 {
-	u16 status = readw(uart_base + REG_STATUS);
-	if (status & UART_RX_FULL)
+	if (readb(uart_base + REG_STATUS) & UART_RX_NOT_EMPTY)
 		return readb(uart_base + REG_RX);
 	return -1;
 }
-- 
2.34.1


