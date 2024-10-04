From: Tim Hutt <tdhutt@gmail.com>
Date: Fri,  4 Oct 2024 14:14:59 +0100
Subject: [PATCH] Makefile: perform sanity checks on payload during build
Message-ID: <20241004131459.774924-1-tdhutt@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To make mistakes more obvious and debugging easier we can check that the payload is not an ELF file, and that the first byte is possibly the start of a valid instruction.

I would have preferred to not do this check in Bash but I didn't want to introduce any additional dependencies, and there isn't a proper language already in use.

I also made it an `#error` to not define `FW_PAYLOAD_PATH` since the build system will always do that. If the user doesn't specify one a default file is used.
---
 firmware/external_deps.mk |  3 ++-
 firmware/fw_payload.S     |  6 ++----
 scripts/check-payload.sh  | 43 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 5 deletions(-)
 create mode 100755 scripts/check-payload.sh

diff --git a/firmware/external_deps.mk b/firmware/external_deps.mk
index 6264005..d4c480c 100644
--- a/firmware/external_deps.mk
+++ b/firmware/external_deps.mk
@@ -10,5 +10,6 @@
 $(platform_build_dir)/firmware/fw_dynamic.o: $(FW_FDT_PATH)
 $(platform_build_dir)/firmware/fw_jump.o: $(FW_FDT_PATH)
 $(platform_build_dir)/firmware/fw_payload.o: $(FW_FDT_PATH)
-
+	scripts/check-payload.sh $(FW_PAYLOAD_PATH_FINAL)
+	$(call compile_as,$@,$<)
 $(platform_build_dir)/firmware/fw_payload.o: $(FW_PAYLOAD_PATH_FINAL)
diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
index 3c8433e..0b0f342 100644
--- a/firmware/fw_payload.S
+++ b/firmware/fw_payload.S
@@ -94,8 +94,6 @@ fw_options:
 	.globl payload_bin
 payload_bin:
 #ifndef FW_PAYLOAD_PATH
-	wfi
-	j	payload_bin
-#else
-	.incbin	FW_PAYLOAD_PATH
+#error FW_PAYLOAD_PATH should always be set by the build system
 #endif
+	.incbin	FW_PAYLOAD_PATH
diff --git a/scripts/check-payload.sh b/scripts/check-payload.sh
new file mode 100755
index 0000000..5752497
--- /dev/null
+++ b/scripts/check-payload.sh
@@ -0,0 +1,43 @@
+#!/usr/bin/env bash
+
+# Simple script to try and detect invalid payloads. The payload should be a flat
+# image and the first bytes should be valid instructions - OpenSBI will jump
+# to the start of the file. It shouldn't be an ELF file.
+#
+# Bash is a terrible language for this purpose but we can make it work.
+
+if [ -z "$1" ]; then
+    echo "Usage: $0 <file>"
+    exit 1
+fi
+
+# Check the payload is not an ELF file.
+readelf -h "$1" >/dev/null 2>&1 && {
+    echo "Error: The payload is an ELF file; it should be a flat executable instead."
+    exit 1
+}
+
+# Check the first bytes are a valid RISC-V instruction. Since we don't know
+# what is valid we can only do limited checks but this will check that it is at
+# least a 16 or 32-bit instruction. Larger instructions are currently unused.
+first_byte="$(head -c 1 "$1")"
+LC_ALL=C printf -v first_byte_dec %d \'$first_byte
+
+# for byte in range(256):
+#     if not ((byte & 0b11) != 0b11 or (byte & 0b11100) != 0b11100):
+#         print(byte)
+[ \
+    "$first_byte_dec" == 31 -o \
+    "$first_byte_dec" == 63 -o \
+    "$first_byte_dec" == 95 -o \
+    "$first_byte_dec" == 127 -o \
+    "$first_byte_dec" == 159 -o \
+    "$first_byte_dec" == 191 -o \
+    "$first_byte_dec" == 223 -o \
+    "$first_byte_dec" == 255 \
+] && {
+    echo "Error: The payload's first byte is not a 16- or 32-bit RISC-V instruction. The payload should be a flat executable."
+    exit 1
+}
+
+exit 0
-- 
2.39.2


