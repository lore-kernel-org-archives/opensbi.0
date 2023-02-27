From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 10:15:35 +0530
Subject: [PATCH v3 2/4] platform: generic/allwinner: Fix sun20i-d1.c
 header dependency
In-Reply-To: <20230223104009.1727401-2-bmeng@tinylab.org>
References: <20230223104009.1727401-1-bmeng@tinylab.org> <20230223104009.1727401-2-bmeng@tinylab.org>
Message-ID: <CAAhSdy0Yb3Sn9X=byDF-sdMyzEM9NDTtsc3K40EBUB4bBtH45w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 23, 2023 at 4:11 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> The code calls various macros from riscv_asm.h and sbi_scratch.h
> which are not directly included. Fix such dependency.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  platform/generic/allwinner/sun20i-d1.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 295c159..0f0a9f3 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -6,12 +6,14 @@
>
>  #include <platform_override.h>
>  #include <thead_c9xx.h>
> +#include <sbi/riscv_asm.h>
>  #include <sbi/riscv_io.h>
>  #include <sbi/sbi_bitops.h>
>  #include <sbi/sbi_ecall_interface.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hsm.h>
>  #include <sbi/sbi_pmu.h>
> +#include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_fixup.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/irqchip/fdt_irqchip_plic.h>
> --
> 2.25.1
>

