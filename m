From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 May 2023 12:56:21 +0530
Subject: [PATCH 2/2] lib: sbi: Simplify sbi_ipi_process remove goto
In-Reply-To: <20230425085625.465921-3-wxjstz@126.com>
References: <20230425085625.465921-1-wxjstz@126.com> <20230425085625.465921-3-wxjstz@126.com>
Message-ID: <CAAhSdy1+nS7sEuqQWWZ7UBwFx0Lsad9SrF5qNKmfXHJWqHE20Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 2:26?PM Xiang W <wxjstz@126.com> wrote:
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Please don't leave the commit description empty. Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_ipi.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index ba83f24..ad09154 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -223,14 +223,11 @@ void sbi_ipi_process(void)
>         ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
>         ipi_event = 0;
>         while (ipi_type) {
> -               if (!(ipi_type & 1UL))
> -                       goto skip;
> -
> -               ipi_ops = ipi_ops_array[ipi_event];
> -               if (ipi_ops && ipi_ops->process)
> -                       ipi_ops->process(scratch);
> -
> -skip:
> +               if (ipi_type & 1UL) {
> +                       ipi_ops = ipi_ops_array[ipi_event];
> +                       if (ipi_ops && ipi_ops->process)
> +                               ipi_ops->process(scratch);
> +               }
>                 ipi_type = ipi_type >> 1;
>                 ipi_event++;
>         }
> --
> 2.39.2
>

