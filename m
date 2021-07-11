From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 20:40:41 +0530
Subject: [PATCH v5 5/6] Makefile: Support building with Clang and LLVM
 binutils
In-Reply-To: <20210711022824.29915-6-jrtc27@jrtc27.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
 <20210711022824.29915-6-jrtc27@jrtc27.com>
Message-ID: <CAAhSdy0qMOD2OAOMkaQNFLO8e+1r4jayZzodnRU16yK1On+4zA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 7:58 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> This is intended to mirror the Linux kernel. Building with CC=clang will
> use Clang as the compiler but default to using the existing binutils.
> Building with LLVM=1 will default to using Clang and LLVM binutils.
>
> Whilst GCC will accept the -N linker option and forward it on to the
> linker, Clang will not, and so in order to support both compilers we
> must use -Wl, to forward it to the linker as is required for most other
> linker options.
>
> Note that there is currently a bug when using Clang as the compiler and
> riscv64-linux-gnu-ld as the linker for FW_PIC=y. At first glance this
> appears to be a bug in GNU binutils, but this could also be Clang or
> OpenSBI at fault in some subtle way. Thus, for now, advise that this
> combination be avoided.
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

I tried this patch using GCC linux toolchain and U-Boot SPL which
worked fine for me. I don't have bare-metal GCC toolchain and LLVM
but I assume LLVM is tested by Jessica.

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Tested-by: Anup Patel <anup.patel@wdc.com>

If there are other compile issues then please send fix as a separate
patch. I insist more people to play around with LLVM and GCC
bare-metal so that we catch issues early.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>  Makefile  | 66 +++++++++++++++++++++++++++++++++++++++++++++++++------
>  README.md | 48 ++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 105 insertions(+), 9 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ba06313..5c188d5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -76,26 +76,54 @@ OPENSBI_VERSION_MINOR=`grep "define OPENSBI_VERSION_MINOR" $(include_dir)/sbi/sb
>  OPENSBI_VERSION_GIT=$(shell if [ -d $(src_dir)/.git ]; then git describe 2> /dev/null; fi)
>
>  # Setup compilation commands
> +ifneq ($(LLVM),)
> +CC             =       clang
> +AR             =       llvm-ar
> +LD             =       ld.lld
> +OBJCOPY                =       llvm-objcopy
> +else
>  ifdef CROSS_COMPILE
>  CC             =       $(CROSS_COMPILE)gcc
> -CPP            =       $(CROSS_COMPILE)cpp
>  AR             =       $(CROSS_COMPILE)ar
>  LD             =       $(CROSS_COMPILE)ld
>  OBJCOPY                =       $(CROSS_COMPILE)objcopy
>  else
>  CC             ?=      gcc
> -CPP            ?=      cpp
>  AR             ?=      ar
>  LD             ?=      ld
>  OBJCOPY                ?=      objcopy
>  endif
> +endif
> +CPP            =       $(CC) -E
>  AS             =       $(CC)
>  DTC            =       dtc
>
> -# Guess the compillers xlen
> -OPENSBI_CC_XLEN := $(shell TMP=`$(CC) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
> +ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> +CC_IS_CLANG    =       y
> +else
> +CC_IS_CLANG    =       n
> +endif
> +
> +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
> +LD_IS_LLD      =       y
> +else
> +LD_IS_LLD      =       n
> +endif
> +
> +ifeq ($(CC_IS_CLANG),y)
> +ifneq ($(CROSS_COMPILE),)
> +CLANG_TARGET   =       --target=$(notdir $(CROSS_COMPILE:%-=%))
> +endif
> +endif
> +
> +# Guess the compiler's XLEN
> +OPENSBI_CC_XLEN := $(shell TMP=`$(CC) $(CLANG_TARGET) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
> +
> +# Guess the compiler's ABI and ISA
> +ifneq ($(CC_IS_CLANG),y)
>  OPENSBI_CC_ABI := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-abi=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
>  OPENSBI_CC_ISA := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-arch=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
> +endif
>
>  # Setup platform XLEN
>  ifndef PLATFORM_RISCV_XLEN
> @@ -106,8 +134,21 @@ ifndef PLATFORM_RISCV_XLEN
>    endif
>  endif
>
> +ifeq ($(CC_IS_CLANG),y)
> +ifeq ($(CROSS_COMPILE),)
> +CLANG_TARGET   =       --target=riscv$(PLATFORM_RISCV_XLEN)-unknown-elf
> +endif
> +endif
> +
> +ifeq ($(LD_IS_LLD),y)
> +RELAX_FLAG     =       -mno-relax
> +USE_LD_FLAG    =       -fuse-ld=lld
> +else
> +USE_LD_FLAG    =       -fuse-ld=bfd
> +endif
> +
>  # Check whether the linker supports creating PIEs
> -OPENSBI_LD_PIE := $(shell $(CC) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
> +OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
>
>  # Setup list of objects.mk files
>  ifdef PLATFORM
> @@ -197,7 +238,11 @@ else
>  endif
>
>  # Setup compilation commands flags
> -GENFLAGS       =       -I$(platform_src_dir)/include
> +ifeq ($(CC_IS_CLANG),y)
> +GENFLAGS       +=      $(CLANG_TARGET)
> +GENFLAGS       +=      -Wno-unused-command-line-argument
> +endif
> +GENFLAGS       +=      -I$(platform_src_dir)/include
>  GENFLAGS       +=      -I$(include_dir)
>  ifneq ($(OPENSBI_VERSION_GIT),)
>  GENFLAGS       +=      -DOPENSBI_VERSION_GIT="\"$(OPENSBI_VERSION_GIT)\""
> @@ -211,6 +256,7 @@ CFLAGS              +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  CFLAGS         +=      -mno-save-restore -mstrict-align
>  CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> +CFLAGS         +=      $(RELAX_FLAG)
>  CFLAGS         +=      $(GENFLAGS)
>  CFLAGS         +=      $(platform-cflags-y)
>  CFLAGS         +=      -fno-pie -no-pie
> @@ -225,18 +271,24 @@ ASFLAGS           +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  ASFLAGS                +=      -mno-save-restore -mstrict-align
>  ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> +ASFLAGS                +=      $(RELAX_FLAG)
>  ASFLAGS                +=      $(GENFLAGS)
>  ASFLAGS                +=      $(platform-asflags-y)
>  ASFLAGS                +=      $(firmware-asflags-y)
>
>  ARFLAGS                =       rcs
>
> -ELFFLAGS       +=      -Wl,--build-id=none -N -static-libgcc -lgcc
> +ELFFLAGS       +=      $(USE_LD_FLAG)
> +ELFFLAGS       +=      -Wl,--build-id=none -Wl,-N -static-libgcc -lgcc
>  ELFFLAGS       +=      $(platform-ldflags-y)
>  ELFFLAGS       +=      $(firmware-ldflags-y)
>
>  MERGEFLAGS     +=      -r
> +ifeq ($(LD_IS_LLD),y)
> +MERGEFLAGS     +=      -b elf
> +else
>  MERGEFLAGS     +=      -b elf$(PLATFORM_RISCV_XLEN)-littleriscv
> +endif
>  MERGEFLAGS     +=      -m elf$(PLATFORM_RISCV_XLEN)lriscv
>
>  DTSCPPFLAGS    =       $(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
> diff --git a/README.md b/README.md
> index 03c02fb..b296f00 100644
> --- a/README.md
> +++ b/README.md
> @@ -96,8 +96,13 @@ Required Toolchain
>  ------------------
>
>  OpenSBI can be compiled natively or cross-compiled on a x86 host. For
> -cross-compilation, you can build your own toolchain or just download
> -a prebuilt one from the [Bootlin toolchain repository].
> +cross-compilation, you can build your own toolchain, download a prebuilt one
> +from the [Bootlin toolchain repository] or install a distribution-provided
> +toolchain; if you opt to use LLVM/Clang, most distribution toolchains will
> +support cross-compiling for RISC-V using the same toolchain as your native
> +LLVM/Clang toolchain due to LLVM's ability to support multiple backends in the
> +same binary, so is often an easy way to obtain a working cross-compilation
> +toolchain.
>
>  Please note that only a 64-bit version of the toolchain is available in
>  the Bootlin toolchain repository for now.
> @@ -202,6 +207,45 @@ export PLATFORM_RISCV_XLEN=32
>
>  will generate 32-bit OpenSBI images. And vice vesa.
>
> +Building with Clang/LLVM
> +------------------------
> +
> +OpenSBI can also be built with Clang/LLVM. To build with just Clang but keep
> +the default binutils (which will still use the *CROSS_COMPILE* prefix if
> +defined), override the *CC* make variable with:
> +```
> +make CC=clang
> +```
> +
> +To build with a full LLVM-based toolchain, not just Clang, enable the *LLVM*
> +option with:
> +```
> +make LLVM=1
> +```
> +
> +When using Clang, *CROSS_COMPILE* often does not need to be defined unless
> +using GNU binutils with prefixed binary names. *PLATFORM_RISCV_XLEN* will be
> +used to infer a default triple to pass to Clang, so if *PLATFORM_RISCV_XLEN*
> +itself defaults to an undesired value then prefer setting that rather than the
> +full triple via *CROSS_COMPILE*. If *CROSS_COMPILE* is nonetheless defined,
> +rather than being used as a prefix for the executable name, it will instead be
> +passed via the `--target` option with the trailing `-` removed, so must be a
> +valid triple.
> +
> +These can also be mixed; for example using a GCC cross-compiler but LLVM
> +binutils would be:
> +```
> +make CC=riscv64-unknown-elf-gcc LLVM=1
> +```
> +
> +These variables must be passed for all the make invocations described in this
> +document.
> +
> +NOTE: Using Clang with a `riscv*-linux-gnu` GNU binutils linker has been seen
> +to produce broken binaries with missing relocations; it is therefore currently
> +recommended that this combination be avoided or *FW_PIC=n* be used to disable
> +building OpenSBI as a position-independent binary.
> +
>  Contributing to OpenSBI
>  -----------------------
>
> --
> 2.31.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

