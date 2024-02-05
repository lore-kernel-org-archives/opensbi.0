From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Feb 2024 13:13:07 +0530
Subject: [PATCH] Makefile: Remove unused code and data
In-Reply-To: <20231219033217.181779-1-wxjstz@126.com>
References: <20231219033217.181779-1-wxjstz@126.com>
Message-ID: <CAAhSdy3bHdex+uQgvU83Etis2Y-9kpE3Lz0bNkzK23OORsy0oA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 19, 2023 at 9:02?AM Xiang W <wxjstz@126.com> wrote:
>
> Add compiler options to create separate sections for functions and
> static variables. And add options to the linker to remove unused
> sections.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

This patch breaks OpenSBI with LLVM.

Regards,
Anup

> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index de4e73a..fbb64f2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -331,7 +331,7 @@ GENFLAGS    +=      $(libsbiutils-genflags-y)
>  GENFLAGS       +=      $(platform-genflags-y)
>  GENFLAGS       +=      $(firmware-genflags-y)
>
> -CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing
> +CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
>  ifneq ($(DEBUG),)
>  CFLAGS         +=      -O0
>  else
> @@ -377,6 +377,7 @@ ARFLAGS             =       rcs
>  ELFFLAGS       +=      $(USE_LD_FLAG)
>  ELFFLAGS       +=      -Wl,--exclude-libs,ALL
>  ELFFLAGS       +=      -Wl,--build-id=none
> +ELFFLAGS       +=      -Wl,--gc-sections
>  ELFFLAGS       +=      $(platform-ldflags-y)
>  ELFFLAGS       +=      $(firmware-ldflags-y)
>
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

