From: Tim Hutt <tdhutt@gmail.com>
Date: Tue,  8 Oct 2024 10:49:19 +0100
Subject: [PATCH] docs: add example of building the Linux kernel
Message-ID: <20241008094919.2158843-1-tdhutt@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Slightly expand the QEMU docs to explain how to build the flat Linux kernel image.

Signed-off-by: Tim Hutt <tdhutt@gmail.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 docs/platform/qemu_virt.md | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/platform/qemu_virt.md b/docs/platform/qemu_virt.md
index 0783be4..fd87ee5 100644
--- a/docs/platform/qemu_virt.md
+++ b/docs/platform/qemu_virt.md
@@ -56,7 +56,14 @@ qemu-system-riscv64 -M virt -m 256M -nographic \
 **Linux Kernel Payload**
 
 Note: We assume that the Linux kernel is compiled using
-*arch/riscv/configs/defconfig*.
+*arch/riscv/configs/defconfig*. The kernel must be a flattened image (a file
+called `Image`) rather than an ELF (`vmlinux`).
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


