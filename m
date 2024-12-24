From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Dec 2024 16:08:18 +0530
Subject: [PATCH] lib: utils: Fix irqchip registration for PLIC and APLIC
In-Reply-To: <20241224082825.710540-1-apatel@ventanamicro.com>
References: <20241224082825.710540-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy28HyndRKxb0U7sB75eej-xM9uPqBKj=wuW-awT425SVA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 24, 2024 at 1:58?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, the same irqchip instance is registered for multiple PLIC
> and APLIC instances which causes the sbi_list_for_each_entry() loop
> in the sbi_irqchip_init() to hang at boot-time.
>
> To address the above issue, register a separate irqchip instance for
> each PLIC and APLIC instance.
>
> Fixes: 2dd6eaf68055 ("lib: sbi_irqchip: Call driver warm_init from SBI core")
> Reported-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

This fix is critical for OpenSBI v1.6 release hence merging it soon.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi_utils/irqchip/aplic.h | 4 ++++
>  include/sbi_utils/irqchip/plic.h  | 4 ++++
>  lib/utils/irqchip/aplic.c         | 6 +-----
>  lib/utils/irqchip/plic.c          | 8 ++------
>  4 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
> index 82682e8a..e31f48a4 100644
> --- a/include/sbi_utils/irqchip/aplic.h
> +++ b/include/sbi_utils/irqchip/aplic.h
> @@ -12,6 +12,7 @@
>  #define __IRQCHIP_APLIC_H__
>
>  #include <sbi/sbi_types.h>
> +#include <sbi/sbi_irqchip.h>
>
>  #define APLIC_MAX_DELEGATE     16
>
> @@ -30,6 +31,9 @@ struct aplic_delegate_data {
>  };
>
>  struct aplic_data {
> +       /* Private members */
> +       struct sbi_irqchip_device irqchip;
> +       /* Public members */
>         unsigned long addr;
>         unsigned long size;
>         unsigned long num_idc;
> diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
> index a173871e..18aa7469 100644
> --- a/include/sbi_utils/irqchip/plic.h
> +++ b/include/sbi_utils/irqchip/plic.h
> @@ -11,8 +11,12 @@
>  #define __IRQCHIP_PLIC_H__
>
>  #include <sbi/sbi_types.h>
> +#include <sbi/sbi_irqchip.h>
>
>  struct plic_data {
> +       /* Private members */
> +       struct sbi_irqchip_device irqchip;
> +       /* Public members */
>         unsigned long addr;
>         unsigned long size;
>         unsigned long num_src;
> diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
> index 27371849..72906d5d 100644
> --- a/lib/utils/irqchip/aplic.c
> +++ b/lib/utils/irqchip/aplic.c
> @@ -12,7 +12,6 @@
>  #include <sbi/sbi_console.h>
>  #include <sbi/sbi_domain.h>
>  #include <sbi/sbi_error.h>
> -#include <sbi/sbi_irqchip.h>
>  #include <sbi_utils/irqchip/aplic.h>
>
>  #define APLIC_MAX_IDC                  (1UL << 14)
> @@ -166,9 +165,6 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
>         return 0;
>  }
>
> -static struct sbi_irqchip_device aplic_device = {
> -};
> -
>  int aplic_cold_irqchip_init(struct aplic_data *aplic)
>  {
>         int rc;
> @@ -280,7 +276,7 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
>         }
>
>         /* Register irqchip device */
> -       sbi_irqchip_add_device(&aplic_device);
> +       sbi_irqchip_add_device(&aplic->irqchip);
>
>         return 0;
>  }
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 7761ae98..8b2190f8 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -15,7 +15,6 @@
>  #include <sbi/sbi_domain.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_heap.h>
> -#include <sbi/sbi_irqchip.h>
>  #include <sbi/sbi_string.h>
>  #include <sbi_utils/irqchip/plic.h>
>
> @@ -221,10 +220,6 @@ static int plic_warm_irqchip_init(struct sbi_irqchip_device *dev)
>         return 0;
>  }
>
> -static struct sbi_irqchip_device plic_device = {
> -       .warm_init      = plic_warm_irqchip_init,
> -};
> -
>  int plic_cold_irqchip_init(struct plic_data *plic)
>  {
>         int i, ret;
> @@ -284,7 +279,8 @@ int plic_cold_irqchip_init(struct plic_data *plic)
>         }
>
>         /* Register irqchip device */
> -       sbi_irqchip_add_device(&plic_device);
> +       plic->irqchip.warm_init = plic_warm_irqchip_init;
> +       sbi_irqchip_add_device(&plic->irqchip);
>
>         return 0;
>  }
> --
> 2.43.0
>

