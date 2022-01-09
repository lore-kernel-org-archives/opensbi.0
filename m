From: Anup Patel <apatel@ventanamicro.com>
Date: Sun,  9 Jan 2022 20:50:36 +0530
Subject: [PATCH v2 2/2] lib: utils/sys: Extend HTIF library to allow custom
 base address
In-Reply-To: <20220109152036.28666-1-apatel@ventanamicro.com>
References: <20220109152036.28666-1-apatel@ventanamicro.com>
Message-ID: <20220109152036.28666-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some of RISC-V emulators provide HTIF at fixed base address so for
such emulators users have to hard-code HTIF base address in the
linker script.

To address this problem, we let users optionally provide fixed HTIF
base address via platform support (or device tree).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
---
 include/sbi_utils/sys/htif.h       |  8 ++-
 lib/utils/reset/fdt_reset_htif.c   | 12 ++++-
 lib/utils/serial/fdt_serial_htif.c | 12 ++++-
 lib/utils/sys/htif.c               | 85 ++++++++++++++++++++++++++----
 4 files changed, 103 insertions(+), 14 deletions(-)

diff --git a/include/sbi_utils/sys/htif.h b/include/sbi_utils/sys/htif.h
index 9cc9634..78784cf 100644
--- a/include/sbi_utils/sys/htif.h
+++ b/include/sbi_utils/sys/htif.h
@@ -10,8 +10,12 @@
 
 #include <sbi/sbi_types.h>
 
-int htif_serial_init(void);
+int htif_serial_init(bool custom_addr,
+		     unsigned long custom_fromhost_addr,
+		     unsigned long custom_tohost_addr);
 
-int htif_system_reset_init(void);
+int htif_system_reset_init(bool custom_addr,
+			   unsigned long custom_fromhost_addr,
+			   unsigned long custom_tohost_addr);
 
 #endif
diff --git a/lib/utils/reset/fdt_reset_htif.c b/lib/utils/reset/fdt_reset_htif.c
index dd08660..2cc52dd 100644
--- a/lib/utils/reset/fdt_reset_htif.c
+++ b/lib/utils/reset/fdt_reset_htif.c
@@ -14,7 +14,17 @@
 static int htif_reset_init(void *fdt, int nodeoff,
 			   const struct fdt_match *match)
 {
-	return htif_system_reset_init();
+	bool custom = false;
+	uint64_t fromhost_addr = 0, tohost_addr = 0;
+
+	if (!fdt_get_node_addr_size(fdt, nodeoff, 0, &fromhost_addr, NULL)) {
+		custom = true;
+		tohost_addr = fromhost_addr + sizeof(uint64_t);
+	}
+
+	fdt_get_node_addr_size(fdt, nodeoff, 1, &tohost_addr, NULL);
+
+	return htif_system_reset_init(custom, fromhost_addr, tohost_addr);
 }
 
 static const struct fdt_match htif_reset_match[] = {
diff --git a/lib/utils/serial/fdt_serial_htif.c b/lib/utils/serial/fdt_serial_htif.c
index fae55b8..61f66d6 100644
--- a/lib/utils/serial/fdt_serial_htif.c
+++ b/lib/utils/serial/fdt_serial_htif.c
@@ -19,7 +19,17 @@ static const struct fdt_match serial_htif_match[] = {
 static int serial_htif_init(void *fdt, int nodeoff,
 			    const struct fdt_match *match)
 {
-	return htif_serial_init();
+	bool custom = false;
+	uint64_t fromhost_addr = 0, tohost_addr = 0;
+
+	if (!fdt_get_node_addr_size(fdt, nodeoff, 0, &fromhost_addr, NULL)) {
+		custom = true;
+		tohost_addr = fromhost_addr + sizeof(uint64_t);
+	}
+
+	fdt_get_node_addr_size(fdt, nodeoff, 1, &tohost_addr, NULL);
+
+	return htif_serial_init(custom, fromhost_addr, tohost_addr);
 }
 
 struct fdt_serial fdt_serial_htif = {
diff --git a/lib/utils/sys/htif.c b/lib/utils/sys/htif.c
index 7c69c7f..d7cbeaf 100644
--- a/lib/utils/sys/htif.c
+++ b/lib/utils/sys/htif.c
@@ -7,6 +7,7 @@
 
 #include <sbi/riscv_locks.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
 #include <sbi/sbi_system.h>
 #include <sbi_utils/sys/htif.h>
 
@@ -47,15 +48,46 @@
 
 volatile uint64_t tohost __attribute__((section(".htif")));
 volatile uint64_t fromhost __attribute__((section(".htif")));
+
+static uint64_t *htif_fromhost = NULL;
+static uint64_t *htif_tohost = NULL;
+static bool htif_custom = false;
+
 static int htif_console_buf;
 static spinlock_t htif_lock = SPIN_LOCK_INITIALIZER;
 
+static inline uint64_t __read_tohost(void)
+{
+	return (htif_custom) ? *htif_tohost : tohost;
+}
+
+static inline void __write_tohost(uint64_t val)
+{
+	if (htif_custom)
+		*htif_tohost = val;
+	else
+		tohost = val;
+}
+
+static inline uint64_t __read_fromhost(void)
+{
+	return (htif_custom) ? *htif_fromhost : fromhost;
+}
+
+static inline void __write_fromhost(uint64_t val)
+{
+	if (htif_custom)
+		*htif_fromhost = val;
+	else
+		fromhost = val;
+}
+
 static void __check_fromhost()
 {
-	uint64_t fh = fromhost;
+	uint64_t fh = __read_fromhost();
 	if (!fh)
 		return;
-	fromhost = 0;
+	__write_fromhost(0);
 
 	/* this should be from the console */
 	if (FROMHOST_DEV(fh) != HTIF_DEV_CONSOLE)
@@ -73,9 +105,26 @@ static void __check_fromhost()
 
 static void __set_tohost(uint64_t dev, uint64_t cmd, uint64_t data)
 {
-	while (tohost)
+	while (__read_tohost())
 		__check_fromhost();
-	tohost = TOHOST_CMD(dev, cmd, data);
+	__write_tohost(TOHOST_CMD(dev, cmd, data));
+}
+
+static int set_custom_addr(bool custom_addr,
+			   unsigned long custom_fromhost_addr,
+			   unsigned long custom_tohost_addr)
+{
+	if (custom_addr) {
+		if (htif_custom &&
+		    ((custom_fromhost_addr != (unsigned long)htif_fromhost) ||
+		     (custom_tohost_addr != (unsigned long)htif_tohost)))
+			return SBI_EINVAL;
+		htif_fromhost = (uint64_t *)custom_fromhost_addr;
+		htif_tohost = (uint64_t *)custom_tohost_addr;
+		htif_custom = true;
+	}
+
+	return 0;
 }
 
 #if __riscv_xlen == 32
@@ -148,10 +197,18 @@ static struct sbi_console_device htif_console = {
 	.console_getc = htif_getc
 };
 
-int htif_serial_init(void)
+int htif_serial_init(bool custom_addr,
+		     unsigned long custom_fromhost_addr,
+		     unsigned long custom_tohost_addr)
 {
-	sbi_console_set_device(&htif_console);
+	int rc;
+
+	rc = set_custom_addr(custom_addr, custom_fromhost_addr,
+			     custom_tohost_addr);
+	if (rc)
+		return rc;
 
+	sbi_console_set_device(&htif_console);
 	return 0;
 }
 
@@ -163,8 +220,8 @@ static int htif_system_reset_check(u32 type, u32 reason)
 static void htif_system_reset(u32 type, u32 reason)
 {
 	while (1) {
-		fromhost = 0;
-		tohost = 1;
+		__write_fromhost(0);
+		__write_tohost(1);
 	}
 }
 
@@ -174,9 +231,17 @@ static struct sbi_system_reset_device htif_reset = {
 	.system_reset = htif_system_reset
 };
 
-int htif_system_reset_init(void)
+int htif_system_reset_init(bool custom_addr,
+			   unsigned long custom_fromhost_addr,
+			   unsigned long custom_tohost_addr)
 {
-	sbi_system_reset_add_device(&htif_reset);
+	int rc;
+
+	rc = set_custom_addr(custom_addr, custom_fromhost_addr,
+			     custom_tohost_addr);
+	if (rc)
+		return rc;
 
+	sbi_system_reset_add_device(&htif_reset);
 	return 0;
 }
-- 
2.25.1


