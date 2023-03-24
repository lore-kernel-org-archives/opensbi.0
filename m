From: Gabriel Somlo <gsomlo@gmail.com>
Date: Fri, 24 Mar 2023 10:09:19 -0400
Subject: [PATCH v4] docs: Correct FW_JUMP_FDT_ADDR calculation example
Message-ID: <20230324140919.4050026-1-gsomlo@gmail.com>
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
---
 docs/firmware/fw_jump.md | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
index 956897e..ed3a43e 100644
--- a/docs/firmware/fw_jump.md
+++ b/docs/firmware/fw_jump.md
@@ -46,15 +46,15 @@ follows:
   You can use the following method.
 
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


