From: Xiang W <wxjstz@126.com>
Date: Wed, 19 Mar 2025 20:38:29 +0800
Subject: [PATCH] lib: sbi: Fix SHMEM_PHYS_ADDR for RV64
Message-ID: <20250319123832.505033-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Obtaining a 64-bit address under rv64 dose not require combining
32-bit registers

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_mpxy.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index c5d9d1bb..0a4c500e 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -66,13 +66,7 @@ static SBI_LIST_HEAD(mpxy_channel_list);
 #define CAP_DISABLE(_c, _m)	INSERT_FIELD(_c, _m, 0)
 #define CAP_GET(_c, _m)		EXTRACT_FIELD(_c, _m)
 
-#if __riscv_xlen == 64
 #define SHMEM_PHYS_ADDR(_hi, _lo) (_lo)
-#elif __riscv_xlen == 32
-#define SHMEM_PHYS_ADDR(_hi, _lo) (((u64)(_hi) << 32) | (_lo))
-#else
-#error "Undefined XLEN"
-#endif
 
 /** Per hart shared memory */
 struct mpxy_shmem {
-- 
2.47.2


