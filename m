From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Thu, 23 Dec 2021 12:09:08 +0100
Subject: [PATCH 1/1] lib: define memmove(), memcmp() as aliases
Message-ID: <20211223110908.9580-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

According to the GCC documentation the freestanding environment must provide
memcpy(), memmove(), memset(), and memcmp(). We already have defined
memcpy() and memset() as weak aliases for sbi_memcpy() and sbi_memset() in
commit d249d6544c3c ("lib: sbi: Fix compile errors using -Os option").
Do the same for memmove() and memcmp().

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_string.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index c67c02e..233be4e 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -167,6 +167,9 @@ void *sbi_memmove(void *dest, const void *src, size_t count)
 	return dest;
 }
 
+void *memmove(void *dest, const void *src, size_t count) \
+__attribute__((weak, alias("sbi_memmove")));
+
 int sbi_memcmp(const void *s1, const void *s2, size_t count)
 {
 	const char *temp1 = s1;
@@ -183,6 +186,9 @@ int sbi_memcmp(const void *s1, const void *s2, size_t count)
 		return 0;
 }
 
+int memcmp(const void *s1, const void *s2, size_t count) \
+__attribute__((weak, alias("sbi_memcmp")));
+
 void *sbi_memchr(const void *s, int c, size_t count)
 {
 	const unsigned char *temp = s;
-- 
2.33.1


