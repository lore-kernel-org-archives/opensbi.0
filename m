From: Xiang W <wxjstz@126.com>
Date: Fri, 13 Sep 2024 12:36:39 +0800
Subject: [PATCH] firmware: fw_base.S: fix multi-core boot bug.
Message-ID: <20240913043703.3781585-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "dong.yang" <dong.yang@sophgo.com>

In a multi-core startup scenario, if both _try_lottery and
_wait_for_boot_hart use the data in the _boot_status address, when
a CPU enters OpenSBI later than boot hart set the _boot_status to
BOOT_STATUS_BOOT_HART_DONE, the CPU will modify _boot_status to 1
by amoswap.w and will never be awakened in _wait_for_boot_hart.
So let _try_lottery and _boot_status use data from two addresses.

Signed-off-by: dong.yang <dong.yang@sophgo.com>
Reviewed-by: Xing Xiaoguang <xiaoguang.xing@sophgo.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index b950c0b..0971612 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -47,7 +47,7 @@ _start:
 	bne	a0, a6, _wait_for_boot_hart
 _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
-	lla	a6, _boot_status
+	lla	a6, _relocate_lottery
 	li	a7, BOOT_STATUS_LOTTERY_DONE
 	amoswap.w a6, a7, (a6)
 	bnez	a6, _wait_for_boot_hart
@@ -371,6 +371,8 @@ _skip_trap_handler_hyp:
 
 	.data
 	.align 3
+_relocate_lottery:
+	RISCV_PTR   0
 _boot_status:
 	RISCV_PTR	0
 
-- 
2.45.2


