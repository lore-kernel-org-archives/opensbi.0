From: Xiang W <wxjstz@126.com>
Date: Sat,  2 Mar 2024 15:42:21 +0800
Subject: [PATCH v5 2/8] firmware: fw_base.S: Simplify address get
In-Reply-To: <20240302074235.12643-1-wxjstz@126.com>
References: <20240302074235.12643-1-wxjstz@126.com>
Message-ID: <20240302074235.12643-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Simplify address get. Remove _link_start _link_end _load_start.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index cd94f15..d418041 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -52,15 +52,9 @@ _try_lottery:
 	amoadd.w a6, a7, (a6)
 	bnez	a6, _wait_for_boot_hart
 
-	/* Save load address */
-	lla	t0, _load_start
-	lla	t1, _fw_start
-	REG_S	t1, 0(t0)
-
 	/* relocate the global table content */
-	lla	t0, _link_start
-	REG_L	t0, 0(t0)
-	/* t1 shall has the address of _fw_start */
+	li	t0, FW_TEXT_START
+	lla	t1, _fw_start
 	sub	t2, t1, t0
 	lla	t0, __rel_dyn_start
 	lla	t1, __rel_dyn_end
@@ -398,12 +392,6 @@ _relocate_lottery:
 	RISCV_PTR	0
 _boot_status:
 	RISCV_PTR	0
-_load_start:
-	RISCV_PTR	_fw_start
-_link_start:
-	RISCV_PTR	FW_TEXT_START
-_link_end:
-	RISCV_PTR	_fw_reloc_end
 
 	.section .entry, "ax", %progbits
 	.align 3
-- 
2.43.0


