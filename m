From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 27 Sep 2022 11:20:09 +0800
Subject: [PATCH v3] docs/firmware: Update FW_JUMP documentation
Message-ID: <20220927032009.7478-1-nylon.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "Nylon.Chen" <nylon.chen@sifive.com>

Add a tip for OpenSBI's FW_JUMP which helps
users avoid overwriting the kernel.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 docs/firmware/fw_jump.md | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
index 35a4301..df4fb97 100644
--- a/docs/firmware/fw_jump.md
+++ b/docs/firmware/fw_jump.md
@@ -41,6 +41,21 @@ follows:
   provided, then the OpenSBI firmware will pass the FDT address passed by the
   previous booting stage to the next booting stage.
 
+  If your *PLATFORM=generic* and your *FW_JUMP_FDT_ADDR* is default, you must
+  ensure *FW_JUMP_FDT_ADDR* is set high enough to avoid overwriting the kernel
+  You can use the following method.
+
+  ```
+  ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk '/^ +[0-9]+ / ' \
+  | awk -n '{addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' | \
+  (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
+
+
+  ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | awk '/^ +[0-9]+ / ' \
+  | awk -n '{addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' | \
+  (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
+  ```
+
 *FW_JUMP* Example
 -----------------
 
-- 
2.36.1


