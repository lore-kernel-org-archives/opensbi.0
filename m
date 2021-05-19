From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 19 May 2021 12:52:50 +0000
Subject: [PATCH v2 3/3] lib: utils: Replace strcmp with strncmp
In-Reply-To: <20210519075410.8520-4-daniel.schaefer@hpe.com>
References: <20210519075410.8520-1-daniel.schaefer@hpe.com>
 <20210519075410.8520-4-daniel.schaefer@hpe.com>
Message-ID: <CO6PR04MB781235EE01AD3E06AE6C5B8A8D2B9@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Daniel Schaefer <daniel.schaefer@hpe.com>
> Sent: 19 May 2021 13:24
> To: opensbi at lists.infradead.org
> Cc: Abner Chang <abner.chang@hpe.com>; Anup Patel
> <Anup.Patel@wdc.com>; Xiang W <wxjstz@126.com>
> Subject: [PATCH v2 3/3] lib: utils: Replace strcmp with strncmp
> 
> Cc: Abner Chang <abner.chang@hpe.com>
> Cc: Anup Patel <Anup.Patel@wdc.com>
> Signed-off-by: Daniel Schaefer <daniel.schaefer@hpe.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Abner Chang <abner.chang@hpe.com>

Looks good to me. I have added some commit description
at time of merging this patch.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup
> ---
>  lib/utils/fdt/fdt_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c index
> fc8ad423eb88..676c75790829 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -96,7 +96,7 @@ static int __fixup_find_domain_offset(void *fdt, int
> doff, void *p)  {
>  	struct __fixup_find_domain_offset_info *fdo = p;
> 
> -	if (!strcmp(fdo->name, fdt_get_name(fdt, doff, NULL)))
> +	if (!strncmp(fdo->name, fdt_get_name(fdt, doff, NULL),
> +strlen(fdo->name)))
>  		*fdo->doffset = doff;
> 
>  	return 0;
> --
> 2.30.1


