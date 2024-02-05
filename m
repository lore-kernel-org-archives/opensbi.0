From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Feb 2024 16:10:01 +0530
Subject: [PATCH v2] Makefile: don't pass -mstrict-align if not supported
In-Reply-To: <20240118180231.30300-1-kalle.wachsmuth@gmail.com>
References: <20240118180231.30300-1-kalle.wachsmuth@gmail.com>
Message-ID: <CAAhSdy2w7dKvOESrVaDLFoL+x0acpCC-jjMpNjJ3CcY_cU7zLg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 18, 2024 at 11:32?PM Kalle Wachsmuth
<kalle.wachsmuth@gmail.com> wrote:
>
> Support for that option will be added in LLVM 18:
> https://github.com/llvm/llvm-project/commit/23ce5368409c760f3dd49d0f17f34772b0b869d8
>
> Clang 17.0.6, however, will error when passed the
> `-mstrict-align` flag.
> We should only use the flag if it is supported.
>
> Signed-off-by: Kalle Wachsmuth <kalle.wachsmuth@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> (I'm using Homebrew Clang on macOS.)
>
>  Makefile | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index de4e73a..66048c3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -170,6 +170,9 @@ OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fP
>  # Check whether the compiler supports -m(no-)save-restore
>  CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep -e "-save-restore" >/dev/null && echo n || echo y)
>
> +# Check whether the compiler supports -m(no-)strict-align
> +CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mstrict-align -x c /dev/null -o /dev/null 2>&1 | grep -e "-mstrict-align\|-mno-unaligned-access" >/dev/null && echo n || echo y)
> +
>  # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
>  CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
>
> @@ -337,11 +340,14 @@ CFLAGS            +=      -O0
>  else
>  CFLAGS         +=      -O2
>  endif
> -CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
> -# enable -m(no-)save-restore option by CC_SUPPORT_SAVE_RESTORE
> +CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> +# Optionally supported flags
>  ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
>  CFLAGS         +=      -mno-save-restore
>  endif
> +ifeq ($(CC_SUPPORT_STRICT_ALIGN),y)
> +CFLAGS         +=      -mstrict-align
> +endif
>  CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>  CFLAGS         +=      $(RELAX_FLAG)
> @@ -355,11 +361,14 @@ CPPFLAGS  +=      $(platform-cppflags-y)
>  CPPFLAGS       +=      $(firmware-cppflags-y)
>
>  ASFLAGS                =       -g -Wall -nostdlib
> -ASFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
> -# enable -m(no-)save-restore option by CC_SUPPORT_SAVE_RESTORE
> +ASFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> +# Optionally supported flags
>  ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
>  ASFLAGS                +=      -mno-save-restore
>  endif
> +ifeq ($(CC_SUPPORT_STRICT_ALIGN),y)
> +ASFLAGS                +=      -mstrict-align
> +endif
>  ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>  ASFLAGS                +=      $(RELAX_FLAG)
> --
> 2.39.3 (Apple Git-145)
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

