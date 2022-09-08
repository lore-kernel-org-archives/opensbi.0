From: Kautuk Consul <kconsul@ventanamicro.com>
Date: Thu,  8 Sep 2022 14:12:38 +0530
Subject: [PATCH 1/2] include: types: add __noinline macro
In-Reply-To: <20220908084239.3205866-1-kconsul@ventanamicro.com>
References: <20220908084239.3205866-1-kconsul@ventanamicro.com>
Message-ID: <20220908084239.3205866-2-kconsul@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add noinline macro to sbi_types.h similar to the Linux kernel.

Signed-off-by: Kautuk Consul <kconsul@ventanamicro.com>
---
 include/sbi/sbi_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index 7fb1af7..b1efed7 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -64,6 +64,7 @@ typedef unsigned long		physical_size_t;
 #define __packed		__attribute__((packed))
 #define __noreturn		__attribute__((noreturn))
 #define __aligned(x)		__attribute__((aligned(x)))
+#define __noinline		__attribute__((__noinline__))
 
 #define likely(x) __builtin_expect((x), 1)
 #define unlikely(x) __builtin_expect((x), 0)
-- 
2.34.1


