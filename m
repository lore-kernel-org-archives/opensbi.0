From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 4 Jan 2023 14:29:24 +0800
Subject: [PATCH 3/6] include: types: add always inline compiler attribute
In-Reply-To: <20230104062927.15628-1-peterlin@andestech.com>
References: <20230104062927.15628-1-peterlin@andestech.com>
Message-ID: <20230104062927.15628-4-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide __always_inline to sbi_types header.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 include/sbi/sbi_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index 7fb1af7..c48d4d1 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -64,6 +64,7 @@ typedef unsigned long		physical_size_t;
 #define __packed		__attribute__((packed))
 #define __noreturn		__attribute__((noreturn))
 #define __aligned(x)		__attribute__((aligned(x)))
+#define __always_inline	inline __attribute__((always_inline))
 
 #define likely(x) __builtin_expect((x), 1)
 #define unlikely(x) __builtin_expect((x), 0)
-- 
2.34.1


