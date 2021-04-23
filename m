From: Xiang W <wxjstz@126.com>
Date: Fri, 23 Apr 2021 13:20:21 +0800
Subject: [PATCH] lib: sbi: Fix sbi_domain_root_add_memregion() for
 merging memregions
In-Reply-To: <20210422114858.676105-1-anup.patel@wdc.com>
References: <20210422114858.676105-1-anup.patel@wdc.com>
Message-ID: <8c3916ce6c13d07d60d9c43b115a6296b501fd22.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-04-22?? 17:18 +0530?Anup Patel???
> We should decrement root_memregs_count by one after merging two
> memregions otherwise new memregion added after a merge will be
> appended after last sentinel memregion of zero order.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
Look good to me.

Reviewed-by: Xiang W <wxjstz@126.com>

Regards,
Xiang W
> ---
>  lib/sbi/sbi_domain.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 69a3795..1b2e6e3 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -521,6 +521,7 @@ int sbi_domain_root_add_memregion(const struct
> sbi_domain_memregion *reg)
>  					nreg1++;
>  				}
>  				reg_merged = true;
> +				root_memregs_count--;
>  			}
>  		}
>  	} while (reg_merged);
> -- 
> 2.25.1
> 
> 


