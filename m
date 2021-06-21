From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 21 Jun 2021 13:01:29 -0700
Subject: [PATCH 1/1] lib: simplify sbi_fifo_inplace_update()
In-Reply-To: <20210621190316.25463-1-xypron.glpk@gmx.de>
References: <20210621190316.25463-1-xypron.glpk@gmx.de>
Message-ID: <CAOnJCUKq2viGMiR+DSsXRwCOEpiy=yXt-bVu-QwtcqHz-0vqGQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 21, 2021 at 12:03 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> Don't assign an unused value to variable index.
>
> Use operator '-=' where applicable.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  lib/sbi/sbi_fifo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_fifo.c b/lib/sbi/sbi_fifo.c
> index 2a5c012..b2395f3 100644
> --- a/lib/sbi/sbi_fifo.c
> +++ b/lib/sbi/sbi_fifo.c
> @@ -118,7 +118,7 @@ bool sbi_fifo_reset(struct sbi_fifo *fifo)
>  int sbi_fifo_inplace_update(struct sbi_fifo *fifo, void *in,
>                             int (*fptr)(void *in, void *data))
>  {
> -       int i, index = 0;
> +       int i, index;
>         int ret = SBI_FIFO_UNCHANGED;
>         void *entry;
>
> @@ -135,7 +135,7 @@ int sbi_fifo_inplace_update(struct sbi_fifo *fifo, void *in,
>         for (i = 0; i < fifo->avail; i++) {
>                 index = fifo->tail + i;
>                 if (index >= fifo->num_entries)
> -                       index = index - fifo->num_entries;
> +                       index -= fifo->num_entries;
>                 entry = (void *)fifo->queue + (u32)index * fifo->entry_size;
>                 ret = fptr(in, entry);
>
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

