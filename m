From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 10:15:52 +0530
Subject: [PATCH v3 3/4] platform: generic/andes: Fix ae350.c header dependency
In-Reply-To: <20230223104009.1727401-3-bmeng@tinylab.org>
References: <20230223104009.1727401-1-bmeng@tinylab.org> <20230223104009.1727401-3-bmeng@tinylab.org>
Message-ID: <CAAhSdy1NtEKv=X7ad_vZQFkDvcchmpvMWTbnoroOVJeT+0_a6g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 23, 2023 at 4:12 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> The code calls various macros from riscv_asm.h which is not directly
> included. Fix such dependency.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  platform/generic/andes/ae350.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
> index 89f5b74..01bd02d 100644
> --- a/platform/generic/andes/ae350.c
> +++ b/platform/generic/andes/ae350.c
> @@ -11,6 +11,7 @@
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/fdt/fdt_fixup.h>
>  #include <sbi_utils/sys/atcsmu.h>
> +#include <sbi/riscv_asm.h>
>  #include <sbi/sbi_bitops.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hsm.h>
> --
> 2.25.1
>

