From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 29 Jun 2020 04:48:53 +0000
Subject: [PATCH v2 1/3] docs/platform: Update QEMU parameter for fw_payload
In-Reply-To: <1593134764-16743-1-git-send-email-bmeng.cn@gmail.com>
References: <1593134764-16743-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <DM6PR04MB6201C417C1BE52778595D0D98D6E0@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Bin
> Meng
> Sent: 26 June 2020 06:56
> To: Atish Patra <Atish.Patra@wdc.com>; opensbi at lists.infradead.org
> Cc: Bin Meng <bin.meng@windriver.com>
> Subject: [PATCH v2 1/3] docs/platform: Update QEMU parameter for
> fw_payload
> 
> From: Bin Meng <bin.meng@windriver.com>
> 
> Since QEMU v5.1, if there is no "-bios" option provided, the default OpenSBI
> firmware will be loaded by QEMU as the BIOS automatically, hence to load
> fw_payload type image, we should explicitly pass the "-bios" option to
> QEMU.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
> 
> (no changes since v1)
> 
>  docs/platform/qemu_virt.md | 12 ++++++------
>  docs/platform/spike.md     |  4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/platform/qemu_virt.md b/docs/platform/qemu_virt.md
> index 2196e5a..2777148 100644
> --- a/docs/platform/qemu_virt.md
> +++ b/docs/platform/qemu_virt.md
> @@ -28,7 +28,7 @@ make PLATFORM=generic
>  Run:
>  ```
>  qemu-system-riscv64 -M virt -m 256M -nographic \
> -	-kernel build/platform/generic/firmware/fw_payload.bin
> +	-bios build/platform/generic/firmware/fw_payload.bin
>  ```
> 
>  **U-Boot Payload**
> @@ -44,7 +44,7 @@ make PLATFORM=generic
> FW_PAYLOAD_PATH=<uboot_build_directory>/u-boot.bin
>  Run:
>  ```
>  qemu-system-riscv64 -M virt -m 256M -nographic \
> -	-kernel build/platform/generic/firmware/fw_payload.elf
> +	-bios build/platform/generic/firmware/fw_payload.elf
>  ```
>  or
>  ```
> @@ -66,7 +66,7 @@ make PLATFORM=generic
> FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Im
>  Run:
>  ```
>  qemu-system-riscv64 -M virt -m 256M -nographic \
> -	-kernel build/platform/generic/firmware/fw_payload.elf \
> +	-bios build/platform/generic/firmware/fw_payload.elf \
>  	-drive file=<path_to_linux_rootfs>,format=raw,id=hd0 \
>  	-device virtio-blk-device,drive=hd0 \
>  	-append "root=/dev/vda rw console=ttyS0"
> @@ -95,7 +95,7 @@ make PLATFORM=generic PLATFORM_RISCV_XLEN=32
>  Run:
>  ```
>  qemu-system-riscv32 -M virt -m 256M -nographic \
> -	-kernel build/platform/generic/firmware/fw_payload.bin
> +	-bios build/platform/generic/firmware/fw_payload.bin
>  ```
> 
>  **U-Boot Payload**
> @@ -111,7 +111,7 @@ make PLATFORM=generic
> PLATFORM_RISCV_XLEN=32 FW_PAYLOAD_PATH=<uboot_build_direct
>  Run:
>  ```
>  qemu-system-riscv32 -M virt -m 256M -nographic \
> -	-kernel build/platform/generic/firmware/fw_payload.elf
> +	-bios build/platform/generic/firmware/fw_payload.elf
>  ```
>  or
>  ```
> @@ -133,7 +133,7 @@ make PLATFORM=generic
> PLATFORM_RISCV_XLEN=32 FW_PAYLOAD_PATH=<linux_build_direct
>  Run:
>  ```
>  qemu-system-riscv32 -M virt -m 256M -nographic \
> -	-kernel build/platform/generic/firmware/fw_payload.elf \
> +	-bios build/platform/generic/firmware/fw_payload.elf \
>  	-drive file=<path_to_linux_rootfs>,format=raw,id=hd0 \
>  	-device virtio-blk-device,drive=hd0 \
>  	-append "root=/dev/vda rw console=ttyS0"
> diff --git a/docs/platform/spike.md b/docs/platform/spike.md index
> 8d6b422..79e2eb2 100644
> --- a/docs/platform/spike.md
> +++ b/docs/platform/spike.md
> @@ -59,7 +59,7 @@ make PLATFORM=generic
>  Run:
>  ```
>  qemu-system-riscv64 -M spike -m 256M -nographic \
> -	-kernel build/platform/generic/firmware/fw_payload.elf
> +	-bios build/platform/generic/firmware/fw_payload.elf
>  ```
> 
>  **Linux Kernel Payload**
> @@ -75,7 +75,7 @@ make PLATFORM=generic
> FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Im
>  Run:
>  ```
>  qemu-system-riscv64 -M spike -m 256M -nographic \
> -	-kernel build/platform/generic/firmware/fw_payload.elf \
> +	-bios build/platform/generic/firmware/fw_payload.elf \
>  	-initrd <path_to_cpio_ramdisk> \
>  	-append "root=/dev/ram rw console=hvc0 earlycon=sbi"
>  ```
> --
> 2.7.4
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

