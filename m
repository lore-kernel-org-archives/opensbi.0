From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:56 -0700
Subject: [PATCH 15/16] lib: utils/serial: Pass the FDT to fdt_serial_init()
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-16-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that this function does not modify the FDT blob, and
deduplicate the call to fdt_get_address().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/serial/fdt_serial.h | 4 ++--
 lib/utils/serial/fdt_serial.c         | 3 +--
 platform/generic/platform.c           | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/sbi_utils/serial/fdt_serial.h b/include/sbi_utils/serial/fdt_serial.h
index a0053a16..572475c9 100644
--- a/include/sbi_utils/serial/fdt_serial.h
+++ b/include/sbi_utils/serial/fdt_serial.h
@@ -19,11 +19,11 @@ struct fdt_serial {
 	int (*init)(const void *fdt, int nodeoff, const struct fdt_match *match);
 };
 
-int fdt_serial_init(void);
+int fdt_serial_init(const void *fdt);
 
 #else
 
-static inline int fdt_serial_init(void) { return 0; }
+static inline int fdt_serial_init(const void *fdt) { return 0; }
 
 #endif
 
diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index 6f995cf7..a2a96cb2 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -17,13 +17,12 @@
 extern struct fdt_serial *fdt_serial_drivers[];
 extern unsigned long fdt_serial_drivers_size;
 
-int fdt_serial_init(void)
+int fdt_serial_init(const void *fdt)
 {
 	const void *prop;
 	struct fdt_serial *drv;
 	const struct fdt_match *match;
 	int pos, noff = -1, len, coff, rc;
-	const void *fdt = fdt_get_address();
 
 	/* Find offset of node pointed to by stdout-path */
 	coff = fdt_path_offset(fdt, "/chosen");
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 2850d55d..7c809b00 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -230,7 +230,7 @@ static int generic_early_init(bool cold_boot)
 		if (semihosting_enabled())
 			rc = semihosting_init();
 		else
-			rc = fdt_serial_init();
+			rc = fdt_serial_init(fdt);
 		if (rc)
 			return rc;
 	}
-- 
2.45.1


