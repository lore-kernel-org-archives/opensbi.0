From: Xiang W <wxjstz@126.com>
Date: Mon, 15 Jan 2024 23:19:19 +0800
Subject: [PATCH v2 3/4] firmware: fw_base.S: Simplify address get in _relocate
In-Reply-To: <20240115151930.392299-1-wxjstz@126.com>
References: <20240115151930.392299-1-wxjstz@126.com>
Message-ID: <20240115151930.392299-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Simplify address get in _relocate. Remove _link_end.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 0e1b6fb..3d88704 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -97,17 +97,14 @@ _wait_relocate_copy_done:
 	/* Relocate if load address != link address */
 _relocate:
 	lla	t0, _link_start
-	REG_L	t0, 0(t0)
-	lla	t1, _link_end
-	REG_L	t1, 0(t1)
-	lla	t2, _load_start
-	REG_L	t2, 0(t2)
+	REG_L	t0, 0(t0)	  /* link start */
+	lla	t2, _fw_start	  /* load start */
 	beq	t0, t2, _relocate_done
-	sub	t3, t1, t0
-	add	t3, t3, t2
+	sub	t6, t2, t0	  /* runtime offset */
+	lla	t3, _fw_reloc_end /* load end */
 	lla	t4, _relocate_done
-	sub	t4, t4, t2
-	add	t4, t4, t0
+	sub	t1, t3, t6	  /* link end */
+	sub	t4, t4, t6	  /* link _relocate_done */
 	blt	t2, t0, _relocate_copy_to_upper
 _relocate_copy_to_lower:
 	ble	t1, t2, _relocate_copy_to_lower_loop
@@ -506,8 +503,6 @@ _load_start:
 	RISCV_PTR	_fw_start
 _link_start:
 	RISCV_PTR	FW_TEXT_START
-_link_end:
-	RISCV_PTR	_fw_reloc_end
 
 	.section .entry, "ax", %progbits
 	.align 3
-- 
2.43.0


