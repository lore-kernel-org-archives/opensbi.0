From: Anup Patel <anup@brainfault.org>
Date: Sun, 10 Dec 2023 10:29:35 +0530
Subject: [PATCH 3/3] lib: sbi_ipi: Drop unnecessary ipi_process check
In-Reply-To: <20231208212301.3649930-4-samuel.holland@sifive.com>
References: <20231208212301.3649930-1-samuel.holland@sifive.com> <20231208212301.3649930-4-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1Q1fuzaUk0nqB5UYL3xDV22Fai_DGUYFLa4asg7oDTLg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 9, 2023 at 2:53?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> sbi_ipi_event_create() disallows registering an IPI event with a NULL
> .process callback, so the function pointer will never be NULL here.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
>  lib/sbi/sbi_ipi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index ac31cd94..1115912b 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -241,7 +241,7 @@ void sbi_ipi_process(void)
>         while (ipi_type) {
>                 if (ipi_type & 1UL) {
>                         ipi_ops = ipi_ops_array[ipi_event];
> -                       if (ipi_ops && ipi_ops->process)
> +                       if (ipi_ops)
>                                 ipi_ops->process(scratch);
>                 }
>                 ipi_type = ipi_type >> 1;
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

