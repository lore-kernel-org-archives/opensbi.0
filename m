From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 15 May 2024 11:57:22 +0530
Subject: [PATCH] firmware: Bring back FW_TEXT_START as an optional parameter
Message-ID: <20240515062722.974003-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Bring back FW_TEXT_START as an optional parameter to allow users
explicitly specify compile time address for loading debug symbols.
When not specified, the FW_TEXT_START is assumed to be 0.

Fixes: d4d2582eef7a ("firmware: remove FW_TEXT_START")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 docs/firmware/fw.md            | 3 +++
 firmware/fw_base.S             | 4 +++-
 firmware/fw_base.ldS           | 3 ++-
 firmware/fw_payload.elf.ldS    | 2 +-
 firmware/objects.mk            | 6 ++++++
 firmware/payloads/test.elf.ldS | 2 +-
 6 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
index 3cc0262..d298096 100644
--- a/docs/firmware/fw.md
+++ b/docs/firmware/fw.md
@@ -61,6 +61,9 @@ Firmware Configuration and Compilation
 All firmware types support the following common compile time configuration
 parameters:
 
+* **FW_TEXT_START** - Defines the compile time address of the OpenSBI
+  firmware. This configuration parameter is optional and assumed to be
+  `0` if not specified.
 * **FW_FDT_PATH** - Path to an external flattened device tree binary file to
   be embedded in the *.rodata* section of the final firmware. If this option
   is not provided then the firmware will expect the FDT to be passed as an
diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 9f995a2..b950c0b 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -53,7 +53,9 @@ _try_lottery:
 	bnez	a6, _wait_for_boot_hart
 
 	/* relocate the global table content */
-	lla	t2, _fw_start
+	li	t0, FW_TEXT_START	/* link start */
+	lla	t1, _fw_start		/* load start */
+	sub	t2, t1, t0		/* load offset */
 	lla	t0, __rel_dyn_start
 	lla	t1, __rel_dyn_end
 	beq	t0, t1, _relocate_done
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 9d11db5..fb47984 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -7,7 +7,8 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
-	/* Don't add any section before _fw_start */
+	. = FW_TEXT_START;
+	/* Don't add any section between FW_TEXT_START and _fw_start */
 	PROVIDE(_fw_start = .);
 
 	. = ALIGN(0x1000); /* Need this to create proper sections */
diff --git a/firmware/fw_payload.elf.ldS b/firmware/fw_payload.elf.ldS
index 94e1ac6..f1a544b 100644
--- a/firmware/fw_payload.elf.ldS
+++ b/firmware/fw_payload.elf.ldS
@@ -15,7 +15,7 @@ SECTIONS
 	#include "fw_base.ldS"
 
 #ifdef FW_PAYLOAD_OFFSET
-	. = FW_PAYLOAD_OFFSET;
+	. = FW_TEXT_START + FW_PAYLOAD_OFFSET;
 #else
 	. = ALIGN(FW_PAYLOAD_ALIGN);
 #endif
diff --git a/firmware/objects.mk b/firmware/objects.mk
index a51ff65..a90485d 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -13,6 +13,12 @@ firmware-cflags-y +=
 firmware-asflags-y +=
 firmware-ldflags-y +=
 
+ifdef FW_TEXT_START
+firmware-genflags-y += -DFW_TEXT_START=$(FW_TEXT_START)
+else
+firmware-genflags-y += -DFW_TEXT_START=0x0
+endif
+
 ifdef FW_FDT_PATH
 firmware-genflags-y += -DFW_FDT_PATH=\"$(FW_FDT_PATH)\"
 ifdef FW_FDT_PADDING
diff --git a/firmware/payloads/test.elf.ldS b/firmware/payloads/test.elf.ldS
index 08e008f..2328a1b 100644
--- a/firmware/payloads/test.elf.ldS
+++ b/firmware/payloads/test.elf.ldS
@@ -13,7 +13,7 @@ ENTRY(_start)
 SECTIONS
 {
 #ifdef FW_PAYLOAD_OFFSET
-	. = FW_PAYLOAD_OFFSET;
+	. = FW_TEXT_START + FW_PAYLOAD_OFFSET;
 #else
 	. = ALIGN(FW_PAYLOAD_ALIGN);
 #endif
-- 
2.34.1


