From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jun 2022 11:50:57 +0530
Subject: [PATCH v3 7/9] lib: utils/irqchip: Add FDT wrappers for PLIC
 save/restore functions
In-Reply-To: <20220613010355.28014-8-samuel@sholland.org>
References: <20220613010355.28014-1-samuel@sholland.org> <20220613010355.28014-8-samuel@sholland.org>
Message-ID: <CAAhSdy2TNtn1Tw4CM0oMOMMybVr3_p0euY49cAkoYLym9E1Szg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 13, 2022 at 6:34 AM Samuel Holland <samuel@sholland.org> wrote:
>
> These functions save/restore the state of the PLIC associated with the
> current hart. The context save/restore functions only manipulate a
> single context, since most likely the M-mode context is unused and does
> not need to be saved.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> Changes in v3:
>  - Rename irqchip_plic_* functions to fdt_plic_*
>  - Add a "bool smode" parameter instead of hard coding the context ID
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
> index 0000000..f158b02
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
> +void fdt_plic_priority_save(u8 *priority);
> +
> +void fdt_plic_priority_restore(const u8 *priority);
> +
> +void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold);
> +
> +void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold);
> +
> +#endif
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index b2d2a1b..89b12d4 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -24,6 +24,38 @@ static struct plic_data plic[PLIC_MAX_NR];
>  static struct plic_data *plic_hartid2data[SBI_HARTMASK_MAX_BITS];
>  static int plic_hartid2context[SBI_HARTMASK_MAX_BITS][2];
>
> +void fdt_plic_priority_save(u8 *priority)
> +{
> +       struct plic_data *plic = plic_hartid2data[current_hartid()];
> +
> +       plic_priority_save(plic, priority);
> +}
> +
> +void fdt_plic_priority_restore(const u8 *priority)
> +{
> +       struct plic_data *plic = plic_hartid2data[current_hartid()];
> +
> +       plic_priority_restore(plic, priority);
> +}
> +
> +void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold)
> +{
> +       u32 hartid = current_hartid();
> +
> +       plic_context_save(plic_hartid2data[hartid],
> +                         plic_hartid2context[hartid][smode],
> +                         enable, threshold);
> +}
> +
> +void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold)
> +{
> +       u32 hartid = current_hartid();
> +
> +       plic_context_restore(plic_hartid2data[hartid],
> +                            plic_hartid2context[hartid][smode],
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

