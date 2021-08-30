From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 30 Aug 2021 14:21:52 -0700
Subject: [PATCH] lib: sbi: Checking fifo validness in sbi_fifo_is_empty
 and is_full
In-Reply-To: <20210827144628.29728-1-Dd_nirvana@sjtu.edu.cn>
References: <20210827144628.29728-1-Dd_nirvana@sjtu.edu.cn>
Message-ID: <CAOnJCUK_ad-aNWKrLEd2UKxDP-s09tXgkDG89ATH_gtwJB7HCw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 27, 2021 at 7:47 AM Dong Du <Dd_nirvana@sjtu.edu.cn> wrote:
>
> As other exported fifo functions, we should check whether the fifo is
> valid in sbi_fifo_is_empty and sbi_fifo_is_full.
> To this end, this patch changes the retval from bool to int, and the
> two functions will return SBI_EINVAL in the case the fifo is invalid.
>
> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> ---
>  include/sbi/sbi_fifo.h |  4 ++--
>  lib/sbi/sbi_fifo.c     | 10 ++++++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi/sbi_fifo.h b/include/sbi/sbi_fifo.h
> index bc8f8f6..1a85f07 100644
> --- a/include/sbi/sbi_fifo.h
> +++ b/include/sbi/sbi_fifo.h
> @@ -33,8 +33,8 @@ int sbi_fifo_dequeue(struct sbi_fifo *fifo, void *data);
>  int sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data);
>  void sbi_fifo_init(struct sbi_fifo *fifo, void *queue_mem, u16 entries,
>                    u16 entry_size);
> -bool sbi_fifo_is_empty(struct sbi_fifo *fifo);
> -bool sbi_fifo_is_full(struct sbi_fifo *fifo);
> +int sbi_fifo_is_empty(struct sbi_fifo *fifo);
> +int sbi_fifo_is_full(struct sbi_fifo *fifo);
>  int sbi_fifo_inplace_update(struct sbi_fifo *fifo, void *in,
>                             int (*fptr)(void *in, void *data));
>  u16 sbi_fifo_avail(struct sbi_fifo *fifo);
> diff --git a/lib/sbi/sbi_fifo.c b/lib/sbi/sbi_fifo.c
> index b2395f3..589cc18 100644
> --- a/lib/sbi/sbi_fifo.c
> +++ b/lib/sbi/sbi_fifo.c
> @@ -43,10 +43,13 @@ u16 sbi_fifo_avail(struct sbi_fifo *fifo)
>         return ret;
>  }
>
> -bool sbi_fifo_is_full(struct sbi_fifo *fifo)
> +int sbi_fifo_is_full(struct sbi_fifo *fifo)
>  {
>         bool ret;
>
> +       if (!fifo)
> +               return SBI_EINVAL;
> +
>         spin_lock(&fifo->qlock);
>         ret = __sbi_fifo_is_full(fifo);
>         spin_unlock(&fifo->qlock);
> @@ -75,10 +78,13 @@ static inline bool __sbi_fifo_is_empty(struct sbi_fifo *fifo)
>         return (fifo->avail == 0) ? TRUE : FALSE;
>  }
>
> -bool sbi_fifo_is_empty(struct sbi_fifo *fifo)
> +int sbi_fifo_is_empty(struct sbi_fifo *fifo)
>  {
>         bool ret;
>
> +       if (!fifo)
> +               return SBI_EINVAL;
> +
>         spin_lock(&fifo->qlock);
>         ret = __sbi_fifo_is_empty(fifo);
>         spin_unlock(&fifo->qlock);
> --
> 2.31.1
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

