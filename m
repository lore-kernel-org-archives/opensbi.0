From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 2 Jun 2021 11:42:23 +0000
Subject: [PATCH v2 1/1] docs: debugging OpenSBI
In-Reply-To: <20210528162214.5073-1-xypron.glpk@gmx.de>
References: <20210528162214.5073-1-xypron.glpk@gmx.de>
Message-ID: <CO6PR04MB7812F93B280CB3F0BC2FB9998D3D9@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: 28 May 2021 21:52
> To: opensbi at lists.infradead.org
> Cc: Anup Patel <Anup.Patel@wdc.com>; Atish Patra <Atish.Patra@wdc.com>;
> Jessica Clarke <jrtc27@jrtc27.com>; Heinrich Schuchardt
> <xypron.glpk@gmx.de>
> Subject: [PATCH v2 1/1] docs: debugging OpenSBI
> 
> Describe how to debug OpenSBI on QEMU with GDB.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
> v2:
> 	As we cannot assume that the user is working on a non-RISC-V
> 	system replace gdb-multiarch by gdb.
> ---
>  docs/platform/qemu_virt.md | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/docs/platform/qemu_virt.md b/docs/platform/qemu_virt.md
> index 2777148..0783be4 100644
> --- a/docs/platform/qemu_virt.md
> +++ b/docs/platform/qemu_virt.md
> @@ -147,3 +147,27 @@ qemu-system-riscv32 -M virt -m 256M -nographic \
>  	-device virtio-blk-device,drive=hd0 \
>  	-append "root=/dev/vda rw console=ttyS0"
>  ```
> +
> +Debugging with GDB
> +------------------
> +
> +In a first console start OpenSBI with QEMU:
> +
> +```
> +qemu-system-riscv64 -M virt -m 256M -nographic \
> +	-bios build/platform/generic/firmware/fw_payload.bin \
> +	-gdb tcp::1234 \
> +	-S
> +
> +```
> +
> +Parameter *-gdb tcp::1234* specifies 1234 as the debug port.
> +Parameter *-S* lets QEMU wait at the first instruction.
> +
> +In a second console start GDB:
> +
> +```
> +gdb build/platform/generic/firmware/fw_payload.elf \
> +	-ex 'target remote localhost:1234'
> +
> +```
> --
> 2.30.2


