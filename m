From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Apr 2024 17:30:55 +0530
Subject: [RFC PATCH 2/2] firmware: Add support for Linux kernel image header
In-Reply-To: <TYYP286MB1439018D4870E37EC35172A3C6282@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439244707DDDB3B2734D67AC6282@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB1439018D4870E37EC35172A3C6282@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy2txMQD5GcHQQsWYGAf28XssWPVqQtFPjt2qUaOEBdUVQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 15, 2024 at 11:07?PM Vivian Wang <dramforever@live.com> wrote:
>
> The firmwares fw_payload and fw_jump support the same entrypoint ABI as
> M-mode Linux. To support booting theses firmware images from bootloaders
> already supporting M-mode Linux, add a compatible header to the firmware
> image.
>
> The header starts with a jump to skip to the actual code, so including
> it does not affect operation without a bootloader.
>
> Signed-off-by: Vivian Wang <dramforever@live.com>

This won't fly because OpenSBI FW_DYNAMIC expects three parameters
instead of just two expected by Linux flat image:
a0 -> HART ID
a1 - > DTB address
a2 -> FW_DYNAMIC_INFO address

Both QEMU and U-Boot SPL already provide FW_DYNAMIC_INFO to
FW_DYNAMIC in an OpenSBI specific way. Unfortunately, booti or other
U-Boot booting commands don't provide FW_DYAMIC_INFO address
hence no point in making OpenSBI binary look like Linux binary for using
booti from U-Boot M-mode.

Regards,
Anup

> ---
>  firmware/Kconfig                   | 17 +++++++++++++++
>  firmware/fw_base.ldS               |  5 +++++
>  firmware/fw_header_linux.S         | 34 ++++++++++++++++++++++++++++++
>  firmware/fw_jump.S                 |  1 +
>  firmware/fw_payload.S              |  1 +
>  platform/generic/configs/defconfig |  1 +
>  6 files changed, 59 insertions(+)
>  create mode 100644 firmware/fw_header_linux.S
>
> diff --git a/firmware/Kconfig b/firmware/Kconfig
> index d6e0506..50ec340 100644
> --- a/firmware/Kconfig
> +++ b/firmware/Kconfig
> @@ -1 +1,18 @@
>  # SPDX-License-Identifier: BSD-2-Clause
> +
> +menu "Firmware Configuration"
> +
> +choice FW_HEADER
> +       bool "Include Firmware Header"
> +       optional
> +
> +config FW_HEADER_LINUX
> +       bool "Linux Kernel Image"
> +       help
> +         Compatibility with Linux kernel image header, for fw_jump and fw_payload
> +
> +         See: https://www.kernel.org/doc/html/v6.8/arch/riscv/boot-image-header.html
> +
> +endchoice
> +
> +endmenu
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index fb47984..6a3b21b 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -15,6 +15,11 @@
>
>         /* Beginning of the code section */
>
> +       .header :
> +       {
> +               *(.header)
> +       }
> +
>         .text :
>         {
>                 PROVIDE(_text_start = .);
> diff --git a/firmware/fw_header_linux.S b/firmware/fw_header_linux.S
> new file mode 100644
> index 0000000..fbd0cf9
> --- /dev/null
> +++ b/firmware/fw_header_linux.S
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: BSD-2-Clause */
> +
> +#include <sbi/sbi_byteorder.h>
> +
> +#ifdef CONFIG_FW_HEADER_LINUX
> +
> +       /*
> +        * Compatibility with Linux kernel image header, for fw_jump and fw_payload
> +        *
> +        * See: https://www.kernel.org/doc/html/v6.8/arch/riscv/boot-image-header.html
> +        */
> +
> +       .section .header, "a", %progbits
> +
> +       /* 8 bytes at beginning reserved for code */
> +       j _start
> +       .align 3
> +
> +       /* We want to be loaded at start of RAM, so text_offset is 0 */
> +       .dword 0                                        /* text_offset */
> +       .dword cpu_to_le64(_fw_reloc_end - _fw_start)   /* image_size */
> +#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> +       .dword 0                                        /* flags: Not big-endian */
> +#else
> +       .dword 1                                        /* flags: Big-endian */
> +#endif
> +       .word cpu_to_le16(0x0002)                       /* version (0.2) */
> +       .word 0                                         /* res1 */
> +       .dword 0                                        /* res2 */
> +       .ascii "RISCV\0\0\0"                            /* magic */
> +       .ascii "RSC\x05"                                /* magic2 */
> +       .word 0                                         /* res3 */
> +
> +#endif /* CONFIG_FW_HEADER_LINUX */
> diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
> index ebf297f..9b2ddda 100644
> --- a/firmware/fw_jump.S
> +++ b/firmware/fw_jump.S
> @@ -8,6 +8,7 @@
>   */
>
>  #include "fw_base.S"
> +#include "fw_header_linux.S"
>
>         .section .entry, "ax", %progbits
>         .align 3
> diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
> index 3c8433e..e324f6d 100644
> --- a/firmware/fw_payload.S
> +++ b/firmware/fw_payload.S
> @@ -8,6 +8,7 @@
>   */
>
>  #include "fw_base.S"
> +#include "fw_header_linux.S"
>
>         .section .entry, "ax", %progbits
>         .align 3
> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
> index 1ce6a12..4f7217b 100644
> --- a/platform/generic/configs/defconfig
> +++ b/platform/generic/configs/defconfig
> @@ -42,3 +42,4 @@ CONFIG_SERIAL_SEMIHOSTING=y
>  CONFIG_FDT_TIMER=y
>  CONFIG_FDT_TIMER_MTIMER=y
>  CONFIG_FDT_TIMER_PLMT=y
> +CONFIG_FW_HEADER_LINUX=y
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

