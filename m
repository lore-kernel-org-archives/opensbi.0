From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 11 Jun 2021 05:53:45 +0000
Subject: [PATCH v2 1/4] platform: andes/ae350: Cosmetic fixes in plicsw.c
In-Reply-To: <20210604153545.18949-1-bmeng.cn@gmail.com>
References: <20210604153545.18949-1-bmeng.cn@gmail.com>
Message-ID: <CO6PR04MB781229C9FF8DA78D4D8A271D8D349@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Bin Meng <bmeng.cn@gmail.com>
> Sent: 04 June 2021 21:06
> To: Anup Patel <Anup.Patel@wdc.com>; opensbi at lists.infradead.org
> Cc: Bin Meng <bmeng.cn@gmail.com>
> Subject: [PATCH v2 1/4] platform: andes/ae350: Cosmetic fixes in plicsw.c
> 
> - %s/CLINT/PLICSW
> - replace '.' with a space
> - add a space around * in plicsw_cold_ipi_init()
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> 
> ---
> 
> Changes in v2:
> - andex => andes in the commit title
> - add a space around *
> 
>  platform/andes/ae350/plicsw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/platform/andes/ae350/plicsw.c b/platform/andes/ae350/plicsw.c
> index d07df28..4df7317 100644
> --- a/platform/andes/ae350/plicsw.c
> +++ b/platform/andes/ae350/plicsw.c
> @@ -83,7 +83,7 @@ void plicsw_ipi_clear(u32 target_hart)
>  	if (plicsw_ipi_hart_count <= target_hart)
>  		return;
> 
> -	/* Clear CLINT IPI */
> +	/* Clear PLICSW IPI */
>  	plicsw_claim();
>  	plicsw_complete();
>  }
> @@ -108,10 +108,10 @@ int plicsw_cold_ipi_init(unsigned long base, u32
> hart_count)
>  	/* Setup source priority */
>  	uint32_t *priority = (void *)base + PLICSW_PRIORITY_BASE;
> 
> -	for (int i = 0; i < AE350_HART_COUNT*PLICSW_PENDING_PER_HART;
> i++)
> +	for (int i = 0; i < AE350_HART_COUNT *
> PLICSW_PENDING_PER_HART; i++)
>  		writel(1, &priority[i]);
> 
> -	/* Setup target enable.*/
> +	/* Setup target enable */
>  	uint32_t enable_mask = PLICSW_HART_MASK;
> 
>  	for (int i = 0; i < AE350_HART_COUNT; i++) {
> --
> 2.25.1


