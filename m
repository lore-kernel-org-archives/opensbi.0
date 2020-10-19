From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 19 Oct 2020 04:16:53 +0000
Subject: [PATCH v2 2/5] firmware: Add common FW_FDT_PATH compile-time
 option
In-Reply-To: <20201018051449.2368918-3-anup.patel@wdc.com>
References: <20201018051449.2368918-1-anup.patel@wdc.com>
 <20201018051449.2368918-3-anup.patel@wdc.com>
Message-ID: <DM6PR04MB6201CE4122C2C4A9E8AD8A018D1E0@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel <Anup.Patel@wdc.com>
> Sent: 18 October 2020 10:45
> To: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>
> Cc: Damien Le Moal <Damien.LeMoal@wdc.com>; Anup Patel
> <anup@brainfault.org>; opensbi at lists.infradead.org; Anup Patel
> <Anup.Patel@wdc.com>
> Subject: [PATCH v2 2/5] firmware: Add common FW_FDT_PATH compile-
> time option
> 
> Currently, only FW_PAYLOAD has mechanism to embed external FDT using
> FW_PAYLOAD_FDT_PATH compile-time option.
> 
> This patch adds a common FW_FDT_PATH compile-time option to embed
> external FDT for all OpenSBI firmwares (i.e FW_JUMP, FW_PAYLOAD, and
> FW_DYNAMIC).
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  docs/firmware/fw.md       | 16 +++++++++++-----
>  firmware/external_deps.mk |  4 ++++
>  firmware/fw_base.S        | 16 ++++++++++++++++
>  firmware/objects.mk       |  7 +++++++
>  4 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md index
> 4133c23..cc0cc9e 100644
> --- a/docs/firmware/fw.md
> +++ b/docs/firmware/fw.md
> @@ -51,11 +51,17 @@ case, a *FW_PAYLOAD* firmware allows embedding a
> flattened device tree in the  Firmware Configuration and Compilation
>  --------------------------------------
> 
> -All firmware types mandate the definition of the following compile time -
> configuration parameter.
> -
> -* **FW_TEXT_ADDR** - Defines the address at which the previous booting
> stage
> -  loads OpenSBI firmware.
> +All firmware types support the following common compile time
> +configuration
> +parameters:
> +
> +* **FW_TEXT_ADDR** - Defines the execution address of the OpenSBI
> firmware.
> +  This configuration parameter is mandatory.
> +* **FW_FDT_PATH** - Path to an external flattened device tree binary
> +file to
> +  be embedded in the *.rodata* section of the final firmware. If this
> +option
> +  is not provided then the firmware will expect the FDT to be passed as
> +an
> +  argument by the prior booting stage.
> +* **FW_FDT_PADDING** - Optional zero bytes padding to the embedded
> +flattened
> +  device tree binary file specified by **FW_FDT_PATH** option.
> 
>  Additionally, each firmware type as a set of type specific configuration
> parameters. Detailed information for each firmware type can be found in the
> diff --git a/firmware/external_deps.mk b/firmware/external_deps.mk index
> 2b8f9f6..f43ac06 100644
> --- a/firmware/external_deps.mk
> +++ b/firmware/external_deps.mk
> @@ -7,5 +7,9 @@
>  #   Anup Patel <anup.patel@wdc.com>
>  #
> 
> +$(platform_build_dir)/firmware/fw_dynamic.o: $(FW_FDT_PATH)
> +$(platform_build_dir)/firmware/fw_jump.o: $(FW_FDT_PATH)
> +$(platform_build_dir)/firmware/fw_payload.o: $(FW_FDT_PATH)
> +
>  $(platform_build_dir)/firmware/fw_payload.o:
> $(FW_PAYLOAD_PATH_FINAL)
>  $(platform_build_dir)/firmware/fw_payload.o: $(FW_PAYLOAD_FDT_PATH)
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S index
> 0271d9a..95197da 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -182,6 +182,11 @@ _bss_zero:
>  	call	fw_save_info
>  	MOV_5R	a0, s0, a1, s1, a2, s2, a3, s3, a4, s4
> 
> +#ifdef FW_FDT_PATH
> +	/* Override previous arg1 */
> +	la	a1, fw_fdt_bin
> +#endif
> +
>  	/* Override previous arg1 */
>  	MOV_3R	s0, a0, s1, a1, s2, a2
>  	call	fw_prev_arg1
> @@ -668,3 +673,14 @@ _reset_regs:
>  	csrw CSR_MSCRATCH, 0
> 
>  	ret
> +
> +#ifdef FW_FDT_PATH
> +	.section .rodata
> +	.align 4
> +	.globl fw_fdt_bin
> +fw_fdt_bin:
> +	.incbin FW_FDT_PATH
> +#ifdef FW_FDT_PADDING
> +	.fill FW_FDT_PADDING, 1, 0
> +#endif
> +#endif
> diff --git a/firmware/objects.mk b/firmware/objects.mk index
> c980362..2eea54c 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -17,6 +17,13 @@ ifdef FW_TEXT_START
>  firmware-genflags-y += -DFW_TEXT_START=$(FW_TEXT_START)  endif
> 
> +ifdef FW_FDT_PATH
> +firmware-genflags-y += -DFW_FDT_PATH=\"$(FW_FDT_PATH)\"
> +ifdef FW_FDT_PADDING
> +firmware-genflags-y += -DFW_FDT_PADDING=$(FW_FDT_PADDING)
> +endif
> +endif
> +
>  firmware-bins-$(FW_DYNAMIC) += fw_dynamic.bin
> 
>  firmware-bins-$(FW_JUMP) += fw_jump.bin
> --
> 2.25.1

Applied this patch to the riscv/opensbi repo

Regards,
Anup


