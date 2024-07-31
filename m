From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:51 -0700
Subject: [PATCH 10/16] lib: utils/serial: Constify FDT pointers in parsing functions
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-11-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that none of these functions modify the devicetree by
constifying the parameter type.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/serial/fdt_serial.h       | 2 +-
 lib/utils/serial/fdt_serial.c               | 2 +-
 lib/utils/serial/fdt_serial_cadence.c       | 2 +-
 lib/utils/serial/fdt_serial_gaisler.c       | 2 +-
 lib/utils/serial/fdt_serial_htif.c          | 2 +-
 lib/utils/serial/fdt_serial_litex.c         | 2 +-
 lib/utils/serial/fdt_serial_renesas_scif.c  | 2 +-
 lib/utils/serial/fdt_serial_shakti.c        | 4 ++--
 lib/utils/serial/fdt_serial_sifive.c        | 4 ++--
 lib/utils/serial/fdt_serial_uart8250.c      | 2 +-
 lib/utils/serial/fdt_serial_xlnx_uartlite.c | 4 ++--
 11 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/sbi_utils/serial/fdt_serial.h b/include/sbi_utils/serial/fdt_serial.h
index daa2e4f5..a0053a16 100644
--- a/include/sbi_utils/serial/fdt_serial.h
+++ b/include/sbi_utils/serial/fdt_serial.h
@@ -16,7 +16,7 @@
 
 struct fdt_serial {
 	const struct fdt_match *match_table;
-	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	int (*init)(const void *fdt, int nodeoff, const struct fdt_match *match);
 };
 
 int fdt_serial_init(void);
diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index 798ac749..6f995cf7 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -23,7 +23,7 @@ int fdt_serial_init(void)
 	struct fdt_serial *drv;
 	const struct fdt_match *match;
 	int pos, noff = -1, len, coff, rc;
-	void *fdt = fdt_get_address();
+	const void *fdt = fdt_get_address();
 
 	/* Find offset of node pointed to by stdout-path */
 	coff = fdt_path_offset(fdt, "/chosen");
diff --git a/lib/utils/serial/fdt_serial_cadence.c b/lib/utils/serial/fdt_serial_cadence.c
index ae59e4c1..ee7d7797 100644
--- a/lib/utils/serial/fdt_serial_cadence.c
+++ b/lib/utils/serial/fdt_serial_cadence.c
@@ -10,7 +10,7 @@
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/cadence-uart.h>
 
-static int serial_cadence_init(void *fdt, int nodeoff,
+static int serial_cadence_init(const void *fdt, int nodeoff,
 			       const struct fdt_match *match)
 {
 	int rc;
diff --git a/lib/utils/serial/fdt_serial_gaisler.c b/lib/utils/serial/fdt_serial_gaisler.c
index 74988e34..cae1727d 100644
--- a/lib/utils/serial/fdt_serial_gaisler.c
+++ b/lib/utils/serial/fdt_serial_gaisler.c
@@ -11,7 +11,7 @@
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/gaisler-uart.h>
 
-static int serial_gaisler_init(void *fdt, int nodeoff,
+static int serial_gaisler_init(const void *fdt, int nodeoff,
 			       const struct fdt_match *match)
 {
 	int rc;
diff --git a/lib/utils/serial/fdt_serial_htif.c b/lib/utils/serial/fdt_serial_htif.c
index 7d88e7a1..43557f6c 100644
--- a/lib/utils/serial/fdt_serial_htif.c
+++ b/lib/utils/serial/fdt_serial_htif.c
@@ -18,7 +18,7 @@ static const struct fdt_match serial_htif_match[] = {
 	{ },
 };
 
-static int serial_htif_init(void *fdt, int nodeoff,
+static int serial_htif_init(const void *fdt, int nodeoff,
 			    const struct fdt_match *match)
 {
 	int rc;
diff --git a/lib/utils/serial/fdt_serial_litex.c b/lib/utils/serial/fdt_serial_litex.c
index 3b3b306b..9aed719f 100644
--- a/lib/utils/serial/fdt_serial_litex.c
+++ b/lib/utils/serial/fdt_serial_litex.c
@@ -12,7 +12,7 @@
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/litex-uart.h>
 
-static int serial_litex_init(void *fdt, int nodeoff,
+static int serial_litex_init(const void *fdt, int nodeoff,
 			     const struct fdt_match *match)
 {
 	uint64_t reg_addr, reg_size;
diff --git a/lib/utils/serial/fdt_serial_renesas_scif.c b/lib/utils/serial/fdt_serial_renesas_scif.c
index c331ca1a..41356d1d 100644
--- a/lib/utils/serial/fdt_serial_renesas_scif.c
+++ b/lib/utils/serial/fdt_serial_renesas_scif.c
@@ -7,7 +7,7 @@
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/renesas-scif.h>
 
-static int serial_renesas_scif_init(void *fdt, int nodeoff,
+static int serial_renesas_scif_init(const void *fdt, int nodeoff,
 				    const struct fdt_match *match)
 {
 	struct platform_uart_data uart = { 0 };
diff --git a/lib/utils/serial/fdt_serial_shakti.c b/lib/utils/serial/fdt_serial_shakti.c
index 0e056303..2bafc99b 100644
--- a/lib/utils/serial/fdt_serial_shakti.c
+++ b/lib/utils/serial/fdt_serial_shakti.c
@@ -9,8 +9,8 @@
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/shakti-uart.h>
 
-static int serial_shakti_init(void *fdt, int nodeoff,
-				const struct fdt_match *match)
+static int serial_shakti_init(const void *fdt, int nodeoff,
+			      const struct fdt_match *match)
 {
 	int rc;
 	struct platform_uart_data uart = { 0 };
diff --git a/lib/utils/serial/fdt_serial_sifive.c b/lib/utils/serial/fdt_serial_sifive.c
index 3ca10913..f551b78c 100644
--- a/lib/utils/serial/fdt_serial_sifive.c
+++ b/lib/utils/serial/fdt_serial_sifive.c
@@ -11,8 +11,8 @@
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/sifive-uart.h>
 
-static int serial_sifive_init(void *fdt, int nodeoff,
-				const struct fdt_match *match)
+static int serial_sifive_init(const void *fdt, int nodeoff,
+			      const struct fdt_match *match)
 {
 	int rc;
 	struct platform_uart_data uart = { 0 };
diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
index 7b5d6a4c..10d201cc 100644
--- a/lib/utils/serial/fdt_serial_uart8250.c
+++ b/lib/utils/serial/fdt_serial_uart8250.c
@@ -11,7 +11,7 @@
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/uart8250.h>
 
-static int serial_uart8250_init(void *fdt, int nodeoff,
+static int serial_uart8250_init(const void *fdt, int nodeoff,
 				const struct fdt_match *match)
 {
 	int rc;
diff --git a/lib/utils/serial/fdt_serial_xlnx_uartlite.c b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
index 9f04aea3..0a829ad2 100644
--- a/lib/utils/serial/fdt_serial_xlnx_uartlite.c
+++ b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
@@ -11,8 +11,8 @@
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/xlnx_uartlite.h>
 
-static int serial_xlnx_uartlite_init(void *fdt, int nodeoff,
-				const struct fdt_match *match)
+static int serial_xlnx_uartlite_init(const void *fdt, int nodeoff,
+				     const struct fdt_match *match)
 {
 	int rc;
 	struct platform_uart_data uart = { 0 };
-- 
2.45.1


