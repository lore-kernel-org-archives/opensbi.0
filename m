From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 18 Jan 2023 10:18:56 +0800
Subject: [PATCH v2 3/6] include: types: add always inline compiler attribute
In-Reply-To: <20230118021859.27010-1-peterlin@andestech.com>
References: <20230118021859.27010-1-peterlin@andestech.com>
Message-ID: <20230118021859.27010-4-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide __always_inline to sbi_types header.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index 75cdddd..9c1fef3 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -62,6 +62,7 @@ typedef unsigned long		physical_size_t;
 #define __packed		__attribute__((packed))
 #define __noreturn		__attribute__((noreturn))
 #define __aligned(x)		__attribute__((aligned(x)))
+#define __always_inline	inline __attribute__((always_inline))
 
 #define likely(x) __builtin_expect((x), 1)
 #define unlikely(x) __builtin_expect((x), 0)
-- 
2.34.1


