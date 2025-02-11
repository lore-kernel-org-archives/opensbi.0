From: Anup Patel <anup@brainfault.org>
Date: Tue, 11 Feb 2025 16:16:03 +0530
Subject: [RFC 2/7] opensbi: add build config for building big-endian
In-Reply-To: <20241220160206.1989527-3-ben.dooks@codethink.co.uk>
References: <20241220160206.1989527-1-ben.dooks@codethink.co.uk> <20241220160206.1989527-3-ben.dooks@codethink.co.uk>
Message-ID: <CAAhSdy0_ykZ3a3Ku9SY3cE6Q4UZV0Ue_UJxMidXKUwYEqH9Vdw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 20, 2024 at 10:40?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Add a build option for big-endian OpenSBI build.
>
> Reviewed-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Reviewed-by: Roan Richmod <roan.richmond@codethink.co.uk>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  Kconfig  |  5 +++++
>  Makefile | 18 ++++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/Kconfig b/Kconfig
> index acfc138..cc7b5bc 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -2,6 +2,11 @@
>
>  mainmenu "OpenSBI $(OPENSBI_PLATFORM) Configuration"
>
> +config OPENSBI_BE
> +       bool "Build OpenSBI big-endian"
> +       help
> +         Say Y here if you like fun challenges
> +

Instead of this kconfig option, I would suggest using the toplevel make
parameter "PLATFORM_RISCV_BE=1" to be consistent with other
PLATFORM_RISCV_xyz make parameters.

>  config OPENSBI_SRC_DIR
>         string
>         option env="OPENSBI_SRC_DIR"
> diff --git a/Makefile b/Makefile
> index d9cee49..3b6d981 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -357,6 +357,9 @@ GENFLAGS    +=      $(firmware-genflags-y)
>
>  CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
>  CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> +ifeq ($(CONFIG_OPENSBI_BE),y)
> +CFLAGS         +=      -mbig-endian
> +endif
>  # Optionally supported flags
>  ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
>  CFLAGS         +=      -mno-save-restore
> @@ -397,6 +400,9 @@ endif
>  ASFLAGS                +=      $(GENFLAGS)
>  ASFLAGS                +=      $(platform-asflags-y)
>  ASFLAGS                +=      $(firmware-asflags-y)
> +ifeq ($(CONFIG_OPENSBI_BE),y)
> +ASFLAGS                +=      -mbig-endian
> +endif
>
>  ARFLAGS                =       rcs
>
> @@ -410,13 +416,21 @@ ELFFLAGS  +=      -Wl,--no-dynamic-linker -Wl,-pie
>  ELFFLAGS       +=      $(platform-ldflags-y)
>  ELFFLAGS       +=      $(firmware-ldflags-y)
>
> +ifeq ($(CONFIG_OPENSBI_BE),y)
> +FULL_ENDIAN=big
> +SMALL_ENDIAN=b
> +else
> +FULL_ENDIAN=little
> +SMALL_ENDIAN=l
> +endif
> +
>  MERGEFLAGS     +=      -r
>  ifeq ($(LD_IS_LLD),y)
>  MERGEFLAGS     +=      -b elf
>  else
> -MERGEFLAGS     +=      -b elf$(PLATFORM_RISCV_XLEN)-littleriscv
> +MERGEFLAGS     +=      -b elf$(PLATFORM_RISCV_XLEN)-$(FULL_ENDIAN)riscv
>  endif
> -MERGEFLAGS     +=      -m elf$(PLATFORM_RISCV_XLEN)lriscv
> +MERGEFLAGS     +=      -m elf$(PLATFORM_RISCV_XLEN)$(SMALL_ENDIAN)riscv
>
>  DTSCPPFLAGS    =       $(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
>
> --
> 2.37.2.352.g3c44437643
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

