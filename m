From: Xiang W <wxjstz@126.com>
Date: Tue, 08 Jun 2021 15:28:33 +0800
Subject: [PATCH v2 07/15] lib: sbi: Remove redundant boot time print
 statement
In-Reply-To: <20210527003044.889681-8-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
 <20210527003044.889681-8-atish.patra@wdc.com>
Message-ID: <ecaa8bb32dd8e264b54e2d0d1399aff6275c0663.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-05-26???? 17:30 -0700?Atish Patra???
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Xiang W <wxjstz@126.com>

> ---
> ?lib/sbi/sbi_init.c | 2 --
> ?1 file changed, 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 3f44a2b87152..65af5705f484 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -137,8 +137,6 @@ static void sbi_boot_print_hart(struct
> sbi_scratch *scratch, u32 hartid)
> ?????????????????? sbi_hart_pmp_addrbits(scratch));
> ????????sbi_printf("Boot HART MHPM Count????? : %d\n",
> ?????????????????? sbi_hart_mhpm_count(scratch));
> -???????sbi_printf("Boot HART MHPM Count????? : %d\n",
> -????????????????? sbi_hart_mhpm_count(scratch));
> ????????sbi_hart_delegation_dump(scratch, "Boot HART ", "???????? ");
> ?}
> ?
> -- 
> 2.25.1
> 
> 



