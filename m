From: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
Date: Mon, 12 Jul 2021 13:39:59 +0100
Subject: [PATCH 1/1] include: types: Use __builtin_offsetof when supported
Message-ID: <20210712123959.58251-1-Alexander.Richardson@cl.cam.ac.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Clang provides a __builtin_offsetof which can be detected using
__has_builtin().

Signed-off-by: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
---
 include/sbi/sbi_types.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index 38e3565..7fb1af7 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -68,8 +68,14 @@ typedef unsigned long		physical_size_t;
 #define likely(x) __builtin_expect((x), 1)
 #define unlikely(x) __builtin_expect((x), 0)
 
+#ifndef __has_builtin
+#define __has_builtin(...) 0
+#endif
+
 #undef offsetof
-#ifdef __compiler_offsetof
+#if __has_builtin(__builtin_offsetof)
+#define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE,MEMBER)
+#elif defined(__compiler_offsetof)
 #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE,MEMBER)
 #else
 #define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
-- 
2.32.0


