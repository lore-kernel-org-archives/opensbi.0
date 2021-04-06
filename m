From: Xiang W <wxjstz@126.com>
Date: Tue,  6 Apr 2021 11:34:38 +0800
Subject: [PATCH] lib: fix atomic_add_return
Message-ID: <20210406033438.27687-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

unsigned length may be 4 bytes or 8 bytes, amoadd.w only applies to 4 bytes,
so submit this patch

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/riscv_atomic.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
index 558bca8..528686f 100644
--- a/lib/sbi/riscv_atomic.c
+++ b/lib/sbi/riscv_atomic.c
@@ -28,25 +28,23 @@ void atomic_write(atomic_t *atom, long value)
 long atomic_add_return(atomic_t *atom, long value)
 {
 	long ret;
-
+#if __SIZEOF_LONG__ == 4
 	__asm__ __volatile__("	amoadd.w.aqrl  %1, %2, %0"
 			     : "+A"(atom->counter), "=r"(ret)
 			     : "r"(value)
 			     : "memory");
-
+#elif __SIZEOF_LONG__ == 8
+	__asm__ __volatile__("	amoadd.d.aqrl  %1, %2, %0"
+			     : "+A"(atom->counter), "=r"(ret)
+			     : "r"(value)
+			     : "memory");
+#endif
 	return ret + value;
 }
 
 long atomic_sub_return(atomic_t *atom, long value)
 {
-	long ret;
-
-	__asm__ __volatile__("	amoadd.w.aqrl  %1, %2, %0"
-			     : "+A"(atom->counter), "=r"(ret)
-			     : "r"(-value)
-			     : "memory");
-
-	return ret - value;
+	return atomic_add_return(atom, -value);
 }
 
 #define __axchg(ptr, new, size)							\
-- 
2.20.1


