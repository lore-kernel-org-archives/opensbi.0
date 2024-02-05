From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Feb 2024 16:43:28 +0530
Subject: [PATCH 1/2] check for --exclude-libs
In-Reply-To: <20240126152145.60488-1-leon@georgemail.eu>
References: <20240126152145.60488-1-leon@georgemail.eu>
Message-ID: <CAAhSdy3BVHxyHAcGf-sznmmNGhyyWzdwFqgs0x6do14x64s+_Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 26, 2024 at 8:52?PM Leon M. Busch-George <leon@georgemail.eu> wrote:
>
> While writing to the dynsym is futile, the --exclude-libs options is not recognized by all linkers (e.g. riscv64-elf-ld.bfd)

The patch subject needs "Makefile: " prefix. Also, there is no Signed-off-by
in the commit description.

I have taken care of the above at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index de4e73a..630e35f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -167,6 +167,9 @@ endif
>  # Check whether the linker supports creating PIEs
>  OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
>
> +# Check whether the linker supports --exclude-libs
> +OPENSBI_LD_EXCLUDE_LIBS := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) "-Wl,--exclude-libs,ALL" -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
> +
>  # Check whether the compiler supports -m(no-)save-restore
>  CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep -e "-save-restore" >/dev/null && echo n || echo y)
>
> @@ -375,7 +378,9 @@ ASFLAGS             +=      $(firmware-asflags-y)
>  ARFLAGS                =       rcs
>
>  ELFFLAGS       +=      $(USE_LD_FLAG)
> +ifeq ($(OPENSBI_LD_EXCLUDE_LIBS),y)
>  ELFFLAGS       +=      -Wl,--exclude-libs,ALL
> +endif
>  ELFFLAGS       +=      -Wl,--build-id=none
>  ELFFLAGS       +=      $(platform-ldflags-y)
>  ELFFLAGS       +=      $(firmware-ldflags-y)
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

