From: Jukka Laitinen <jukka.laitinen@iki.fi>
Date: Wed, 19 Jan 2022 11:20:17 +0200
Subject: [PATCH v5] lib: fix pointer of type 'void *' used in arithmetic
Message-ID: <20220119092017.176840-1-jukkax@ssrc.tii.ae>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Using "void *" in arithmetic causes errors with strict compiler settings:
"error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]"

Avoid these by calculating on "char *" where 1-byte data size is assumed.

Signed-off-by: Jukka Laitinen <jukkax@ssrc.tii.ae>
---
 include/sbi/sbi_scratch.h             | 4 ++--
 lib/sbi/sbi_fifo.c                    | 6 +++---
 lib/sbi/sbi_string.c                  | 4 ++--
 lib/utils/i2c/fdt_i2c_sifive.c        | 4 ++--
 lib/utils/irqchip/fdt_irqchip_plic.c  | 2 +-
 lib/utils/irqchip/plic.c              | 8 ++++----
 lib/utils/reset/fdt_reset_sunxi_wdt.c | 4 ++--
 lib/utils/reset/fdt_reset_thead.c     | 4 ++--
 lib/utils/serial/gaisler-uart.c       | 4 ++--
 lib/utils/serial/shakti-uart.c        | 4 ++--
 lib/utils/serial/sifive-uart.c        | 4 ++--
 lib/utils/serial/uart8250.c           | 4 ++--
 lib/utils/timer/aclint_mtimer.c       | 2 +-
 13 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 186a40c..0c27307 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -104,11 +104,11 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size);
 void sbi_scratch_free_offset(unsigned long offset);
 
 /** Get pointer from offset in sbi_scratch */
-#define sbi_scratch_offset_ptr(scratch, offset)	((void *)scratch + (offset))
+#define sbi_scratch_offset_ptr(scratch, offset)	(void *)((char *)(scratch) + (offset))
 
 /** Get pointer from offset in sbi_scratch for current HART */
 #define sbi_scratch_thishart_offset_ptr(offset)	\
-	((void *)sbi_scratch_thishart_ptr() + (offset))
+	(void *)((char *)sbi_scratch_thishart_ptr() + (offset))
 
 /** HART id to scratch table */
 extern struct sbi_scratch *hartid_to_scratch_table[];
diff --git a/lib/sbi/sbi_fifo.c b/lib/sbi/sbi_fifo.c
index 589cc18..68d6039 100644
--- a/lib/sbi/sbi_fifo.c
+++ b/lib/sbi/sbi_fifo.c
@@ -66,7 +66,7 @@ static inline void  __sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data)
 	if (head >= fifo->num_entries)
 		head = head - fifo->num_entries;
 
-	sbi_memcpy(fifo->queue + head * fifo->entry_size, data, fifo->entry_size);
+	sbi_memcpy((char *)fifo->queue + head * fifo->entry_size, data, fifo->entry_size);
 
 	fifo->avail++;
 }
@@ -142,7 +142,7 @@ int sbi_fifo_inplace_update(struct sbi_fifo *fifo, void *in,
 		index = fifo->tail + i;
 		if (index >= fifo->num_entries)
 			index -= fifo->num_entries;
-		entry = (void *)fifo->queue + (u32)index * fifo->entry_size;
+		entry = (char *)fifo->queue + (u32)index * fifo->entry_size;
 		ret = fptr(in, entry);
 
 		if (ret == SBI_FIFO_SKIP || ret == SBI_FIFO_UPDATED) {
@@ -184,7 +184,7 @@ int sbi_fifo_dequeue(struct sbi_fifo *fifo, void *data)
 		return SBI_ENOENT;
 	}
 
-	sbi_memcpy(data, fifo->queue + (u32)fifo->tail * fifo->entry_size,
+	sbi_memcpy(data, (char *)fifo->queue + (u32)fifo->tail * fifo->entry_size,
 	       fifo->entry_size);
 
 	fifo->avail--;
diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index c87bce9..c163f31 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -149,8 +149,8 @@ void *sbi_memmove(void *dest, const void *src, size_t count)
 			count--;
 		}
 	} else {
-		temp1 = dest + count - 1;
-		temp2 = src + count - 1;
+		temp1 = (char *)dest + count - 1;
+		temp2 = (char *)src + count - 1;
 
 		while (count > 0) {
 			*temp1-- = *temp2--;
diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
index 871241a..195541c 100644
--- a/lib/utils/i2c/fdt_i2c_sifive.c
+++ b/lib/utils/i2c/fdt_i2c_sifive.c
@@ -56,13 +56,13 @@ extern struct fdt_i2c_adapter fdt_i2c_adapter_sifive;
 static inline void sifive_i2c_setreg(struct sifive_i2c_adapter *adap,
 				     uint8_t reg, uint8_t value)
 {
-	writel(value, (volatile void *)adap->addr + reg);
+	writel(value, (volatile char *)adap->addr + reg);
 }
 
 static inline uint8_t sifive_i2c_getreg(struct sifive_i2c_adapter *adap,
 					uint8_t reg)
 {
-	return readl((volatile void *)adap->addr + reg);
+	return readl((volatile char *)adap->addr + reg);
 }
 
 static int sifive_i2c_adapter_rxack(struct sifive_i2c_adapter *adap)
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 8d375be..b2d2a1b 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -116,7 +116,7 @@ static int irqchip_plic_cold_init(void *fdt, int nodeoff,
 
 static void thead_plic_plat_init(struct plic_data *pd)
 {
-	writel_relaxed(BIT(0), (void *)pd->addr + THEAD_PLIC_CTRL_REG);
+	writel_relaxed(BIT(0), (char *)pd->addr + THEAD_PLIC_CTRL_REG);
 }
 
 static const struct fdt_match irqchip_plic_match[] = {
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 7665c62..0f58f3e 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -23,7 +23,7 @@
 
 static void plic_set_priority(struct plic_data *plic, u32 source, u32 val)
 {
-	volatile void *plic_priority = (void *)plic->addr +
+	volatile void *plic_priority = (char *)plic->addr +
 			PLIC_PRIORITY_BASE + 4 * source;
 	writel(val, plic_priority);
 }
@@ -35,19 +35,19 @@ void plic_set_thresh(struct plic_data *plic, u32 cntxid, u32 val)
 	if (!plic)
 		return;
 
-	plic_thresh = (void *)plic->addr +
+	plic_thresh = (char *)plic->addr +
 		      PLIC_CONTEXT_BASE + PLIC_CONTEXT_STRIDE * cntxid;
 	writel(val, plic_thresh);
 }
 
 void plic_set_ie(struct plic_data *plic, u32 cntxid, u32 word_index, u32 val)
 {
-	volatile void *plic_ie;
+	volatile char *plic_ie;
 
 	if (!plic)
 		return;
 
-	plic_ie = (void *)plic->addr +
+	plic_ie = (char *)plic->addr +
 		   PLIC_ENABLE_BASE + PLIC_ENABLE_STRIDE * cntxid;
 	writel(val, plic_ie + word_index * 4);
 }
diff --git a/lib/utils/reset/fdt_reset_sunxi_wdt.c b/lib/utils/reset/fdt_reset_sunxi_wdt.c
index 6d1b5b7..446d32b 100644
--- a/lib/utils/reset/fdt_reset_sunxi_wdt.c
+++ b/lib/utils/reset/fdt_reset_sunxi_wdt.c
@@ -19,7 +19,7 @@
 
 #define WDT_MODE_REG			0x18
 
-static volatile void *sunxi_wdt_base;
+static volatile char *sunxi_wdt_base;
 
 static int sunxi_wdt_system_reset_check(u32 type, u32 reason)
 {
@@ -59,7 +59,7 @@ static int sunxi_wdt_reset_init(void *fdt, int nodeoff,
 	if (rc < 0 || !reg_addr)
 		return SBI_ENODEV;
 
-	sunxi_wdt_base = (volatile void *)(unsigned long)reg_addr;
+	sunxi_wdt_base = (volatile char *)(unsigned long)reg_addr;
 
 	sbi_system_reset_add_device(&sunxi_wdt_reset);
 
diff --git a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
index d491687..e1d6885 100644
--- a/lib/utils/reset/fdt_reset_thead.c
+++ b/lib/utils/reset/fdt_reset_thead.c
@@ -59,7 +59,7 @@ extern void __thead_pre_start_warm(void);
 static int thead_reset_init(void *fdt, int nodeoff,
 				 const struct fdt_match *match)
 {
-	void *p;
+	char *p;
 	const fdt64_t *val;
 	const fdt32_t *val_w;
 	int len, i;
@@ -91,7 +91,7 @@ static int thead_reset_init(void *fdt, int nodeoff,
 	/* Custom reset method for secondary harts */
 	val = fdt_getprop(fdt, nodeoff, "entry-reg", &len);
 	if (len > 0 && val) {
-		p = (void *)(ulong)fdt64_to_cpu(*val);
+          p = (char *)(ulong)fdt64_to_cpu(*val);
 
 		val_w = fdt_getprop(fdt, nodeoff, "entry-cnt", &len);
 		if (len > 0 && val_w) {
diff --git a/lib/utils/serial/gaisler-uart.c b/lib/utils/serial/gaisler-uart.c
index 49298e9..5f30ee4 100644
--- a/lib/utils/serial/gaisler-uart.c
+++ b/lib/utils/serial/gaisler-uart.c
@@ -29,7 +29,7 @@
 
 /* clang-format on */
 
-static volatile void *uart_base;
+static volatile char *uart_base;
 
 static u32 get_reg(u32 num)
 {
@@ -67,7 +67,7 @@ int gaisler_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
 {
 	u32 ctrl;
 
-	uart_base = (volatile void *)base;
+	uart_base = (volatile char *)base;
 
 	/* Configure baudrate */
 	if (in_freq)
diff --git a/lib/utils/serial/shakti-uart.c b/lib/utils/serial/shakti-uart.c
index e77a985..5f2fe75 100644
--- a/lib/utils/serial/shakti-uart.c
+++ b/lib/utils/serial/shakti-uart.c
@@ -21,7 +21,7 @@
 #define UART_TX_FULL  0x2
 #define UART_RX_FULL  0x8
 
-static volatile void *uart_base;
+static volatile char *uart_base;
 
 static void shakti_uart_putc(char ch)
 {
@@ -46,7 +46,7 @@ static struct sbi_console_device shakti_console = {
 
 int shakti_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
 {
-	uart_base = (volatile void *)base;
+	uart_base = (volatile char *)base;
 	u16 baud = (u16)(in_freq/(16 * baudrate));
 	writew(baud, uart_base + REG_BAUD);
 
diff --git a/lib/utils/serial/sifive-uart.c b/lib/utils/serial/sifive-uart.c
index 57d80fa..9478a77 100644
--- a/lib/utils/serial/sifive-uart.c
+++ b/lib/utils/serial/sifive-uart.c
@@ -29,7 +29,7 @@
 
 /* clang-format on */
 
-static volatile void *uart_base;
+static volatile char *uart_base;
 static u32 uart_in_freq;
 static u32 uart_baudrate;
 
@@ -90,7 +90,7 @@ static struct sbi_console_device sifive_console = {
 
 int sifive_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
 {
-	uart_base     = (volatile void *)base;
+	uart_base     = (volatile char *)base;
 	uart_in_freq  = in_freq;
 	uart_baudrate = baudrate;
 
diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 1cf6624..142f8dc 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -39,7 +39,7 @@
 
 /* clang-format on */
 
-static volatile void *uart8250_base;
+static volatile char *uart8250_base;
 static u32 uart8250_in_freq;
 static u32 uart8250_baudrate;
 static u32 uart8250_reg_width;
@@ -95,7 +95,7 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
 {
 	u16 bdiv;
 
-	uart8250_base      = (volatile void *)base;
+	uart8250_base      = (volatile char *)base;
 	uart8250_reg_shift = reg_shift;
 	uart8250_reg_width = reg_width;
 	uart8250_in_freq   = in_freq;
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 62e87f7..2532b63 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -47,7 +47,7 @@ static u64 mtimer_time_rd32(volatile u64 *addr)
 static void mtimer_time_wr32(bool timecmp, u64 value, volatile u64 *addr)
 {
 	writel_relaxed((timecmp) ? -1U : 0U, (void *)(addr));
-	writel_relaxed((u32)(value >> 32), (void *)(addr) + 0x04);
+	writel_relaxed((u32)(value >> 32), (char *)(addr) + 0x04);
 	writel_relaxed((u32)value, (void *)(addr));
 }
 
-- 
2.25.1


