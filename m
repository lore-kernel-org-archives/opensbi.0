From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Dec 2022 22:01:55 +0530
Subject: [PATCH v2 3/3] lib: sbi: fix is_region_valid
In-Reply-To: <20221124031605.216192-4-wxjstz@126.com>
References: <20221124031605.216192-1-wxjstz@126.com> <20221124031605.216192-4-wxjstz@126.com>
Message-ID: <CAAhSdy3CEUUrsqdvwnQi3b2WgWbBAxKpf9+z-9nN-iXCRhqW5g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 24, 2022 at 8:46 AM Xiang W <wxjstz@126.com> wrote:
>
> When order is equal to __riscv_xlen, the shift operation will not
> perform any operation, which will cause
> reg->base & (BIT(reg->order) - 1) to always be 0, and the condition
> has not been established. This patch fixes this bug
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 3365e74..65fae89 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -142,6 +142,9 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
>         if (reg->order < 3 || __riscv_xlen < reg->order)
>                 return FALSE;
>
> +       if (reg->order == __riscv_xlen && reg->base != 0)
> +               return FALSE;
> +
>         if (reg->base & (BIT(reg->order) - 1))
>                 return FALSE;
>
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

