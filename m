From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri,  6 Jan 2023 12:22:03 +0100
Subject: [RFC PATCH 05/11] lib: sbi_hsm: Remove unnecessary include
In-Reply-To: <20230106112209.441825-1-ajones@ventanamicro.com>
References: <20230106112209.441825-1-ajones@ventanamicro.com>
Message-ID: <20230106112209.441825-6-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Also remove a superfluous semicolon and add a blank line.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_ecall_hsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index 703a824493b4..f1b41d073b22 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -12,7 +12,6 @@
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_trap.h>
-#include <sbi/sbi_version.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/riscv_asm.h>
@@ -45,7 +44,8 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 		break;
 	default:
 		ret = SBI_ENOTSUPP;
-	};
+	}
+
 	if (ret >= 0) {
 		*out_val = ret;
 		ret = 0;
-- 
2.39.0


