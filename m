From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 9 Jul 2021 09:50:41 +0800
Subject: [PATCH v2 1/2] Makefile: Support building with Clang and LLVM
 binutils
In-Reply-To: <20210708175108.82365-2-jrtc27@jrtc27.com>
References: <20210708175108.82365-1-jrtc27@jrtc27.com>
 <20210708175108.82365-2-jrtc27@jrtc27.com>
Message-ID: <CAEUhbmXL1bGWF3i6XJ61W1t+L53TJEAz2W_esC2nHmYaiqGfHw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 9, 2021 at 1:51 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
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
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>  Makefile  | 57 +++++++++++++++++++++++++++++++++++++++++++++++++------
>  README.md | 39 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 88 insertions(+), 8 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 6b64205..3fe8153 100644
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
> +CLANG_TARGET   =       -target $(notdir $(CROSS_COMPILE:%-=%))

It's odd that when we use full LLVM toolchains we still need to
specify CROSS_COMPILE in order to only guess the "--target" value.
This can be written directly to --target=riscv64 / riscv32 depending
OPENSBI_CC_XLEN

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
> @@ -194,7 +222,11 @@ else
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
> @@ -208,6 +240,9 @@ CFLAGS              +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  CFLAGS         +=      -mno-save-restore -mstrict-align
>  CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> +ifeq ($(LD_IS_LLD),y)
> +CFLAGS         +=      -mno-relax
> +endif
>  CFLAGS         +=      $(GENFLAGS)
>  CFLAGS         +=      $(platform-cflags-y)
>  CFLAGS         +=      -fno-pie -no-pie
> @@ -222,18 +257,28 @@ ASFLAGS           +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  ASFLAGS                +=      -mno-save-restore -mstrict-align
>  ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> +ifeq ($(LD_IS_LLD),y)
> +ASFLAGS                +=      -mno-relax
> +endif
>  ASFLAGS                +=      $(GENFLAGS)
>  ASFLAGS                +=      $(platform-asflags-y)
>  ASFLAGS                +=      $(firmware-asflags-y)
>
>  ARFLAGS                =       rcs
>
> -ELFFLAGS       +=      -Wl,--build-id=none -N -static-libgcc -lgcc
> +ifeq ($(LD_IS_LLD),y)
> +ELFFLAGS       +=      -fuse-ld=lld
> +endif
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
> index 03c02fb..e97dcc4 100644
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
> @@ -202,6 +207,36 @@ export PLATFORM_RISCV_XLEN=32
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

Testing with the pre-built official LLVM 12 release for Ubuntu 20.04
[1], along with bootlin pre-built cross-compile GCC [2]:

There are 3 build warnings when using the default binutils:

 AS        platform/generic/firmware/fw_dynamic.o
firmware/fw_base.S:557:2: warning: fw_platform_init changed binding to STB_WEAK
 .weak fw_platform_init
 ^

 AS        platform/generic/firmware/fw_jump.o
firmware/fw_base.S:557:2: warning: fw_platform_init changed binding to STB_WEAK
 .weak fw_platform_init
 ^

 AS        platform/generic/firmware/fw_payload.o
firmware/fw_base.S:557:2: warning: fw_platform_init changed binding to STB_WEAK
 .weak fw_platform_init
 ^

And several warnings from the GNU linker:

/share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
search path "/lib/../lib64" is unsafe for cross-compilation
/share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
search path "/usr/lib/../lib64" is unsafe for cross-compilation
/share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
search path "/lib" is unsafe for cross-compilation
/share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
search path "/usr/lib" is unsafe for cross-compilation

The generated fw_dynamic firmware image does not boot on QEMU 'virt'.
Initial debugging shows that it returns SBI_EINVAL in
sanitize_domain().

> +```
> +
> +To build with a full LLVM-based toolchain, not just Clang, enable the *LLVM*
> +option with:
> +```
> +make LLVM=1
> +```
> +
> +When using Clang, *CROSS_COMPILE* must be defined if the default target for the
> +used Clang is not RISC-V. For Clang, rather than being used as a prefix for the
> +executable name, it will instead be passed via the `-target` option with the
> +trailing `-` removed, so must be a valid triple.
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
>  Contributing to OpenSBI
>  -----------------------

[1] https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz
[2] https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64/tarballs/riscv64--glibc--bleeding-edge-2020.08-1.tar.bz2

Regards,
Bin

