From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Feb 2023 16:35:37 +0530
Subject: [PATCH] lib: sbi: Ensure domidx_to_domain_table is null-terminated
In-Reply-To: <20230130164224.1364402-1-ajones@ventanamicro.com>
References: <20230130164224.1364402-1-ajones@ventanamicro.com>
Message-ID: <CAAhSdy0=BTLr2vO+D6EzpUhfctRfTrPsQr-nn5ToJhFb57SROQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 30, 2023 at 10:12 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> sbi_domain_for_each() requires domidx_to_domain_table[] to be
> null-terminated. Allocate one extra element which will always
> be null.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 3ab1fbe0b7de..3813f1b2e97d 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -17,8 +17,12 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
>
> +/*
> + * We allocate an extra element because sbi_domain_for_each() expects
> + * the array to be null-terminated.
> + */
> +struct sbi_domain *domidx_to_domain_table[SBI_DOMAIN_MAX_INDEX + 1] = { 0 };
>  struct sbi_domain *hartid_to_domain_table[SBI_HARTMASK_MAX_BITS] = { 0 };
> -struct sbi_domain *domidx_to_domain_table[SBI_DOMAIN_MAX_INDEX] = { 0 };
>  static u32 domain_count = 0;
>  static bool domain_finalized = false;
>
> --
> 2.39.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

