From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 May 2022 10:28:32 -0700
Subject: [PATCH 11/11] platform: generic: Move Sifive platform overrides
 into own directory
In-Reply-To: <20220503033759.544156-12-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
 <20220503033759.544156-12-apatel@ventanamicro.com>
Message-ID: <CAOnJCUJ0BmnU+uCn=BAPPExPWF1stv_OZKBfyYs8JM_iVxD+uA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 2, 2022 at 8:38 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Let us move SiFive platform overrides for FU540 and FU740 into a separate
> directory so better maintainability. Other SoC vendors can also create
> their own directory under platform/generic.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  platform/generic/objects.mk                         | 6 ------
>  platform/generic/{sifive_fu540.c => sifive/fu540.c} | 0
>  platform/generic/{sifive_fu740.c => sifive/fu740.c} | 0
>  platform/generic/sifive/objects.mk                  | 9 +++++++++
>  4 files changed, 9 insertions(+), 6 deletions(-)
>  rename platform/generic/{sifive_fu540.c => sifive/fu540.c} (100%)
>  rename platform/generic/{sifive_fu740.c => sifive/fu740.c} (100%)
>  create mode 100644 platform/generic/sifive/objects.mk
>
> diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
> index 6f63e69..4907754 100644
> --- a/platform/generic/objects.mk
> +++ b/platform/generic/objects.mk
> @@ -9,9 +9,3 @@
>
>  platform-objs-y += platform.o
>  platform-objs-y += platform_override_modules.o
> -
> -carray-platform_override_modules-y += sifive_fu540
> -platform-objs-y += sifive_fu540.o
> -
> -carray-platform_override_modules-y += sifive_fu740
> -platform-objs-y += sifive_fu740.o
> diff --git a/platform/generic/sifive_fu540.c b/platform/generic/sifive/fu540.c
> similarity index 100%
> rename from platform/generic/sifive_fu540.c
> rename to platform/generic/sifive/fu540.c
> diff --git a/platform/generic/sifive_fu740.c b/platform/generic/sifive/fu740.c
> similarity index 100%
> rename from platform/generic/sifive_fu740.c
> rename to platform/generic/sifive/fu740.c
> diff --git a/platform/generic/sifive/objects.mk b/platform/generic/sifive/objects.mk
> new file mode 100644
> index 0000000..c17e2df
> --- /dev/null
> +++ b/platform/generic/sifive/objects.mk
> @@ -0,0 +1,9 @@
> +#
> +# SPDX-License-Identifier: BSD-2-Clause
> +#
> +
> +carray-platform_override_modules-y += sifive_fu540
> +platform-objs-y += sifive/fu540.o
> +
> +carray-platform_override_modules-y += sifive_fu740
> +platform-objs-y += sifive/fu740.o
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

