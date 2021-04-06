From: Christoph Muellner <cmuellner@linux.com>
Date: Tue,  6 Apr 2021 03:53:52 +0200
Subject: [PATCH v3 1/3] include: types: Add __aligned(x) to define the minimum
 alignement
In-Reply-To: <20210406015354.332780-1-cmuellner@linux.com>
References: <20210406015354.332780-1-cmuellner@linux.com>
Message-ID: <20210406015354.332780-2-cmuellner@linux.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The __aligned(x) macro is a common wrapper around compiler's
aligned attribute, which allow to define the minimum alignement
of a data type. Let's add this macro.

Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 include/sbi/sbi_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index 0952d5c..38e3565 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -63,6 +63,7 @@ typedef unsigned long		physical_size_t;
 
 #define __packed		__attribute__((packed))
 #define __noreturn		__attribute__((noreturn))
+#define __aligned(x)		__attribute__((aligned(x)))
 
 #define likely(x) __builtin_expect((x), 1)
 #define unlikely(x) __builtin_expect((x), 0)
-- 
2.30.2


