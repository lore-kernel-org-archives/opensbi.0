From: Michael Neuling <michaelneuling@tenstorrent.com>
Date: Fri, 13 Dec 2024 04:14:21 +0000
Subject: [PATCH v2 2/2] Fix compiling with C23 enabled compilers
In-Reply-To: <20241213041421.2153806-1-michaelneuling@tenstorrent.com>
References: <20241213041421.2153806-1-michaelneuling@tenstorrent.com>
Message-ID: <20241213041421.2153806-2-michaelneuling@tenstorrent.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

C23 pre-definies bool so we need to gate our defines.

Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>
---
 include/sbi/sbi_types.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index a9943d299c..f051695ffd 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -44,7 +44,12 @@ typedef unsigned long long	uint64_t;
 #error "Unexpected __riscv_xlen"
 #endif
 
+#if __STDC_VERSION__ < 202311L
 typedef int			bool;
+#define true			1
+#define false			0
+#endif
+
 typedef unsigned long		ulong;
 typedef unsigned long		uintptr_t;
 typedef unsigned long		size_t;
@@ -61,9 +66,6 @@ typedef uint32_t		be32_t;
 typedef uint64_t		le64_t;
 typedef uint64_t		be64_t;
 
-#define true			1
-#define false			0
-
 #define NULL			((void *)0)
 
 #define __packed		__attribute__((packed))
-- 
2.34.1


