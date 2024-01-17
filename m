From: Xiang W <wxjstz@126.com>
Date: Wed, 17 Jan 2024 18:41:59 +0800
Subject: [PATCH v3 02/10] firmware: fw_base.S: remove _runtime_offset
In-Reply-To: <20240117104212.1055737-1-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com>
Message-ID: <20240117104212.1055737-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

_runtime_offset is a variable not used elsewhere, so remove it.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 2f30d00..0e1b6fb 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -74,8 +74,6 @@ _try_lottery:
 	REG_L	t0, 0(t0)
 	/* t1 shall has the address of _fw_start */
 	sub	t2, t1, t0
-	lla	t3, _runtime_offset
-	REG_S	t2, (t3)
 	lla	t0, __rel_dyn_start
 	lla	t1, __rel_dyn_end
 	beq	t0, t1, _relocate_done
@@ -500,10 +498,6 @@ _skip_trap_exit_rv32_hyp:
 
 	.data
 	.align 3
-#ifdef FW_PIC
-_runtime_offset:
-	RISCV_PTR	0
-#endif
 _relocate_lottery:
 	RISCV_PTR	0
 _boot_status:
-- 
2.43.0


