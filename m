From: Xiang W <wxjstz@126.com>
Date: Sun, 11 Jul 2021 12:16:50 +0800
Subject: [PATCH v5] firmware: Detect whether the toolchain supports pie and
 automatically disable the FW_PIC option
Message-ID: <20210711041650.217653-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The previous version opensbi enable the FW_PIC option by default, but
not all toolchains can support pie. This makes some toolchain report erroes
when compiling. This patch whill check whether the toolchain supports FW_PIC
and disable FW_PIC.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/objects.mk         | 4 ++++
 scripts/toolchain-check-pie | 7 +++++++
 2 files changed, 11 insertions(+)
 create mode 100755 scripts/toolchain-check-pie

diff --git a/firmware/objects.mk b/firmware/objects.mk
index ce91c2f..f8ee394 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -17,6 +17,10 @@ ifndef FW_PIC
 FW_PIC := y
 endif
 
+ifeq ($(FW_PIC),y)
+FW_PIC := $(shell scripts/toolchain-check-pie $(CC))
+endif
+
 ifeq ($(FW_PIC),y)
 firmware-genflags-y +=	-DFW_PIC
 firmware-asflags-y  +=	-fpic
diff --git a/scripts/toolchain-check-pie b/scripts/toolchain-check-pie
new file mode 100755
index 0000000..559dc42
--- /dev/null
+++ b/scripts/toolchain-check-pie
@@ -0,0 +1,7 @@
+#! /bin/bash
+
+if ${1} --version | head -n 1 | grep clang 2>&1 >/dev/null; then
+	printf "void _start() {}" | ${1} --target=riscv64 -fuse-ld=lld -mno-relax -nostdlib -fPIE -Wl,-pie -xc - -o /dev/null 2>/dev/null && echo y || echo n
+else
+	printf "void _start() {}" | ${1} -nostdlib -fPIE -Wl,-pie -xc - -o /dev/null 2>/dev/null && echo y || echo n
+fi
-- 
2.30.2


