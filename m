From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Nov 2024 14:02:54 -0800
Subject: [PATCH v2 10/11] lib: utils/serial: Use fdt_driver for initialization
In-Reply-To: <20241111220304.1228821-1-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
Message-ID: <20241111220304.1228821-11-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The serial driver subsystem does not need any extra data, so it can use
`struct fdt_driver` directly. The generic fdt_serial_init() first
attempts to match the chosen stdout device, and upon failure matches the
first available serial device in the DT. It is a fatal error if no such
device is found. This matches the behavior of fdt_driver_init_one().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 include/sbi_utils/serial/fdt_serial.h       |  6 +--
 lib/utils/serial/fdt_serial.c               | 52 +++------------------
 lib/utils/serial/fdt_serial_cadence.c       |  2 +-
 lib/utils/serial/fdt_serial_drivers.carray  |  2 +-
 lib/utils/serial/fdt_serial_gaisler.c       |  2 +-
 lib/utils/serial/fdt_serial_htif.c          |  2 +-
 lib/utils/serial/fdt_serial_litex.c         |  2 +-
 lib/utils/serial/fdt_serial_renesas_scif.c  |  2 +-
 lib/utils/serial/fdt_serial_shakti.c        |  2 +-
 lib/utils/serial/fdt_serial_sifive.c        |  2 +-
 lib/utils/serial/fdt_serial_uart8250.c      |  2 +-
 lib/utils/serial/fdt_serial_xlnx_uartlite.c |  2 +-
 12 files changed, 18 insertions(+), 60 deletions(-)

diff --git a/include/sbi_utils/serial/fdt_serial.h b/include/sbi_utils/serial/fdt_serial.h
index 572475c9..57776105 100644
--- a/include/sbi_utils/serial/fdt_serial.h
+++ b/include/sbi_utils/serial/fdt_serial.h
@@ -11,14 +11,10 @@
 #define __FDT_SERIAL_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 
 #ifdef CONFIG_FDT_SERIAL
 
-struct fdt_serial {
-	const struct fdt_match *match_table;
-	int (*init)(const void *fdt, int nodeoff, const struct fdt_match *match);
-};
-
 int fdt_serial_init(const void *fdt);
 
 #else
diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index a7129bdd..b0fa82bc 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -9,19 +9,16 @@
 
 #include <libfdt.h>
 #include <sbi/sbi_error.h>
-#include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/serial/fdt_serial.h>
 
 /* List of FDT serial drivers generated at compile time */
-extern struct fdt_serial *const fdt_serial_drivers[];
+extern const struct fdt_driver *const fdt_serial_drivers[];
 
 int fdt_serial_init(const void *fdt)
 {
 	const void *prop;
-	struct fdt_serial *drv;
-	const struct fdt_match *match;
-	int pos, noff = -1, len, coff, rc;
+	int noff = -1, len, coff, rc;
 
 	/* Find offset of node pointed to by stdout-path */
 	coff = fdt_path_offset(fdt, "/chosen");
@@ -38,50 +35,15 @@ int fdt_serial_init(const void *fdt)
 			else
 				noff = fdt_path_offset(fdt, prop);
 		}
-		if (-1 < noff) {
-			if (!fdt_node_is_enabled(fdt, noff))
-				noff = -1;
-		}
 	}
 
 	/* First check DT node pointed by stdout-path */
-	for (pos = 0; fdt_serial_drivers[pos] && -1 < noff; pos++) {
-		drv = fdt_serial_drivers[pos];
-
-		match = fdt_match_node(fdt, noff, drv->match_table);
-		if (!match)
-			continue;
-
-		/* drv->init must not be NULL */
-		if (drv->init == NULL)
-			return SBI_EFAIL;
-
-		rc = drv->init(fdt, noff, match);
-		if (rc == SBI_ENODEV)
-			continue;
-		return rc;
-	}
-
-	/* Lastly check all DT nodes */
-	for (pos = 0; fdt_serial_drivers[pos]; pos++) {
-		drv = fdt_serial_drivers[pos];
-
-		noff = -1;
-		while ((noff = fdt_find_match(fdt, noff,
-					drv->match_table, &match)) >= 0) {
-			if (!fdt_node_is_enabled(fdt, noff))
-				continue;
-
-			/* drv->init must not be NULL */
-			if (drv->init == NULL)
-				return SBI_EFAIL;
-
-			rc = drv->init(fdt, noff, match);
-			if (rc == SBI_ENODEV)
-				continue;
+	if (-1 < noff) {
+		rc = fdt_driver_init_by_offset(fdt, noff, fdt_serial_drivers);
+		if (rc != SBI_ENODEV)
 			return rc;
-		}
 	}
 
-	return SBI_ENODEV;
+	/* Lastly check all DT nodes */
+	return fdt_driver_init_one(fdt, fdt_serial_drivers);
 }
diff --git a/lib/utils/serial/fdt_serial_cadence.c b/lib/utils/serial/fdt_serial_cadence.c
index ee7d7797..0a497a41 100644
--- a/lib/utils/serial/fdt_serial_cadence.c
+++ b/lib/utils/serial/fdt_serial_cadence.c
@@ -30,7 +30,7 @@ static const struct fdt_match serial_cadence_match[] = {
 	{ },
 };
 
-struct fdt_serial fdt_serial_cadence = {
+const struct fdt_driver fdt_serial_cadence = {
 	.match_table = serial_cadence_match,
 	.init = serial_cadence_init
 };
diff --git a/lib/utils/serial/fdt_serial_drivers.carray b/lib/utils/serial/fdt_serial_drivers.carray
index 3517b2c8..4336f4e1 100644
--- a/lib/utils/serial/fdt_serial_drivers.carray
+++ b/lib/utils/serial/fdt_serial_drivers.carray
@@ -1,3 +1,3 @@
 HEADER: sbi_utils/serial/fdt_serial.h
-TYPE: struct fdt_serial
+TYPE: const struct fdt_driver
 NAME: fdt_serial_drivers
diff --git a/lib/utils/serial/fdt_serial_gaisler.c b/lib/utils/serial/fdt_serial_gaisler.c
index cae1727d..bf2ee284 100644
--- a/lib/utils/serial/fdt_serial_gaisler.c
+++ b/lib/utils/serial/fdt_serial_gaisler.c
@@ -29,7 +29,7 @@ static const struct fdt_match serial_gaisler_match[] = {
 	{},
 };
 
-struct fdt_serial fdt_serial_gaisler = {
+const struct fdt_driver fdt_serial_gaisler = {
 	.match_table = serial_gaisler_match,
 	.init = serial_gaisler_init
 };
diff --git a/lib/utils/serial/fdt_serial_htif.c b/lib/utils/serial/fdt_serial_htif.c
index 43557f6c..b95caf1e 100644
--- a/lib/utils/serial/fdt_serial_htif.c
+++ b/lib/utils/serial/fdt_serial_htif.c
@@ -41,7 +41,7 @@ static int serial_htif_init(const void *fdt, int nodeoff,
 	return htif_serial_init(custom, fromhost_addr, tohost_addr);
 }
 
-struct fdt_serial fdt_serial_htif = {
+const struct fdt_driver fdt_serial_htif = {
 	.match_table = serial_htif_match,
 	.init = serial_htif_init
 };
diff --git a/lib/utils/serial/fdt_serial_litex.c b/lib/utils/serial/fdt_serial_litex.c
index 9aed719f..7c479119 100644
--- a/lib/utils/serial/fdt_serial_litex.c
+++ b/lib/utils/serial/fdt_serial_litex.c
@@ -33,7 +33,7 @@ static const struct fdt_match serial_litex_match[] = {
 	{ },
 };
 
-struct fdt_serial fdt_serial_litex = {
+const struct fdt_driver fdt_serial_litex = {
 	.match_table = serial_litex_match,
 	.init = serial_litex_init
 };
diff --git a/lib/utils/serial/fdt_serial_renesas_scif.c b/lib/utils/serial/fdt_serial_renesas_scif.c
index 41356d1d..b42e1c45 100644
--- a/lib/utils/serial/fdt_serial_renesas_scif.c
+++ b/lib/utils/serial/fdt_serial_renesas_scif.c
@@ -25,7 +25,7 @@ static const struct fdt_match serial_renesas_scif_match[] = {
 	{ /* sentinel */ }
 };
 
-struct fdt_serial fdt_serial_renesas_scif = {
+const struct fdt_driver fdt_serial_renesas_scif = {
 	.match_table = serial_renesas_scif_match,
 	.init = serial_renesas_scif_init
 };
diff --git a/lib/utils/serial/fdt_serial_shakti.c b/lib/utils/serial/fdt_serial_shakti.c
index 2bafc99b..7a324643 100644
--- a/lib/utils/serial/fdt_serial_shakti.c
+++ b/lib/utils/serial/fdt_serial_shakti.c
@@ -27,7 +27,7 @@ static const struct fdt_match serial_shakti_match[] = {
 	{ },
 };
 
-struct fdt_serial fdt_serial_shakti = {
+const struct fdt_driver fdt_serial_shakti = {
 	.match_table = serial_shakti_match,
 	.init = serial_shakti_init
 };
diff --git a/lib/utils/serial/fdt_serial_sifive.c b/lib/utils/serial/fdt_serial_sifive.c
index f551b78c..b1811ee9 100644
--- a/lib/utils/serial/fdt_serial_sifive.c
+++ b/lib/utils/serial/fdt_serial_sifive.c
@@ -30,7 +30,7 @@ static const struct fdt_match serial_sifive_match[] = {
 	{ },
 };
 
-struct fdt_serial fdt_serial_sifive = {
+const struct fdt_driver fdt_serial_sifive = {
 	.match_table = serial_sifive_match,
 	.init = serial_sifive_init
 };
diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
index 10d201cc..af5ceac9 100644
--- a/lib/utils/serial/fdt_serial_uart8250.c
+++ b/lib/utils/serial/fdt_serial_uart8250.c
@@ -33,7 +33,7 @@ static const struct fdt_match serial_uart8250_match[] = {
 	{ },
 };
 
-struct fdt_serial fdt_serial_uart8250 = {
+const struct fdt_driver fdt_serial_uart8250 = {
 	.match_table = serial_uart8250_match,
 	.init = serial_uart8250_init,
 };
diff --git a/lib/utils/serial/fdt_serial_xlnx_uartlite.c b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
index 0a829ad2..78e3ffe4 100644
--- a/lib/utils/serial/fdt_serial_xlnx_uartlite.c
+++ b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
@@ -29,7 +29,7 @@ static const struct fdt_match serial_xlnx_uartlite_match[] = {
 	{ },
 };
 
-struct fdt_serial fdt_serial_xlnx_uartlite = {
+const struct fdt_driver fdt_serial_xlnx_uartlite = {
 	.match_table = serial_xlnx_uartlite_match,
 	.init = serial_xlnx_uartlite_init,
 };
-- 
2.45.1


