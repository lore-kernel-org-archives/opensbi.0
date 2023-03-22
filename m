From: Gabriel Somlo <gsomlo@gmail.com>
Date: Wed, 22 Mar 2023 13:04:48 -0400
Subject: [PATCH v1] docs: Correct FW_JUMP_FDT_ADDR calculation example
Message-ID: <20230322170448.3600124-1-gsomlo@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When using `PLATFORM=generic` defaults, the kernel is loaded at
`FW_JUMP_ADDR = FW_TEXT_START + 0x200000`, and the FDT is loaded at
`FW_JUMP_FDT_ADDR = FW_TEXT_START + 0x2200000`.

Therefore, the maximum kernel size before `FW_JUMP_FDT_ADDR` must
be increased is the difference, or `0x2000000`.

Update the example calculation to reflect this, and avoid confusion.

Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>
---
 docs/firmware/fw_jump.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
index 956897e..d1b07b9 100644
--- a/docs/firmware/fw_jump.md
+++ b/docs/firmware/fw_jump.md
@@ -48,12 +48,12 @@ follows:
   ```
   ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '/^ +[0-9]+ /\
   {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' \
-  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
+  | (( `tail -1` > 0x2000000 )) && echo fdt overlaps kernel,\
   increase FW_JUMP_FDT_ADDR
 
   ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | \
   awk -n '/^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}'\
-  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
+  | (( `tail -1` > 0x2000000 )) && echo fdt overlaps kernel,\
   increase FW_JUMP_FDT_ADDR
   ```
 
-- 
2.39.2


