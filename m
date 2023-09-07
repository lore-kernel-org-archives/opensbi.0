From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  7 Sep 2023 17:19:46 +0530
Subject: [PATCH v1 6/7] lib: utils/serial: Add shared regions for serial drivers
In-Reply-To: <20230907114947.1705425-1-mchitale@ventanamicro.com>
References: <20230907114947.1705425-1-mchitale@ventanamicro.com>
Message-ID: <20230907114947.1705425-7-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The serial driver regions used by OpenSBI should be marked as a shared
read-write regions between M-mode and SU-mode as those are accessed
by earlycon and the corresponding tty serial drivers running in 'S' mode.
When the smepmp extension is enabled, PMP entries for these shared regions
will get programmed.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/serial/cadence-uart.c    |  6 +++++-
 lib/utils/serial/fdt_serial_htif.c | 10 ++++++++++
 lib/utils/serial/uart8250.c        |  7 ++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/lib/utils/serial/cadence-uart.c b/lib/utils/serial/cadence-uart.c
index 8a2b6ba..30fbb95 100644
--- a/lib/utils/serial/cadence-uart.c
+++ b/lib/utils/serial/cadence-uart.c
@@ -6,6 +6,8 @@
  * Author: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
  */
 
+#include <sbi/sbi_domain.h>
+#include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_console.h>
 #include <sbi_utils/serial/cadence-uart.h>
@@ -124,5 +126,7 @@ int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
 
 	sbi_console_set_device(&cadence_console);
 
-	return 0;
+	return sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
+					    (SBI_DOMAIN_MEMREGION_MMIO |
+					    SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 }
diff --git a/lib/utils/serial/fdt_serial_htif.c b/lib/utils/serial/fdt_serial_htif.c
index 61f66d6..631d01f 100644
--- a/lib/utils/serial/fdt_serial_htif.c
+++ b/lib/utils/serial/fdt_serial_htif.c
@@ -7,6 +7,8 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_domain.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/sys/htif.h>
@@ -19,6 +21,7 @@ static const struct fdt_match serial_htif_match[] = {
 static int serial_htif_init(void *fdt, int nodeoff,
 			    const struct fdt_match *match)
 {
+	int rc;
 	bool custom = false;
 	uint64_t fromhost_addr = 0, tohost_addr = 0;
 
@@ -29,6 +32,13 @@ static int serial_htif_init(void *fdt, int nodeoff,
 
 	fdt_get_node_addr_size(fdt, nodeoff, 1, &tohost_addr, NULL);
 
+	rc = sbi_domain_root_add_memrange(fromhost_addr, PAGE_SIZE, PAGE_SIZE,
+					  (SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_ENF_READABLE |
+					  SBI_DOMAIN_MEMREGION_ENF_WRITABLE));
+        if (rc)
+		return rc;
+
 	return htif_serial_init(custom, fromhost_addr, tohost_addr);
 }
 
diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 99bf1bf..4d158d3 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -7,8 +7,10 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
+#include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
 #include <sbi_utils/serial/uart8250.h>
 
 /* clang-format off */
@@ -133,5 +135,8 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
 
 	sbi_console_set_device(&uart8250_console);
 
-	return 0;
+	return sbi_domain_root_add_memrange(base + reg_offset, PAGE_SIZE,
+					    PAGE_SIZE,
+					    (SBI_DOMAIN_MEMREGION_MMIO |
+					    SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 }
-- 
2.34.1


