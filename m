From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Aug 2024 17:25:18 +0530
Subject: [PATCH 1/4] platform: generic: Kconfig: add the description for
 Andes PMA feature
In-Reply-To: <20240723075728.587110-2-ben717@andestech.com>
References: <20240723075728.587110-1-ben717@andestech.com> <20240723075728.587110-2-ben717@andestech.com>
Message-ID: <CAAhSdy2mRUEk6_xu9ejz7gTgWb2zJj-LGeO0YHw-1h_V6yH4vA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 23, 2024 at 1:27?PM Ben Zong-You Xie <ben717@andestech.com> wrote:
>
> Describe Andes PPMA in the config option, and select it for AE350
> platform.
>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup


> ---
>  platform/generic/Kconfig       | 1 +
>  platform/generic/andes/Kconfig | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 6642a6e..688da3f 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -33,6 +33,7 @@ config PLATFORM_ANDES_AE350
>         bool "Andes AE350 support"
>         select SYS_ATCSMU
>         select ANDES_PMU
> +       select ANDES_PMA
>         default n
>
>  config PLATFORM_RENESAS_RZFIVE
> diff --git a/platform/generic/andes/Kconfig b/platform/generic/andes/Kconfig
> index 138710b..6edd67d 100644
> --- a/platform/generic/andes/Kconfig
> +++ b/platform/generic/andes/Kconfig
> @@ -3,6 +3,11 @@
>  config ANDES_PMA
>         bool "Andes PMA support"
>         default n
> +       help
> +         Programmable PMA(PPMA) is a feature for Andes. PPMA allows
> +         dynamic adjustment of memory attributes in the runtime.
> +         It contains a configurable amount of PMA entries implemented
> +         as CSRs to control the attributes of memory locations in interest.
>
>  config ANDES_SBI
>         bool "Andes SBI support"
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

