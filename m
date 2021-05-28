From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 28 May 2021 16:59:26 +0100
Subject: [PATCH 1/1] docs: debugging OpenSBI
In-Reply-To: <20210528101617.31237-1-xypron.glpk@gmx.de>
References: <20210528101617.31237-1-xypron.glpk@gmx.de>
Message-ID: <D5A43496-05E7-413D-B3B5-89DBE6AF7486@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 28 May 2021, at 11:16, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> 
> Describe how to debug OpenSBI on QEMU with GDB.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> docs/platform/qemu_virt.md | 24 ++++++++++++++++++++++++
> 1 file changed, 24 insertions(+)
> 
> diff --git a/docs/platform/qemu_virt.md b/docs/platform/qemu_virt.md
> index 2777148..de7a028 100644
> --- a/docs/platform/qemu_virt.md
> +++ b/docs/platform/qemu_virt.md
> @@ -147,3 +147,27 @@ qemu-system-riscv32 -M virt -m 256M -nographic \
> 	-device virtio-blk-device,drive=hd0 \
> 	-append "root=/dev/vda rw console=ttyS0"
> ```
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
> +gdb-multiarch build/platform/generic/firmware/fw_payload.elf \
> +	-ex 'target remote localhost:1234'

This is rather presumptuous about what the user?s gdb is. More often than not
they probably have a triple-prefixed gdb, not a gdb-multiarch. I would just
leave it as gdb and let them figure out what that means for them, maybe with a
note that they should make sure to use a gdb that?s built with RISC-V support.

Jess


