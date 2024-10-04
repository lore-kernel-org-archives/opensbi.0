From: Tim Hutt <tdhutt@gmail.com>
Date: Fri,  4 Oct 2024 14:14:10 +0100
Subject: [PATCH] docs: add example of building the Linux kernel
Message-ID: <20241004131410.772651-1-tdhutt@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Slightly expand the QEMU docs to explain how to build the flat Linux kernel image.
---
 docs/platform/qemu_virt.md | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/platform/qemu_virt.md b/docs/platform/qemu_virt.md
index 0783be4..71faf42 100644
--- a/docs/platform/qemu_virt.md
+++ b/docs/platform/qemu_virt.md
@@ -56,7 +56,13 @@ qemu-system-riscv64 -M virt -m 256M -nographic \
 **Linux Kernel Payload**
 
 Note: We assume that the Linux kernel is compiled using
-*arch/riscv/configs/defconfig*.
+*arch/riscv/configs/defconfig*. The kernel must be a flattened image (a file called `Image`) rather than an ELF (`vmlinux`).
+
+Example of building a Linux kernel:
+```
+make ARCH=riscv CROSS_COMPILE=riscv64-linux- defconfig
+make ARCH=riscv CROSS_COMPILE=riscv64-linux- Image
+```
 
 Build:
 ```
-- 
2.39.2


