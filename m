From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Feb 2023 10:19:38 +0530
Subject: [RFC PATCH] Kconfig: Add an option for debugging OpenSBI
In-Reply-To: <20230223145238.1750383-1-bmeng@tinylab.org>
References: <20230223145238.1750383-1-bmeng@tinylab.org>
Message-ID: <CAAhSdy2pDpYtYgydyaWyxeQDQD+VgmDM1nfwD23xAKOBBWvEKw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 23, 2023 at 8:23 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> Add a new Kconfig option CONFIG_OPENSBI_DEBUG to prevent compiler
> optimizations using -O2.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>  Kconfig  | 7 +++++++
>  Makefile | 7 ++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/Kconfig b/Kconfig
> index acfc138..123ea66 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -23,3 +23,10 @@ source "$(OPENSBI_SRC_DIR)/lib/sbi/Kconfig"
>  source "$(OPENSBI_SRC_DIR)/lib/utils/Kconfig"
>
>  source "$(OPENSBI_SRC_DIR)/firmware/Kconfig"
> +
> +menu "General Setup"
> +
> +config OPENSBI_DEBUG
> +       bool "Disable compiler optimizations for debugging"
> +
> +endmenu\

Rather than adding a Kconfig option, I would suggest having a
simple make command-line option. For example, "make DEBUG=1"

Regards,
Anup

> diff --git a/Makefile b/Makefile
> index b20404f..b4ed548 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -331,7 +331,12 @@ GENFLAGS   +=      $(libsbiutils-genflags-y)
>  GENFLAGS       +=      $(platform-genflags-y)
>  GENFLAGS       +=      $(firmware-genflags-y)
>
> -CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
> +CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing
> +ifeq ($(CONFIG_OPENSBI_DEBUG),y)
> +CFLAGS         +=      -O0
> +else
> +CFLAGS         +=      -O2
> +endif
>  CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
>  # enable -m(no-)save-restore option by CC_SUPPORT_SAVE_RESTORE
>  ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
> --
> 2.25.1
>

