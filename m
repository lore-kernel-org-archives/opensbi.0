From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 1 Oct 2020 10:56:51 +0000
Subject: [PATCH 1/1] firmware: provide space for firmware fixups
In-Reply-To: <20201001102836.15622-1-xypron.glpk@gmx.de>
References: <20201001102836.15622-1-xypron.glpk@gmx.de>
Message-ID: <DM6PR04MB6201E6C1A30CD6930F472DF78D300@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Heinrich
> Schuchardt
> Sent: 01 October 2020 15:59
> To: Atish Patra <Atish.Patra@wdc.com>
> Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>; OpenSBI List
> <opensbi@lists.infradead.org>; Atish Patra <atishp@atishpatra.org>
> Subject: [PATCH 1/1] firmware: provide space for firmware fixups
> 
> We expand the provided device tree by up to 1056 bytes in fixup operations.
> This space must be allocated in the firmware binary.
> 
> An alternative approach would be to allocate RAM for a copy of the device
> tree but we do not have library functions for dynamic memory allocation yet.
> 
> Without this patch devicetree fixups lead to memory corruption.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  firmware/fw_payload.S | 2 ++
>  scripts/d2c.sh        | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S index
> 9805d8c..fdd082f 100644
> --- a/firmware/fw_payload.S
> +++ b/firmware/fw_payload.S
> @@ -108,6 +108,8 @@ fw_options:
>  	.globl fdt_bin
>  fdt_bin:
>  	.incbin	FW_PAYLOAD_FDT_PATH
> +	/* space for device tree updates */
> +	. = . + 0x420;
>  #endif

We should not add arbitrary padding like this. Instead we should have
separate FW_PAYLOAD_FDT_PADDING options for config.mk.

> 
>  	.section .payload, "ax", %progbits
> diff --git a/scripts/d2c.sh b/scripts/d2c.sh index 821a995..1c53a71 100755
> --- a/scripts/d2c.sh
> +++ b/scripts/d2c.sh
> @@ -62,6 +62,9 @@ printf "const char __attribute__((aligned(%s)))
> %s_start[] = {\n" "${OUTPUT_C_AL
> 
>  od -v -t x1 -An ${INPUT_PATH} | awk '{for (i=1; i<=NF; i++) printf " 0x%s,", $i;
> printf "\n"; }'
> 
> +# Add 1056 bytes for device tree fixups echo dummy | awk '{for (j=1;
> +j<=0x42; j++) {for (i=1; i<=0x10; i++) printf " 0x00,"; printf "\n"}; }'
> +

Here again, we should not have arbitrary padding. Instead:
1) Add optional parameter to d2c.sh for amount of padding required
2) In platform/kendryte/k210/objects.mk, add line "platform-padding-k210.o = 1056"
3) Extend "compile_d2c" and make rule to convert .dtb to .c file in toplevel Makfile

>  printf "};\n"
> 
>  printf "const unsigned long %s_size = sizeof(%s_start);\n"
> "${OUTPUT_C_PREFIX}" "${OUTPUT_C_PREFIX}"
> --
> 2.28.0
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Overall, this needs to be broken down into more patches:
1) Patch for adding FW_PAYLOAD_FDT_PADDING option
2) Patch for documenting FW_PAYLOAD_FDT_PADDING
3) Patch for optional padding parameter to d2c.sh
4) Patch to extend "compile_d2c" and make rule in top-level makefile
5) Patch to update platform/kendryte/k210/objects.mk

Regards,
Anup

