From: Xiang W <wxjstz@126.com>
Date: Thu,  6 Jun 2024 17:17:15 +0800
Subject: [PATCH 3/4] lib: utils/serial: add domains_init for 8250
In-Reply-To: <20240606091723.896477-1-wxjstz@126.com>
References: <20240606091723.896477-1-wxjstz@126.com>
Message-ID: <20240606091723.896477-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

8250 needs to add memregion to root_domain. Move this part of
operation to sbi_console_device.domains_init

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi_utils/serial/uart8250.h |  1 +
 lib/utils/serial/uart8250.c         | 28 +++++++++++++++++++---------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/sbi_utils/serial/uart8250.h b/include/sbi_utils/serial/uart8250.h
index be9483a..0949b96 100644
--- a/include/sbi_utils/serial/uart8250.h
+++ b/include/sbi_utils/serial/uart8250.h
@@ -18,6 +18,7 @@ struct uart8250_device {
 	u32 baudrate;
 	u32 reg_shift;
 	u32 reg_width;
+	u32 reg_offset;
 };
 
 void uart8250_putc(struct uart8250_device *dev, char ch);
diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index db35ec3..754548f 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -92,10 +92,21 @@ static int uart8250_console_getc(void)
 	return uart8250_getc(&console_dev);
 }
 
+static int uart8250_domains_init(void)
+{
+	unsigned long base = (unsigned long)console_dev.base
+					- console_dev.reg_offset;
+
+	return sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
+					(SBI_DOMAIN_MEMREGION_MMIO |
+					SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
+}
+
 static struct sbi_console_device uart8250_console = {
 	.name = "uart8250",
 	.console_putc = uart8250_console_putc,
-	.console_getc = uart8250_console_getc
+	.console_getc = uart8250_console_getc,
+	.domains_init = uart8250_domains_init
 };
 
 int uart8250_init(struct uart8250_device * dev, unsigned long base, u32 in_freq,
@@ -103,11 +114,12 @@ int uart8250_init(struct uart8250_device * dev, unsigned long base, u32 in_freq,
 {
 	u16 bdiv = 0;
 
-	dev->base      = (volatile char *)base + reg_offset;
-	dev->reg_shift = reg_shift;
-	dev->reg_width = reg_width;
-	dev->in_freq   = in_freq;
-	dev->baudrate  = baudrate;
+	dev->base       = (volatile char *)base + reg_offset;
+	dev->reg_offset = reg_offset;
+	dev->reg_shift  = reg_shift;
+	dev->reg_width  = reg_width;
+	dev->in_freq    = in_freq;
+	dev->baudrate   = baudrate;
 
 	if (baudrate)
 		bdiv = (in_freq + 8 * baudrate) / (16 * baudrate);
@@ -147,7 +159,5 @@ int uart8250_console_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg
 
 	sbi_console_set_device(&uart8250_console);
 
-	return sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
-					    (SBI_DOMAIN_MEMREGION_MMIO |
-					    SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
+	return 0;
 }
-- 
2.43.0


