From: Xiang W <wxjstz@126.com>
Date: Mon, 24 Jun 2024 22:18:59 +0800
Subject: [PATCH v2 3/3] lib: sbi: Make the console print buffer size configurable
In-Reply-To: <20240624141903.2305676-1-wxjstz@126.com>
References: <20240624141903.2305676-1-wxjstz@126.com>
Message-ID: <20240624141903.2305676-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Before the console is initialized, the contents of the console print
will be cached. If there is a lot of information that needs to be
output before the console is initialized, can configure it through
make menuconfig.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/Kconfig       | 4 ++++
 lib/sbi/sbi_console.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index 6cf54ce..fb6852e 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -62,4 +62,8 @@ config SBI_ECALL_SSE
 	bool "SSE extension"
 	default y
 
+config SBI_CONSOLE_TBUF_MAX
+	int "console print buffer size (bytes)"
+	default 256
+
 endmenu
diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 1a91f88..acf9f6b 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -14,7 +14,7 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 
-#define CONSOLE_TBUF_MAX 256
+#define CONSOLE_TBUF_MAX CONFIG_SBI_CONSOLE_TBUF_MAX
 
 static const struct sbi_console_device *console_dev = NULL;
 static char console_tbuf[CONSOLE_TBUF_MAX];
-- 
2.43.0


