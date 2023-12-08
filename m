From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Dec 2023 17:05:06 +0530
Subject: [PATCH] lib: sbi: Prevent redundant sbi_ipi_process
In-Reply-To: <20231122125444.333876-1-wxjstz@126.com>
References: <20231122125444.333876-1-wxjstz@126.com>
Message-ID: <CAAhSdy2uLzvRrpnai=O3nB7GCn4J2Fe_JA6X1D_KPo2HZzkD=A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 22, 2023 at 6:25?PM Xiang W <wxjstz@126.com> wrote:
>
> sbi_ipi_process reads ipi_type through xchg. This may occur between
> set ipi_type and send_ipi, which will result in redundant interrupt
> processing.
>
> The specific case is as follows:
>
>                 hart A             hart B
> send ipi--------->|                  |
>                   | clear ipi        |
>                   |                  | set ipi_type
>                   |                  |
>                   | xchg ipi_type    |
>                   |                  |
>                   |<-----------------| send ipi
>                   |                  |
>                   |                  |
>
> This patch fixes this issue.

The optimization is in the right direction but the commit
description is not appropriate.

This optimization is not about addressing a very specific
case mentioned above rather it's above avoid unnecessary
send_ipi() call when multiple HARTs try to send IPI to the
same HART.

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_ipi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 0bf446a..6f25a7e 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -39,7 +39,7 @@ static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
>  static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
>                         u32 event, void *data)
>  {
> -       int ret;
> +       int ret = 0;
>         struct sbi_scratch *remote_scratch = NULL;
>         struct sbi_ipi_data *ipi_data;
>         const struct sbi_ipi_event_ops *ipi_ops;
> @@ -66,9 +66,8 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
>          * Set IPI type on remote hart's scratch area and
>          * trigger the interrupt
>          */
> -       atomic_raw_set_bit(event, &ipi_data->ipi_type);
> -
> -       ret = sbi_ipi_raw_send(remote_hartindex);
> +       if (__atomic_fetch_or(&ipi_data->ipi_type, BIT(event), __ATOMIC_ACQ_REL) == 0)

We should use __ATOMIC_RELAXED here because we already have
barriers in sbi_ipi_raw_send().

> +               ret = sbi_ipi_raw_send(remote_hartindex);
>
>         sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
>
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

I have taken care of the above at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

