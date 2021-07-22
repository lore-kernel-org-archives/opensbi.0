From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 21 Jul 2021 17:38:45 -0700
Subject: [PATCH 1/1] lib: utils: support multiple reset drivers of same
 type
In-Reply-To: <8cce28e4-63bd-1325-42e1-96afd49534be@gmx.de>
References: <20210721155527.72568-1-xypron.glpk@gmx.de>
 <3151EF5D-3C0A-4FBC-9AD2-89B1EF2DCAD3@jrtc27.com>
 <8cce28e4-63bd-1325-42e1-96afd49534be@gmx.de>
Message-ID: <CAOnJCU+y5Yzkgy-P3-kSBF+yRT4DWsesHCMtF_8H3M6JcoBzag@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 21, 2021 at 9:51 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
>
>
> On 21.07.21 18:06, Jessica Clarke wrote:
> > On 21 Jul 2021, at 16:55, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>
> >> The generic GPIO reset driver has two entries in the match table:
> >> "gpio-poweroff", "gpio-reset". Only the first entry is considered by
> >> fdt_reset_init().
> >>
> >> Let fdt_reset_init() loop over all entries.
> >>
> >> Fixes: e3d6919d10d7 ("lib: utils/reset: Add generic GPIO reset driver")
> >> Fixes: 7cc6fa4d8a65 ("lib: utils: Add simple FDT reset framework")
> >> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> >> ---
> >> lib/utils/reset/fdt_reset.c | 34 ++++++++++++++++++++--------------
> >> 1 file changed, 20 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> >> index aa5f59f..a77a680 100644
> >> --- a/lib/utils/reset/fdt_reset.c
> >> +++ b/lib/utils/reset/fdt_reset.c
> >> @@ -7,6 +7,7 @@
> >>   *   Anup Patel <anup.patel@wdc.com>
> >>   */
> >>
> >> +#include <libfdt.h>
> >> #include <sbi/sbi_error.h>
> >> #include <sbi/sbi_scratch.h>
> >> #include <sbi_utils/fdt/fdt_helper.h>
> >> @@ -24,8 +25,14 @@ static struct fdt_reset *reset_drivers[] = {
> >>      &fdt_reset_thead,
> >> };
> >>
> >> -static struct fdt_reset *current_driver = NULL;
> >> -
> >> +/**
> >> + * fdt_reset_init() - initialize reset drivers
> >> + *
> >> + * For each reset driver we iterate over the match table. For each matching
> >> + * entry we call the driver initialization code once. This is necessary as
> >> + * drivers may use different compatible string for different reset functions,
> >> + * e.g. both "gpio-poweroff" and "gpio-reset".
> >> + */
> >> int fdt_reset_init(void)
> >> {
> >>      int pos, noff, rc;
> >> @@ -35,20 +42,19 @@ int fdt_reset_init(void)
> >>
> >>      for (pos = 0; pos < array_size(reset_drivers); pos++) {
> >>              drv = reset_drivers[pos];
> >> -
> >> -            noff = fdt_find_match(fdt, -1, drv->match_table, &match);
> >> -            if (noff < 0)
> >> -                    continue;
> >> -
> >> -            if (drv->init) {
> >> -                    rc = drv->init(fdt, noff, match);
> >> -                    if (rc == SBI_ENODEV)
> >> +            for(match = drv->match_table; match->compatible; ++match) {
> >> +                    noff = fdt_node_offset_by_compatible(fdt, -1,
> >> +                                                         match->compatible);
> >> +                    if (noff < 0)
> >
> > I don?t understand this. Doesn?t fdt_find_match already contain an equivalent loop?
>
> The SiFive boards use to separate nodes for gpio-restart and
> gpio-poweroff. There is only one GPIO driver which has a match table
> with those to strings. For each of the nodes we have to call the init
> method of the GPIO driver.
>
> If you pass a table of compatible strings to fdt_find_match() it will
> return the position of the first node that matches any of the strings.
> So if you have two nodes gpio-restart and gpio-poweroff and two entries
> in the matchtable the init routine is only called for one the two nodes.
>
> An alternative solution would be to separate the GPIO driver into two
> drivers. One for gpio-restart and one for gpio-poweroff. The advantage
> of such a solution would be that you still could use alternative
> compatible strings for a single driver.

This seems like a better approach to me.

>
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index aa5f59f..bf60547 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -12,12 +12,14 @@
>   #include <sbi_utils/fdt/fdt_helper.h>
>   #include <sbi_utils/reset/fdt_reset.h>
>
> +extern struct fdt_reset fdt_poweroff_gpio;
>   extern struct fdt_reset fdt_reset_gpio;
>   extern struct fdt_reset fdt_reset_sifive_test;
>   extern struct fdt_reset fdt_reset_htif;
>   extern struct fdt_reset fdt_reset_thead;
>
>   static struct fdt_reset *reset_drivers[] = {
> +       &fdt_poweroff_gpio,
>          &fdt_reset_gpio,
>          &fdt_reset_sifive_test,
>          &fdt_reset_htif,
> diff --git a/lib/utils/reset/fdt_reset_gpio.c
> b/lib/utils/reset/fdt_reset_gpio.c
> index 7e0eb74..77e308a 100644
> --- a/lib/utils/reset/fdt_reset_gpio.c
> +++ b/lib/utils/reset/fdt_reset_gpio.c
> @@ -129,8 +129,17 @@ static int gpio_reset_init(void *fdt, int nodeoff,
>          return 0;
>   }
>
> -static const struct fdt_match gpio_reset_match[] = {
> +static const struct fdt_match gpio_poweroff_match[] = {
>          { .compatible = "gpio-poweroff", .data = (void *)FALSE },
> +       { },
> +};
> +
> +struct fdt_reset fdt_poweroff_gpio = {
> +       .match_table = gpio_poweroff_match,
> +       .init = gpio_reset_init,
> +};
> +
> +static const struct fdt_match gpio_reset_match[] = {
>          { .compatible = "gpio-restart", .data = (void *)TRUE },
>          { },
>   };
>
> Best regards
>
> Heinrich
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

