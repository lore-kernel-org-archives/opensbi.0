From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Dec 2024 11:14:00 +0530
Subject: [PATCH v2 1/2] platform: generic: Initialize console before other drivers
In-Reply-To: <20241219050250.3861915-1-samuel.holland@sifive.com>
References: <20241219050250.3861915-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1E_u_25vTafJii4Cy4eBBsZgVND0_MAsGjNW2irL5i1A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 19, 2024 at 10:32?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Initialize serial drivers first, so messages printed by other drivers do
> not need to use the early console buffer.
>
> Suggested-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> Changes in v2:
>  - New patch for v2
>
>  platform/generic/platform.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 350d2517..c03ed88e 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -250,17 +250,17 @@ static int generic_early_init(bool cold_boot)
>         int rc;
>
>         if (cold_boot) {
> -               fdt_reset_init(fdt);
> -               fdt_suspend_init(fdt);
> -               fdt_hsm_init(fdt);
> -               fdt_cppc_init(fdt);
> -
>                 if (semihosting_enabled())
>                         rc = semihosting_init();
>                 else
>                         rc = fdt_serial_init(fdt);
>                 if (rc)
>                         return rc;
> +
> +               fdt_cppc_init(fdt);
> +               fdt_hsm_init(fdt);
> +               fdt_reset_init(fdt);
> +               fdt_suspend_init(fdt);
>         }
>
>         if (!generic_plat || !generic_plat->early_init)
> --
> 2.45.1
>

