From: Xiang W <wxjstz@126.com>
Date: Wed, 15 Sep 2021 14:42:58 +0800
Subject: [PATCH 2/2] lib: sbi: Add runtime bug detection for
 csr_read_num/csr_write_num
In-Reply-To: <20210915064258.13064-1-wxjstz@126.com>
References: <20210915064258.13064-1-wxjstz@126.com>
Message-ID: <20210915064258.13064-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/riscv_asm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 4c24a51..ed9cee7 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -134,6 +134,7 @@ unsigned long csr_read_num(int csr_num)
 #endif
 
 	default:
+		BUG();
 		break;
 	};
 
@@ -197,6 +198,7 @@ void csr_write_num(int csr_num, unsigned long val)
 	switchcase_csr_write_16(CSR_MHPMEVENT16, val)
 
 	default:
+		BUG();
 		break;
 	};
 
-- 
2.30.2


