From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 24 Jul 2024 11:08:39 +0530
Subject: [PATCH 5/6] include: sbi: Add macros to create FIFO as local or
 global variable
In-Reply-To: <20240705071504.50988-6-apatel@ventanamicro.com>
References: <20240705071504.50988-1-apatel@ventanamicro.com> <20240705071504.50988-6-apatel@ventanamicro.com>
Message-ID: <CAPd4Wexsw1ENhP6z8casegVj=c6yAfGq_f62j1ByZMTv2SN+4w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 5, 2024 at 12:45?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The FIFO data structure is quite handy of variety of use-case so add
> SBI_FIFO_INITIALIZER() and SBI_FIFO_DEFINE() helper macros to create
> FIFO as local or global variable.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_fifo.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/sbi/sbi_fifo.h b/include/sbi/sbi_fifo.h
> index af1632a..89a2ea2 100644
> --- a/include/sbi/sbi_fifo.h
> +++ b/include/sbi/sbi_fifo.h
> @@ -23,6 +23,18 @@ struct sbi_fifo {
>         u16 tail;
>  };
>
> +#define SBI_FIFO_INITIALIZER(__queue_mem, __entries, __entry_size)     \
> +{      .queue = __queue_mem,                                           \
> +       .qlock = SPIN_LOCK_INITIALIZER,                                 \
> +       .num_entries = __entries,                                       \
> +       .entry_size = __entry_size,                                     \
> +       .avail = 0,                                                     \
> +       .tail = 0,                                                      \
> +}
> +
> +#define SBI_FIFO_DEFINE(__name, __queue_mem, __entries, __entry_size)  \
> +struct sbi_fifo __name = SBI_FIFO_INITIALIZER(__queue_mem, __entries, __entry_size)
> +
>  enum sbi_fifo_inplace_update_types {
>         SBI_FIFO_SKIP,
>         SBI_FIFO_UPDATED,
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

