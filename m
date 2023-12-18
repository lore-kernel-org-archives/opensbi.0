From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Dec 2023 22:45:06 +0530
Subject: [PATCH 1/3] lib: sbi_ipi: Do not ignore errors from sbi_ipi_send()
In-Reply-To: <20231208212301.3649930-2-samuel.holland@sifive.com>
References: <20231208212301.3649930-1-samuel.holland@sifive.com> <20231208212301.3649930-2-samuel.holland@sifive.com>
Message-ID: <CAAhSdy2anOAgAannK2bnamcqQngAEyNUZgQpjF3Q550RCLV1-Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 9, 2023 at 2:53?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Currently, failures in sbi_ipi_send() are silently ignored, which makes
> them difficult to debug. Instead, abort sending the IPI and pass back
> the error, but still synchronize any IPIs already sent.
>
> This requires changing the value of SBI_IPI_UPDATE_BREAK to 0, since
> sbi_ipi_send() returning that value should not be treated as an error.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

I have taken care of my comments at the time of merging this patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>
>  include/sbi/sbi_ipi.h | 2 +-
>  lib/sbi/sbi_ipi.c     | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
> index d3962334..e81d9352 100644
> --- a/include/sbi/sbi_ipi.h
> +++ b/include/sbi/sbi_ipi.h
> @@ -31,9 +31,9 @@ struct sbi_ipi_device {
>  };
>
>  enum sbi_ipi_update_type {
> -       SBI_IPI_UPDATE_SUCCESS,
>         SBI_IPI_UPDATE_BREAK,
>         SBI_IPI_UPDATE_RETRY,
> +       SBI_IPI_UPDATE_SUCCESS,
>  };
>
>  struct sbi_scratch;
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 5c33a78b..1fd24228 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -101,7 +101,7 @@ static int sbi_ipi_sync(struct sbi_scratch *scratch, u32 event)
>   */
>  int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
>  {
> -       int rc;
> +       int rc = 0;
>         bool retry_needed;
>         ulong i, m;
>         struct sbi_hartmask target_mask = {0};
> @@ -137,6 +137,8 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
>                         rc = sbi_ipi_send(scratch, i, event, data);
>                         if (rc == SBI_IPI_UPDATE_RETRY)
>                                 retry_needed = true;
> +                       else if (rc)
> +                               break;
>                         else
>                                 sbi_hartmask_clear_hartindex(i, &target_mask);
>                 }
> @@ -145,7 +147,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
>         /* Sync IPIs */
>         sbi_ipi_sync(scratch, event);
>
> -       return 0;
> +       return rc;
>  }
>
>  int sbi_ipi_event_create(const struct sbi_ipi_event_ops *ops)
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

