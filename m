From: Xiang W <wxjstz@126.com>
Date: Wed, 15 Sep 2021 21:53:51 +0800
Subject: [PATCH V3 2/2] lib: sbi: Add runtime bug detection for
 csr_read_num/csr_write_num/misa_string
In-Reply-To: <20210915135351.34295-1-wxjstz@126.com>
References: <20210915135351.34295-1-wxjstz@126.com>
Message-ID: <20210915135351.34295-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/riscv_asm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 4c24a51..281e50a 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -11,6 +11,7 @@
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_console.h>
 
 /* determine CPU extension, return non-zero support */
 int misa_extension_imp(char ext)
@@ -75,6 +76,7 @@ void misa_string(int xlen, char *out, unsigned int out_sz)
 			out[pos++] = '8';
 			break;
 		default:
+			BUG();
 			return;
 		}
 	}
@@ -134,6 +136,7 @@ unsigned long csr_read_num(int csr_num)
 #endif
 
 	default:
+		BUG();
 		break;
 	};
 
@@ -197,6 +200,7 @@ void csr_write_num(int csr_num, unsigned long val)
 	switchcase_csr_write_16(CSR_MHPMEVENT16, val)
 
 	default:
+		BUG();
 		break;
 	};
 
-- 
2.30.2


