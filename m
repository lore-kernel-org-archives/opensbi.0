From: Abner Chang <abner.chang@hpe.com>
Date: Thu, 23 Jul 2020 09:54:03 +0800
Subject: [PATCH 2/3] Use standard C string APIs in FDT helper
In-Reply-To: <20200723015404.17667-1-abner.chang@hpe.com>
References: <20200723015404.17667-1-abner.chang@hpe.com>
Message-ID: <20200723015404.17667-3-abner.chang@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use strncmp instead of using sbi_strcmp directly in fdthelp.c.
- This commit add a macro to replace strncmp with sbi_strncmp.

Signed-off-by: Abner Chang <abner.chang@hpe.com>

Cc: Atish Patra <atish.patra@wdc.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Daniel Schaefer <daniel.schaefer@hpe.com>
---
 lib/utils/libfdt/libfdt_env.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/libfdt/libfdt_env.h b/lib/utils/libfdt/libfdt_env.h
index 7fcfe01..a9be6a8 100644
--- a/lib/utils/libfdt/libfdt_env.h
+++ b/lib/utils/libfdt/libfdt_env.h
@@ -31,9 +31,9 @@
 #define strchr		sbi_strchr
 #define strrchr		sbi_strrchr
 #define strcpy		sbi_strcpy
-#define strcmp		sbi_strcmp
 #define strlen		sbi_strlen
 #define strnlen		sbi_strnlen
+#define strncmp		sbi_strncmp
 
 typedef uint16_t FDT_BITWISE fdt16_t;
 typedef uint32_t FDT_BITWISE fdt32_t;
-- 
2.25.0


