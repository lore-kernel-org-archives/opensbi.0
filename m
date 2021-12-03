From: Tsukasa OI <research_trasio@irq.a4lg.com>
Date: Fri,  3 Dec 2021 10:13:56 +0900
Subject: [PATCH 1/1] docs/platform: spike: Enhance Spike examples
In-Reply-To: <cover.1638493883.git.research_trasio@irq.a4lg.com>
References: <cover.1638493883.git.research_trasio@irq.a4lg.com>
Message-ID: <92283da5b32c3fbec8f23df7bdb6f7c80ba435d6.1638493883.git.research_trasio@irq.a4lg.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This commit makes Spike usable as QEMU (in fact, those are based on
QEMU examples).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 docs/platform/spike.md | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/platform/spike.md b/docs/platform/spike.md
index 79e2eb2..bde9e13 100644
--- a/docs/platform/spike.md
+++ b/docs/platform/spike.md
@@ -43,7 +43,18 @@ make PLATFORM=generic FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Im
 
 Run:
 ```
-spike --initrd <path_to_cpio_ramdisk> build/platform/generic/firmware/fw_payload.elf
+spike -m256 \
+	--initrd <path_to_cpio_ramdisk> \
+	--bootargs 'root=/dev/ram rw console=hvc0 earlycon=sbi' \
+	build/platform/generic/firmware/fw_payload.elf
+```
+or
+```
+spike -m256 \
+	--kernel <linux_build_directory>/arch/riscv/boot/Image \
+	--initrd <path_to_cpio_ramdisk> \
+	--bootargs 'root=/dev/ram rw console=hvc0 earlycon=sbi' \
+	build/platform/generic/firmware/fw_jump.elf
 ```
 
 Execution on QEMU RISC-V 64-bit
-- 
2.32.0


