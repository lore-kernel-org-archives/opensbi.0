From: Abner Chang <abner.chang@hpe.com>
Date: Sat, 25 Jul 2020 17:30:39 +0800
Subject: [PATCH v2 1/3] Use standard C string APIs in FDT helper
In-Reply-To: <20200725093041.7373-1-abner.chang@hpe.com>
References: <20200725093041.7373-1-abner.chang@hpe.com>
Message-ID: <20200725093041.7373-2-abner.chang@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use strncmp instead of using sbi_strcmp directly in fdthelp.c.
- This commit add implementation of sbi_strncmp.

Signed-off-by: Abner Chang <abner.chang@hpe.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>

Cc: Atish Patra <atish.patra@wdc.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Daniel Schaefer <daniel.schaefer@hpe.com>
---
 include/sbi/sbi_string.h |  7 +++++++
 lib/sbi/sbi_string.c     | 13 +++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/sbi/sbi_string.h b/include/sbi/sbi_string.h
index 338075f..b7c2bc2 100644
--- a/include/sbi/sbi_string.h
+++ b/include/sbi/sbi_string.h
@@ -12,8 +12,15 @@
 
 #include <sbi/sbi_types.h>
 
+/*
+  Provides sbi_strcmp for the completeness of supporting string functions.
+  it is not recommended to use sbi_strcmp() but use sbi_strncmp instead.
+*/
+
 int sbi_strcmp(const char *a, const char *b);
 
+int sbi_strncmp(const char *a, const char *b, size_t count);
+
 size_t sbi_strlen(const char *str);
 
 size_t sbi_strnlen(const char *str, size_t count);
diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index 38b700b..7805ba4 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -14,6 +14,10 @@
 
 #include <sbi/sbi_string.h>
 
+/*
+  Provides sbi_strcmp for the completeness of supporting string functions.
+  it is not recommended to use sbi_strcmp() but use sbi_strncmp instead.
+*/
 int sbi_strcmp(const char *a, const char *b)
 {
 	/* search first diff or end of string */
@@ -23,6 +27,15 @@ int sbi_strcmp(const char *a, const char *b)
 	return *a - *b;
 }
 
+int sbi_strncmp(const char *a, const char *b, size_t count)
+{
+	/* search first diff or end of string */
+	for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
+		;
+
+	return *a - *b;
+}
+
 size_t sbi_strlen(const char *str)
 {
 	unsigned long ret = 0;
-- 
2.25.0


