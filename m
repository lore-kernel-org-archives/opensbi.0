From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 28 May 2021 08:56:37 -0700
Subject: [PATCH 1/1] docs: debugging OpenSBI
In-Reply-To: <20210528101617.31237-1-xypron.glpk@gmx.de>
References: <20210528101617.31237-1-xypron.glpk@gmx.de>
Message-ID: <CAOnJCU+H8NaBz9y2wQ9dBDSE-CNDiobzh07edp31jq7Q88CWgg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 28, 2021 at 4:10 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> Describe how to debug OpenSBI on QEMU with GDB.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  docs/platform/qemu_virt.md | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/docs/platform/qemu_virt.md b/docs/platform/qemu_virt.md
> index 2777148..de7a028 100644
> --- a/docs/platform/qemu_virt.md
> +++ b/docs/platform/qemu_virt.md
> @@ -147,3 +147,27 @@ qemu-system-riscv32 -M virt -m 256M -nographic \
>         -device virtio-blk-device,drive=hd0 \
>         -append "root=/dev/vda rw console=ttyS0"
>  ```
> +
> +Debugging with GDB
> +------------------
> +
> +In a first console start OpenSBI with QEMU:
> +
> +```
> +qemu-system-riscv64 -M virt -m 256M -nographic \
> +       -bios build/platform/generic/firmware/fw_payload.bin \
> +       -gdb tcp::1234 \
> +       -S
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
> +       -ex 'target remote localhost:1234'
> +
> +```
> --
> 2.32.0.rc0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

