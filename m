From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 9 Jul 2021 05:03:01 +0100
Subject: [PATCH v2 1/2] Makefile: Support building with Clang and LLVM
 binutils
In-Reply-To: <C5240D5D-596B-4A72-BCB6-D0C400BB5291@jrtc27.com>
References: <20210708175108.82365-1-jrtc27@jrtc27.com>
 <20210708175108.82365-2-jrtc27@jrtc27.com>
 <CAEUhbmXL1bGWF3i6XJ61W1t+L53TJEAz2W_esC2nHmYaiqGfHw@mail.gmail.com>
 <9AA630AE-3BE2-4771-8FA0-B2CFD2F2FF4E@jrtc27.com>
 <CAEUhbmWa37bNyDWY-eiZPZUbo=HtBrm4z8HytkGHXV64ZwRJ7g@mail.gmail.com>
 <C5240D5D-596B-4A72-BCB6-D0C400BB5291@jrtc27.com>
Message-ID: <77364460-048A-4683-B89E-EB7BF22D8130@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Jul 2021, at 04:31, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> On 9 Jul 2021, at 04:11, Bin Meng <bmeng.cn@gmail.com> wrote:
>> 
>> On Fri, Jul 9, 2021 at 10:35 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>> 
>>> On 9 Jul 2021, at 02:50, Bin Meng <bmeng.cn@gmail.com> wrote:
>>>> 
>>>> On Fri, Jul 9, 2021 at 1:51 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>>> 
>>>>> This is intended to mirror the Linux kernel. Building with CC=clang will
>>>>> use Clang as the compiler but default to using the existing binutils.
>>>>> Building with LLVM=1 will default to using Clang and LLVM binutils.
>>>>> 
>>>>> Whilst GCC will accept the -N linker option and forward it on to the
>>>>> linker, Clang will not, and so in order to support both compilers we
>>>>> must use -Wl, to forward it to the linker as is required for most other
>>>>> linker options.
>>>>> 
>>>>> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
>>>>> ---
>>>>> Makefile  | 57 +++++++++++++++++++++++++++++++++++++++++++++++++------
>>>>> README.md | 39 +++++++++++++++++++++++++++++++++++--
>>>>> 2 files changed, 88 insertions(+), 8 deletions(-)
>>>>> 
>>>>> diff --git a/Makefile b/Makefile
>>>>> index 6b64205..3fe8153 100644
>>>>> --- a/Makefile
>>>>> +++ b/Makefile
>>>>> @@ -76,26 +76,54 @@ OPENSBI_VERSION_MINOR=`grep "define OPENSBI_VERSION_MINOR" $(include_dir)/sbi/sb
>>>>> OPENSBI_VERSION_GIT=$(shell if [ -d $(src_dir)/.git ]; then git describe 2> /dev/null; fi)
>>>>> 
>>>>> # Setup compilation commands
>>>>> +ifneq ($(LLVM),)
>>>>> +CC             =       clang
>>>>> +AR             =       llvm-ar
>>>>> +LD             =       ld.lld
>>>>> +OBJCOPY                =       llvm-objcopy
>>>>> +else
>>>>> ifdef CROSS_COMPILE
>>>>> CC             =       $(CROSS_COMPILE)gcc
>>>>> -CPP            =       $(CROSS_COMPILE)cpp
>>>>> AR             =       $(CROSS_COMPILE)ar
>>>>> LD             =       $(CROSS_COMPILE)ld
>>>>> OBJCOPY                =       $(CROSS_COMPILE)objcopy
>>>>> else
>>>>> CC             ?=      gcc
>>>>> -CPP            ?=      cpp
>>>>> AR             ?=      ar
>>>>> LD             ?=      ld
>>>>> OBJCOPY                ?=      objcopy
>>>>> endif
>>>>> +endif
>>>>> +CPP            =       $(CC) -E
>>>>> AS             =       $(CC)
>>>>> DTC            =       dtc
>>>>> 
>>>>> -# Guess the compillers xlen
>>>>> -OPENSBI_CC_XLEN := $(shell TMP=`$(CC) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
>>>>> +ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>>>>> +CC_IS_CLANG    =       y
>>>>> +else
>>>>> +CC_IS_CLANG    =       n
>>>>> +endif
>>>>> +
>>>>> +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
>>>>> +LD_IS_LLD      =       y
>>>>> +else
>>>>> +LD_IS_LLD      =       n
>>>>> +endif
>>>>> +
>>>>> +ifeq ($(CC_IS_CLANG),y)
>>>>> +ifneq ($(CROSS_COMPILE),)
>>>>> +CLANG_TARGET   =       -target $(notdir $(CROSS_COMPILE:%-=%))
>>>> 
>>>> It's odd that when we use full LLVM toolchains we still need to
>>>> specify CROSS_COMPILE in order to only guess the "--target" value.
>>>> This can be written directly to --target=riscv64 / riscv32 depending
>>>> OPENSBI_CC_XLEN
>>> 
>>> Hm, that?s true. To be honest, the fact that OpenSBI defaults to an
>>> unprefixed GCC is rather dubious, that?ll likely be for either
>>> riscv64-linux-gnu or riscv64-unknown-freebsd and thus not suitable
>>> (there can be subtle issues with using the wrong one, though RISC-V is
>>> more uniform than some other architectures) so should probably grab
>>> XLEN from the default GCC and then look for riscvXLEN-unknown-elf-gcc
>>> if CROSS_COMPILE wasn?t specified. I can at least make it do something
>>> like that for Clang (keep this code for CROSS_COMPILE not empty, then
>>> add a -target riscvXLEN-unknown-elf after guessing the XLEN if
>>> CROSS_COMPILE was empty).
>> 
>> I don't think we should over-complicate things. Passing riscv64 /
>> riscv32 to --target is enough for OpenSBI when building with clang.
> 
> We should use the right triple though, and doing so requires knowing XLEN.
> 
>>>>> +endif
>>>>> +endif
>>>>> +
>>>>> +# Guess the compiler's XLEN
>>>>> +OPENSBI_CC_XLEN := $(shell TMP=`$(CC) $(CLANG_TARGET) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
>>>>> +
>>>>> +# Guess the compiler's ABI and ISA
>>>>> +ifneq ($(CC_IS_CLANG),y)
>>>>> OPENSBI_CC_ABI := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-abi=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
>>>>> OPENSBI_CC_ISA := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-arch=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
>>>>> +endif
>>>>> 
>>>>> # Setup platform XLEN
>>>>> ifndef PLATFORM_RISCV_XLEN
>>>>> @@ -194,7 +222,11 @@ else
>>>>> endif
>>>>> 
>>>>> # Setup compilation commands flags
>>>>> -GENFLAGS       =       -I$(platform_src_dir)/include
>>>>> +ifeq ($(CC_IS_CLANG),y)
>>>>> +GENFLAGS       +=      $(CLANG_TARGET)
>>>>> +GENFLAGS       +=      -Wno-unused-command-line-argument
>>>>> +endif
>>>>> +GENFLAGS       +=      -I$(platform_src_dir)/include
>>>>> GENFLAGS       +=      -I$(include_dir)
>>>>> ifneq ($(OPENSBI_VERSION_GIT),)
>>>>> GENFLAGS       +=      -DOPENSBI_VERSION_GIT="\"$(OPENSBI_VERSION_GIT)\""
>>>>> @@ -208,6 +240,9 @@ CFLAGS              +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>>>>> CFLAGS         +=      -mno-save-restore -mstrict-align
>>>>> CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>>>>> CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>>>>> +ifeq ($(LD_IS_LLD),y)
>>>>> +CFLAGS         +=      -mno-relax
>>>>> +endif
>>>>> CFLAGS         +=      $(GENFLAGS)
>>>>> CFLAGS         +=      $(platform-cflags-y)
>>>>> CFLAGS         +=      -fno-pie -no-pie
>>>>> @@ -222,18 +257,28 @@ ASFLAGS           +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>>>>> ASFLAGS                +=      -mno-save-restore -mstrict-align
>>>>> ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>>>>> ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>>>>> +ifeq ($(LD_IS_LLD),y)
>>>>> +ASFLAGS                +=      -mno-relax
>>>>> +endif
>>>>> ASFLAGS                +=      $(GENFLAGS)
>>>>> ASFLAGS                +=      $(platform-asflags-y)
>>>>> ASFLAGS                +=      $(firmware-asflags-y)
>>>>> 
>>>>> ARFLAGS                =       rcs
>>>>> 
>>>>> -ELFFLAGS       +=      -Wl,--build-id=none -N -static-libgcc -lgcc
>>>>> +ifeq ($(LD_IS_LLD),y)
>>>>> +ELFFLAGS       +=      -fuse-ld=lld
>>>>> +endif
>>>>> +ELFFLAGS       +=      -Wl,--build-id=none -Wl,-N -static-libgcc -lgcc
>>>>> ELFFLAGS       +=      $(platform-ldflags-y)
>>>>> ELFFLAGS       +=      $(firmware-ldflags-y)
>>>>> 
>>>>> MERGEFLAGS     +=      -r
>>>>> +ifeq ($(LD_IS_LLD),y)
>>>>> +MERGEFLAGS     +=      -b elf
>>>>> +else
>>>>> MERGEFLAGS     +=      -b elf$(PLATFORM_RISCV_XLEN)-littleriscv
>>>>> +endif
>>>>> MERGEFLAGS     +=      -m elf$(PLATFORM_RISCV_XLEN)lriscv
>>>>> 
>>>>> DTSCPPFLAGS    =       $(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
>>>>> diff --git a/README.md b/README.md
>>>>> index 03c02fb..e97dcc4 100644
>>>>> --- a/README.md
>>>>> +++ b/README.md
>>>>> @@ -96,8 +96,13 @@ Required Toolchain
>>>>> ------------------
>>>>> 
>>>>> OpenSBI can be compiled natively or cross-compiled on a x86 host. For
>>>>> -cross-compilation, you can build your own toolchain or just download
>>>>> -a prebuilt one from the [Bootlin toolchain repository].
>>>>> +cross-compilation, you can build your own toolchain, download a prebuilt one
>>>>> +from the [Bootlin toolchain repository] or install a distribution-provided
>>>>> +toolchain; if you opt to use LLVM/Clang, most distribution toolchains will
>>>>> +support cross-compiling for RISC-V using the same toolchain as your native
>>>>> +LLVM/Clang toolchain due to LLVM's ability to support multiple backends in the
>>>>> +same binary, so is often an easy way to obtain a working cross-compilation
>>>>> +toolchain.
>>>>> 
>>>>> Please note that only a 64-bit version of the toolchain is available in
>>>>> the Bootlin toolchain repository for now.
>>>>> @@ -202,6 +207,36 @@ export PLATFORM_RISCV_XLEN=32
>>>>> 
>>>>> will generate 32-bit OpenSBI images. And vice vesa.
>>>>> 
>>>>> +Building with Clang/LLVM
>>>>> +------------------------
>>>>> +
>>>>> +OpenSBI can also be built with Clang/LLVM. To build with just Clang but keep
>>>>> +the default binutils (which will still use the *CROSS_COMPILE* prefix if
>>>>> +defined), override the *CC* make variable with:
>>>>> +```
>>>>> +make CC=clang
>>>> 
>>>> Testing with the pre-built official LLVM 12 release for Ubuntu 20.04
>>>> [1], along with bootlin pre-built cross-compile GCC [2]:
>>>> 
>>>> There are 3 build warnings when using the default binutils:
>>>> 
>>>> AS        platform/generic/firmware/fw_dynamic.o
>>>> firmware/fw_base.S:557:2: warning: fw_platform_init changed binding to STB_WEAK
>>>> .weak fw_platform_init
>>>> ^
>>>> 
>>>> AS        platform/generic/firmware/fw_jump.o
>>>> firmware/fw_base.S:557:2: warning: fw_platform_init changed binding to STB_WEAK
>>>> .weak fw_platform_init
>>>> ^
>>>> 
>>>> AS        platform/generic/firmware/fw_payload.o
>>>> firmware/fw_base.S:557:2: warning: fw_platform_init changed binding to STB_WEAK
>>>> .weak fw_platform_init
>>>> ^
>>> 
>>> Yeah, those are known. They?re harmless and easy to fix (just delete
>>> the .globl lines, as the two are mutually exclusive), so I didn?t
>>> include it as part of this patch series, LLVM 12 just got stricter
>>> about this as it?s dodgy code.
>> 
>> Please include a patch to fix these warnings as part of this series.
>> We should not allow any building warnings to happen.
> 
> Ok, that?s a trivial patch to include in v3.
> 
>>>> And several warnings from the GNU linker:
>>>> 
>>>> /share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
>>>> search path "/lib/../lib64" is unsafe for cross-compilation
>>>> /share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
>>>> search path "/usr/lib/../lib64" is unsafe for cross-compilation
>>>> /share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
>>>> search path "/lib" is unsafe for cross-compilation
>>>> /share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
>>>> search path "/usr/lib" is unsafe for cross-compilation
>>> 
>>> Hm, indeed, Clang likes to add some host directories to the search
>>> path, seemingly only for RISC-V. RISC-V?s bare-metal toolchain driver
>>> is a bit quirky due to all the multilib stuff the GNU world decided to
>>> introduce so that?s a bug. They should be harmless though given we
>>> don?t pass -lfoo, when linking in SBI libraries we pass the path.
>> 
>> Is it a bug of clang, or GNU ld? Could you please file a bug report to
>> get this issue tracked (if there isn't one already), and mentioned in
>> the commit message?
> 
> Clang, though I suspect some of these are a result of you using the
> wrong triple (see below).

Looking into this more, my memory of bare-metal RISC-V toolchains is
wrong. Clang 12 fixed RISC-V to be a lot more like other targets, so as
long as you use Clang 12 and use the right triple no system paths
should be added. If you use an older version with the right triple it
should still work but may print one of these warnings per file (for
/lib only) if you also use GNU ld, but the warning is harmless.

Jess

>>>> The generated fw_dynamic firmware image does not boot on QEMU 'virt'.
>>>> Initial debugging shows that it returns SBI_EINVAL in
>>>> sanitize_domain().
>>> 
>>> My pure LLVM=1-built fw_dynamic binary on FreeBSD boots U-Boot just fine
>>> (-M virt -m 2048 -nographic -bios fw_dynamic.elf -kernel u-boot), as
>>> does an LLVM=1 with LD overridden to be GNU ld 2.33.1 (also on FreeBSD)
>>> so I don?t know what?s going on there. Though I did discover that
>>> -fuse-ld=bfd is needed for the non-LLD case otherwise Clang won?t pick
>>> up an ld.bfd intended to override a system LLD. So my guess is that one
>>> or other of the binaries you downloaded has broken something. Does
>>> using LLD work? If you tell me exactly what you ran I can try it on a
>>> Linux machine myself and see if I can reproduce it.
>> 
>> Switching to full LLVM build does not build for me.
>> 
>> ELF       platform/generic/firmware/fw_dynamic.elf
>> ld.lld: error: can't create dynamic relocation R_RISCV_64 against
>> symbol: _fw_start in readonly segment; recompile object files with
>> -fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
>>>>> defined in opensbi/build/platform/generic/firmware/fw_dynamic.elf.ld:8
>>>>> referenced by fw_base.S:502 (opensbi/firmware/fw_base.S:502)
>>>>>             opensbi/build/platform/generic/firmware/fw_dynamic.o:(.entry+0x3A0)
>> 
>> ld.lld: error: can't create dynamic relocation R_RISCV_64 against
>> symbol: _fw_reloc_end in readonly segment; recompile object files with
>> -fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
>>>>> defined in opensbi/build/platform/generic/firmware/fw_dynamic.elf.ld:92
>>>>> referenced by fw_base.S:502 (opensbi/firmware/fw_base.S:502)
>>>>>             opensbi/build/platform/generic/firmware/fw_dynamic.o:(.entry+0x3B0)
>> clang-12: error: linker command failed with exit code 1 (use -v to see
>> invocation)
>> make: *** [Makefile:396:
>> opensbi/build/platform/generic/firmware/fw_dynamic.elf] Error 1
> 
> This is a result of you using the wrong triple, though it?s also a sign
> that we do slightly bogus things. For FW_PIC we link with -pie, but
> that doesn?t make sense for bare-metal. We also don?t link with
> -static, but it?s the default (and only) supported thing for bare-metal
> targets. If you use a bare-metal triple then the -pie gets ignored (we
> should probably remove it from objects.mk) and -static is implied. If
> you use a Linux triple then the -pie gets honoured and the lack of
> -static means it defaults to dynamic linking, so LLD rightly complains
> about the fact that fw_base.S is creating a pointer in a read-only
> section that requires run-time relocation. I don?t know why you don?t
> see the same thing with GNU ld but it?s probably just silently allowing
> it and leaving it to crash at run time.
> 
>> My environment:
>> 
>> Host: Ubuntu 20.04 x86_64
>> LLVM: https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz
>> GCC: https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64/tarballs/riscv64--glibc--bleeding-edge-2020.08-1.tar.bz2
>> 
>> Both LLVM and GCC are in my $PATH.
>> 
>> $ make CC=clang CROSS_COMPILE=riscv64-linux- PLATFORM=generic
>> Result: can build, cannot boot
>> 
>> $ make LLVM=1 CROSS_COMPILE=riscv64-linux- PLATFORM=generic
>> Result: cannot build
> 
> OpenSBI is not Linux, using the wrong triple will give different
> behaviour in the driver. Use riscv64-unknown-elf- and things should be
> better.
> 
> Jess


