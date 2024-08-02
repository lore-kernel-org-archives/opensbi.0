From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Aug 2024 08:51:17 +0530
Subject: [PATCH] lib: sbi: check result of pmp_get() in is_pmp_entry_mapped()
In-Reply-To: <20240801125852.5361-1-carlos.lopezr4096@gmail.com>
References: <20240801125852.5361-1-carlos.lopezr4096@gmail.com>
Message-ID: <CAAhSdy0F4nb=fxWzV8SLENgucjHO6hhBPuOZc6C6+8s8o76=xw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 1, 2024 at 6:36?PM Carlos L?pez <carlos.lopezr4096@gmail.com> wrote:
>
> pmp_get() may return an error if the given entry, given by the caller
> of is_pmp_entry_mapped(), is invalid. This results in the output
> parameters for pmp_get() being uninitialized. To avoid using garbage
> values, check the result and return early if necessary.
>
> This issue is not being hit because at the moment
> is_pmp_entry_mapped() is only being called from a single site with a
> valid hardcoded value.
>
> Signed-off-by: Carlos L?pez <carlos.lopezr4096@gmail.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/riscv_asm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> index 05b8c7c..c7d75ac 100644
> --- a/lib/sbi/riscv_asm.c
> +++ b/lib/sbi/riscv_asm.c
> @@ -291,7 +291,8 @@ int is_pmp_entry_mapped(unsigned long entry)
>         unsigned long addr;
>         unsigned long log2len;
>
> -       pmp_get(entry, &prot, &addr, &log2len);
> +       if (pmp_get(entry, &prot, &addr, &log2len) != 0)
> +               return false;
>
>         /* If address matching bits are non-zero, the entry is enable */
>         if (prot & PMP_A)
> --
> 2.39.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

