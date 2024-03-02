From: Anup Patel <anup@brainfault.org>
Date: Sat, 2 Mar 2024 18:25:29 +0530
Subject: [PATCH v3 2/6] include: sbi: rename sbi_misaligned_ldst.h to sbi_trap_ldst.h
In-Reply-To: <1709378725-56656-3-git-send-email-ganboing@gmail.com>
References: <1709378725-56656-1-git-send-email-ganboing@gmail.com> <1709378725-56656-3-git-send-email-ganboing@gmail.com>
Message-ID: <CAAhSdy3kFnJ5Wf1XFHzKw6vXZbaxar+7nP+p-VnvchYuwpViaw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 2, 2024 at 4:55?PM Bo Gan <ganboing@gmail.com> wrote:
>
> Signed-off-by: Bo Gan <ganboing@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/{sbi_misaligned_ldst.h => sbi_trap_ldst.h} | 4 ++--
>  lib/sbi/sbi_trap.c                                     | 2 +-
>  lib/sbi/sbi_trap_ldst.c                                | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>  rename include/sbi/{sbi_misaligned_ldst.h => sbi_trap_ldst.h} (86%)
>
> diff --git a/include/sbi/sbi_misaligned_ldst.h b/include/sbi/sbi_trap_ldst.h
> similarity index 86%
> rename from include/sbi/sbi_misaligned_ldst.h
> rename to include/sbi/sbi_trap_ldst.h
> index ab27eb4..9bbd237 100644
> --- a/include/sbi/sbi_misaligned_ldst.h
> +++ b/include/sbi/sbi_trap_ldst.h
> @@ -7,8 +7,8 @@
>   *   Anup Patel <anup.patel@wdc.com>
>   */
>
> -#ifndef __SBI_MISALIGNED_LDST_H__
> -#define __SBI_MISALIGNED_LDST_H__
> +#ifndef __SBI_TRAP_LDST_H__
> +#define __SBI_TRAP_LDST_H__
>
>  #include <sbi/sbi_types.h>
>
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index dbf307c..145db4b 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -17,7 +17,7 @@
>  #include <sbi/sbi_illegal_insn.h>
>  #include <sbi/sbi_ipi.h>
>  #include <sbi/sbi_irqchip.h>
> -#include <sbi/sbi_misaligned_ldst.h>
> +#include <sbi/sbi_trap_ldst.h>
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_timer.h>
> diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
> index aa512de..be9a394 100644
> --- a/lib/sbi/sbi_trap_ldst.c
> +++ b/lib/sbi/sbi_trap_ldst.c
> @@ -11,7 +11,7 @@
>  #include <sbi/riscv_encoding.h>
>  #include <sbi/riscv_fp.h>
>  #include <sbi/sbi_error.h>
> -#include <sbi/sbi_misaligned_ldst.h>
> +#include <sbi/sbi_trap_ldst.h>
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_trap.h>
>  #include <sbi/sbi_unpriv.h>
> --
> 2.7.4
>

