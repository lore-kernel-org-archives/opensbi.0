From: Abner Chang <abner.chang@hpe.com>
Date: Thu, 23 Jul 2020 09:54:02 +0800
Subject: [PATCH 1/3] Use standard C string APIs in FDT helper
In-Reply-To: <20200723015404.17667-1-abner.chang@hpe.com>
References: <20200723015404.17667-1-abner.chang@hpe.com>
Message-ID: <20200723015404.17667-2-abner.chang@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use strncmp instead of using sbi_strcmp directly in fdthelp.c.
- This commit add implementation of sbi_strncmp.

Signed-off-by: Abner Chang <abner.chang@hpe.com>

Cc: Atish Patra <atish.patra@wdc.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Daniel Schaefer <daniel.schaefer@hpe.com>
---
 include/sbi/sbi_string.h | 2 +-
 lib/sbi/sbi_string.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_string.h b/include/sbi/sbi_string.h
index 338075f..5e7304f 100644
--- a/include/sbi/sbi_string.h
+++ b/include/sbi/sbi_string.h
@@ -12,7 +12,7 @@
 
 #include <sbi/sbi_types.h>
 
-int sbi_strcmp(const char *a, const char *b);
+int sbi_strncmp(const char *a, const char *b, size_t count);
 
 size_t sbi_strlen(const char *str);
 
diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index 38b700b..c29120a 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -14,10 +14,10 @@
 
 #include <sbi/sbi_string.h>
 
-int sbi_strcmp(const char *a, const char *b)
+int sbi_strncmp(const char *a, const char *b, size_t count)
 {
 	/* search first diff or end of string */
-	for (; *a == *b && *a != '\0'; a++, b++)
+	for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
 		;
 
 	return *a - *b;
-- 
2.25.0


