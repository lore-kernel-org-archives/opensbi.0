From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Nov 2021 18:28:37 +0530
Subject: [PATCH v2] lib: utils/gpio: use list for drivers
In-Reply-To: <20211102143911.30184-1-nikita.shubin@maquefel.me>
References: <20211101115023.13414-1-nikita.shubin@maquefel.me>
 <20211102143911.30184-1-nikita.shubin@maquefel.me>
Message-ID: <CAAhSdy1qY0eHTp0s_5cqvAnNa86cwvYvapBCh+x2zYXMuCgyHw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 2, 2021 at 8:09 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Convert static array to sbi_list.
>
> This removes size limitation, makes add/remove more efficient and
> saves space.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Please keep Reviewed-by tags provided by others in subsequent
patch revisions. It helps me decide whether patch is good to be
merged or not.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> v1 -> v2:
> fixed typo
> ---
>  include/sbi_utils/gpio/gpio.h |  8 +++++++
>  lib/utils/gpio/gpio.c         | 42 ++++++++++-------------------------
>  2 files changed, 20 insertions(+), 30 deletions(-)
>
> diff --git a/include/sbi_utils/gpio/gpio.h b/include/sbi_utils/gpio/gpio.h
> index 167d11a..7a3d8bb 100644
> --- a/include/sbi_utils/gpio/gpio.h
> +++ b/include/sbi_utils/gpio/gpio.h
> @@ -11,6 +11,7 @@
>  #define __GPIO_H__
>
>  #include <sbi/sbi_types.h>
> +#include <sbi/sbi_list.h>
>
>  #define GPIO_LINE_DIRECTION_IN 1
>  #define GPIO_LINE_DIRECTION_OUT        0
> @@ -70,8 +71,15 @@ struct gpio_chip {
>         int (*get)(struct gpio_pin *gp);
>         /** Set output value for GPIO pin */
>         void (*set)(struct gpio_pin *gp, int value);
> +       /** List */
> +       struct sbi_dlist node;
>  };
>
> +static inline struct gpio_chip *to_gpio_chip(struct sbi_dlist *node)
> +{
> +       return container_of(node, struct gpio_chip, node);
> +}
> +
>  /** Find a registered GPIO chip */
>  struct gpio_chip *gpio_chip_find(unsigned int id);
>
> diff --git a/lib/utils/gpio/gpio.c b/lib/utils/gpio/gpio.c
> index fb30c0f..3a3a6b2 100644
> --- a/lib/utils/gpio/gpio.c
> +++ b/lib/utils/gpio/gpio.c
> @@ -10,58 +10,40 @@
>  #include <sbi/sbi_error.h>
>  #include <sbi_utils/gpio/gpio.h>
>
> -#define GPIO_CHIP_MAX          16
> -
> -static struct gpio_chip *gc_array[GPIO_CHIP_MAX];
> +static SBI_LIST_HEAD(gpio_chip_list);
>
>  struct gpio_chip *gpio_chip_find(unsigned int id)
>  {
> -       unsigned int i;
> -       struct gpio_chip *ret = NULL;
> -
> -       for (i = 0; i < GPIO_CHIP_MAX; i++) {
> -               if (gc_array[i] && gc_array[i]->id == id) {
> -                       ret = gc_array[i];
> -                       break;
> -               }
> +       struct sbi_dlist *pos;
> +
> +       sbi_list_for_each(pos, &(gpio_chip_list)) {
> +               struct gpio_chip *chip = to_gpio_chip(pos);
> +
> +               if (chip->id == id)
> +                       return chip;
>         }
>
> -       return ret;
> +       return NULL;
>  }
>
>  int gpio_chip_add(struct gpio_chip *gc)
>  {
> -       int i, ret = SBI_ENOSPC;
> -
>         if (!gc)
>                 return SBI_EINVAL;
>         if (gpio_chip_find(gc->id))
>                 return SBI_EALREADY;
>
> -       for (i = 0; i < GPIO_CHIP_MAX; i++) {
> -               if (!gc_array[i]) {
> -                       gc_array[i] = gc;
> -                       ret = 0;
> -                       break;
> -               }
> -       }
> +       sbi_list_add(&(gc->node), &(gpio_chip_list));
>
> -       return ret;
> +       return 0;
>  }
>
>  void gpio_chip_remove(struct gpio_chip *gc)
>  {
> -       int i;
> -
>         if (!gc)
>                 return;
>
> -       for (i = 0; i < GPIO_CHIP_MAX; i++) {
> -               if (gc_array[i] == gc) {
> -                       gc_array[i] = NULL;
> -                       break;
> -               }
> -       }
> +       sbi_list_del(&(gc->node));
>  }
>
>  int gpio_get_direction(struct gpio_pin *gp)
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

