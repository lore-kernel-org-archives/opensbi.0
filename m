From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Date: Thu, 13 Jan 2022 19:52:54 +0900
Subject: [PATCH v2] lib: fix pointer of type 'void *' used in arithmetic
In-Reply-To: <20220113084744.70982-1-jukkax@ssrc.tii.ae>
References: <20220113084744.70982-1-jukkax@ssrc.tii.ae>
Message-ID: <34228bc1-5083-fee8-8cce-be52f9d9a9a1@opensource.wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[Re-sending this since my emails end up being empty...]

On 2022/01/13 17:49, Jukka Laitinen wrote:
> Using "void *" in arithmetic causes errors with strict compiler settings:
> "error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]"
> 
> Just remove these by calculating on "char *" where 1-byte data size is assumed

s/Just Remove/Avoid
(and nit: add a period at the end of the sentence)

I would also suggest a cast to unsigned long instead of char *. unsigned long is
more common/natural for addresses arithmetic.

> 
> Signed-off-by: Jukka Laitinen <jukkax@ssrc.tii.ae>
> ---
>  include/sbi/sbi_scratch.h       | 4 ++--
>  lib/sbi/sbi_fifo.c              | 6 +++---
>  lib/sbi/sbi_string.c            | 4 ++--
>  lib/utils/irqchip/plic.c        | 8 ++++----
>  lib/utils/timer/aclint_mtimer.c | 2 +-
>  5 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 186a40c..0c27307 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -104,11 +104,11 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size);
>  void sbi_scratch_free_offset(unsigned long offset);
>  
>  /** Get pointer from offset in sbi_scratch */
> -#define sbi_scratch_offset_ptr(scratch, offset)	((void *)scratch + (offset))
> +#define sbi_scratch_offset_ptr(scratch, offset)	(void *)((char *)(scratch) + (offset))
>  
>  /** Get pointer from offset in sbi_scratch for current HART */
>  #define sbi_scratch_thishart_offset_ptr(offset)	\
> -	((void *)sbi_scratch_thishart_ptr() + (offset))
> +	(void *)((char *)sbi_scratch_thishart_ptr() + (offset))
>  
>  /** HART id to scratch table */
>  extern struct sbi_scratch *hartid_to_scratch_table[];
> diff --git a/lib/sbi/sbi_fifo.c b/lib/sbi/sbi_fifo.c
> index 589cc18..68d6039 100644
> --- a/lib/sbi/sbi_fifo.c
> +++ b/lib/sbi/sbi_fifo.c
> @@ -66,7 +66,7 @@ static inline void  __sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data)
>  	if (head >= fifo->num_entries)
>  		head = head - fifo->num_entries;
>  
> -	sbi_memcpy(fifo->queue + head * fifo->entry_size, data, fifo->entry_size);
> +	sbi_memcpy((char *)fifo->queue + head * fifo->entry_size, data, fifo->entry_size);
>  
>  	fifo->avail++;
>  }
> @@ -142,7 +142,7 @@ int sbi_fifo_inplace_update(struct sbi_fifo *fifo, void *in,
>  		index = fifo->tail + i;
>  		if (index >= fifo->num_entries)
>  			index -= fifo->num_entries;
> -		entry = (void *)fifo->queue + (u32)index * fifo->entry_size;
> +		entry = (char *)fifo->queue + (u32)index * fifo->entry_size;
>  		ret = fptr(in, entry);
>  
>  		if (ret == SBI_FIFO_SKIP || ret == SBI_FIFO_UPDATED) {
> @@ -184,7 +184,7 @@ int sbi_fifo_dequeue(struct sbi_fifo *fifo, void *data)
>  		return SBI_ENOENT;
>  	}
>  
> -	sbi_memcpy(data, fifo->queue + (u32)fifo->tail * fifo->entry_size,
> +	sbi_memcpy(data, (char *)fifo->queue + (u32)fifo->tail * fifo->entry_size,
>  	       fifo->entry_size);
>  
>  	fifo->avail--;
> diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
> index c87bce9..c163f31 100644
> --- a/lib/sbi/sbi_string.c
> +++ b/lib/sbi/sbi_string.c
> @@ -149,8 +149,8 @@ void *sbi_memmove(void *dest, const void *src, size_t count)
>  			count--;
>  		}
>  	} else {
> -		temp1 = dest + count - 1;
> -		temp2 = src + count - 1;
> +		temp1 = (char *)dest + count - 1;
> +		temp2 = (char *)src + count - 1;
>  
>  		while (count > 0) {
>  			*temp1-- = *temp2--;
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 7665c62..0f58f3e 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -23,7 +23,7 @@
>  
>  static void plic_set_priority(struct plic_data *plic, u32 source, u32 val)
>  {
> -	volatile void *plic_priority = (void *)plic->addr +
> +	volatile void *plic_priority = (char *)plic->addr +
>  			PLIC_PRIORITY_BASE + 4 * source;
>  	writel(val, plic_priority);
>  }
> @@ -35,19 +35,19 @@ void plic_set_thresh(struct plic_data *plic, u32 cntxid, u32 val)
>  	if (!plic)
>  		return;
>  
> -	plic_thresh = (void *)plic->addr +
> +	plic_thresh = (char *)plic->addr +
>  		      PLIC_CONTEXT_BASE + PLIC_CONTEXT_STRIDE * cntxid;
>  	writel(val, plic_thresh);
>  }
>  
>  void plic_set_ie(struct plic_data *plic, u32 cntxid, u32 word_index, u32 val)
>  {
> -	volatile void *plic_ie;
> +	volatile char *plic_ie;
>  
>  	if (!plic)
>  		return;
>  
> -	plic_ie = (void *)plic->addr +
> +	plic_ie = (char *)plic->addr +
>  		   PLIC_ENABLE_BASE + PLIC_ENABLE_STRIDE * cntxid;
>  	writel(val, plic_ie + word_index * 4);
>  }
> diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> index 62e87f7..2532b63 100644
> --- a/lib/utils/timer/aclint_mtimer.c
> +++ b/lib/utils/timer/aclint_mtimer.c
> @@ -47,7 +47,7 @@ static u64 mtimer_time_rd32(volatile u64 *addr)
>  static void mtimer_time_wr32(bool timecmp, u64 value, volatile u64 *addr)
>  {
>  	writel_relaxed((timecmp) ? -1U : 0U, (void *)(addr));
> -	writel_relaxed((u32)(value >> 32), (void *)(addr) + 0x04);
> +	writel_relaxed((u32)(value >> 32), (char *)(addr) + 0x04);
>  	writel_relaxed((u32)value, (void *)(addr));
>  }
>  


-- 
Damien Le Moal
Western Digital Research

