From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Nov 2024 16:36:27 +0530
Subject: [PATCH v4 1/1] Makefile: enable --gc-sections
In-Reply-To: <09f89be252e5ea08820909ad6a1bb93866b438c8.1727823614.git.zhangcola2003@gmail.com>
References: <cover.1727823614.git.zhangcola2003@gmail.com> <09f89be252e5ea08820909ad6a1bb93866b438c8.1727823614.git.zhangcola2003@gmail.com>
Message-ID: <CAAhSdy1B+UV27R6+B_3um7pO857uGRhKvF-AypQR_hwTfWUdxA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 2, 2024 at 6:16?AM Kele Zhang <zhangcola2003@gmail.com> wrote:
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
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  Makefile             | 15 +++++++++------
>  firmware/fw_base.ldS |  1 +
>  2 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f0012f6..dae282c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -355,12 +355,7 @@ GENFLAGS   +=      $(libsbiutils-genflags-y)
>  GENFLAGS       +=      $(platform-genflags-y)
>  GENFLAGS       +=      $(firmware-genflags-y)
>
> -CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing
> -ifneq ($(DEBUG),)
> -CFLAGS         +=      -O0
> -else
> -CFLAGS         +=      -O2
> -endif
> +CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
>  CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  # Optionally supported flags
>  ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
> @@ -406,6 +401,7 @@ ASFLAGS             +=      $(firmware-asflags-y)
>  ARFLAGS                =       rcs
>
>  ELFFLAGS       +=      $(USE_LD_FLAG)
> +ELFFLAGS       +=      -Wl,--gc-sections
>  ifeq ($(OPENSBI_LD_EXCLUDE_LIBS),y)
>  ELFFLAGS       +=      -Wl,--exclude-libs,ALL
>  endif
> @@ -424,6 +420,13 @@ MERGEFLAGS +=      -m elf$(PLATFORM_RISCV_XLEN)lriscv
>
>  DTSCPPFLAGS    =       $(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
>
> +ifneq ($(DEBUG),)
> +CFLAGS         +=      -O0
> +ELFFLAGS       +=      -Wl,--print-gc-sections
> +else
> +CFLAGS         +=      -O2
> +endif
> +
>  # Setup functions for compilation
>  define dynamic_flags
>  -I$(shell dirname $(2)) -D__OBJNAME__=$(subst -,_,$(shell basename $(1) .o))
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
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

