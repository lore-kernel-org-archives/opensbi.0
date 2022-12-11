From: Andreas Schwab <schwab@linux-m68k.org>
Date: Sun, 11 Dec 2022 13:11:53 +0100
Subject: [PATCH v3 2/5] lib: utils/irqchip: plic: Ensure no out-of-bound
 access in priority save/restore helpers
In-Reply-To: <20221211065424.806478-2-bmeng@tinylab.org> (Bin Meng's message
	of "Sun, 11 Dec 2022 14:54:21 +0800")
References: <20221211065424.806478-1-bmeng@tinylab.org>
	<20221211065424.806478-2-bmeng@tinylab.org>
Message-ID: <87tu22qgvq.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 11 2022, Bin Meng wrote:

> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 18d330d..1f27575 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -79,13 +79,13 @@ static u32 plic_threshold;
>  static void sun20i_d1_plic_save(void)
>  {
>  	fdt_plic_context_save(true, plic_sie, &plic_threshold);
> -	fdt_plic_priority_save(plic_priority);
> +	fdt_plic_priority_save(plic_priority, PLIC_SOURCES);
>  }
>  
>  static void sun20i_d1_plic_restore(void)
>  {
>  	thead_plic_restore();
> -	fdt_plic_priority_restore(plic_priority);
> +	fdt_plic_priority_restore(plic_priority, PLIC_SOURCES);
>  	fdt_plic_context_restore(true, plic_sie, plic_threshold);
>  }

That fails to update the size of the plic_priority arraay.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

