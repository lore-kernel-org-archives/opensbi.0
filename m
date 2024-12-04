From: Michael Neuling <michaelneuling@tenstorrent.com>
Date: Wed,  4 Dec 2024 05:54:51 +0000
Subject: [PATCH 1/2] lib: utils/serial: Cleanup int vs bool in semihosting_init() definitions
Message-ID: <20241204055452.652401-1-michaelneuling@tenstorrent.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These are inconsistent. This is also needed for a future patches to
enable C23 language dialect.

Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>
---
 include/sbi_utils/serial/semihosting.h | 8 ++++----
 lib/utils/serial/semihosting.c         | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sbi_utils/serial/semihosting.h b/include/sbi_utils/serial/semihosting.h
index 8cc4a86c3a..0ef20cc2e4 100644
--- a/include/sbi_utils/serial/semihosting.h
+++ b/include/sbi_utils/serial/semihosting.h
@@ -37,11 +37,11 @@ enum semihosting_open_mode {
 };
 
 #ifdef CONFIG_SERIAL_SEMIHOSTING
-int semihosting_init(void);
-int semihosting_enabled(void);
+bool semihosting_init(void);
+bool semihosting_enabled(void);
 #else
-static inline int semihosting_init(void) { return SBI_ENODEV; }
-static inline int semihosting_enabled(void) { return 0; }
+static inline bool semihosting_init(void) { return SBI_ENODEV; }
+static inline bool semihosting_enabled(void) { return 0; }
 #endif
 
 #endif
diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
index 19ebaa07e3..320a5834d6 100644
--- a/lib/utils/serial/semihosting.c
+++ b/lib/utils/serial/semihosting.c
@@ -198,12 +198,12 @@ static struct sbi_console_device semihosting_console = {
 	.console_getc = semihosting_getc
 };
 
-int semihosting_init(void)
+bool semihosting_init(void)
 {
 	semihosting_infd = semihosting_open(":tt", MODE_READ);
 	semihosting_outfd = semihosting_open(":tt", MODE_WRITE);
 
 	sbi_console_set_device(&semihosting_console);
 
-	return 0;
+	return false;
 }
-- 
2.34.1


