From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Feb 2025 18:08:51 +0530
Subject: [PATCH] lib: utils: Constify FDT driver definitions
In-Reply-To: <20250213222457.3581142-1-samuel.holland@sifive.com>
References: <20250213222457.3581142-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1mbG6KrhCcLNHNnHwYeuZg0KnA3922mq556t6UfJfCpA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 14, 2025 at 3:55?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> The carray referencing these definitions assumes they are const.
>
> Fixes: 6a26726e08e4 ("lib/utils: reset: Add RPMI System Reset driver")
> Fixes: 13f55f33a1d3 ("lib: utils/suspend: Add RPMI system suspend driver")
> Fixes: 33ee9b8240fe ("lib: utils/hsm: Add RPMI HSM driver")
> Fixes: 591a98bdd549 ("lib: utils/cppc: Add RPMI CPPC driver")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  lib/utils/cppc/fdt_cppc_rpmi.c       | 2 +-
>  lib/utils/hsm/fdt_hsm_rpmi.c         | 2 +-
>  lib/utils/reset/fdt_reset_rpmi.c     | 2 +-
>  lib/utils/suspend/fdt_suspend_rpmi.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
> index 39342198..efcea652 100644
> --- a/lib/utils/cppc/fdt_cppc_rpmi.c
> +++ b/lib/utils/cppc/fdt_cppc_rpmi.c
> @@ -367,7 +367,7 @@ static const struct fdt_match rpmi_cppc_match[] = {
>         {},
>  };
>
> -struct fdt_driver fdt_cppc_rpmi = {
> +const struct fdt_driver fdt_cppc_rpmi = {
>         .match_table = rpmi_cppc_match,
>         .init = rpmi_cppc_cold_init,
>         .experimental = true,
> diff --git a/lib/utils/hsm/fdt_hsm_rpmi.c b/lib/utils/hsm/fdt_hsm_rpmi.c
> index 5142c3e6..cc78436f 100644
> --- a/lib/utils/hsm/fdt_hsm_rpmi.c
> +++ b/lib/utils/hsm/fdt_hsm_rpmi.c
> @@ -356,7 +356,7 @@ static const struct fdt_match rpmi_hsm_match[] = {
>         {},
>  };
>
> -struct fdt_driver fdt_hsm_rpmi = {
> +const struct fdt_driver fdt_hsm_rpmi = {
>         .match_table = rpmi_hsm_match,
>         .init = rpmi_hsm_cold_init,
>         .experimental = true,
> diff --git a/lib/utils/reset/fdt_reset_rpmi.c b/lib/utils/reset/fdt_reset_rpmi.c
> index 15d3c6d5..81b21d0f 100644
> --- a/lib/utils/reset/fdt_reset_rpmi.c
> +++ b/lib/utils/reset/fdt_reset_rpmi.c
> @@ -135,7 +135,7 @@ static const struct fdt_match rpmi_reset_match[] = {
>         {},
>  };
>
> -struct fdt_driver fdt_reset_rpmi = {
> +const struct fdt_driver fdt_reset_rpmi = {
>         .match_table = rpmi_reset_match,
>         .init = rpmi_reset_init,
>         .experimental = true,
> diff --git a/lib/utils/suspend/fdt_suspend_rpmi.c b/lib/utils/suspend/fdt_suspend_rpmi.c
> index b08c33e9..f9baa23c 100644
> --- a/lib/utils/suspend/fdt_suspend_rpmi.c
> +++ b/lib/utils/suspend/fdt_suspend_rpmi.c
> @@ -132,7 +132,7 @@ static const struct fdt_match rpmi_suspend_match[] = {
>         {},
>  };
>
> -struct fdt_driver fdt_suspend_rpmi = {
> +const struct fdt_driver fdt_suspend_rpmi = {
>         .match_table = rpmi_suspend_match,
>         .init = rpmi_suspend_init,
>         .experimental = true,
> --
> 2.47.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

