From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 23 Mar 2023 18:18:00 +0100
Subject: [PATCH v1] docs: Correct FW_JUMP_FDT_ADDR calculation example
In-Reply-To: <20230322170448.3600124-1-gsomlo@gmail.com>
References: <20230322170448.3600124-1-gsomlo@gmail.com>
Message-ID: <20230323171800.fngjibzpt4omg3ml@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 22, 2023 at 01:04:48PM -0400, Gabriel Somlo wrote:
> When using `PLATFORM=generic` defaults, the kernel is loaded at
> `FW_JUMP_ADDR = FW_TEXT_START + 0x200000`, and the FDT is loaded at
> `FW_JUMP_FDT_ADDR = FW_TEXT_START + 0x2200000`.
> 
> Therefore, the maximum kernel size before `FW_JUMP_FDT_ADDR` must
> be increased is the difference, or `0x2000000`.

Sounds good, but this is only correct for RV64. For RV32 it should be
0x1e00000. I wonder if we should do something like

   ```
   ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '/^ +[0-9]+ /\
   {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' \
-  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
-  increase FW_JUMP_FDT_ADDR
+  | (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) && echo fdt overlaps \
+  kernel, increase FW_JUMP_FDT_ADDR

   ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | \
   awk -n '/^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}'\
-  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
-  increase FW_JUMP_FDT_ADDR
+  | (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) && echo fdt overlaps \
+  kernel, increase FW_JUMP_FDT_ADDR
   ```

instead?

Thanks,
drew

> 
> Update the example calculation to reflect this, and avoid confusion.
> 
> Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>
> ---
>  docs/firmware/fw_jump.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
> index 956897e..d1b07b9 100644
> --- a/docs/firmware/fw_jump.md
> +++ b/docs/firmware/fw_jump.md
> @@ -48,12 +48,12 @@ follows:
>    ```
>    ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '/^ +[0-9]+ /\
>    {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' \
> -  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
> +  | (( `tail -1` > 0x2000000 )) && echo fdt overlaps kernel,\
>    increase FW_JUMP_FDT_ADDR
>  
>    ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | \
>    awk -n '/^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}'\
> -  | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
> +  | (( `tail -1` > 0x2000000 )) && echo fdt overlaps kernel,\
>    increase FW_JUMP_FDT_ADDR
>    ```
>  
> -- 
> 2.39.2
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

