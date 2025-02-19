From: zhangdongdong@eswincomputing.com <zhangdongdong@eswincomputing.com>
Date: Wed, 19 Feb 2025 09:57:26 +0800
Subject: [PATCH] lib: sbi: Fix potential garbage data in string copy functions
Message-ID: <20250219015726.8146-1-zhangdongdong@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

In the original implementation of `sbi_strcpy` and `sbi_strncpy`, if the
destination buffer (`dest`) was longer than the source string (`src`),
the functions did not ensure that the remaining bytes in `dest` were
properly null-terminated. This could result in garbage data being
present in the destination buffer after the copy operation, as the
functions only copied characters from `src` without explicitly
terminating `dest`.

Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
---
 lib/sbi/sbi_string.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index 9ebea69..f4f1394 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -68,22 +68,22 @@ char *sbi_strcpy(char *dest, const char *src)
 {
 	char *ret = dest;
 
-	while (*src != '\0') {
-		*dest++ = *src++;
+	while ((*dest++ = *src++) != '\0') {
 	}
-
 	return ret;
 }
 
 char *sbi_strncpy(char *dest, const char *src, size_t count)
 {
-	char *ret = dest;
+	char *tmp = dest;
 
-	while (count-- && *src != '\0') {
-		*dest++ = *src++;
+	while (count) {
+		if ((*tmp = *src) != 0)
+			src++;
+		tmp++;
+		count--;
 	}
-
-	return ret;
+	return dest;
 }
 
 char *sbi_strchr(const char *s, int c)
-- 
2.17.1


