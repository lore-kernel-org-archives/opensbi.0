From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Fri, 28 May 2021 18:22:14 +0200
Subject: [PATCH v2 1/1] docs: debugging OpenSBI
Message-ID: <20210528162214.5073-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Describe how to debug OpenSBI on QEMU with GDB.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
v2:
	As we cannot assume that the user is working on a non-RISC-V
	system replace gdb-multiarch by gdb.
---
 docs/platform/qemu_virt.md | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/docs/platform/qemu_virt.md b/docs/platform/qemu_virt.md
index 2777148..0783be4 100644
--- a/docs/platform/qemu_virt.md
+++ b/docs/platform/qemu_virt.md
@@ -147,3 +147,27 @@ qemu-system-riscv32 -M virt -m 256M -nographic \
 	-device virtio-blk-device,drive=hd0 \
 	-append "root=/dev/vda rw console=ttyS0"
 ```
+
+Debugging with GDB
+------------------
+
+In a first console start OpenSBI with QEMU:
+
+```
+qemu-system-riscv64 -M virt -m 256M -nographic \
+	-bios build/platform/generic/firmware/fw_payload.bin \
+	-gdb tcp::1234 \
+	-S
+
+```
+
+Parameter *-gdb tcp::1234* specifies 1234 as the debug port.
+Parameter *-S* lets QEMU wait at the first instruction.
+
+In a second console start GDB:
+
+```
+gdb build/platform/generic/firmware/fw_payload.elf \
+	-ex 'target remote localhost:1234'
+
+```
--
2.30.2


