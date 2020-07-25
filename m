From: Abner Chang <abner.chang@hpe.com>
Date: Sat, 25 Jul 2020 17:30:40 +0800
Subject: [PATCH v2 2/3] Use standard C string APIs in FDT helper
In-Reply-To: <20200725093041.7373-1-abner.chang@hpe.com>
References: <20200725093041.7373-1-abner.chang@hpe.com>
Message-ID: <20200725093041.7373-3-abner.chang@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use strncmp instead of using sbi_strcmp directly in fdthelp.c.
- This commit add a macro to replace strncmp with sbi_strncmp.

Signed-off-by: Abner Chang <abner.chang@hpe.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>

Cc: Atish Patra <atish.patra@wdc.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Daniel Schaefer <daniel.schaefer@hpe.com>
---
 lib/utils/libfdt/libfdt_env.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/utils/libfdt/libfdt_env.h b/lib/utils/libfdt/libfdt_env.h
index 7fcfe01..bc3e758 100644
--- a/lib/utils/libfdt/libfdt_env.h
+++ b/lib/utils/libfdt/libfdt_env.h
@@ -32,6 +32,7 @@
 #define strrchr		sbi_strrchr
 #define strcpy		sbi_strcpy
 #define strcmp		sbi_strcmp
+#define strncmp		sbi_strncmp
 #define strlen		sbi_strlen
 #define strnlen		sbi_strnlen
 
-- 
2.25.0


