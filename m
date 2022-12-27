From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Tue, 27 Dec 2022 13:28:41 +0100
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <87h6xhdpbx.fsf@igel.home>
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
 <87h6xhdpbx.fsf@igel.home>
Message-ID: <e869a6e2-458a-df92-6662-bf4fd3ff68a9@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/27/22 13:05, Andreas Schwab wrote:
> The actual bug is in plic_priority_save/restore.


The problem really starts at include/sbi_utils/irqchip/plic.h where 
there is no comment at all describing the usage of the function and its 
parameters. So we don't know what the different authors of these 
functions intended to use index 0 for.

It would be great if we could move the project to follow the kernel 
documentation style (https://docs.kernel.org/doc-guide/kernel-doc.html)


> 
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index d633514..901ffaa 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -39,14 +39,14 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>   void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num)
>   {
>   	for (u32 i = 1; i <= num; i++)

In patch 34da6638 ("lib: utils/irqchip: plic: Fix the off-by-one error 
in priority save/restore helpers") Bin wrote

Interrupt source 0 is reserved. Hence the irq should start from 1.

Why was the the upper limit changed?

-       for (u32 i = 0; i < plic->num_src; i++)
+       for (u32 i = 1; i <= plic->num_src; i++)

Best regards

Heinrich

> -		priority[i] = plic_get_priority(plic, i);
> +		priority[i - 1] = plic_get_priority(plic, i);
>   }
>   
>   void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
>   			   u32 num)
>   {
>   	for (u32 i = 1; i <= num; i++)
> -		plic_set_priority(plic, i, priority[i]);
> +		plic_set_priority(plic, i, priority[i - 1]);
>   }
>   
>   static u32 plic_get_thresh(const struct plic_data *plic, u32 cntxid)
> 

