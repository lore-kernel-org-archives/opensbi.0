From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 27 Sep 2022 07:30:52 +0200
Subject: [PATCH v4] docs/firmware: Update FW_JUMP documentation
In-Reply-To: <20220927051941.15894-1-nylon.chen@sifive.com>
References: <20220927051941.15894-1-nylon.chen@sifive.com>
Message-ID: <20220927053052.r22q2sn35m2qv2fq@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 27, 2022 at 01:19:41PM +0800, Nylon Chen wrote:
> From: "Nylon.Chen" <nylon.chen@sifive.com>
> 
> Add a tip for OpenSBI's FW_JUMP which helps
> users avoid overwriting the kernel.
> 
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  docs/firmware/fw_jump.md | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
> index 35a4301..30046d6 100644
> --- a/docs/firmware/fw_jump.md
> +++ b/docs/firmware/fw_jump.md
> @@ -41,6 +41,23 @@ follows:
>    provided, then the OpenSBI firmware will pass the FDT address passed by the
>    previous booting stage to the next booting stage.
>  
> +  When using the default *FW_JUMP_FDT_ADDR* with *PLATFORM=generic*, you must
> +  ensure *FW_JUMP_FDT_ADDR* is set high enough to avoid overwriting the kernel.
> +  You can use the following method.
> +
> +  ```
> +  ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk '/^ +[0-9]+ / ' \
> +  | awk -n '{addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' | \
> +  (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel, \
> +  increase FW_JUMP_FDT_ADDR
> +
> +
> +  ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | awk '/^ +[0-9]+ / ' \
> +  | awk -n '{addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' | \
> +  (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel, \
> +  increase FW_JUMP_FDT_ADDR
> +  ```
> +
>  *FW_JUMP* Example
>  -----------------
>  
> -- 
> 2.36.1
>

I'd still prefer we merge the two awks together into one awk invocation,
but anyway

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

