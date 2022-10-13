From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 09:25:56 +0530
Subject: [PATCH v5] docs/firmware: Update FW_JUMP documentation
In-Reply-To: <20220927073409.2982-1-nylon.chen@sifive.com>
References: <20220927073409.2982-1-nylon.chen@sifive.com>
Message-ID: <CAAhSdy02uGgyHnAjeB3+g53R9XhCmqRuLcKDdCbT2DcSoTLZJQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 27, 2022 at 1:04 PM Nylon Chen <nylon.chen@sifive.com> wrote:
>
> From: "Nylon.Chen" <nylon.chen@sifive.com>
>
> Add a tip for OpenSBI's FW_JUMP which helps
> users avoid overwriting the kernel.
>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
>  docs/firmware/fw_jump.md | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
> index 35a4301..956897e 100644
> --- a/docs/firmware/fw_jump.md
> +++ b/docs/firmware/fw_jump.md
> @@ -41,6 +41,22 @@ follows:
>    provided, then the OpenSBI firmware will pass the FDT address passed by the
>    previous booting stage to the next booting stage.
>
> +  When using the default *FW_JUMP_FDT_ADDR* with *PLATFORM=generic*, you must
> +  ensure *FW_JUMP_FDT_ADDR* is set high enough to avoid overwriting the kernel.
> +  You can use the following method.
> +
> +  ```
> +  ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '/^ +[0-9]+ /\
> +  {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' \
> +  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
> +  increase FW_JUMP_FDT_ADDR
> +
> +  ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | \
> +  awk -n '/^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}'\
> +  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
> +  increase FW_JUMP_FDT_ADDR
> +  ```
> +
>  *FW_JUMP* Example
>  -----------------
>
> --
> 2.36.1
>

