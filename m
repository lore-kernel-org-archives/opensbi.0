From: Andreas Schwab <schwab@linux-m68k.org>
Date: Sun, 11 Dec 2022 11:07:01 +0100
Subject: [PATCH v3 1/5] lib: utils/irqchip: plic: Fix the off-by-one
 error in priority save/restore helpers
In-Reply-To: <20221211065424.806478-1-bmeng@tinylab.org> (Bin Meng's message
	of "Sun, 11 Dec 2022 14:54:20 +0800")
References: <20221211065424.806478-1-bmeng@tinylab.org>
Message-ID: <87a63ufe4a.fsf@linux-m68k.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 11 2022, Bin Meng wrote:

> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 73d7788..4df9020 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -38,13 +38,13 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>  
>  void plic_priority_save(const struct plic_data *plic, u8 *priority)
>  {
> -	for (u32 i = 0; i < plic->num_src; i++)
> +	for (u32 i = 1; i <= plic->num_src; i++)
>  		priority[i] = plic_get_priority(plic, i);

That needs to adjust the index into the priority array.

>  void plic_priority_restore(const struct plic_data *plic, const u8 *priority)
>  {
> -	for (u32 i = 0; i < plic->num_src; i++)
> +	for (u32 i = 1; i <= plic->num_src; i++)
>  		plic_set_priority(plic, i, priority[i]);

Likewise.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

