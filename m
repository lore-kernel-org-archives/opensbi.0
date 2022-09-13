From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 13 Sep 2022 13:46:05 +0800
Subject: [PATCH 1/1] docs/firmware: Update FW_JUMP documentation
Message-ID: <20220913054605.19929-1-nylon.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "Nylon.Chen" <nylon.chen@sifive.com>

Add a tip for OpenSBI's Jump mode.

help user avoids the kernel overwritten.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Nylon.Chen <nylon.chen@sifive.com>
---
 docs/firmware/fw_jump.md | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
index 35a4301..c20d722 100644
--- a/docs/firmware/fw_jump.md
+++ b/docs/firmware/fw_jump.md
@@ -40,6 +40,24 @@ follows:
   the booting stage following the OpenSBI firmware. If this option is not
   provided, then the OpenSBI firmware will pass the FDT address passed by the
   previous booting stage to the next booting stage.
+  
+  If your *PLATFORM=generic* and your *FW_JUMP_FDT_ADDR* is default, you must check
+  your Linux size because Linux will be overwritten in OpneSBI's FDT copy loop.
+  You can use the following method.
+
+  ```
+  LAST_SECTION=`${CROSS_COMPILE}objdump -h vmlinux | grep "00*" | awk '{print $5,$3}'\
+  | sort -rfu | head -n 1 | awk '{split($0,addr," ");print addr[1]}'` \
+  && LAST_SECTION_SIZE=`${CROSS_COMPILE}objdump -h vmlinux | grep "00*" |awk '{print $5,$3}'\
+  | sort -rfu | head -n 1 | awk '{split($0,addr,"")}'` \
+  && OFFSET_ADDR=$(( 16#$LAST_SECTION_SIZE + 16#$LAST_SECTION)) \
+  && printf "The LMA of the last section of the Kernel is 0x%X\n" ${OFFSET_ADDR}
+  ```
+  
+  If the result is bigger than the default of FW_JUMP_FDT_ADDR(0x2200000), 
+  you must change it to avoid the problem of being overwritten.
+
+
 
 *FW_JUMP* Example
 -----------------
-- 
2.36.1


