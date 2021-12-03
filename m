From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  3 Dec 2021 10:33:34 +0530
Subject: [PATCH v4 2/2] lib: sbi: Fix compile errors using -Os option
In-Reply-To: <20211203050334.729392-1-anup.patel@wdc.com>
References: <20211203050334.729392-1-anup.patel@wdc.com>
Message-ID: <20211203050334.729392-3-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When compiling with -Os option along with -ffreestanding, both GCC
and clang will add implicit calls to memcpy() and memset() for stack
variables initialized in declaration.

The C standard as per Clause 4, the compiler cannot necessarily
assume that anything beyond:

 * float.h
 * iso646.h
 * limits.h
 * stdalign.h
 * stdarg.h
 * stdbool.h
 * stddef.h
 * stdint.h
 * stdnoreturn.h
 * fenv.h
 * math.h
 * and the numeric conversion functions of stdlib.h.

This patch maps memcpy() and memset() as weak-alias of sbi_memcpy()
and sbi_memset() respectively so that implicit calls to memcpy()
and memset() will compile properly.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_string.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index c87bce9..c67c02e 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -122,6 +122,9 @@ void *sbi_memset(void *s, int c, size_t count)
 	return s;
 }
 
+void *memset(void *s, int c, size_t count) \
+__attribute__((weak, alias("sbi_memset")));
+
 void *sbi_memcpy(void *dest, const void *src, size_t count)
 {
 	char *temp1	  = dest;
@@ -135,6 +138,9 @@ void *sbi_memcpy(void *dest, const void *src, size_t count)
 	return dest;
 }
 
+void *memcpy(void *dest, const void *src, size_t count) \
+__attribute__((weak, alias("sbi_memcpy")));
+
 void *sbi_memmove(void *dest, const void *src, size_t count)
 {
 	char *temp1	  = (char *)dest;
-- 
2.25.1


