From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Thu,  1 Oct 2020 12:28:36 +0200
Subject: [PATCH 1/1] firmware: provide space for firmware fixups
Message-ID: <20201001102836.15622-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We expand the provided device tree by up to 1056 bytes in fixup operations.
This space must be allocated in the firmware binary.

An alternative approach would be to allocate RAM for a copy of the
device tree but we do not have library functions for dynamic memory
allocation yet.

Without this patch devicetree fixups lead to memory corruption.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 firmware/fw_payload.S | 2 ++
 scripts/d2c.sh        | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
index 9805d8c..fdd082f 100644
--- a/firmware/fw_payload.S
+++ b/firmware/fw_payload.S
@@ -108,6 +108,8 @@ fw_options:
 	.globl fdt_bin
 fdt_bin:
 	.incbin	FW_PAYLOAD_FDT_PATH
+	/* space for device tree updates */
+	. = . + 0x420;
 #endif

 	.section .payload, "ax", %progbits
diff --git a/scripts/d2c.sh b/scripts/d2c.sh
index 821a995..1c53a71 100755
--- a/scripts/d2c.sh
+++ b/scripts/d2c.sh
@@ -62,6 +62,9 @@ printf "const char __attribute__((aligned(%s))) %s_start[] = {\n" "${OUTPUT_C_AL

 od -v -t x1 -An ${INPUT_PATH} | awk '{for (i=1; i<=NF; i++) printf " 0x%s,", $i; printf "\n"; }'

+# Add 1056 bytes for device tree fixups
+echo dummy | awk '{for (j=1; j<=0x42; j++) {for (i=1; i<=0x10; i++) printf " 0x00,"; printf "\n"}; }'
+
 printf "};\n"

 printf "const unsigned long %s_size = sizeof(%s_start);\n" "${OUTPUT_C_PREFIX}" "${OUTPUT_C_PREFIX}"
--
2.28.0


