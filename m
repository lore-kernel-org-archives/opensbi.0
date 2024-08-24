From: Kele Zhang <1952088712@qq.com>
Date: Sat, 24 Aug 2024 16:16:44 +0800
Subject: [PATCH 1/2] Makefile: enable --gc-sections
In-Reply-To: <cover.1724487146.git.1952088712@qq.com>
References: <cover.1724487146.git.1952088712@qq.com>
Message-ID: <tencent_48AE88FE505E24B2609EACA57A9A2F35BD06@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The --gc-sections option enables the linker to perform garbage
collection of unreferenced code and data, thereby reducing the binary
size.

The -ffunction-sections option will place each function into a separate
section, so it is necessary to add .text.* to the linker script.

Signed-off-by: Kele Zhang <1952088712@qq.com>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 Makefile                    | 4 ++--
 firmware/fw_base.ldS        | 1 +
 firmware/fw_payload.elf.ldS | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 9c7fd4d..9abea9f 100644
--- a/Makefile
+++ b/Makefile
@@ -346,9 +346,9 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
 GENFLAGS	+=	$(platform-genflags-y)
 GENFLAGS	+=	$(firmware-genflags-y)
 
-CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing
+CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections -Wl,--gc-sections
 ifneq ($(DEBUG),)
-CFLAGS		+=	-O0
+CFLAGS		+=	-O0 -Wl,--print-gc-sections
 else
 CFLAGS		+=	-O2
 endif
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index fb47984..a33746a 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -20,6 +20,7 @@
 		PROVIDE(_text_start = .);
 		*(.entry)
 		*(.text)
+		*(.text.*)
 		. = ALIGN(8);
 		PROVIDE(_text_end = .);
 	}
diff --git a/firmware/fw_payload.elf.ldS b/firmware/fw_payload.elf.ldS
index f1a544b..4e1f011 100644
--- a/firmware/fw_payload.elf.ldS
+++ b/firmware/fw_payload.elf.ldS
@@ -23,7 +23,7 @@ SECTIONS
 	.payload :
 	{
 		PROVIDE(_payload_start = .);
-		*(.payload)
+		KEEP(*(.payload))
 		. = ALIGN(8);
 		PROVIDE(_payload_end = .);
 	}
-- 
2.34.1


