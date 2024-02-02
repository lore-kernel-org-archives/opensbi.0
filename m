From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri,  2 Feb 2024 12:05:34 +0800
Subject: [PATCH 2/4] firmware: Add relocatable FW_PAYLOAD_FDT_ADDR
In-Reply-To: <IA1PR20MB495352218C0BF2CE8D86B3B9BB422@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495352218C0BF2CE8D86B3B9BB422@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB49539A729C9350C1714D7DA4BB422@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fw_payload.bin has the same issue as described in commit 80129c2.
But only FW_PAYLOAD_FDT_ADDR is affected.

Add FW_PAYLOAD_FDT_OFFSET to identify relocatable payload fdt address.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 firmware/fw_payload.S | 4 ++++
 firmware/objects.mk   | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
index c53a3bb..3c8433e 100644
--- a/firmware/fw_payload.S
+++ b/firmware/fw_payload.S
@@ -46,6 +46,10 @@ fw_save_info:
 fw_next_arg1:
 #ifdef FW_PAYLOAD_FDT_ADDR
 	li	a0, FW_PAYLOAD_FDT_ADDR
+#elif defined(FW_PAYLOAD_FDT_OFFSET)
+	lla	a0, _fw_start
+	li	a1, FW_PAYLOAD_FDT_OFFSET
+	add	a0, a0, a1
 #else
 	add	a0, a1, zero
 #endif
diff --git a/firmware/objects.mk b/firmware/objects.mk
index 248706d..a761b9e 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -42,6 +42,9 @@ ifeq ($(FW_PIC),n)
   ifndef FW_JUMP_FDT_ADDR
     FW_JUMP_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + $(FW_JUMP_FDT_OFFSET))))
   endif
+  ifndef FW_PAYLOAD_FDT_ADDR
+    FW_PAYLOAD_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + $(FW_PAYLOAD_FDT_OFFSET))))
+  endif
 endif
 
 firmware-bins-$(FW_DYNAMIC) += fw_dynamic.bin
@@ -74,6 +77,9 @@ ifdef FW_PAYLOAD_ALIGN
 firmware-genflags-$(FW_PAYLOAD) += -DFW_PAYLOAD_ALIGN=$(FW_PAYLOAD_ALIGN)
 endif
 
+ifdef FW_PAYLOAD_FDT_OFFSET
+firmware-genflags-$(FW_PAYLOAD) += -DFW_PAYLOAD_FDT_OFFSET=$(FW_PAYLOAD_FDT_OFFSET)
+endif
 ifdef FW_PAYLOAD_FDT_ADDR
 firmware-genflags-$(FW_PAYLOAD) += -DFW_PAYLOAD_FDT_ADDR=$(FW_PAYLOAD_FDT_ADDR)
 endif
-- 
2.43.0


