From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 10 Dec 2024 18:11:47 -0600
Subject: [PATCH v2 2/2] Makefile: Don't enable V-extension using -march
 option
In-Reply-To: <20241210052326.407237-3-apatel@ventanamicro.com>
References: <20241210052326.407237-1-apatel@ventanamicro.com>
 <20241210052326.407237-3-apatel@ventanamicro.com>
Message-ID: <bb66a790-cc05-437f-9561-e8f64de5da59@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-12-09 11:23 PM, Anup Patel wrote:
> Enabling V-extension using -march option causes OpenSBI boot-time
> hang with LLVM compiler.
> 
> As a work-around, don't enable V-extension using -march option and
> instead use a custom OpenSBI specific define inform availability of
> V-extension to lib/sbi/sbi_trap_v_ldst.c.
> 
> Fixes: c2acc5e5b0d8 ("lib: sbi_misaligned_ldst: Add handling of vector load/store")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  Makefile                  | 8 ++++----
>  lib/sbi/sbi_trap_v_ldst.c | 5 +++--
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5ac95a0f..1b949a9f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -190,7 +190,7 @@ CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib
>  CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep -e "zicsr" -e "zifencei" > /dev/null && echo n || echo y)
>  
>  # Check whether the assembler and the compiler support the Vector extension
> -CC_SUPPORT_VECT := $(shell echo | $(CC) -dM -E -march=rv$(OPENSBI_CC_XLEN)gv - | grep -q riscv.*vector && echo y || echo n)
> +CC_SUPPORT_VECT := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)gv -dM -E -x c /dev/null 2>&1 | grep -q riscv.*vector && echo y || echo n)
>  
>  ifneq ($(OPENSBI_LD_PIE),y)
>  $(error Your linker does not support creating PIEs, opensbi requires this.)
> @@ -298,9 +298,6 @@ endif
>  ifndef PLATFORM_RISCV_ISA
>    ifneq ($(PLATFORM_RISCV_TOOLCHAIN_DEFAULT), 1)
>      PLATFORM_RISCV_ISA := rv$(PLATFORM_RISCV_XLEN)imafdc
> -    ifeq ($(CC_SUPPORT_VECT), y)
> -      PLATFORM_RISCV_ISA := $(PLATFORM_RISCV_ISA)v
> -    endif
>      ifeq ($(CC_SUPPORT_ZICSR_ZIFENCEI), y)
>        PLATFORM_RISCV_ISA := $(PLATFORM_RISCV_ISA)_zicsr_zifencei
>      endif
> @@ -363,6 +360,9 @@ GENFLAGS	+=	$(firmware-genflags-y)
>  CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
>  CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
>  # Optionally supported flags
> +ifeq ($(CC_SUPPORT_VECT),y)
> +CFLAGS		+=	-DOPENSBI_CC_SUPPORT_VECT

nit: Since you're changing this, could you please spell out "VECTOR"? The
abbreviation isn't great for greppability.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> +endif
>  ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
>  CFLAGS		+=	-mno-save-restore
>  endif
> diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
> index 9929215c..75b79baa 100644
> --- a/lib/sbi/sbi_trap_v_ldst.c
> +++ b/lib/sbi/sbi_trap_v_ldst.c
> @@ -17,7 +17,8 @@
>  #include <sbi/sbi_unpriv.h>
>  #include <sbi/sbi_trap.h>
>  
> -#ifdef __riscv_vector
> +#ifdef OPENSBI_CC_SUPPORT_VECT
> +
>  #define VLEN_MAX 65536
>  
>  static inline void set_vreg(ulong vlenb, ulong which,
> @@ -340,4 +341,4 @@ int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
>  {
>  	return 0;
>  }
> -#endif /* __riscv_vector  */
> +#endif /* OPENSBI_CC_SUPPORT_VECT  */


