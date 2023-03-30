From: Xiang W <wxjstz@126.com>
Date: Thu, 30 Mar 2023 10:15:59 +0800
Subject: [PATCH v3] docs: Correct FW_JUMP_FDT_ADDR calculation example
In-Reply-To: <20230324120728.3926464-1-gsomlo@gmail.com>
References: <20230324120728.3926464-1-gsomlo@gmail.com>
Message-ID: <7ecf54d130e979c0fc1f74f6ce0483eff1a0fa03.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-03-24???? 08:07 -0400?Gabriel Somlo???
> When using `PLATFORM=generic` defaults, the kernel is loaded at
> `FW_JUMP_ADDR`, and the FDT is loaded at `FW_JUMP_FDT_ADDR.
> 
> Therefore, the maximum kernel size before `FW_JUMP_FDT_ADDR` must
> be increased is `$(( FW_JUMP_FDT_ADDR - FW_JUMP_ADDR ))`.
> 
> The example calculation assumes `rv64`, and is wrong to boot
> (off by 0x200000). Fix it and update it for the general case.
> 
> Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>
> ---
> ?docs/firmware/fw_jump.md | 16 ++++++++--------
> ?1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
> index 956897e..ed3a43e 100644
> --- a/docs/firmware/fw_jump.md
> +++ b/docs/firmware/fw_jump.md
> @@ -46,15 +46,15 @@ follows:
> ?? You can use the following method.
> ?
> ?? ```
> -? ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '/^ +[0-9]+ /\
> -? {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' \
> -? | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
> -? increase FW_JUMP_FDT_ADDR
> +? ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '
> +? /^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' |
> +? (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) &&
FW_JUMP_FDT_ADDR and FW_JUMP_ADDR should be variables in the shell,
and references need to use $ as the starting char.

> +? echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
> ?
> -? ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | \
> -? awk -n '/^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}'\
> -? | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
> -? increase FW_JUMP_FDT_ADDR
> +? ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | awk -n '
> +? /^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' |
> +? (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) &&
Same as above

Regards,
Xiang W
> +? echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
> ?? ```
> ?
> ?*FW_JUMP* Example
> -- 
> 2.39.2
> 
> 


