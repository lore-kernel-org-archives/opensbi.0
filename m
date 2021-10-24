From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 24 Oct 2021 18:26:21 +0100
Subject: [PATCH] lib: utils/reset: Add voltage level for gpio_reset
In-Reply-To: <c5697b18296e0b0d670ea95cb38dca766971651c.camel@126.com>
References: <20211024164642.810274-1-wxjstz@126.com>
 <293C7F25-1B4C-4F11-832F-0FF89C4F14FC@jrtc27.com>
 <c5697b18296e0b0d670ea95cb38dca766971651c.camel@126.com>
Message-ID: <CD2FA1E4-9B02-4763-8208-F976B2938974@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24 Oct 2021, at 18:10, Xiang W <wxjstz@126.com> wrote:
> 
> ? 2021-10-24???? 17:53 +0100?Jessica Clarke???
>> On 24 Oct 2021, at 17:46, Xiang W <wxjstz@126.com> wrote:
>>> 
>>> The reset voltage may be different under different platforms, so
>>> fdt
>>> should describe the reset level.
>>> 
>>> Signed-off-by: Xiang W <wxjstz@126.com>
>>> ---
>>> lib/utils/reset/fdt_reset_gpio.c | 13 ++++++++++---
>>> 1 file changed, 10 insertions(+), 3 deletions(-)
>>> 
>>> diff --git a/lib/utils/reset/fdt_reset_gpio.c
>>> b/lib/utils/reset/fdt_reset_gpio.c
>>> index 4da1450..b834522 100644
>>> --- a/lib/utils/reset/fdt_reset_gpio.c
>>> +++ b/lib/utils/reset/fdt_reset_gpio.c
>>> @@ -21,16 +21,19 @@
>>> 
>>> struct gpio_reset {
>>>         struct gpio_pin pin;
>>> +       u32 active_level;
>>>         u32 active_delay;
>>>         u32 inactive_delay;
>>> };
>>> 
>>> static struct gpio_reset poweroff = {
>>> +       .active_level = 1,
>>>         .active_delay = 100,
>>>         .inactive_delay = 100
>>> };
>>> 
>>> static struct gpio_reset restart = {
>>> +       .active_level = 1,
>>>         .active_delay = 100,
>>>         .inactive_delay = 100
>>> };
>>> @@ -68,15 +71,15 @@ static void gpio_system_reset(u32 type, u32
>>> reason)
>>> 
>>>         if (reset) {
>>>                 /* drive it active, also inactive->active edge */
>>> -               gpio_direction_output(&reset->pin, 1);
>>> +               gpio_direction_output(&reset->pin, reset-
>>>> active_level);
>>>                 sbi_timer_mdelay(reset->active_delay);
>>> 
>>>                 /* drive inactive, also active->inactive edge */
>>> -               gpio_set(&reset->pin, 0);
>>> +               gpio_set(&reset->pin, !reset->active_level);
>>>                 sbi_timer_mdelay(reset->inactive_delay);
>>> 
>>>                 /* drive it active, also inactive->active edge */
>>> -               gpio_set(&reset->pin, 1);
>>> +               gpio_set(&reset->pin, reset->active_level);
>>>         }
>>>         /* hang !!! */
>>>         sbi_hart_hang();
>>> @@ -107,6 +110,10 @@ static int gpio_reset_init(void *fdt, int
>>> nodeoff,
>>>                         return rc;
>>>         }
>>> 
>>> +       val = fdt_getprop(fdt, nodeoff, "active-level", &len);
>> 
>> This property is neither documented in the binding specification for
>> gpio-restart nor is it checked by Linux.
> 
> This DT is only processed by opensbi, and linux should be reset through
> the sbi interface, instead of controlling gpio to perform the reset by
> itself.

Well, there are several things going on:

1. In general, you can?t just make up properties in the global
   namespace, that?s how you end up with the kind of mess device trees
   have the reputation of having
2. Linux doesn?t need this property and supports far more hardware than
   OpenSBI does, so why does OpenSBI need knowledge of this property but
   Linux doesn?t on any platform for any architecture?
3. OpenSBI doesn?t provide the device tree, in general, pre-OpenSBI
   firmware does, be it U-Boot SPL or something else, and in general that
   device tree *will* make its way all the way to the OS. Linux might go and
   ignore that and use its own device tree because the whole situation is a
   mess, but that?s not the point, this can and will be exposed to OSes running
   on top.

Jess


