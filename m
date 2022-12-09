From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Dec 2022 14:11:01 +0530
Subject: [PATCH v2 1/3] lib: fix is_region_valid()
In-Reply-To: <20221208011421.11624-2-heinrich.schuchardt@canonical.com>
References: <20221208011421.11624-1-heinrich.schuchardt@canonical.com> <20221208011421.11624-2-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy0M1gnmjv6YnPbU=5LB+ZTyRS+KGB3+pRbTKZEJuwPm-g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 8, 2022 at 6:44 AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> For 'reg->order == __riscv_xlen' the term 'BIT(reg->order)' is undefined.
>
> Addresses-Coverity-ID: 1529706 ("Bad bit shift operation")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> v2:
>         Make the logical constraint a bit easier to read.
> ---
>  lib/sbi/sbi_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 3302213..3205595 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -149,7 +149,7 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
>         if (reg->order == __riscv_xlen && reg->base != 0)
>                 return FALSE;
>
> -       if (reg->base & (BIT(reg->order) - 1))
> +       if (reg->order < __riscv_xlen && (reg->base & (BIT(reg->order) - 1)))
>                 return FALSE;
>
>         return TRUE;
> --
> 2.37.2
>

