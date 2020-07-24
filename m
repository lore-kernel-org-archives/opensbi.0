From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 24 Jul 2020 04:40:39 +0000
Subject: [PATCH 3/3] Use standard C string APIs in FDT helper
In-Reply-To: <20200723015404.17667-4-abner.chang@hpe.com>
References: <20200723015404.17667-1-abner.chang@hpe.com>
 <20200723015404.17667-4-abner.chang@hpe.com>
Message-ID: <DM6PR04MB6201446168519AD7CEEAF9FA8D770@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Abner Chang <abner.chang@hpe.com>
> Sent: 23 July 2020 07:24
> To: opensbi at lists.infradead.org
> Cc: abner.chang at hpe.com; Atish Patra <Atish.Patra@wdc.com>; Anup Patel
> <Anup.Patel@wdc.com>; Daniel Schaefer <daniel.schaefer@hpe.com>
> Subject: [PATCH 3/3] Use standard C string APIs in FDT helper
> 
> Use strncmp instead of using sbi_strcmp directly in fdthelp.c.
> 
> Signed-off-by: Abner Chang <abner.chang@hpe.com>
> 
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Daniel Schaefer <daniel.schaefer@hpe.com>
> ---
>  lib/utils/fdt/fdt_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c index
> 78077f7..aec73a0 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -123,7 +123,7 @@ int fdt_parse_hart_id(void *fdt, int cpu_offset, u32
> *hartid)
>  	prop = fdt_getprop(fdt, cpu_offset, "device_type", &len);
>  	if (!prop || !len)
>  		return SBI_EINVAL;
> -	if (sbi_strcmp(prop, "cpu"))
> +	if (strncmp (prop, "cpu", strlen ("cpu")))
>  		return SBI_EINVAL;
> 
>  	val = fdt_getprop(fdt, cpu_offset, "reg", &len);
> --
> 2.25.0

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup


