From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Nov 2021 10:32:38 +0530
Subject: [PATCH v4 1/6] lib: utils/reset: add priority to gpio reset
In-Reply-To: <20211110094230.5243-2-nikita.shubin@maquefel.me>
References: <20211110094230.5243-1-nikita.shubin@maquefel.me>
 <20211110094230.5243-2-nikita.shubin@maquefel.me>
Message-ID: <CAAhSdy337PLCvnVrk4Je3YAvJG4mFKF1MbAGaT71n0YeodgpaQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 10, 2021 at 3:12 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Make gpio_system_reset_check return priority instead of just true/false.
>
> Make default 128 priority for reset/shutdown.
>
> Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Reviewed-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/reset/fdt_reset_gpio.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
> index 302035b..d28b6f5 100644
> --- a/lib/utils/reset/fdt_reset_gpio.c
> +++ b/lib/utils/reset/fdt_reset_gpio.c
> @@ -77,7 +77,10 @@ static void gpio_reset_exec(struct gpio_reset *reset)
>
>  static int gpio_system_poweroff_check(u32 type, u32 reason)
>  {
> -       return !!gpio_reset_get(FALSE, type);
> +       if (gpio_reset_get(FALSE, type))
> +               return 128;
> +
> +       return 0;
>  }
>
>  static void gpio_system_poweroff(u32 type, u32 reason)
> @@ -93,7 +96,10 @@ static struct sbi_system_reset_device gpio_poweroff = {
>
>  static int gpio_system_restart_check(u32 type, u32 reason)
>  {
> -       return !!gpio_reset_get(TRUE, type);
> +       if (gpio_reset_get(TRUE, type))
> +               return 128;
> +
> +       return 0;
>  }
>
>  static void gpio_system_restart(u32 type, u32 reason)
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

