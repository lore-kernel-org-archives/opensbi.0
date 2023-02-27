From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 10:15:17 +0530
Subject: [PATCH v3 1/4] lib: utils/fdt: Fix fdt_pmu.c header dependency
In-Reply-To: <20230223104009.1727401-1-bmeng@tinylab.org>
References: <20230223104009.1727401-1-bmeng@tinylab.org>
Message-ID: <CAAhSdy2fPr1TWCy2OAjsLOGrx=ZBRpD2TCJXAwdBGDc-CpjymQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 23, 2023 at 4:10 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> The code calls sbi_scratch_thishart_ptr() from sbi_scratch.h which
> is not directly included. Fix such dependency.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  lib/utils/fdt/fdt_pmu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
> index 4829f21..83301bb 100644
> --- a/lib/utils/fdt/fdt_pmu.c
> +++ b/lib/utils/fdt/fdt_pmu.c
> @@ -12,6 +12,7 @@
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_pmu.h>
> +#include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>
>  #define FDT_PMU_HW_EVENT_MAX (SBI_PMU_HW_EVENT_MAX * 2)
> --
> 2.25.1
>

