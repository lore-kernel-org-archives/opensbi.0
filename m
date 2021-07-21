From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 21 Jul 2021 17:06:49 +0100
Subject: [PATCH 1/1] lib: utils: support multiple reset drivers of same
 type
In-Reply-To: <20210721155527.72568-1-xypron.glpk@gmx.de>
References: <20210721155527.72568-1-xypron.glpk@gmx.de>
Message-ID: <3151EF5D-3C0A-4FBC-9AD2-89B1EF2DCAD3@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21 Jul 2021, at 16:55, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> 
> The generic GPIO reset driver has two entries in the match table:
> "gpio-poweroff", "gpio-reset". Only the first entry is considered by
> fdt_reset_init().
> 
> Let fdt_reset_init() loop over all entries.
> 
> Fixes: e3d6919d10d7 ("lib: utils/reset: Add generic GPIO reset driver")
> Fixes: 7cc6fa4d8a65 ("lib: utils: Add simple FDT reset framework")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> lib/utils/reset/fdt_reset.c | 34 ++++++++++++++++++++--------------
> 1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index aa5f59f..a77a680 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -7,6 +7,7 @@
>  *   Anup Patel <anup.patel@wdc.com>
>  */
> 
> +#include <libfdt.h>
> #include <sbi/sbi_error.h>
> #include <sbi/sbi_scratch.h>
> #include <sbi_utils/fdt/fdt_helper.h>
> @@ -24,8 +25,14 @@ static struct fdt_reset *reset_drivers[] = {
> 	&fdt_reset_thead,
> };
> 
> -static struct fdt_reset *current_driver = NULL;
> -
> +/**
> + * fdt_reset_init() - initialize reset drivers
> + *
> + * For each reset driver we iterate over the match table. For each matching
> + * entry we call the driver initialization code once. This is necessary as
> + * drivers may use different compatible string for different reset functions,
> + * e.g. both "gpio-poweroff" and "gpio-reset".
> + */
> int fdt_reset_init(void)
> {
> 	int pos, noff, rc;
> @@ -35,20 +42,19 @@ int fdt_reset_init(void)
> 
> 	for (pos = 0; pos < array_size(reset_drivers); pos++) {
> 		drv = reset_drivers[pos];
> -
> -		noff = fdt_find_match(fdt, -1, drv->match_table, &match);
> -		if (noff < 0)
> -			continue;
> -
> -		if (drv->init) {
> -			rc = drv->init(fdt, noff, match);
> -			if (rc == SBI_ENODEV)
> +		for(match = drv->match_table; match->compatible; ++match) {
> +			noff = fdt_node_offset_by_compatible(fdt, -1,
> +							     match->compatible);
> +			if (noff < 0)

I don?t understand this. Doesn?t fdt_find_match already contain an equivalent loop?

Jess


