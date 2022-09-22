From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 22 Sep 2022 15:36:12 +0800
Subject: [PATCH v2] docs/firmware: Update FW_JUMP documentation
Message-ID: <20220922073612.28320-1-nylon.chen@sifive.com>
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
 docs/firmware/fw_jump.md | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
index 35a4301..848f515 100644
--- a/docs/firmware/fw_jump.md
+++ b/docs/firmware/fw_jump.md
@@ -41,6 +41,23 @@ follows:
   provided, then the OpenSBI firmware will pass the FDT address passed by the
   previous booting stage to the next booting stage.
 
+  If your *PLATFORM=generic* and your *FW_JUMP_FDT_ADDR* is default, you must
+  ensure *FW_JUMP_FDT_ADDR* is set high enough to avoid overwriting the kernel
+  You can use the following method.
+
+  ```
+  ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk '/^ +[0-9]+ / ' \
+  | awk -n '{addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' | \
+  if [[ `tail -n -1` -gt 0x2200000 ]]; then \
+  echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR ; fi
+
+
+  ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | awk '/^ +[0-9]+ / ' \
+  | awk -n '{addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' | \
+  if [[ `tail -n -1` -gt 0x2200000 ]]; then \
+  echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR ; fi
+  ```
+
 *FW_JUMP* Example
 -----------------
 
-- 
2.36.1


