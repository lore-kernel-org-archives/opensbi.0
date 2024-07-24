From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 24 Jul 2024 11:08:19 +0530
Subject: [PATCH 4/6] lib: sbi: Allow forceful queueing of data in sbi_fifo_enqueue()
In-Reply-To: <20240705071504.50988-5-apatel@ventanamicro.com>
References: <20240705071504.50988-1-apatel@ventanamicro.com> <20240705071504.50988-5-apatel@ventanamicro.com>
Message-ID: <CAPd4Wey9FMBUOBw6AbNaaBb5qp0Y-WjF4nBdebmqxW6pOxDmFg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 5, 2024 at 12:45?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Extend sbi_fifo_enqueue() to allow forceful queueing by droping
> data from the tail.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_fifo.h |  2 +-
>  lib/sbi/sbi_fifo.c     | 69 +++++++++++++++++++++++++-----------------
>  lib/sbi/sbi_sse.c      |  2 +-
>  lib/sbi/sbi_tlb.c      |  3 +-
>  4 files changed, 45 insertions(+), 31 deletions(-)
>
> diff --git a/include/sbi/sbi_fifo.h b/include/sbi/sbi_fifo.h
> index 1a85f07..af1632a 100644
> --- a/include/sbi/sbi_fifo.h
> +++ b/include/sbi/sbi_fifo.h
> @@ -30,7 +30,7 @@ enum sbi_fifo_inplace_update_types {
>  };
>
>  int sbi_fifo_dequeue(struct sbi_fifo *fifo, void *data);
> -int sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data);
> +int sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data, bool force);
>  void sbi_fifo_init(struct sbi_fifo *fifo, void *queue_mem, u16 entries,
>                    u16 entry_size);
>  int sbi_fifo_is_empty(struct sbi_fifo *fifo);
> diff --git a/lib/sbi/sbi_fifo.c b/lib/sbi/sbi_fifo.c
> index 9199a30..d07ebff 100644
> --- a/lib/sbi/sbi_fifo.c
> +++ b/lib/sbi/sbi_fifo.c
> @@ -90,6 +90,39 @@ static inline void  __sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data)
>         fifo->avail++;
>  }
>
> +/* Note: must be called with fifo->qlock held */
> +static inline void  __sbi_fifo_dequeue(struct sbi_fifo *fifo, void *data)
> +{
> +       if (!data)
> +               goto skip_data_copy;
> +
> +       switch (fifo->entry_size) {
> +       case 1:
> +               *(char *)data = *(char *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
> +               break;
> +       case 2:
> +               *(u16 *)data = *(u16 *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
> +               break;
> +       case 4:
> +               *(u32 *)data = *(u32 *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
> +               break;
> +#if __riscv_xlen > 32
> +       case 8:
> +               *(u64 *)data = *(u64 *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
> +               break;
> +#endif
> +       default:
> +               sbi_memcpy(data, fifo->queue + (u32)fifo->tail * fifo->entry_size,
> +                          fifo->entry_size);
> +               break;
> +       }
> +
> +skip_data_copy:
> +       fifo->avail--;
> +       fifo->tail++;
> +       if (fifo->tail >= fifo->num_entries)
> +               fifo->tail = 0;
> +}
>
>  /* Note: must be called with fifo->qlock held */
>  static inline bool __sbi_fifo_is_empty(struct sbi_fifo *fifo)
> @@ -173,7 +206,7 @@ int sbi_fifo_inplace_update(struct sbi_fifo *fifo, void *in,
>         return ret;
>  }
>
> -int sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data)
> +int sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data, bool force)
>  {
>         if (!fifo || !data)
>                 return SBI_EINVAL;
> @@ -181,9 +214,13 @@ int sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data)
>         spin_lock(&fifo->qlock);
>
>         if (__sbi_fifo_is_full(fifo)) {
> -               spin_unlock(&fifo->qlock);
> -               return SBI_ENOSPC;
> +               if (!force) {
> +                       spin_unlock(&fifo->qlock);
> +                       return SBI_ENOSPC;
> +               }
> +               __sbi_fifo_dequeue(fifo, NULL);
>         }
> +
>         __sbi_fifo_enqueue(fifo, data);
>
>         spin_unlock(&fifo->qlock);
> @@ -203,31 +240,7 @@ int sbi_fifo_dequeue(struct sbi_fifo *fifo, void *data)
>                 return SBI_ENOENT;
>         }
>
> -       switch (fifo->entry_size) {
> -       case 1:
> -               *(char *)data = *(char *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
> -               break;
> -       case 2:
> -               *(u16 *)data = *(u16 *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
> -               break;
> -       case 4:
> -               *(u32 *)data = *(u32 *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
> -               break;
> -#if __riscv_xlen > 32
> -       case 8:
> -               *(u64 *)data = *(u64 *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
> -               break;
> -#endif
> -       default:
> -               sbi_memcpy(data, fifo->queue + (u32)fifo->tail * fifo->entry_size,
> -                          fifo->entry_size);
> -               break;
> -       }
> -
> -       fifo->avail--;
> -       fifo->tail++;
> -       if (fifo->tail >= fifo->num_entries)
> -               fifo->tail = 0;
> +       __sbi_fifo_dequeue(fifo, data);
>
>         spin_unlock(&fifo->qlock);
>
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index e39963f..fe36a64 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -667,7 +667,7 @@ static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id)
>         sse_inject_fifo_r =
>                 sbi_scratch_offset_ptr(remote_scratch, sse_inject_fifo_off);
>
> -       ret = sbi_fifo_enqueue(sse_inject_fifo_r, &evt);
> +       ret = sbi_fifo_enqueue(sse_inject_fifo_r, &evt, false);
>         if (ret)
>                 return SBI_EFAIL;
>
> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> index cca319f..01b31f4 100644
> --- a/lib/sbi/sbi_tlb.c
> +++ b/lib/sbi/sbi_tlb.c
> @@ -351,7 +351,8 @@ static int tlb_update(struct sbi_scratch *scratch,
>
>         ret = sbi_fifo_inplace_update(tlb_fifo_r, data, tlb_update_cb);
>
> -       if (ret == SBI_FIFO_UNCHANGED && sbi_fifo_enqueue(tlb_fifo_r, data) < 0) {
> +       if (ret == SBI_FIFO_UNCHANGED &&
> +           sbi_fifo_enqueue(tlb_fifo_r, data, false) < 0) {
>                 /**
>                  * For now, Busy loop until there is space in the fifo.
>                  * There may be case where target hart is also
> --
> 2.34.1
>
LGTM

Reviewed-By: Himanshu Chauhan <hchauhan@ventanamicro.com>

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

