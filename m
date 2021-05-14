From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 09:16:13 +0800
Subject: [PATCH] lib: utils/serial: Support Synopsys DesignWare APB UART
Message-ID: <20210514011613.2183141-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Synopsys DesignWare APB UART is seen on the StarFive JH7100 SoC.
Its programming interface is compatible with the existing 8250
UART driver. Simply add its compatible string to the driver makes
it work with the StarFive JH7100 SoC on a BeagleV board.

With this patch, the generic platform firmware can be used out of
the box on the BeagleV board.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 lib/utils/serial/fdt_serial_uart8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
index 918193a..36f364c 100644
--- a/lib/utils/serial/fdt_serial_uart8250.c
+++ b/lib/utils/serial/fdt_serial_uart8250.c
@@ -28,6 +28,7 @@ static int serial_uart8250_init(void *fdt, int nodeoff,
 static const struct fdt_match serial_uart8250_match[] = {
 	{ .compatible = "ns16550" },
 	{ .compatible = "ns16550a" },
+	{ .compatible = "snps,dw-apb-uart" },
 	{ },
 };
 
-- 
2.25.1


