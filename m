From: Gabriel Somlo <gsomlo@gmail.com>
Date: Thu, 30 Mar 2023 16:25:30 -0400
Subject: [PATCH v5] docs: Correct FW_JUMP_FDT_ADDR calculation example
Message-ID: <20230330202530.2645471-1-gsomlo@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When using `PLATFORM=generic` defaults, the kernel is loaded at
`FW_JUMP_ADDR`, and the FDT is loaded at `FW_JUMP_FDT_ADDR.

Therefore, the maximum kernel size before `FW_JUMP_FDT_ADDR` must
be increased is `$(( FW_JUMP_FDT_ADDR - FW_JUMP_ADDR ))`.

The example calculation assumes `rv64`, and is wrong to boot
(off by 0x200000). Fix it and update it for the general case.

Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 docs/firmware/fw_jump.md | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
index 956897e..3e883fa 100644
--- a/docs/firmware/fw_jump.md
+++ b/docs/firmware/fw_jump.md
@@ -43,18 +43,18 @@ follows:
 
   When using the default *FW_JUMP_FDT_ADDR* with *PLATFORM=generic*, you must
   ensure *FW_JUMP_FDT_ADDR* is set high enough to avoid overwriting the kernel.
-  You can use the following method.
+  You can use the following method (e.g., using bash or zsh):
 
   ```
-  ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '/^ +[0-9]+ /\
-  {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' \
-  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
-  increase FW_JUMP_FDT_ADDR
+  ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '
+  /^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' |
+  (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) &&
+  echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
 
-  ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | \
-  awk -n '/^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}'\
-  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
-  increase FW_JUMP_FDT_ADDR
+  ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | awk -n '
+  /^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' |
+  (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) &&
+  echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
   ```
 
 *FW_JUMP* Example
-- 
2.39.2


