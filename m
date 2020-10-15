From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 15 Oct 2020 13:42:09 +0530
Subject: [PATCH 3/5] firmware: Remove FW_PAYLOAD_FDT_PATH compile-time option
In-Reply-To: <20201015081211.1956554-1-anup.patel@wdc.com>
References: <20201015081211.1956554-1-anup.patel@wdc.com>
Message-ID: <20201015081211.1956554-4-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The FW_PAYLOAD_FDT_PATH compile-time option is replaced by
FW_FDT_PATH compile-time option which is more flexible and
common across all OpenSBI firmwares.

This patch removes FW_PAYLOAD_FDT_PATH and updates related
documentation to use FW_FDT_PATH.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 docs/firmware/fw_payload.md    |  9 ++-------
 docs/platform/andes-ae350.md   |  4 ++--
 docs/platform/shakti_cclass.md |  4 ++--
 docs/platform/sifive_fu540.md  |  6 +++---
 firmware/external_deps.mk      |  1 -
 firmware/fw_base.S             |  9 ---------
 firmware/fw_dynamic.S          | 13 -------------
 firmware/fw_jump.S             | 13 -------------
 firmware/fw_payload.S          | 25 -------------------------
 firmware/objects.mk            |  3 ---
 platform/template/config.mk    |  4 +++-
 11 files changed, 12 insertions(+), 79 deletions(-)

diff --git a/docs/firmware/fw_payload.md b/docs/firmware/fw_payload.md
index bc712d2..0947448 100644
--- a/docs/firmware/fw_payload.md
+++ b/docs/firmware/fw_payload.md
@@ -55,14 +55,9 @@ file. The parameters currently defined are as follows:
   automatically generated and used as a payload. This test payload executes
   an infinite `while (1)` loop after printing a message on the platform console.
 
-* **FW_PAYLOAD_FDT_PATH** - Path to an external flattened device tree binary
-  file to be embedded in the *.text* section of the final firmware. If this
-  option is not provided then the firmware will expect the FDT to be passed
-  as an argument by the prior booting stage.
-
 * **FW_PAYLOAD_FDT_ADDR** - Address where the FDT passed by the prior booting
-  stage or specified by the *FW_PAYLOAD_FDT_PATH* parameter and embedded in
-  the *.text* section will be placed before executing the next booting stage,
+  stage or specified by the *FW_FDT_PATH* parameter and embedded in the
+  *.rodata* section will be placed before executing the next booting stage,
   that is, the payload firmware. If this option is not provided, then the
   firmware will pass the FDT address passed by the previous booting stage
   to the next booting stage.
diff --git a/docs/platform/andes-ae350.md b/docs/platform/andes-ae350.md
index 5a98707..46889a1 100644
--- a/docs/platform/andes-ae350.md
+++ b/docs/platform/andes-ae350.md
@@ -19,12 +19,12 @@ Building Andes AE350 Platform
 -----------------------------
 
 To use Linux v5.2 should be used to build Andes AE350 OpenSBI binaries by using
-the compile time option FW_PAYLOAD_FDT_PATH.
+the compile time option FW_FDT_PATH.
 
 AE350's dts is included in https://github.com/andestech/linux/tree/ast-v3_2_0-release-public
 
 **Linux Kernel Payload**
 
 ```
-make PLATFORM=andes/ae350 FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_PAYLOAD_FDT_PATH=<ae350.dtb path>
+make PLATFORM=andes/ae350 FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_FDT_PATH=<ae350.dtb path>
 ```
diff --git a/docs/platform/shakti_cclass.md b/docs/platform/shakti_cclass.md
index 2f4a699..05c9b3a 100644
--- a/docs/platform/shakti_cclass.md
+++ b/docs/platform/shakti_cclass.md
@@ -23,11 +23,11 @@ Building Shakti C-class Platform
 **Linux Kernel Payload**
 
 ```
-make PLATFORM=generic FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_PAYLOAD_FDT_PATH=<shakti.dtb path>
+make PLATFORM=generic FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_FDT_PATH=<shakti.dtb path>
 ```
 
 **Test Payload**
 
 ```
-make PLATFORM=generic FW_PAYLOAD_FDT_PATH=<shakti.dtb path>
+make PLATFORM=generic FW_FDT_PATH=<shakti.dtb path>
 ```
diff --git a/docs/platform/sifive_fu540.md b/docs/platform/sifive_fu540.md
index 1008432..c9513eb 100644
--- a/docs/platform/sifive_fu540.md
+++ b/docs/platform/sifive_fu540.md
@@ -29,13 +29,13 @@ DT (device tree) is not backward compatible with the DT passed from FSBL.
 
 To use Linux v5.2 (or higher, the pre-built DTB (DT binary) from Linux v5.2
 (or higher) should be used to build SiFive FU540 OpenSBI binaries by using
-the compile time option *FW_PAYLOAD_FDT_PATH*.
+the compile time option *FW_FDT_PATH*.
 
 ```
 make PLATFORM=sifive/fu540 FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image
 or
 (For Linux v5.2 or higher)
-make PLATFORM=sifive/fu540 FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_PAYLOAD_FDT_PATH=<hifive-unleashed-a00.dtb path from Linux kernel>
+make PLATFORM=sifive/fu540 FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_FDT_PATH=<hifive-unleashed-a00.dtb path from Linux kernel>
 ```
 
 **U-Boot Payload**
@@ -147,7 +147,7 @@ booti ${kernel_addr_r} - ${fdt_addr_r}
 QEMU Specific Instructions
 --------------------------
 If you want to test OpenSBI with QEMU 'sifive_u' machine, please follow the
-same instructions above, with the exception of not passing FW_PAYLOAD_FDT_PATH.
+same instructions above, with the exception of not passing FW_FDT_PATH.
 
 This is because QEMU generates a device tree blob on the fly based on the
 command line parameters and it's compatible with the one used in the upstream
diff --git a/firmware/external_deps.mk b/firmware/external_deps.mk
index f43ac06..6264005 100644
--- a/firmware/external_deps.mk
+++ b/firmware/external_deps.mk
@@ -12,4 +12,3 @@ $(platform_build_dir)/firmware/fw_jump.o: $(FW_FDT_PATH)
 $(platform_build_dir)/firmware/fw_payload.o: $(FW_FDT_PATH)
 
 $(platform_build_dir)/firmware/fw_payload.o: $(FW_PAYLOAD_PATH_FINAL)
-$(platform_build_dir)/firmware/fw_payload.o: $(FW_PAYLOAD_FDT_PATH)
diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 95197da..1d9b375 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -187,15 +187,6 @@ _bss_zero:
 	la	a1, fw_fdt_bin
 #endif
 
-	/* Override previous arg1 */
-	MOV_3R	s0, a0, s1, a1, s2, a2
-	call	fw_prev_arg1
-	add	t1, a0, zero
-	MOV_3R	a0, s0, a1, s1, a2, s2
-	beqz	t1, _prev_arg1_override_done
-	add	a1, t1, zero
-_prev_arg1_override_done:
-
 	/*
 	 * Initialize platform
 	 * Note: The a0 to a4 registers passed to the
diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
index d658011..8b56947 100644
--- a/firmware/fw_dynamic.S
+++ b/firmware/fw_dynamic.S
@@ -86,19 +86,6 @@ fw_save_info:
 2:
 	ret
 
-	.section .entry, "ax", %progbits
-	.align 3
-	.global fw_prev_arg1
-	/*
-	 * We can only use a0, a1, and a2 registers here.
-	 * The a0, a1, and a2 registers will be same as passed by
-	 * previous booting stage.
-	 * The previous arg1 should be returned in 'a0'.
-	 */
-fw_prev_arg1:
-	add	a0, zero, zero
-	ret
-
 	.section .entry, "ax", %progbits
 	.align 3
 	.global fw_next_arg1
diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
index afbcec0..8553f8c 100644
--- a/firmware/fw_jump.S
+++ b/firmware/fw_jump.S
@@ -34,19 +34,6 @@ fw_boot_hart:
 fw_save_info:
 	ret
 
-	.section .entry, "ax", %progbits
-	.align 3
-	.global fw_prev_arg1
-	/*
-	 * We can only use a0, a1, and a2 registers here.
-	 * The a0, a1, and a2 registers will be same as passed by
-	 * previous booting stage.
-	 * The previous arg1 should be returned in 'a0'.
-	 */
-fw_prev_arg1:
-	add	a0, zero, zero
-	ret
-
 	.section .entry, "ax", %progbits
 	.align 3
 	.global fw_next_arg1
diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
index 9805d8c..1ef121e 100644
--- a/firmware/fw_payload.S
+++ b/firmware/fw_payload.S
@@ -34,23 +34,6 @@ fw_boot_hart:
 fw_save_info:
 	ret
 
-	.section .entry, "ax", %progbits
-	.align 3
-	.global fw_prev_arg1
-	/*
-	 * We can only use a0, a1, and a2 registers here.
-	 * The a0, a1, and a2 registers will be same as passed by
-	 * previous booting stage.
-	 * The previous arg1 should be returned in 'a0'.
-	 */
-fw_prev_arg1:
-#ifdef FW_PAYLOAD_FDT_PATH
-	la	a0, fdt_bin
-#else
-	add	a0, zero, zero
-#endif
-	ret
-
 	.section .entry, "ax", %progbits
 	.align 3
 	.global fw_next_arg1
@@ -102,14 +85,6 @@ fw_options:
 	add	a0, zero, zero
 	ret
 
-#ifdef FW_PAYLOAD_FDT_PATH
-	.section .text, "ax", %progbits
-	.align 4
-	.globl fdt_bin
-fdt_bin:
-	.incbin	FW_PAYLOAD_FDT_PATH
-#endif
-
 	.section .payload, "ax", %progbits
 	.align 4
 	.globl payload_bin
diff --git a/firmware/objects.mk b/firmware/objects.mk
index 2eea54c..b2ace75 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -48,9 +48,6 @@ ifdef FW_PAYLOAD_ALIGN
 firmware-genflags-$(FW_PAYLOAD) += -DFW_PAYLOAD_ALIGN=$(FW_PAYLOAD_ALIGN)
 endif
 
-ifdef FW_PAYLOAD_FDT_PATH
-firmware-genflags-$(FW_PAYLOAD) += -DFW_PAYLOAD_FDT_PATH=\"$(FW_PAYLOAD_FDT_PATH)\"
-endif
 ifdef FW_PAYLOAD_FDT_ADDR
 firmware-genflags-$(FW_PAYLOAD) += -DFW_PAYLOAD_FDT_ADDR=$(FW_PAYLOAD_FDT_ADDR)
 endif
diff --git a/platform/template/config.mk b/platform/template/config.mk
index 7bcf937..f817342 100644
--- a/platform/template/config.mk
+++ b/platform/template/config.mk
@@ -34,6 +34,9 @@ platform-ldflags-y =
 # Firmware load address configuration. This is mandatory.
 FW_TEXT_START=0x80000000
 
+# Optional parameter for path to external FDT
+# FW_FDT_PATH="path to platform flattened device tree file"
+
 #
 # Dynamic firmware configuration.
 # Optional parameters are commented out. Uncomment and define these parameters
@@ -71,5 +74,4 @@ FW_PAYLOAD_OFFSET=0x200000
 endif
 # FW_PAYLOAD_ALIGN=0x1000
 # FW_PAYLOAD_PATH="path to next boot stage binary image file"
-# FW_PAYLOAD_FDT_PATH="path to platform flattened device tree file"
 # FW_PAYLOAD_FDT_ADDR=0x82200000
-- 
2.25.1


