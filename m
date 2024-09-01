From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 1 Sep 2024 19:12:00 +0800
Subject: [PATCH v2 1/1] Makefile: enable --gc-sections
In-Reply-To: <004ed61b6c6743ab87a369bc6202b4b1c50de89d.1724959010.git.zhangcola2003@gmail.com>
References: <cover.1724959010.git.zhangcola2003@gmail.com> <004ed61b6c6743ab87a369bc6202b4b1c50de89d.1724959010.git.zhangcola2003@gmail.com>
Message-ID: <CAEUhbmWzoCX5QkdNW_eYO2HB1Ok61H4pRdS4-r=JEMbVk_A18w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 4:12?AM Kele Zhang <zhangcola2003@gmail.com> wrote:
>
> The --gc-sections option enables the linker to perform garbage
> collection of unreferenced code and data, thereby reducing the binary
> size.
>
> The -ffunction-sections option will place each function into a separate
> section, so it is necessary to add .text.* to the linker script.
>
> Signed-off-by: Kele Zhang <zhangcola2003@gmail.com>
> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  Makefile             | 5 +++--
>  firmware/fw_base.ldS | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e5a0f19..44db5d4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -355,9 +355,9 @@ GENFLAGS    +=      $(libsbiutils-genflags-y)
>  GENFLAGS       +=      $(platform-genflags-y)
>  GENFLAGS       +=      $(firmware-genflags-y)
>
> -CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing
> +CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
>  ifneq ($(DEBUG),)
> -CFLAGS         +=      -O0
> +CFLAGS         +=      -O0 -Wl,--print-gc-sections

This should be put into the ELF flags too.

>  else
>  CFLAGS         +=      -O2
>  endif
> @@ -406,6 +406,7 @@ ASFLAGS             +=      $(firmware-asflags-y)
>  ARFLAGS                =       rcs
>
>  ELFFLAGS       +=      $(USE_LD_FLAG)
> +ELFFLAGS       +=      -Wl,--gc-sections
>  ifeq ($(OPENSBI_LD_EXCLUDE_LIBS),y)
>  ELFFLAGS       +=      -Wl,--exclude-libs,ALL
>  endif
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index fb47984..a33746a 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -20,6 +20,7 @@
>                 PROVIDE(_text_start = .);
>                 *(.entry)
>                 *(.text)
> +               *(.text.*)
>                 . = ALIGN(8);
>                 PROVIDE(_text_end = .);
>         }

Regards,
Bin

