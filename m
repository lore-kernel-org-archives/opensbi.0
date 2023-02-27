From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 10:16:06 +0530
Subject: [PATCH v3 4/4] include: fdt/fdt_helper: Change fdt_get_address()
 to return root.next_arg1
In-Reply-To: <20230223104009.1727401-4-bmeng@tinylab.org>
References: <20230223104009.1727401-1-bmeng@tinylab.org> <20230223104009.1727401-4-bmeng@tinylab.org>
Message-ID: <CAAhSdy0Ov1kqD0cqi87Dzh7b67Rwmvq8E-3-V8xXoP4zSUm_bg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 23, 2023 at 4:13 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> In sbi_domain_finalize(), when locating the coldboot hart's domain,
> the coldboot hart's scratch->arg1 will be overwritten by the domain
> configuration. However scratch->arg1 holds the FDT address of the
> coldboot hart, and is still being accessed by fdt_get_address() in
> later boot process. scratch->arg1 could then contain completely
> garbage and lead to a crash.
>
> To fix this, we change fdt_get_address() to return root domain's
> next_arg1 as the FDT pointer.
>
> Resolves: https://github.com/riscv-software-src/opensbi/issues/281
> Fixes: b1678af210dc ("lib: sbi: Add initial domain support")
> Reported-by: Marouene Boubakri <marouene.boubakri@nxp.com>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
> Changes in v3:
> - Drop <sbi/sbi_scratch.h> as it is no longer needed
>
> Changes in v2:
> - Change fdt_get_address() to return root.next_arg1
>
>  include/sbi_utils/fdt/fdt_helper.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 09f3095..39d7f3a 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -11,7 +11,7 @@
>  #define __FDT_HELPER_H__
>
>  #include <sbi/sbi_types.h>
> -#include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_domain.h>
>
>  struct fdt_match {
>         const char *compatible;
> @@ -109,7 +109,7 @@ int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
>
>  static inline void *fdt_get_address(void)
>  {
> -       return sbi_scratch_thishart_arg1_ptr();
> +       return (void *)root.next_arg1;
>  }
>
>  #endif /* __FDT_HELPER_H__ */
> --
> 2.25.1
>

