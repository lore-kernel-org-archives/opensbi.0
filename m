From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 28 Aug 2024 22:50:28 +0800
Subject: [PATCH 2/2] Makefile: Remove -g from default CFLAGS
In-Reply-To: <tencent_07F41222A743779181827FB2F0EAE7BECE08@qq.com>
References: <cover.1724487146.git.1952088712@qq.com> <tencent_07F41222A743779181827FB2F0EAE7BECE08@qq.com>
Message-ID: <CAEUhbmVB=qBxgYxTA9c4fZEXVTVNarJqqMjnHm_QFF_MGts3jA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 24, 2024 at 4:22?PM Kele Zhang <1952088712@qq.com> wrote:
>
> Remove `-g` from default CFLAGS as it should not be used in production
> builds. Adjust optimization level to `-Og` when DEBUG is enabled.

The production build does not use ELF images to program onto the board
but the plain binary image instead. So `-g`should be fine. As for
`-Og` vs. `-O0` I prefer using `-O0` as `-Og` sometimes breaks
debugging.

>
> Signed-off-by: Kele Zhang <1952088712@qq.com>
> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9abea9f..bcec588 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -346,9 +346,9 @@ GENFLAGS    +=      $(libsbiutils-genflags-y)
>  GENFLAGS       +=      $(platform-genflags-y)
>  GENFLAGS       +=      $(firmware-genflags-y)
>
> -CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections -Wl,--gc-sections
> +CFLAGS         =       -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections -Wl,--gc-sections
>  ifneq ($(DEBUG),)
> -CFLAGS         +=      -O0 -Wl,--print-gc-sections
> +CFLAGS         +=      -Og -Wl,--print-gc-sections
>  else
>  CFLAGS         +=      -O2
>  endif

Regards,
Bin

