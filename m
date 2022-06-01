From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Jun 2022 18:45:30 +0530
Subject: [RFC PATCH v2 7/9] lib: utils/irqchip: Add FDT wrappers for PLIC
 save/restore functions
In-Reply-To: <20220530033738.27127-8-samuel@sholland.org>
References: <20220530033738.27127-1-samuel@sholland.org> <20220530033738.27127-8-samuel@sholland.org>
Message-ID: <CAAhSdy240crXp4VPQhG2-en4uv+v5oJy-HDhT6nBr7NYZ9jv-w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 30, 2022 at 9:07 AM Samuel Holland <samuel@sholland.org> wrote:
>
> These functions save/restore the state of the PLIC associated with the
> current hart. Only the S-mode context is saved/restored, under the
> assumption that none of the interrupts are enabled in M-mode anyway.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
> Changes in v2:
>  - New patch for v2
>
>  include/sbi_utils/irqchip/fdt_irqchip_plic.h | 20 ++++++++++++
>  lib/utils/irqchip/fdt_irqchip_plic.c         | 32 ++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 include/sbi_utils/irqchip/fdt_irqchip_plic.h
>
> diff --git a/include/sbi_utils/irqchip/fdt_irqchip_plic.h b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> new file mode 100644
> index 0000000..66650a2
> --- /dev/null
> +++ b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> @@ -0,0 +1,20 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Samuel Holland <samuel@sholland.org>
> + */
> +
> +#ifndef __IRQCHIP_FDT_IRQCHIP_PLIC_H__
> +#define __IRQCHIP_FDT_IRQCHIP_PLIC_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +void irqchip_plic_priority_save(u8 *priority);
> +
> +void irqchip_plic_priority_restore(const u8 *priority);
> +
> +void irqchip_plic_context_save(u32 *enable, u32 *threshold);
> +
> +void irqchip_plic_context_restore(const u32 *enable, u32 threshold);

Since these functions are part of the FDT based PLIC driver, I suggest
using "fdt_plic_" instead of "irqchip_plic_" prefix for function names.

Regards,
Anup

> +
> +#endif
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index b2d2a1b..37090d3 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -24,6 +24,38 @@ static struct plic_data plic[PLIC_MAX_NR];
>  static struct plic_data *plic_hartid2data[SBI_HARTMASK_MAX_BITS];
>  static int plic_hartid2context[SBI_HARTMASK_MAX_BITS][2];
>
> +void irqchip_plic_priority_save(u8 *priority)
> +{
> +       struct plic_data *plic = plic_hartid2data[current_hartid()];
> +
> +       plic_priority_save(plic, priority);
> +}
> +
> +void irqchip_plic_priority_restore(const u8 *priority)
> +{
> +       struct plic_data *plic = plic_hartid2data[current_hartid()];
> +
> +       plic_priority_restore(plic, priority);
> +}
> +
> +void irqchip_plic_context_save(u32 *enable, u32 *threshold)
> +{
> +       u32 hartid = current_hartid();
> +
> +       plic_context_save(plic_hartid2data[hartid],
> +                         plic_hartid2context[hartid][1],
> +                         enable, threshold);
> +}
> +
> +void irqchip_plic_context_restore(const u32 *enable, u32 threshold)
> +{
> +       u32 hartid = current_hartid();
> +
> +       plic_context_restore(plic_hartid2data[hartid],
> +                            plic_hartid2context[hartid][1],
> +                            enable, threshold);
> +}
> +
>  static int irqchip_plic_warm_init(void)
>  {
>         u32 hartid = current_hartid();
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

