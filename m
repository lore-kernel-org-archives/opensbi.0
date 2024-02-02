From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri,  2 Feb 2024 12:05:35 +0800
Subject: [PATCH 3/4] platform: Apply relocatable address
In-Reply-To: <IA1PR20MB495352218C0BF2CE8D86B3B9BB422@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495352218C0BF2CE8D86B3B9BB422@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB49538AFD74ED9DA26246603CBB422@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since jump and payload firmware support relocatable address, make
general platform use runtime relocatable address.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 platform/generic/objects.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index 136853e..85aa723 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -27,12 +27,12 @@ FW_DYNAMIC=y
 FW_JUMP=y
 ifeq ($(PLATFORM_RISCV_XLEN), 32)
   # This needs to be 4MB aligned for 32-bit system
-  FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x400000)))
+  FW_JUMP_OFFSET=0x400000
 else
   # This needs to be 2MB aligned for 64-bit system
-  FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x200000)))
+  FW_JUMP_OFFSET=0x200000
 endif
-FW_JUMP_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x2200000)))
+FW_JUMP_FDT_OFFSET=0x2200000
 FW_PAYLOAD=y
 ifeq ($(PLATFORM_RISCV_XLEN), 32)
   # This needs to be 4MB aligned for 32-bit system
@@ -41,4 +41,4 @@ else
   # This needs to be 2MB aligned for 64-bit system
   FW_PAYLOAD_OFFSET=0x200000
 endif
-FW_PAYLOAD_FDT_ADDR=$(FW_JUMP_FDT_ADDR)
+FW_PAYLOAD_FDT_OFFSET=$(FW_JUMP_FDT_OFFSET)
-- 
2.43.0


