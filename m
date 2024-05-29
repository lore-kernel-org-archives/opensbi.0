From: Pope B.Lei <popeblei@gmail.com>
Date: Wed, 29 May 2024 15:37:47 +0800
Subject: [PATCH v1] "Reset registers to enhance robustness."
Message-ID: <20240529073747.505-1-popeblei@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Pope B.Lei <popeblei@gmail.com>
---
V1: If the registers are not initialized, they may remain in an x-state in certain DV verification environments due to the lack of written values, causing the x-state to propagate during the boot process. Adding register initialization enhances robustness.
 firmware/fw_base.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index b950c0b..10889a9 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -36,6 +36,8 @@
 	.globl _start
 	.globl _start_warm
 _start:
+	/* Reset registers to enhance robustness. */
+	call	_reset_regs
 	/* Find preferred boot HART id */
 	MOV_3R	s0, a0, s1, a1, s2, a2
 	call	fw_boot_hart
-- 
2.35.2.windows.1


