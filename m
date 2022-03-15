From: Xiang W <wxjstz@126.com>
Date: Wed, 16 Mar 2022 00:22:40 +0800
Subject: [PATCH 3/3] lib: Add error messages via conditional compilation for
 the future
In-Reply-To: <20220315162240.40990-1-wxjstz@126.com>
References: <20220315162240.40990-1-wxjstz@126.com>
Message-ID: <20220315162240.40990-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 128-bit machines, sbi_load_xx/sbi_store_xx needs to be improved.
Through this conditional compile, the corresponding implementation
can be prompted to be added.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_unpriv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
index 4246124..73b530c 100644
--- a/lib/sbi/sbi_unpriv.c
+++ b/lib/sbi/sbi_unpriv.c
@@ -83,7 +83,7 @@ DEFINE_UNPRIVILEGED_LOAD_FUNCTION(u32, lwu)
 DEFINE_UNPRIVILEGED_LOAD_FUNCTION(u64, ld)
 DEFINE_UNPRIVILEGED_STORE_FUNCTION(u64, sd)
 DEFINE_UNPRIVILEGED_LOAD_FUNCTION(ulong, ld)
-#else
+#elif __riscv_xlen == 32
 DEFINE_UNPRIVILEGED_LOAD_FUNCTION(u32, lw)
 DEFINE_UNPRIVILEGED_LOAD_FUNCTION(ulong, lw)
 
@@ -112,6 +112,8 @@ void sbi_store_u64(u64 *addr, u64 val,
 	if (trap->cause)
 		return;
 }
+#else
+# error "Unexpected __riscv_xlen"
 #endif
 
 ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
-- 
2.30.2


