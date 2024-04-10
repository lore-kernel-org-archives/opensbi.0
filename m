From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Apr 2024 10:48:49 +0530
Subject: [PATCH v4] firmware: remove FW_TEXT_START
In-Reply-To: <20240408153013.653350-1-wxjstz@126.com>
References: <20240408153013.653350-1-wxjstz@126.com>
Message-ID: <CAAhSdy0EYuDn_FcPnAMWX0t449iF4eazGEVm1Lhgm63137BkmQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 8, 2024 at 9:01?PM Xiang W <wxjstz@126.com> wrote:
>
> Now opensbi can run at any address via dynamic relocation. We can
> remove FW_TEXT_START.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
> v4 changes:
> - only remove FW_TEXT_START by anup's suggestion
>
>  docs/firmware/fw.md                |  2 --
>  docs/firmware/fw_jump.md           |  4 ++--
>  docs/firmware/fw_payload.md        |  6 +++---
>  docs/platform/generic.md           | 11 +++--------
>  firmware/fw_base.S                 |  4 +---
>  firmware/fw_base.ldS               |  3 +--
>  firmware/fw_payload.elf.ldS        |  2 +-
>  firmware/objects.mk                |  4 ----
>  firmware/payloads/test.elf.ldS     |  2 +-
>  platform/fpga/ariane/objects.mk    |  1 -
>  platform/fpga/openpiton/objects.mk |  1 -
>  platform/generic/objects.mk        |  3 +--
>  platform/kendryte/k210/objects.mk  |  1 -
>  platform/nuclei/ux600/objects.mk   |  1 -
>  platform/template/objects.mk       |  9 ++-------
>  15 files changed, 15 insertions(+), 39 deletions(-)
>
> diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
> index 2f4deb5..3cc0262 100644
> --- a/docs/firmware/fw.md
> +++ b/docs/firmware/fw.md
> @@ -61,8 +61,6 @@ Firmware Configuration and Compilation
>  All firmware types support the following common compile time configuration
>  parameters:
>
> -* **FW_TEXT_START** - Defines the execution address of the OpenSBI firmware.
> -  This configuration parameter is mandatory.
>  * **FW_FDT_PATH** - Path to an external flattened device tree binary file to
>    be embedded in the *.rodata* section of the final firmware. If this option
>    is not provided then the firmware will expect the FDT to be passed as an
> diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
> index 2ee6b29..66be016 100644
> --- a/docs/firmware/fw_jump.md
> +++ b/docs/firmware/fw_jump.md
> @@ -35,7 +35,7 @@ follows:
>    At least one of *FW_JUMP_ADDR* and *FW_JUMP_OFFSET* (see below) should be
>    defined. Compilation errors will result from not defining one of them.
>
> -* **FW_JUMP_OFFSET** - Address offset from the *FW_TEXT_START* where the
> +* **FW_JUMP_OFFSET** - Address offset from the opensbi load address where the
>    entry point of the next booting stage is located. This offset is used as
>    relocatable address of the next booting stage entry point. If *FW_JUMP_ADDR*
>    is also defined, the firmware will prefer *FW_JUMP_ADDR*.
> @@ -62,7 +62,7 @@ follows:
>    echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
>    ```
>
> -* **FW_JUMP_FDT_OFFSET** - Address offset from the *FW_TEXT_START* where
> +* **FW_JUMP_FDT_OFFSET** - Address offset from the opensbi load address where
>    the FDT will be passed to the next booting stage. This offset is used
>    as relocatable address of the FDT passed to the next booting stage. If
>    *FW_JUMP_FDT_ADDR* is also defined, the firmware will prefer
> diff --git a/docs/firmware/fw_payload.md b/docs/firmware/fw_payload.md
> index a67fc50..d25be60 100644
> --- a/docs/firmware/fw_payload.md
> +++ b/docs/firmware/fw_payload.md
> @@ -36,8 +36,8 @@ options. These configuration parameters can be defined using either the top
>  level `make` command line or the target platform *objects.mk* configuration
>  file. The parameters currently defined are as follows:
>
> -* **FW_PAYLOAD_OFFSET** - Offset from *FW_TEXT_START* where the payload binary
> -  will be linked in the final *FW_PAYLOAD* firmware binary image. This
> +* **FW_PAYLOAD_OFFSET** - Offset from the opensbi load address where the payload
> +  binary will be linked in the final *FW_PAYLOAD* firmware binary image. This
>    configuration parameter is mandatory if *FW_PAYLOAD_ALIGN* is not defined.
>    Compilation errors will result from an incorrect definition of
>    *FW_PAYLOAD_OFFSET* or of *FW_PAYLOAD_ALIGN*, or if neither of these
> @@ -62,7 +62,7 @@ file. The parameters currently defined are as follows:
>    firmware will pass the FDT address passed by the previous booting stage
>    to the next booting stage.
>
> -* **FW_PAYLOAD_FDT_OFFSET** - Address offset from the *FW_TEXT_START* where
> +* **FW_PAYLOAD_FDT_OFFSET** - Address offset from the opensbi load address where
>    the FDT will be passed to the next booting stage. This offset is used as
>    relocatable address of the FDT passed to the next booting stage. If
>    *FW_PAYLOAD_FDT_ADDR* is also defined, the firmware will prefer *FW_PAYLOAD_FDT_ADDR*.
> diff --git a/docs/platform/generic.md b/docs/platform/generic.md
> index c29eb04..709b436 100644
> --- a/docs/platform/generic.md
> +++ b/docs/platform/generic.md
> @@ -9,10 +9,9 @@ boards.
>
>  By default, the generic FDT platform makes following assumptions:
>
> -1. platform FW_TEXT_START is 0x80000000
> -2. platform features are default
> -3. platform stack size is default
> -4. platform has no quirks or work-arounds
> +1. platform features are default
> +2. platform stack size is default
> +3. platform has no quirks or work-arounds
>
>  The above assumptions (except 1) can be overridden by adding special platform
>  callbacks which will be called based on FDT root node compatible string.
> @@ -33,10 +32,6 @@ Users of the generic FDT platform will have to ensure that:
>  To build the platform-specific library and firmware images, provide the
>  *PLATFORM=generic* parameter to the top level `make` command.
>
> -For custom FW_TEXT_START, we can build the platform-specific library and
> -firmware images by passing *PLATFORM=generic FW_TEXT_START=<custom_text_start>*
> -parameter to the top level `make` command.
> -
>  Platform Options
>  ----------------
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index b950c0b..9f995a2 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -53,9 +53,7 @@ _try_lottery:
>         bnez    a6, _wait_for_boot_hart
>
>         /* relocate the global table content */
> -       li      t0, FW_TEXT_START       /* link start */
> -       lla     t1, _fw_start           /* load start */
> -       sub     t2, t1, t0              /* load offset */
> +       lla     t2, _fw_start
>         lla     t0, __rel_dyn_start
>         lla     t1, __rel_dyn_end
>         beq     t0, t1, _relocate_done
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index fb47984..9d11db5 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -7,8 +7,7 @@
>   *   Anup Patel <anup.patel@wdc.com>
>   */
>
> -       . = FW_TEXT_START;
> -       /* Don't add any section between FW_TEXT_START and _fw_start */
> +       /* Don't add any section before _fw_start */
>         PROVIDE(_fw_start = .);
>
>         . = ALIGN(0x1000); /* Need this to create proper sections */
> diff --git a/firmware/fw_payload.elf.ldS b/firmware/fw_payload.elf.ldS
> index f1a544b..94e1ac6 100644
> --- a/firmware/fw_payload.elf.ldS
> +++ b/firmware/fw_payload.elf.ldS
> @@ -15,7 +15,7 @@ SECTIONS
>         #include "fw_base.ldS"
>
>  #ifdef FW_PAYLOAD_OFFSET
> -       . = FW_TEXT_START + FW_PAYLOAD_OFFSET;
> +       . = FW_PAYLOAD_OFFSET;
>  #else
>         . = ALIGN(FW_PAYLOAD_ALIGN);
>  #endif
> diff --git a/firmware/objects.mk b/firmware/objects.mk
> index e6b364b..a51ff65 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -13,10 +13,6 @@ firmware-cflags-y +=
>  firmware-asflags-y +=
>  firmware-ldflags-y +=
>
> -ifdef FW_TEXT_START
> -firmware-genflags-y += -DFW_TEXT_START=$(FW_TEXT_START)
> -endif
> -
>  ifdef FW_FDT_PATH
>  firmware-genflags-y += -DFW_FDT_PATH=\"$(FW_FDT_PATH)\"
>  ifdef FW_FDT_PADDING
> diff --git a/firmware/payloads/test.elf.ldS b/firmware/payloads/test.elf.ldS
> index 2328a1b..08e008f 100644
> --- a/firmware/payloads/test.elf.ldS
> +++ b/firmware/payloads/test.elf.ldS
> @@ -13,7 +13,7 @@ ENTRY(_start)
>  SECTIONS
>  {
>  #ifdef FW_PAYLOAD_OFFSET
> -       . = FW_TEXT_START + FW_PAYLOAD_OFFSET;
> +       . = FW_PAYLOAD_OFFSET;
>  #else
>         . = ALIGN(FW_PAYLOAD_ALIGN);
>  #endif
> diff --git a/platform/fpga/ariane/objects.mk b/platform/fpga/ariane/objects.mk
> index 83581ac..d1177f4 100644
> --- a/platform/fpga/ariane/objects.mk
> +++ b/platform/fpga/ariane/objects.mk
> @@ -17,7 +17,6 @@ platform-objs-y += platform.o
>  PLATFORM_RISCV_XLEN = 64
>
>  # Blobs to build
> -FW_TEXT_START=0x80000000
>  FW_JUMP=n
>
>  ifeq ($(PLATFORM_RISCV_XLEN), 32)
> diff --git a/platform/fpga/openpiton/objects.mk b/platform/fpga/openpiton/objects.mk
> index c8c345a..1a0ce0c 100644
> --- a/platform/fpga/openpiton/objects.mk
> +++ b/platform/fpga/openpiton/objects.mk
> @@ -16,7 +16,6 @@ platform-objs-y += platform.o
>  PLATFORM_RISCV_XLEN = 64
>
>  # Blobs to build
> -FW_TEXT_START=0x80000000
>  FW_JUMP=n
>
>  ifeq ($(PLATFORM_RISCV_XLEN), 32)
> diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
> index 85aa723..c215935 100644
> --- a/platform/generic/objects.mk
> +++ b/platform/generic/objects.mk
> @@ -15,14 +15,13 @@ platform-ldflags-y =
>
>  # Command for platform specific "make run"
>  platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
> -  -nographic -bios $(build_dir)/platform/generic/firmware/fw_payload.elf
> +  -nographic -bios $(build_dir)/platform/generic/firmware/fw_payload.bin
>
>  # Objects to build
>  platform-objs-y += platform.o
>  platform-objs-y += platform_override_modules.o
>
>  # Blobs to build
> -FW_TEXT_START=0x80000000
>  FW_DYNAMIC=y
>  FW_JUMP=y
>  ifeq ($(PLATFORM_RISCV_XLEN), 32)
> diff --git a/platform/kendryte/k210/objects.mk b/platform/kendryte/k210/objects.mk
> index 1bfb898..efac3d2 100644
> --- a/platform/kendryte/k210/objects.mk
> +++ b/platform/kendryte/k210/objects.mk
> @@ -21,6 +21,5 @@ platform-varprefix-k210.o = dt_k210
>  platform-padding-k210.o = 2048
>
>  # Blobs to build
> -FW_TEXT_START=0x80000000
>  FW_PAYLOAD=y
>  FW_PAYLOAD_ALIGN=0x1000
> diff --git a/platform/nuclei/ux600/objects.mk b/platform/nuclei/ux600/objects.mk
> index 7c429e0..2753a7f 100644
> --- a/platform/nuclei/ux600/objects.mk
> +++ b/platform/nuclei/ux600/objects.mk
> @@ -22,7 +22,6 @@ platform-runcmd = xl_spike \
>  platform-objs-y += platform.o
>
>  # Blobs to build
> -FW_TEXT_START=0xA0000000
>  FW_DYNAMIC=y
>  FW_JUMP=y
>
> diff --git a/platform/template/objects.mk b/platform/template/objects.mk
> index b143cbc..f240a55 100644
> --- a/platform/template/objects.mk
> +++ b/platform/template/objects.mk
> @@ -41,9 +41,6 @@ platform-objs-y += platform.o
>  #
>  # platform-objs-y += <dt file name>.o
>
> -# Firmware load address configuration. This is mandatory.
> -FW_TEXT_START=0x80000000
> -
>  # Optional parameter for path to external FDT
>  # FW_FDT_PATH="path to platform flattened device tree file"
>
> @@ -69,8 +66,7 @@ FW_JUMP=<y|n>
>  # endif
>  # FW_JUMP_FDT_OFFSET=0x2200000
>  #
> -# You can use fixed address for jump firmware as an alternative option,
> -# but this may fail when setting wrong FW_TEXT_START. Use with caution.
> +# You can use fixed address for jump firmware as an alternative option.
>  # SBI will prefer "<X>_ADDR" if both "<X>_ADDR" and "<X>_OFFSET" are
>  # defined
>  # ifeq ($(PLATFORM_RISCV_XLEN), 32)
> @@ -97,8 +93,7 @@ endif
>  # FW_PAYLOAD_PATH="path to next boot stage binary image file"
>  # FW_PAYLOAD_FDT_OFFSET=0x2200000
>  #
> -# You can use fixed address for payload firmware as an alternative option,
> -# but this may fail when setting wrong FW_TEXT_START. Use with caution.
> +# You can use fixed address for payload firmware as an alternative option.
>  # SBI will prefer "FW_PAYLOAD_FDT_ADDR" if both "FW_PAYLOAD_FDT_OFFSET"
>  # and "FW_PAYLOAD_FDT_ADDR" are defined.
>  # FW_PAYLOAD_FDT_ADDR=0x82200000
> --
> 2.43.0
>

