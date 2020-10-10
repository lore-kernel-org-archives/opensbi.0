From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 10 Oct 2020 05:51:23 +0000
Subject: [PATCH] makefile: fix clean directive
In-Reply-To: <20201005145553.80557-1-damien.lemoal@wdc.com>
References: <20201005145553.80557-1-damien.lemoal@wdc.com>
Message-ID: <DM6PR04MB62018763A6B637AE41E5486F8D090@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Damien Le Moal <damien.lemoal@wdc.com>
> Sent: 05 October 2020 20:26
> To: opensbi at lists.infradead.org; Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>
> Subject: [PATCH] makefile: fix clean directive
> 
> Add cleaning of compiled device tree files (.dtb files).
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index cebb78e..2a352ef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -461,6 +461,8 @@ clean:
>  	$(CMD_PREFIX)find $(build_dir) -type f -name "*.elf" -exec rm -rf {}
> +
>  	$(if $(V), @echo " RM        $(build_dir)/*.bin")
>  	$(CMD_PREFIX)find $(build_dir) -type f -name "*.bin" -exec rm -rf {}
> +
> +	$(if $(V), @echo " RM        $(build_dir)/*.dtb")
> +	$(CMD_PREFIX)find $(build_dir) -type f -name "*.dtb" -exec rm -rf {}
> +
> 
>  # Rule for "make distclean"
>  .PHONY: distclean
> --
> 2.26.2

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

