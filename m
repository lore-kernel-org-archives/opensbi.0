From: Andreas Schwab <schwab@suse.de>
Date: Mon, 28 Nov 2022 14:36:24 +0100
Subject: [PATCH] lib: utils/irqchip: plic: Fix the off-by-one error in
 priority save/restore helpers
In-Reply-To: <20221128132129.58558-1-bmeng@tinylab.org> (Bin Meng's message of
	"Mon, 28 Nov 2022 21:21:29 +0800")
References: <20221128132129.58558-1-bmeng@tinylab.org>
Message-ID: <mvmpmd78alj.fsf@suse.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 28 2022, Bin Meng wrote:

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

That requires updating the size of the priority array.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

