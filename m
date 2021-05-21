From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 20 May 2021 22:33:26 -0700
Subject: [PATCH 2/2] lib: utils: Try other FDT drivers when we see
 SBI_ENODEV
In-Reply-To: <20210520155912.1336836-3-anup.patel@wdc.com>
References: <20210520155912.1336836-1-anup.patel@wdc.com>
 <20210520155912.1336836-3-anup.patel@wdc.com>
Message-ID: <CAOnJCUJMyRTD213MwW81f594aJC6ygud+VcAr6ZtAyw28cV-vQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 20, 2021 at 9:01 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We should try other FDT drivers when we see SBI_ENODEV returned
> by cold_init() of FDT driver.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/utils/ipi/fdt_ipi.c         | 3 +++
>  lib/utils/irqchip/fdt_irqchip.c | 3 +++
>  lib/utils/reset/fdt_reset.c     | 3 +++
>  lib/utils/serial/fdt_serial.c   | 5 +++++
>  lib/utils/timer/fdt_timer.c     | 3 +++
>  5 files changed, 17 insertions(+)
>
> diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
> index efca37e..3932f50 100644
> --- a/lib/utils/ipi/fdt_ipi.c
> +++ b/lib/utils/ipi/fdt_ipi.c
> @@ -7,6 +7,7 @@
>   *   Anup Patel <anup.patel@wdc.com>
>   */
>
> +#include <sbi/sbi_error.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/ipi/fdt_ipi.h>
> @@ -54,6 +55,8 @@ static int fdt_ipi_cold_init(void)
>                                         drv->match_table, &match)) >= 0) {
>                         if (drv->cold_init) {
>                                 rc = drv->cold_init(fdt, noff, match);
> +                               if (rc == SBI_ENODEV)
> +                                       continue;
>                                 if (rc)
>                                         return rc;
>                         }
> diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
> index 3630be6..1306d50 100644
> --- a/lib/utils/irqchip/fdt_irqchip.c
> +++ b/lib/utils/irqchip/fdt_irqchip.c
> @@ -7,6 +7,7 @@
>   *   Anup Patel <anup.patel@wdc.com>
>   */
>
> +#include <sbi/sbi_error.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/irqchip/fdt_irqchip.h>
> @@ -47,6 +48,8 @@ static int fdt_irqchip_cold_init(void)
>                                         drv->match_table, &match)) >= 0) {
>                         if (drv->cold_init) {
>                                 rc = drv->cold_init(fdt, noff, match);
> +                               if (rc == SBI_ENODEV)
> +                                       continue;
>                                 if (rc)
>                                         return rc;
>                         }
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index b01b0d1..1d687dc 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -7,6 +7,7 @@
>   *   Anup Patel <anup.patel@wdc.com>
>   */
>
> +#include <sbi/sbi_error.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/reset/fdt_reset.h>
> @@ -39,6 +40,8 @@ int fdt_reset_init(void)
>
>                 if (drv->init) {
>                         rc = drv->init(fdt, noff, match);
> +                       if (rc == SBI_ENODEV)
> +                               continue;
>                         if (rc)
>                                 return rc;
>                 }
> diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
> index bad3387..25982ec 100644
> --- a/lib/utils/serial/fdt_serial.c
> +++ b/lib/utils/serial/fdt_serial.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include <libfdt.h>
> +#include <sbi/sbi_error.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/serial/fdt_serial.h>
> @@ -59,6 +60,8 @@ int fdt_serial_init(void)
>
>                 if (drv->init) {
>                         rc = drv->init(fdt, noff, match);
> +                       if (rc == SBI_ENODEV)
> +                               continue;
>                         if (rc)
>                                 return rc;
>                 }
> @@ -80,6 +83,8 @@ int fdt_serial_init(void)
>
>                 if (drv->init) {
>                         rc = drv->init(fdt, noff, match);
> +                       if (rc == SBI_ENODEV)
> +                               continue;
>                         if (rc)
>                                 return rc;
>                 }
> diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
> index 92198cd..1fad42c 100644
> --- a/lib/utils/timer/fdt_timer.c
> +++ b/lib/utils/timer/fdt_timer.c
> @@ -7,6 +7,7 @@
>   *   Anup Patel <anup.patel@wdc.com>
>   */
>
> +#include <sbi/sbi_error.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/timer/fdt_timer.h>
> @@ -54,6 +55,8 @@ static int fdt_timer_cold_init(void)
>                                         drv->match_table, &match)) >= 0) {
>                         if (drv->cold_init) {
>                                 rc = drv->cold_init(fdt, noff, match);
> +                               if (rc == SBI_ENODEV)
> +                                       continue;
>                                 if (rc)
>                                         return rc;
>                         }
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

