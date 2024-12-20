From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 20 Dec 2024 16:02:04 +0000
Subject: [RFC 5/7] internal: add big/little endian to boot print
In-Reply-To: <20241220160206.1989527-1-ben.dooks@codethink.co.uk>
References: <20241220160206.1989527-1-ben.dooks@codethink.co.uk>
Message-ID: <20241220160206.1989527-6-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make a nice new banner for our big endian system.
---
 lib/sbi/sbi_init.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 8a2cfae..9009f78 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -32,6 +32,17 @@
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
 
+#ifdef CONFIG_OPENSBI_BE
+#define ENDIAN "big-endian "
+#define BANNER	\
+        "   ___                   ____  ____ ___    ____  _____ \n"	\
+        "  / _ \\ _ __   ___ _ __ / ___|| __ )_ _|  | __ )| ____|\n"	\
+        " | | | | '_ \\ / _ \\ '_ \\ \\ ___ \\|  _ \\| |   |  _ \\|  _|  \n"	\
+        " | |_| | |_) |  __/ | | |___) | |_) | |   | |_) | |___ \n"	\
+        "  \\___/| .__/ \\___|_| |_|____/|____/___|  |____/|_____|\n"	\
+        "       |_|                                             \n\n"
+#else
+#define ENDIAN "little-endian "
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
 	"  / __ \\                  / ____|  _ \\_   _|\n"  \
@@ -41,6 +52,8 @@
 	"  \\____/| .__/ \\___|_| |_|_____/|____/_____|\n"  \
 	"        | |\n"                                     \
 	"        |_|\n\n"
+#endif
+
 
 static void sbi_boot_print_banner(struct sbi_scratch *scratch)
 {
@@ -48,9 +61,9 @@ static void sbi_boot_print_banner(struct sbi_scratch *scratch)
 		return;
 
 #ifdef OPENSBI_VERSION_GIT
-	sbi_printf("\nOpenSBI %s\n", OPENSBI_VERSION_GIT);
+	sbi_printf("\nOpenSBI %s%s\n", ENDIAN, OPENSBI_VERSION_GIT);
 #else
-	sbi_printf("\nOpenSBI v%d.%d\n", OPENSBI_VERSION_MAJOR,
+	sbi_printf("\nOpenSBI %sv%d.%d\n", ENDIAN, OPENSBI_VERSION_MAJOR,
 		   OPENSBI_VERSION_MINOR);
 #endif
 
-- 
2.37.2.352.g3c44437643


