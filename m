From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 23 Feb 2024 16:18:15 +0800
Subject: [PATCH v2 4/4] doc/firmware: add new configuration options for jump and payload firmware
In-Reply-To: <IA1PR20MB495379ECC11096AEEBC4C691BB552@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495379ECC11096AEEBC4C691BB552@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB49538E5FEEB091B8DFBBBCFFBB552@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adding relocatable address brings new configuration options.
Add these new options in doc.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 docs/firmware/fw_jump.md    | 17 ++++++++++++++---
 docs/firmware/fw_payload.md |  6 ++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
index 3e883fa..4484393 100644
--- a/docs/firmware/fw_jump.md
+++ b/docs/firmware/fw_jump.md
@@ -31,9 +31,15 @@ follows:
 
 * **FW_JUMP_ADDR** - Address of the entry point of the booting stage to be
   executed following OpenSBI firmware. This address generally corresponds
-  exactly to the address where this next booting stage was loaded. This is a
-  mandatory parameter. Compilation errors will result from not defining this
-  address.
+  exactly to the address where this next booting stage was loaded.
+  At least one of *FW_JUMP_ADDR* and *FW_JUMP_OFFSET* (see below) should be
+  defined. Compilation errors will result from not defining one of them.
+
+* **FW_JUMP_OFFSET** - Address offset from the *FW_TEXT_START* of *FW_JUMP_ADDR*.
+  This offset is used as relocatable *FW_JUMP_ADDR* when "FW_PIC=y".
+  If *FW_JUMP_ADDR* is also defined, the firmware will prefer *FW_JUMP_ADDR*.
+  This offset will convert to *FW_JUMP_ADDR* at build time if "FW_PIC=n"
+  and *FW_JUMP_ADDR* is not defined.
 
 * **FW_JUMP_FDT_ADDR** - Address where the *flattened device tree (FDT file)*
   passed by the prior booting stage will be placed in memory before executing
@@ -56,6 +62,11 @@ follows:
   (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) &&
   echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
   ```
+* **FW_JUMP_FDT_OFFSET** - Address offset from the *FW_TEXT_START* of
+  *FW_JUMP_FDT_ADDR*. This offset is used as relocatable *FW_JUMP_FDT_ADDR*
+  when "FW_PIC=y". If *FW_JUMP_FDT_ADDR* is also defined, the firmware will
+  prefer *FW_JUMP_FDT_ADDR*. This offset will convert to *FW_JUMP_FDT_ADDR*
+  at build time if "FW_PIC=n" and *FW_JUMP_FDT_ADDR* is not defined.
 
 *FW_JUMP* Example
 -----------------
diff --git a/docs/firmware/fw_payload.md b/docs/firmware/fw_payload.md
index 113604a..3a5ffe8 100644
--- a/docs/firmware/fw_payload.md
+++ b/docs/firmware/fw_payload.md
@@ -62,6 +62,12 @@ file. The parameters currently defined are as follows:
   firmware will pass the FDT address passed by the previous booting stage
   to the next booting stage.
 
+* **FW_PAYLOAD_FDT_OFFSET** - Address offset from the *FW_TEXT_START* of
+  *FW_PAYLOAD_FDT_ADDR*. This offset is used as relocatable *FW_PAYLOAD_FDT_ADDR*
+  when "FW_PIC=y". If *FW_PAYLOAD_FDT_ADDR* is also defined, the firmware will
+  prefer *FW_PAYLOAD_FDT_ADDR*. This offset will convert to *FW_PAYLOAD_FDT_ADDR*
+  at build time if "FW_PIC=n" and *FW_PAYLOAD_FDT_ADDR* is not defined.
+
 *FW_PAYLOAD* Example
 --------------------
 
-- 
2.43.2


