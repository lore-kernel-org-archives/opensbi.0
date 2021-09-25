From: Xiang W <wxjstz@126.com>
Date: Sat, 25 Sep 2021 15:28:12 +0800
Subject: [PATCH v3 3/5] lib: sbi: Print timer frequency at boot time
In-Reply-To: <20210925043735.686518-4-anup.patel@wdc.com>
References: <20210925043735.686518-1-anup.patel@wdc.com>
 <20210925043735.686518-4-anup.patel@wdc.com>
Message-ID: <e5f1794a5ccedf5db9691700a382f3a8761b319b.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-09-25???? 10:07 +0530?Anup Patel???
> We now have frequency in timer device instance provided by platform
> so let's print timer frequency as part of the boot prints.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/sbi/sbi_init.c | 5 +++--
> ?1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 6ef8742..f0eb365 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -75,8 +75,9 @@ static void sbi_boot_print_general(struct
> sbi_scratch *scratch)
> ????????sbi_printf("Platform IPI Device?????? : %s\n",
> ?????????????????? (idev) ? idev->name : "---");
> ????????tdev = sbi_timer_get_device();
> -???????sbi_printf("Platform Timer Device???? : %s\n",
> -????????????????? (tdev) ? tdev->name : "---");
> +???????sbi_printf("Platform Timer Device???? : %s @ %luHz\n",
> +????????????????? (tdev) ? tdev->name : "---",
> +????????????????? (tdev) ? tdev->timer_freq : 0);
> ????????cdev = sbi_console_get_device();
> ????????sbi_printf("Platform Console Device?? : %s\n",
> ?????????????????? (cdev) ? cdev->name : "---");
> -- 
> 2.25.1
> 
> 



