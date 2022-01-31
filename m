From: Alexandre Ghiti <alex@ghiti.fr>
Date: Mon, 31 Jan 2022 08:43:51 +0100
Subject: [PATCH] Makefile: fix build with binutils 2.38
In-Reply-To: <20220128173346.1863727-1-aurelien@aurel32.net>
References: <20220128173346.1863727-1-aurelien@aurel32.net>
Message-ID: <caf7fe65-732e-f9cd-1e97-d681fe649311@ghiti.fr>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Aur?lien,

On 1/28/22 18:33, Aurelien Jarno wrote:
>  From version 2.38, binutils default to ISA spec version 20191213. This
> means that the csr read/write (csrr*/csrw*) instructions and fence.i
> instruction has separated from the `I` extension, become two standalone
> extensions: Zicsr and Zifencei. As the kernel uses those instruction,
> this causes the following build failure:
>
>   CC        lib/sbi/sbi_tlb.o
> <<BUILDDIR>>/lib/sbi/sbi_tlb.c: Assembler messages:
> <<BUILDDIR>>/lib/sbi/sbi_tlb.c:190: Error: unrecognized opcode `fence.i'
> make: *** [Makefile:431: <<BUILDDIR>>/build/lib/sbi/sbi_tlb.o] Error 1
>
> The fix is to specify those extensions explicitly in -march. However as
> older binutils version do not support this, we first need to detect
> that.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>   Makefile | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> Changes v1 -> v2 following the review from Bin Men (thanks)!
> - Fix typos
> - Use grep to detect missing extensions for consistency with CC_SUPPORT_SAVE_RESTORE
>
> diff --git a/Makefile b/Makefile
> index 062883e..717dffd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -153,6 +153,9 @@ OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fP
>   # Check whether the compiler supports -m(no-)save-restore
>   CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep "\-save\-restore" >/dev/null && echo n || echo y)
>   
> +# Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
> +CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(PLATFORM_RISCV_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
> +
>   # Build Info:
>   # OPENSBI_BUILD_TIME_STAMP -- the compilation time stamp
>   # OPENSBI_BUILD_COMPILER_VERSION -- the compiler version info
> @@ -223,7 +226,11 @@ ifndef PLATFORM_RISCV_ABI
>   endif
>   ifndef PLATFORM_RISCV_ISA
>     ifneq ($(PLATFORM_RISCV_TOOLCHAIN_DEFAULT), 1)
> -    PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc
> +    ifeq ($(CC_SUPPORT_ZICSR_ZIFENCEI), y)
> +      PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc_zicsr_zifencei
> +    else
> +      PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc
> +    endif
>     else
>       PLATFORM_RISCV_ISA = $(OPENSBI_CC_ISA)
>     endif


You can add:

Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

Thanks again for taking care of that,

Alex


