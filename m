From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 May 2024 11:30:15 +0530
Subject: [PATCH v4] firmware: remove FW_TEXT_START
In-Reply-To: <tencent_7553DC5290AF126F8FE8B3A160AB566C2309@qq.com>
References: <20240408153013.653350-1-wxjstz@126.com> <CAAhSdy0EYuDn_FcPnAMWX0t449iF4eazGEVm1Lhgm63137BkmQ@mail.gmail.com>
 <2d1f2b6b-0feb-4507-b432-6801d4bae490@rivosinc.com> <CAAhSdy2E3km1W=LeztDAk+iJe1vZtWZV0OqKB7fDP72iyf0rAA@mail.gmail.com>
 <tencent_7553DC5290AF126F8FE8B3A160AB566C2309@qq.com>
Message-ID: <CAAhSdy1hkYGoZB15Yt6TETxF0Pnr_3dDXGviT0uVZ1UrDNX3hg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 14, 2024 at 10:20?PM Cheng Yang <yangcheng.work@foxmail.com> wrote:
>
> &gt;On Tue, May 14, 2024 at 9:58?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
> &gt;&gt;
> &gt;&gt;
> &gt;&gt;
> &gt;&gt; On 10/04/2024 07:18, Anup Patel wrote:
> &gt;&gt; &gt; On Mon, Apr 8, 2024 at 9:01?PM Xiang W <wxjstz@126.com> wrote:
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; Now opensbi can run at any address via dynamic relocation. We can
> &gt;&gt; &gt;&gt; remove FW_TEXT_START.
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; Signed-off-by: Xiang W <wxjstz@126.com>
> &gt;&gt; &gt;
> &gt;&gt; &gt; LGTM.
> &gt;&gt; &gt;
> &gt;&gt; &gt; Reviewed-by: Anup Patel <anup@brainfault.org>
> &gt;&gt; &gt; Tested-by: Anup Patel <anup@brainfault.org>
> &gt;&gt; &gt;
> &gt;&gt; &gt; Applied this patch to the riscv/opensbi repo.
> &gt;&gt; &gt;
> &gt;&gt; &gt; Thanks,
> &gt;&gt; &gt; Anup
> &gt;&gt;
> &gt;&gt; Hi Anup,
> &gt;&gt;
> &gt;&gt; This patch seems to break spike support. The newly created ELF is not
> &gt;&gt; marked as EXEC anymore but DYNAMIC and it fails with the following error:
> &gt;&gt;
> &gt;&gt; spike: ../fesvr/elfloader.cc:45:
> &gt;&gt; std::map<std::__cxx11::basic_string<char>, long unsigned int&gt;
> &gt;&gt; load_elf(const char*, memif_t*, reg_t*, unsigned int): Assertion
> &gt;&gt; `IS_ELF_EXEC(*eh64)' failed.
> &gt;&gt;
> &gt;&gt; Should we fixed OpenSBI or allow spike to load a DYNAMIC elf ?
> &gt;
> &gt;I think it is better to use FW_DYNAMIC in Spike because various
> &gt;other projects (such as U-Boot, QEMU, etc) use it.
> &gt;
> &gt;Also, Spike should support loading M-mode firmware in BIN
> &gt;(flat binary) format as well.
> &gt;
> &gt;Regards,
> &gt;Anup
> &gt;
> &gt;&gt;
> &gt;&gt; Thanks,
> &gt;&gt;
> &gt;&gt; Cl?ment
> &gt;&gt;
>
> Hi Anup,
>
> I think this patch is not that necessary, and after applying
> this patch, we lost an elf file that can disassemble or directly
> provide symbol addresses to gdb, which caused some difficulties
> in debugging. In the past, I could pass it in Specify the address
> of FW_TEXT_START during compilation to generate an ELF file containing
> accurate symbol addresses, which is useful for debugging OpenSBI.

If FW_TEXT_START is needed only for convenience in debugging
then we can bring it back as an optional parameter which is by default
set to 0x0.

Regards,
Anup

>
> Best regards,
> Cheng Yang
>
> &gt;&gt; &gt;
> &gt;&gt; &gt;&gt; ---
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; v4 changes:
> &gt;&gt; &gt;&gt; - only remove FW_TEXT_START by anup's suggestion
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  docs/firmware/fw.md                |  2 --
> &gt;&gt; &gt;&gt;  docs/firmware/fw_jump.md           |  4 ++--
> &gt;&gt; &gt;&gt;  docs/firmware/fw_payload.md        |  6 +++---
> &gt;&gt; &gt;&gt;  docs/platform/generic.md           | 11 +++--------
> &gt;&gt; &gt;&gt;  firmware/fw_base.S                 |  4 +---
> &gt;&gt; &gt;&gt;  firmware/fw_base.ldS               |  3 +--
> &gt;&gt; &gt;&gt;  firmware/fw_payload.elf.ldS        |  2 +-
> &gt;&gt; &gt;&gt;  firmware/objects.mk                |  4 ----
> &gt;&gt; &gt;&gt;  firmware/payloads/test.elf.ldS     |  2 +-
> &gt;&gt; &gt;&gt;  platform/fpga/ariane/objects.mk    |  1 -
> &gt;&gt; &gt;&gt;  platform/fpga/openpiton/objects.mk |  1 -
> &gt;&gt; &gt;&gt;  platform/generic/objects.mk        |  3 +--
> &gt;&gt; &gt;&gt;  platform/kendryte/k210/objects.mk  |  1 -
> &gt;&gt; &gt;&gt;  platform/nuclei/ux600/objects.mk   |  1 -
> &gt;&gt; &gt;&gt;  platform/template/objects.mk       |  9 ++-------
> &gt;&gt; &gt;&gt;  15 files changed, 15 insertions(+), 39 deletions(-)
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
> &gt;&gt; &gt;&gt; index 2f4deb5..3cc0262 100644
> &gt;&gt; &gt;&gt; --- a/docs/firmware/fw.md
> &gt;&gt; &gt;&gt; +++ b/docs/firmware/fw.md
> &gt;&gt; &gt;&gt; @@ -61,8 +61,6 @@ Firmware Configuration and Compilation
> &gt;&gt; &gt;&gt;  All firmware types support the following common compile time configuration
> &gt;&gt; &gt;&gt;  parameters:
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -* **FW_TEXT_START** - Defines the execution address of the OpenSBI firmware.
> &gt;&gt; &gt;&gt; -  This configuration parameter is mandatory.
> &gt;&gt; &gt;&gt;  * **FW_FDT_PATH** - Path to an external flattened device tree binary file to
> &gt;&gt; &gt;&gt;    be embedded in the *.rodata* section of the final firmware. If this option
> &gt;&gt; &gt;&gt;    is not provided then the firmware will expect the FDT to be passed as an
> &gt;&gt; &gt;&gt; diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
> &gt;&gt; &gt;&gt; index 2ee6b29..66be016 100644
> &gt;&gt; &gt;&gt; --- a/docs/firmware/fw_jump.md
> &gt;&gt; &gt;&gt; +++ b/docs/firmware/fw_jump.md
> &gt;&gt; &gt;&gt; @@ -35,7 +35,7 @@ follows:
> &gt;&gt; &gt;&gt;    At least one of *FW_JUMP_ADDR* and *FW_JUMP_OFFSET* (see below) should be
> &gt;&gt; &gt;&gt;    defined. Compilation errors will result from not defining one of them.
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -* **FW_JUMP_OFFSET** - Address offset from the *FW_TEXT_START* where the
> &gt;&gt; &gt;&gt; +* **FW_JUMP_OFFSET** - Address offset from the opensbi load address where the
> &gt;&gt; &gt;&gt;    entry point of the next booting stage is located. This offset is used as
> &gt;&gt; &gt;&gt;    relocatable address of the next booting stage entry point. If *FW_JUMP_ADDR*
> &gt;&gt; &gt;&gt;    is also defined, the firmware will prefer *FW_JUMP_ADDR*.
> &gt;&gt; &gt;&gt; @@ -62,7 +62,7 @@ follows:
> &gt;&gt; &gt;&gt;    echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
> &gt;&gt; &gt;&gt;    ```
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -* **FW_JUMP_FDT_OFFSET** - Address offset from the *FW_TEXT_START* where
> &gt;&gt; &gt;&gt; +* **FW_JUMP_FDT_OFFSET** - Address offset from the opensbi load address where
> &gt;&gt; &gt;&gt;    the FDT will be passed to the next booting stage. This offset is used
> &gt;&gt; &gt;&gt;    as relocatable address of the FDT passed to the next booting stage. If
> &gt;&gt; &gt;&gt;    *FW_JUMP_FDT_ADDR* is also defined, the firmware will prefer
> &gt;&gt; &gt;&gt; diff --git a/docs/firmware/fw_payload.md b/docs/firmware/fw_payload.md
> &gt;&gt; &gt;&gt; index a67fc50..d25be60 100644
> &gt;&gt; &gt;&gt; --- a/docs/firmware/fw_payload.md
> &gt;&gt; &gt;&gt; +++ b/docs/firmware/fw_payload.md
> &gt;&gt; &gt;&gt; @@ -36,8 +36,8 @@ options. These configuration parameters can be defined using either the top
> &gt;&gt; &gt;&gt;  level `make` command line or the target platform *objects.mk* configuration
> &gt;&gt; &gt;&gt;  file. The parameters currently defined are as follows:
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -* **FW_PAYLOAD_OFFSET** - Offset from *FW_TEXT_START* where the payload binary
> &gt;&gt; &gt;&gt; -  will be linked in the final *FW_PAYLOAD* firmware binary image. This
> &gt;&gt; &gt;&gt; +* **FW_PAYLOAD_OFFSET** - Offset from the opensbi load address where the payload
> &gt;&gt; &gt;&gt; +  binary will be linked in the final *FW_PAYLOAD* firmware binary image. This
> &gt;&gt; &gt;&gt;    configuration parameter is mandatory if *FW_PAYLOAD_ALIGN* is not defined.
> &gt;&gt; &gt;&gt;    Compilation errors will result from an incorrect definition of
> &gt;&gt; &gt;&gt;    *FW_PAYLOAD_OFFSET* or of *FW_PAYLOAD_ALIGN*, or if neither of these
> &gt;&gt; &gt;&gt; @@ -62,7 +62,7 @@ file. The parameters currently defined are as follows:
> &gt;&gt; &gt;&gt;    firmware will pass the FDT address passed by the previous booting stage
> &gt;&gt; &gt;&gt;    to the next booting stage.
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -* **FW_PAYLOAD_FDT_OFFSET** - Address offset from the *FW_TEXT_START* where
> &gt;&gt; &gt;&gt; +* **FW_PAYLOAD_FDT_OFFSET** - Address offset from the opensbi load address where
> &gt;&gt; &gt;&gt;    the FDT will be passed to the next booting stage. This offset is used as
> &gt;&gt; &gt;&gt;    relocatable address of the FDT passed to the next booting stage. If
> &gt;&gt; &gt;&gt;    *FW_PAYLOAD_FDT_ADDR* is also defined, the firmware will prefer *FW_PAYLOAD_FDT_ADDR*.
> &gt;&gt; &gt;&gt; diff --git a/docs/platform/generic.md b/docs/platform/generic.md
> &gt;&gt; &gt;&gt; index c29eb04..709b436 100644
> &gt;&gt; &gt;&gt; --- a/docs/platform/generic.md
> &gt;&gt; &gt;&gt; +++ b/docs/platform/generic.md
> &gt;&gt; &gt;&gt; @@ -9,10 +9,9 @@ boards.
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  By default, the generic FDT platform makes following assumptions:
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -1. platform FW_TEXT_START is 0x80000000
> &gt;&gt; &gt;&gt; -2. platform features are default
> &gt;&gt; &gt;&gt; -3. platform stack size is default
> &gt;&gt; &gt;&gt; -4. platform has no quirks or work-arounds
> &gt;&gt; &gt;&gt; +1. platform features are default
> &gt;&gt; &gt;&gt; +2. platform stack size is default
> &gt;&gt; &gt;&gt; +3. platform has no quirks or work-arounds
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  The above assumptions (except 1) can be overridden by adding special platform
> &gt;&gt; &gt;&gt;  callbacks which will be called based on FDT root node compatible string.
> &gt;&gt; &gt;&gt; @@ -33,10 +32,6 @@ Users of the generic FDT platform will have to ensure that:
> &gt;&gt; &gt;&gt;  To build the platform-specific library and firmware images, provide the
> &gt;&gt; &gt;&gt;  *PLATFORM=generic* parameter to the top level `make` command.
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -For custom FW_TEXT_START, we can build the platform-specific library and
> &gt;&gt; &gt;&gt; -firmware images by passing *PLATFORM=generic FW_TEXT_START=<custom_text_start>*
> &gt;&gt; &gt;&gt; -parameter to the top level `make` command.
> &gt;&gt; &gt;&gt; -
> &gt;&gt; &gt;&gt;  Platform Options
> &gt;&gt; &gt;&gt;  ----------------
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> &gt;&gt; &gt;&gt; index b950c0b..9f995a2 100644
> &gt;&gt; &gt;&gt; --- a/firmware/fw_base.S
> &gt;&gt; &gt;&gt; +++ b/firmware/fw_base.S
> &gt;&gt; &gt;&gt; @@ -53,9 +53,7 @@ _try_lottery:
> &gt;&gt; &gt;&gt;         bnez    a6, _wait_for_boot_hart
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;         /* relocate the global table content */
> &gt;&gt; &gt;&gt; -       li      t0, FW_TEXT_START       /* link start */
> &gt;&gt; &gt;&gt; -       lla     t1, _fw_start           /* load start */
> &gt;&gt; &gt;&gt; -       sub     t2, t1, t0              /* load offset */
> &gt;&gt; &gt;&gt; +       lla     t2, _fw_start
> &gt;&gt; &gt;&gt;         lla     t0, __rel_dyn_start
> &gt;&gt; &gt;&gt;         lla     t1, __rel_dyn_end
> &gt;&gt; &gt;&gt;         beq     t0, t1, _relocate_done
> &gt;&gt; &gt;&gt; diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> &gt;&gt; &gt;&gt; index fb47984..9d11db5 100644
> &gt;&gt; &gt;&gt; --- a/firmware/fw_base.ldS
> &gt;&gt; &gt;&gt; +++ b/firmware/fw_base.ldS
> &gt;&gt; &gt;&gt; @@ -7,8 +7,7 @@
> &gt;&gt; &gt;&gt;   *   Anup Patel <anup.patel@wdc.com>
> &gt;&gt; &gt;&gt;   */
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -       . = FW_TEXT_START;
> &gt;&gt; &gt;&gt; -       /* Don't add any section between FW_TEXT_START and _fw_start */
> &gt;&gt; &gt;&gt; +       /* Don't add any section before _fw_start */
> &gt;&gt; &gt;&gt;         PROVIDE(_fw_start = .);
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;         . = ALIGN(0x1000); /* Need this to create proper sections */
> &gt;&gt; &gt;&gt; diff --git a/firmware/fw_payload.elf.ldS b/firmware/fw_payload.elf.ldS
> &gt;&gt; &gt;&gt; index f1a544b..94e1ac6 100644
> &gt;&gt; &gt;&gt; --- a/firmware/fw_payload.elf.ldS
> &gt;&gt; &gt;&gt; +++ b/firmware/fw_payload.elf.ldS
> &gt;&gt; &gt;&gt; @@ -15,7 +15,7 @@ SECTIONS
> &gt;&gt; &gt;&gt;         #include "fw_base.ldS"
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  #ifdef FW_PAYLOAD_OFFSET
> &gt;&gt; &gt;&gt; -       . = FW_TEXT_START + FW_PAYLOAD_OFFSET;
> &gt;&gt; &gt;&gt; +       . = FW_PAYLOAD_OFFSET;
> &gt;&gt; &gt;&gt;  #else
> &gt;&gt; &gt;&gt;         . = ALIGN(FW_PAYLOAD_ALIGN);
> &gt;&gt; &gt;&gt;  #endif
> &gt;&gt; &gt;&gt; diff --git a/firmware/objects.mk b/firmware/objects.mk
> &gt;&gt; &gt;&gt; index e6b364b..a51ff65 100644
> &gt;&gt; &gt;&gt; --- a/firmware/objects.mk
> &gt;&gt; &gt;&gt; +++ b/firmware/objects.mk
> &gt;&gt; &gt;&gt; @@ -13,10 +13,6 @@ firmware-cflags-y +=
> &gt;&gt; &gt;&gt;  firmware-asflags-y +=
> &gt;&gt; &gt;&gt;  firmware-ldflags-y +=
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -ifdef FW_TEXT_START
> &gt;&gt; &gt;&gt; -firmware-genflags-y += -DFW_TEXT_START=$(FW_TEXT_START)
> &gt;&gt; &gt;&gt; -endif
> &gt;&gt; &gt;&gt; -
> &gt;&gt; &gt;&gt;  ifdef FW_FDT_PATH
> &gt;&gt; &gt;&gt;  firmware-genflags-y += -DFW_FDT_PATH=\"$(FW_FDT_PATH)\"
> &gt;&gt; &gt;&gt;  ifdef FW_FDT_PADDING
> &gt;&gt; &gt;&gt; diff --git a/firmware/payloads/test.elf.ldS b/firmware/payloads/test.elf.ldS
> &gt;&gt; &gt;&gt; index 2328a1b..08e008f 100644
> &gt;&gt; &gt;&gt; --- a/firmware/payloads/test.elf.ldS
> &gt;&gt; &gt;&gt; +++ b/firmware/payloads/test.elf.ldS
> &gt;&gt; &gt;&gt; @@ -13,7 +13,7 @@ ENTRY(_start)
> &gt;&gt; &gt;&gt;  SECTIONS
> &gt;&gt; &gt;&gt;  {
> &gt;&gt; &gt;&gt;  #ifdef FW_PAYLOAD_OFFSET
> &gt;&gt; &gt;&gt; -       . = FW_TEXT_START + FW_PAYLOAD_OFFSET;
> &gt;&gt; &gt;&gt; +       . = FW_PAYLOAD_OFFSET;
> &gt;&gt; &gt;&gt;  #else
> &gt;&gt; &gt;&gt;         . = ALIGN(FW_PAYLOAD_ALIGN);
> &gt;&gt; &gt;&gt;  #endif
> &gt;&gt; &gt;&gt; diff --git a/platform/fpga/ariane/objects.mk b/platform/fpga/ariane/objects.mk
> &gt;&gt; &gt;&gt; index 83581ac..d1177f4 100644
> &gt;&gt; &gt;&gt; --- a/platform/fpga/ariane/objects.mk
> &gt;&gt; &gt;&gt; +++ b/platform/fpga/ariane/objects.mk
> &gt;&gt; &gt;&gt; @@ -17,7 +17,6 @@ platform-objs-y += platform.o
> &gt;&gt; &gt;&gt;  PLATFORM_RISCV_XLEN = 64
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  # Blobs to build
> &gt;&gt; &gt;&gt; -FW_TEXT_START=0x80000000
> &gt;&gt; &gt;&gt;  FW_JUMP=n
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  ifeq ($(PLATFORM_RISCV_XLEN), 32)
> &gt;&gt; &gt;&gt; diff --git a/platform/fpga/openpiton/objects.mk b/platform/fpga/openpiton/objects.mk
> &gt;&gt; &gt;&gt; index c8c345a..1a0ce0c 100644
> &gt;&gt; &gt;&gt; --- a/platform/fpga/openpiton/objects.mk
> &gt;&gt; &gt;&gt; +++ b/platform/fpga/openpiton/objects.mk
> &gt;&gt; &gt;&gt; @@ -16,7 +16,6 @@ platform-objs-y += platform.o
> &gt;&gt; &gt;&gt;  PLATFORM_RISCV_XLEN = 64
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  # Blobs to build
> &gt;&gt; &gt;&gt; -FW_TEXT_START=0x80000000
> &gt;&gt; &gt;&gt;  FW_JUMP=n
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  ifeq ($(PLATFORM_RISCV_XLEN), 32)
> &gt;&gt; &gt;&gt; diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
> &gt;&gt; &gt;&gt; index 85aa723..c215935 100644
> &gt;&gt; &gt;&gt; --- a/platform/generic/objects.mk
> &gt;&gt; &gt;&gt; +++ b/platform/generic/objects.mk
> &gt;&gt; &gt;&gt; @@ -15,14 +15,13 @@ platform-ldflags-y =
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  # Command for platform specific "make run"
> &gt;&gt; &gt;&gt;  platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
> &gt;&gt; &gt;&gt; -  -nographic -bios $(build_dir)/platform/generic/firmware/fw_payload.elf
> &gt;&gt; &gt;&gt; +  -nographic -bios $(build_dir)/platform/generic/firmware/fw_payload.bin
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  # Objects to build
> &gt;&gt; &gt;&gt;  platform-objs-y += platform.o
> &gt;&gt; &gt;&gt;  platform-objs-y += platform_override_modules.o
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  # Blobs to build
> &gt;&gt; &gt;&gt; -FW_TEXT_START=0x80000000
> &gt;&gt; &gt;&gt;  FW_DYNAMIC=y
> &gt;&gt; &gt;&gt;  FW_JUMP=y
> &gt;&gt; &gt;&gt;  ifeq ($(PLATFORM_RISCV_XLEN), 32)
> &gt;&gt; &gt;&gt; diff --git a/platform/kendryte/k210/objects.mk b/platform/kendryte/k210/objects.mk
> &gt;&gt; &gt;&gt; index 1bfb898..efac3d2 100644
> &gt;&gt; &gt;&gt; --- a/platform/kendryte/k210/objects.mk
> &gt;&gt; &gt;&gt; +++ b/platform/kendryte/k210/objects.mk
> &gt;&gt; &gt;&gt; @@ -21,6 +21,5 @@ platform-varprefix-k210.o = dt_k210
> &gt;&gt; &gt;&gt;  platform-padding-k210.o = 2048
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  # Blobs to build
> &gt;&gt; &gt;&gt; -FW_TEXT_START=0x80000000
> &gt;&gt; &gt;&gt;  FW_PAYLOAD=y
> &gt;&gt; &gt;&gt;  FW_PAYLOAD_ALIGN=0x1000
> &gt;&gt; &gt;&gt; diff --git a/platform/nuclei/ux600/objects.mk b/platform/nuclei/ux600/objects.mk
> &gt;&gt; &gt;&gt; index 7c429e0..2753a7f 100644
> &gt;&gt; &gt;&gt; --- a/platform/nuclei/ux600/objects.mk
> &gt;&gt; &gt;&gt; +++ b/platform/nuclei/ux600/objects.mk
> &gt;&gt; &gt;&gt; @@ -22,7 +22,6 @@ platform-runcmd = xl_spike \
> &gt;&gt; &gt;&gt;  platform-objs-y += platform.o
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;  # Blobs to build
> &gt;&gt; &gt;&gt; -FW_TEXT_START=0xA0000000
> &gt;&gt; &gt;&gt;  FW_DYNAMIC=y
> &gt;&gt; &gt;&gt;  FW_JUMP=y
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; diff --git a/platform/template/objects.mk b/platform/template/objects.mk
> &gt;&gt; &gt;&gt; index b143cbc..f240a55 100644
> &gt;&gt; &gt;&gt; --- a/platform/template/objects.mk
> &gt;&gt; &gt;&gt; +++ b/platform/template/objects.mk
> &gt;&gt; &gt;&gt; @@ -41,9 +41,6 @@ platform-objs-y += platform.o
> &gt;&gt; &gt;&gt;  #
> &gt;&gt; &gt;&gt;  # platform-objs-y += <dt file="" name="">.o
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; -# Firmware load address configuration. This is mandatory.
> &gt;&gt; &gt;&gt; -FW_TEXT_START=0x80000000
> &gt;&gt; &gt;&gt; -
> &gt;&gt; &gt;&gt;  # Optional parameter for path to external FDT
> &gt;&gt; &gt;&gt;  # FW_FDT_PATH="path to platform flattened device tree file"
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; @@ -69,8 +66,7 @@ FW_JUMP=<y|n>
> &gt;&gt; &gt;&gt;  # endif
> &gt;&gt; &gt;&gt;  # FW_JUMP_FDT_OFFSET=0x2200000
> &gt;&gt; &gt;&gt;  #
> &gt;&gt; &gt;&gt; -# You can use fixed address for jump firmware as an alternative option,
> &gt;&gt; &gt;&gt; -# but this may fail when setting wrong FW_TEXT_START. Use with caution.
> &gt;&gt; &gt;&gt; +# You can use fixed address for jump firmware as an alternative option.
> &gt;&gt; &gt;&gt;  # SBI will prefer "<x>_ADDR" if both "<x>_ADDR" and "<x>_OFFSET" are
> &gt;&gt; &gt;&gt;  # defined
> &gt;&gt; &gt;&gt;  # ifeq ($(PLATFORM_RISCV_XLEN), 32)
> &gt;&gt; &gt;&gt; @@ -97,8 +93,7 @@ endif
> &gt;&gt; &gt;&gt;  # FW_PAYLOAD_PATH="path to next boot stage binary image file"
> &gt;&gt; &gt;&gt;  # FW_PAYLOAD_FDT_OFFSET=0x2200000
> &gt;&gt; &gt;&gt;  #
> &gt;&gt; &gt;&gt; -# You can use fixed address for payload firmware as an alternative option,
> &gt;&gt; &gt;&gt; -# but this may fail when setting wrong FW_TEXT_START. Use with caution.
> &gt;&gt; &gt;&gt; +# You can use fixed address for payload firmware as an alternative option.
> &gt;&gt; &gt;&gt;  # SBI will prefer "FW_PAYLOAD_FDT_ADDR" if both "FW_PAYLOAD_FDT_OFFSET"
> &gt;&gt; &gt;&gt;  # and "FW_PAYLOAD_FDT_ADDR" are defined.
> &gt;&gt; &gt;&gt;  # FW_PAYLOAD_FDT_ADDR=0x82200000
> &gt;&gt; &gt;&gt; --
> &gt;&gt; &gt;&gt; 2.43.0
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;
> &gt;
> &gt;--
> &gt;opensbi mailing list
> &gt;opensbi at lists.infradead.org
> &gt;http://lists.infradead.org/mailman/listinfo/opensbi</x></x></x></y|n></dt></anup.patel@wdc.com></custom_text_start></std::__cxx11::basic_string<char></anup@brainfault.org></anup@brainfault.org></wxjstz@126.com></wxjstz@126.com></cleger@rivosinc.com>

