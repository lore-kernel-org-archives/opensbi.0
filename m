From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Apr 2023 17:20:28 +0530
Subject: [PATCH v6] lib: sbi: Optimize sbi_tlb queue waiting
In-Reply-To: <20230414013247.132847-1-wxjstz@126.com>
References: <20230414013247.132847-1-wxjstz@126.com>
Message-ID: <CAAhSdy3cjw1KGbRvtNcgqyZarpA59SM3kHzXijVbDvZusWirjQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 14, 2023 at 7:03?AM Xiang W <wxjstz@126.com> wrote:
>
> When tlb_fifo is full, it will wait and affect the ipi update to
> other harts. This patch is optimized.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> v6 changes:
> - Define enum for return values of sbi ipi update and use
>   positive numbers leaving negative numbers for errors.
> - directly use target_mask remove retry_mask in
>   sbi_ipi_send_many
>
>  include/sbi/sbi_ipi.h | 10 ++++++++++
>  lib/sbi/sbi_ipi.c     | 44 +++++++++++++++++++++----------------------
>  lib/sbi/sbi_tlb.c     |  7 ++++---
>  3 files changed, 35 insertions(+), 26 deletions(-)
>
> diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
> index f384e74..c64f422 100644
> --- a/include/sbi/sbi_ipi.h
> +++ b/include/sbi/sbi_ipi.h
> @@ -30,6 +30,12 @@ struct sbi_ipi_device {
>         void (*ipi_clear)(u32 target_hart);
>  };
>
> +enum sbi_ipi_update_type {
> +       SBI_IPI_UPDATE_SUCCESS,
> +       SBI_IPI_UPDATE_BREAK,
> +       SBI_IPI_UPDATE_RETRY,
> +};
> +
>  struct sbi_scratch;
>
>  /** IPI event operations or callbacks */
> @@ -41,6 +47,10 @@ struct sbi_ipi_event_ops {
>          * Update callback to save/enqueue data for remote HART
>          * Note: This is an optional callback and it is called just before
>          * triggering IPI to remote HART.
> +        * @return < 0, error or failure
> +        * @return SBI_IPI_UPDATE_SUCCESS, success
> +        * @return SBI_IPI_UPDATE_BREAK, break IPI, done on local hart
> +        * @return SBI_IPI_UPDATE_RETRY, need retry
>          */
>         int (* update)(struct sbi_scratch *scratch,
>                         struct sbi_scratch *remote_scratch,
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 24d8a93..3972bcc 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -53,7 +53,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
>         if (ipi_ops->update) {
>                 ret = ipi_ops->update(scratch, remote_scratch,
>                                       remote_hartid, data);
> -               if (ret < 0)
> +               if (ret != SBI_IPI_UPDATE_SUCCESS)
>                         return ret;
>         }
>
> @@ -95,50 +95,48 @@ static int sbi_ipi_sync(struct sbi_scratch *scratch, u32 event)
>  int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
>  {
>         int rc;
> -       ulong i, m, n;
> +       bool retry_needed;
> +       ulong i, m;
> +       struct sbi_hartmask target_mask = {0};
>         struct sbi_domain *dom = sbi_domain_thishart_ptr();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
> +       /* find target harts */
>         if (hbase != -1UL) {
>                 rc = sbi_hsm_hart_interruptible_mask(dom, hbase, &m);
>                 if (rc)
>                         return rc;
>                 m &= hmask;
> -               n = m;
>
> -               /* Send IPIs */
>                 for (i = hbase; m; i++, m >>= 1) {
>                         if (m & 1UL)
> -                               sbi_ipi_send(scratch, i, event, data);
> -               }
> -
> -               /* Sync IPIs */
> -               m = n;
> -               for (i = hbase; m; i++, m >>= 1) {
> -                       if (m & 1UL)
> -                               sbi_ipi_sync(scratch, event);
> +                               sbi_hartmask_set_hart(i, &target_mask);
>                 }
>         } else {
> -               /* Send IPIs */
>                 hbase = 0;
>                 while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
>                         for (i = hbase; m; i++, m >>= 1) {
>                                 if (m & 1UL)
> -                                       sbi_ipi_send(scratch, i, event, data);
> +                                       sbi_hartmask_set_hart(i, &target_mask);
>                         }
>                         hbase += BITS_PER_LONG;
>                 }
> +       }
>
> -               /* Sync IPIs */
> -               hbase = 0;
> -               while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
> -                       for (i = hbase; m; i++, m >>= 1) {
> -                               if (m & 1UL)
> -                                       sbi_ipi_sync(scratch, event);
> -                       }
> -                       hbase += BITS_PER_LONG;
> +       /* update IPIs */
> +       do {
> +               retry_needed = false;
> +               sbi_hartmask_for_each_hart(i, &target_mask) {
> +                       rc = sbi_ipi_send(scratch, i, event, data);
> +                       if (rc == SBI_IPI_UPDATE_RETRY)
> +                               retry_needed = true;
> +                       else
> +                               sbi_hartmask_clear_hart(i, &target_mask);
>                 }
> -       }
> +       } while (retry_needed);
> +
> +       /* sync IPIs */
> +       sbi_ipi_sync(scratch, event);
>
>         return 0;
>  }
> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> index 60ca8c6..26a87f3 100644
> --- a/lib/sbi/sbi_tlb.c
> +++ b/lib/sbi/sbi_tlb.c
> @@ -357,14 +357,14 @@ static int tlb_update(struct sbi_scratch *scratch,
>          */
>         if (remote_hartid == curr_hartid) {
>                 tinfo->local_fn(tinfo);
> -               return -1;
> +               return SBI_IPI_UPDATE_BREAK;
>         }
>
>         tlb_fifo_r = sbi_scratch_offset_ptr(remote_scratch, tlb_fifo_off);
>
>         ret = sbi_fifo_inplace_update(tlb_fifo_r, data, tlb_update_cb);
>
> -       while (ret == SBI_FIFO_UNCHANGED && sbi_fifo_enqueue(tlb_fifo_r, data) < 0) {
> +       if (ret == SBI_FIFO_UNCHANGED && sbi_fifo_enqueue(tlb_fifo_r, data) < 0) {
>                 /**
>                  * For now, Busy loop until there is space in the fifo.
>                  * There may be case where target hart is also
> @@ -376,12 +376,13 @@ static int tlb_update(struct sbi_scratch *scratch,
>                 tlb_process_once(scratch);
>                 sbi_dprintf("hart%d: hart%d tlb fifo full\n",
>                             curr_hartid, remote_hartid);
> +               return SBI_IPI_UPDATE_RETRY;
>         }
>
>         tlb_sync = sbi_scratch_offset_ptr(scratch, tlb_sync_off);
>         atomic_add_return(tlb_sync, 1);
>
> -       return 0;
> +       return SBI_IPI_UPDATE_SUCCESS;
>  }
>
>  static struct sbi_ipi_event_ops tlb_ops = {
> --
> 2.39.2
>

