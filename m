From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 17 Apr 2021 11:25:30 +0000
Subject: [PATCH 1/2] lib: utils: Implement "64bit-mmio" property parsing
In-Reply-To: <1618285442-84580-1-git-send-email-guoren@kernel.org>
References: <1618285442-84580-1-git-send-email-guoren@kernel.org>
Message-ID: <DM6PR04MB6201E80F712C23695AC6EADD8D4B9@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> guoren at kernel.org
> Sent: 13 April 2021 09:14
> To: guoren at kernel.org; Alistair Francis <Alistair.Francis@wdc.com>;
> anup at brainfault.org
> Cc: opensbi at lists.infradead.org; Guo Ren <guoren@linux.alibaba.com>;
> Anup Patel <Anup.Patel@wdc.com>; Xiang W <wxjstz@126.com>
> Subject: [PATCH 1/2] lib: utils: Implement "64bit-mmio" property parsing
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Figure out CLINT has_64bit_mmio from DT node and using antonym for
> compatibility.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  lib/utils/fdt/fdt_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c index
> bf19ff9..909de01 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -442,8 +442,9 @@ int fdt_parse_clint_node(void *fdt, int nodeoffset,
> bool for_timer,
>  	if (clint->hart_count < count)
>  		clint->hart_count = count;
> 
> -	/* TODO: We should figure-out CLINT has_64bit_mmio from DT node
> */
>  	clint->has_64bit_mmio = TRUE;
> +	if (fdt_getprop(fdt, nodeoffset, "clint,has-no-64bit-mmio", &count))
> +		clint->has_64bit_mmio = FALSE;
> 
>  	return 0;
>  }
> --
> 2.7.4
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

