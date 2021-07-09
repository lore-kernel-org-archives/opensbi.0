From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 9 Jul 2021 15:34:47 +0000
Subject: [PATCH v2 1/2] Makefile: Support building with Clang and LLVM
 binutils
In-Reply-To: <9AA01E86-263B-4628-9D1D-8CBD8D5AA98D@jrtc27.com>
References: <20210708175108.82365-1-jrtc27@jrtc27.com>
 <20210708175108.82365-2-jrtc27@jrtc27.com>
 <CAEUhbmXL1bGWF3i6XJ61W1t+L53TJEAz2W_esC2nHmYaiqGfHw@mail.gmail.com>
 <9AA630AE-3BE2-4771-8FA0-B2CFD2F2FF4E@jrtc27.com>
 <CAEUhbmWa37bNyDWY-eiZPZUbo=HtBrm4z8HytkGHXV64ZwRJ7g@mail.gmail.com>
 <C5240D5D-596B-4A72-BCB6-D0C400BB5291@jrtc27.com>
 <CAEUhbmWH+4Fm4YtP3hXnP36GQpXtqp3_MXxm5Pc9EyyvxddsTQ@mail.gmail.com>
 <CAEUhbmWSuMA4khQRHfJ_vDbsCjdgOejcHdYEuud4PbniJcxsOA@mail.gmail.com>
 <CAEUhbmWOAJA15x9XpXZE-f=Vz3zA4PGLiSDtUZNw7KNgcf3F+w@mail.gmail.com>
 <7CA002F8-303A-4E25-A017-147CD324D7CD@jrtc27.com>
 <CAEUhbmUq-t5AODPe96xSdYJ+u=55GqFDLpJeRzrE9m8qXADPfA@mail.gmail.com>
 <9AA01E86-263B-4628-9D1D-8CBD8D5AA98D@jrtc27.com>
Message-ID: <E4AE8E77-BC56-4EBE-ACAA-D96F5BFA6875@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 09/07/21, 8:39 PM, "opensbi on behalf of Jessica Clarke" <opensbi-bounces at lists.infradead.org on behalf of jrtc27@jrtc27.com> wrote:

    On 9 Jul 2021, at 15:42, Bin Meng <bmeng.cn@gmail.com> wrote:
    > 
    > On Fri, Jul 9, 2021 at 10:34 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
    >> 
    >> On 9 Jul 2021, at 11:30, Bin Meng <bmeng.cn@gmail.com> wrote:
    >>> 
    >>> On Fri, Jul 9, 2021 at 3:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:
    >>>> 
    >>>> On Fri, Jul 9, 2021 at 2:40 PM Bin Meng <bmeng.cn@gmail.com> wrote:
    >>>>> 
    >>>>> On Fri, Jul 9, 2021 at 11:31 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
    >>>>>> 
    >>>>>> On 9 Jul 2021, at 04:11, Bin Meng <bmeng.cn@gmail.com> wrote:
    >>>>>>> 
    >>>>>>> On Fri, Jul 9, 2021 at 10:35 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
    >>>>>>>> 
    >>>>>>>> On 9 Jul 2021, at 02:50, Bin Meng <bmeng.cn@gmail.com> wrote:
    >>>>>>>>> 
    >>>>>>>>> On Fri, Jul 9, 2021 at 1:51 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
    >>>>>>>>>> 
    >>>>>>>>>> This is intended to mirror the Linux kernel. Building with CC=clang will
    >>>>>>>>>> use Clang as the compiler but default to using the existing binutils.
    >>>>>>>>>> Building with LLVM=1 will default to using Clang and LLVM binutils.
    >>>>>>>>>> 
    >>>>>>>>>> Whilst GCC will accept the -N linker option and forward it on to the
    >>>>>>>>>> linker, Clang will not, and so in order to support both compilers we
    >>>>>>>>>> must use -Wl, to forward it to the linker as is required for most other
    >>>>>>>>>> linker options.
    >>>>>>>>>> 
    >>>>>>>>>> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
    >>>>>>>>>> ---
    >>>>>>>>>> Makefile  | 57 +++++++++++++++++++++++++++++++++++++++++++++++++------
    >>>>>>>>>> README.md | 39 +++++++++++++++++++++++++++++++++++--
    >>>>>>>>>> 2 files changed, 88 insertions(+), 8 deletions(-)
    >>>>>>>>>> 
    >>>>>>>>>> diff --git a/Makefile b/Makefile
    >>>>>>>>>> index 6b64205..3fe8153 100644
    >>>>>>>>>> --- a/Makefile
    >>>>>>>>>> +++ b/Makefile
    >>>>>>>>>> @@ -76,26 +76,54 @@ OPENSBI_VERSION_MINOR=`grep "define OPENSBI_VERSION_MINOR" $(include_dir)/sbi/sb
    >>>>>>>>>> OPENSBI_VERSION_GIT=$(shell if [ -d $(src_dir)/.git ]; then git describe 2> /dev/null; fi)
    >>>>>>>>>> 
    >>>>>>>>>> # Setup compilation commands
    >>>>>>>>>> +ifneq ($(LLVM),)
    >>>>>>>>>> +CC             =       clang
    >>>>>>>>>> +AR             =       llvm-ar
    >>>>>>>>>> +LD             =       ld.lld
    >>>>>>>>>> +OBJCOPY                =       llvm-objcopy
    >>>>>>>>>> +else
    >>>>>>>>>> ifdef CROSS_COMPILE
    >>>>>>>>>> CC             =       $(CROSS_COMPILE)gcc
    >>>>>>>>>> -CPP            =       $(CROSS_COMPILE)cpp
    >>>>>>>>>> AR             =       $(CROSS_COMPILE)ar
    >>>>>>>>>> LD             =       $(CROSS_COMPILE)ld
    >>>>>>>>>> OBJCOPY                =       $(CROSS_COMPILE)objcopy
    >>>>>>>>>> else
    >>>>>>>>>> CC             ?=      gcc
    >>>>>>>>>> -CPP            ?=      cpp
    >>>>>>>>>> AR             ?=      ar
    >>>>>>>>>> LD             ?=      ld
    >>>>>>>>>> OBJCOPY                ?=      objcopy
    >>>>>>>>>> endif
    >>>>>>>>>> +endif
    >>>>>>>>>> +CPP            =       $(CC) -E
    >>>>>>>>>> AS             =       $(CC)
    >>>>>>>>>> DTC            =       dtc
    >>>>>>>>>> 
    >>>>>>>>>> -# Guess the compillers xlen
    >>>>>>>>>> -OPENSBI_CC_XLEN := $(shell TMP=`$(CC) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
    >>>>>>>>>> +ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
    >>>>>>>>>> +CC_IS_CLANG    =       y
    >>>>>>>>>> +else
    >>>>>>>>>> +CC_IS_CLANG    =       n
    >>>>>>>>>> +endif
    >>>>>>>>>> +
    >>>>>>>>>> +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
    >>>>>>>>>> +LD_IS_LLD      =       y
    >>>>>>>>>> +else
    >>>>>>>>>> +LD_IS_LLD      =       n
    >>>>>>>>>> +endif
    >>>>>>>>>> +
    >>>>>>>>>> +ifeq ($(CC_IS_CLANG),y)
    >>>>>>>>>> +ifneq ($(CROSS_COMPILE),)
    >>>>>>>>>> +CLANG_TARGET   =       -target $(notdir $(CROSS_COMPILE:%-=%))
    >>>>>>>>> 
    >>>>>>>>> It's odd that when we use full LLVM toolchains we still need to
    >>>>>>>>> specify CROSS_COMPILE in order to only guess the "--target" value.
    >>>>>>>>> This can be written directly to --target=riscv64 / riscv32 depending
    >>>>>>>>> OPENSBI_CC_XLEN
    >>>>>>>> 
    >>>>>>>> Hm, that?s true. To be honest, the fact that OpenSBI defaults to an
    >>>>>>>> unprefixed GCC is rather dubious, that?ll likely be for either
    >>>>>>>> riscv64-linux-gnu or riscv64-unknown-freebsd and thus not suitable
    >>>>>>>> (there can be subtle issues with using the wrong one, though RISC-V is
    >>>>>>>> more uniform than some other architectures) so should probably grab
    >>>>>>>> XLEN from the default GCC and then look for riscvXLEN-unknown-elf-gcc
    >>>>>>>> if CROSS_COMPILE wasn?t specified. I can at least make it do something
    >>>>>>>> like that for Clang (keep this code for CROSS_COMPILE not empty, then
    >>>>>>>> add a -target riscvXLEN-unknown-elf after guessing the XLEN if
    >>>>>>>> CROSS_COMPILE was empty).
    >>>>>>> 
    >>>>>>> I don't think we should over-complicate things. Passing riscv64 /
    >>>>>>> riscv32 to --target is enough for OpenSBI when building with clang.
    >>>>>> 
    >>>>>> We should use the right triple though, and doing so requires knowing XLEN.
    >>>>>> 
    >>>>>>>>>> +endif
    >>>>>>>>>> +endif
    >>>>>>>>>> +
    >>>>>>>>>> +# Guess the compiler's XLEN
    >>>>>>>>>> +OPENSBI_CC_XLEN := $(shell TMP=`$(CC) $(CLANG_TARGET) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
    >>>>>>>>>> +
    >>>>>>>>>> +# Guess the compiler's ABI and ISA
    >>>>>>>>>> +ifneq ($(CC_IS_CLANG),y)
    >>>>>>>>>> OPENSBI_CC_ABI := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-abi=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
    >>>>>>>>>> OPENSBI_CC_ISA := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-arch=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
    >>>>>>>>>> +endif
    >>>>>>>>>> 
    >>>>>>>>>> # Setup platform XLEN
    >>>>>>>>>> ifndef PLATFORM_RISCV_XLEN
    >>>>>>>>>> @@ -194,7 +222,11 @@ else
    >>>>>>>>>> endif
    >>>>>>>>>> 
    >>>>>>>>>> # Setup compilation commands flags
    >>>>>>>>>> -GENFLAGS       =       -I$(platform_src_dir)/include
    >>>>>>>>>> +ifeq ($(CC_IS_CLANG),y)
    >>>>>>>>>> +GENFLAGS       +=      $(CLANG_TARGET)
    >>>>>>>>>> +GENFLAGS       +=      -Wno-unused-command-line-argument
    >>>>>>>>>> +endif
    >>>>>>>>>> +GENFLAGS       +=      -I$(platform_src_dir)/include
    >>>>>>>>>> GENFLAGS       +=      -I$(include_dir)
    >>>>>>>>>> ifneq ($(OPENSBI_VERSION_GIT),)
    >>>>>>>>>> GENFLAGS       +=      -DOPENSBI_VERSION_GIT="\"$(OPENSBI_VERSION_GIT)\""
    >>>>>>>>>> @@ -208,6 +240,9 @@ CFLAGS              +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
    >>>>>>>>>> CFLAGS         +=      -mno-save-restore -mstrict-align
    >>>>>>>>>> CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
    >>>>>>>>>> CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
    >>>>>>>>>> +ifeq ($(LD_IS_LLD),y)
    >>>>>>>>>> +CFLAGS         +=      -mno-relax
    >>>>>>>>>> +endif
    >>>>>>>>>> CFLAGS         +=      $(GENFLAGS)
    >>>>>>>>>> CFLAGS         +=      $(platform-cflags-y)
    >>>>>>>>>> CFLAGS         +=      -fno-pie -no-pie
    >>>>>>>>>> @@ -222,18 +257,28 @@ ASFLAGS           +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
    >>>>>>>>>> ASFLAGS                +=      -mno-save-restore -mstrict-align
    >>>>>>>>>> ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
    >>>>>>>>>> ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
    >>>>>>>>>> +ifeq ($(LD_IS_LLD),y)
    >>>>>>>>>> +ASFLAGS                +=      -mno-relax
    >>>>>>>>>> +endif
    >>>>>>>>>> ASFLAGS                +=      $(GENFLAGS)
    >>>>>>>>>> ASFLAGS                +=      $(platform-asflags-y)
    >>>>>>>>>> ASFLAGS                +=      $(firmware-asflags-y)
    >>>>>>>>>> 
    >>>>>>>>>> ARFLAGS                =       rcs
    >>>>>>>>>> 
    >>>>>>>>>> -ELFFLAGS       +=      -Wl,--build-id=none -N -static-libgcc -lgcc
    >>>>>>>>>> +ifeq ($(LD_IS_LLD),y)
    >>>>>>>>>> +ELFFLAGS       +=      -fuse-ld=lld
    >>>>>>>>>> +endif
    >>>>>>>>>> +ELFFLAGS       +=      -Wl,--build-id=none -Wl,-N -static-libgcc -lgcc
    >>>>>>>>>> ELFFLAGS       +=      $(platform-ldflags-y)
    >>>>>>>>>> ELFFLAGS       +=      $(firmware-ldflags-y)
    >>>>>>>>>> 
    >>>>>>>>>> MERGEFLAGS     +=      -r
    >>>>>>>>>> +ifeq ($(LD_IS_LLD),y)
    >>>>>>>>>> +MERGEFLAGS     +=      -b elf
    >>>>>>>>>> +else
    >>>>>>>>>> MERGEFLAGS     +=      -b elf$(PLATFORM_RISCV_XLEN)-littleriscv
    >>>>>>>>>> +endif
    >>>>>>>>>> MERGEFLAGS     +=      -m elf$(PLATFORM_RISCV_XLEN)lriscv
    >>>>>>>>>> 
    >>>>>>>>>> DTSCPPFLAGS    =       $(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
    >>>>>>>>>> diff --git a/README.md b/README.md
    >>>>>>>>>> index 03c02fb..e97dcc4 100644
    >>>>>>>>>> --- a/README.md
    >>>>>>>>>> +++ b/README.md
    >>>>>>>>>> @@ -96,8 +96,13 @@ Required Toolchain
    >>>>>>>>>> ------------------
    >>>>>>>>>> 
    >>>>>>>>>> OpenSBI can be compiled natively or cross-compiled on a x86 host. For
    >>>>>>>>>> -cross-compilation, you can build your own toolchain or just download
    >>>>>>>>>> -a prebuilt one from the [Bootlin toolchain repository].
    >>>>>>>>>> +cross-compilation, you can build your own toolchain, download a prebuilt one
    >>>>>>>>>> +from the [Bootlin toolchain repository] or install a distribution-provided
    >>>>>>>>>> +toolchain; if you opt to use LLVM/Clang, most distribution toolchains will
    >>>>>>>>>> +support cross-compiling for RISC-V using the same toolchain as your native
    >>>>>>>>>> +LLVM/Clang toolchain due to LLVM's ability to support multiple backends in the
    >>>>>>>>>> +same binary, so is often an easy way to obtain a working cross-compilation
    >>>>>>>>>> +toolchain.
    >>>>>>>>>> 
    >>>>>>>>>> Please note that only a 64-bit version of the toolchain is available in
    >>>>>>>>>> the Bootlin toolchain repository for now.
    >>>>>>>>>> @@ -202,6 +207,36 @@ export PLATFORM_RISCV_XLEN=32
    >>>>>>>>>> 
    >>>>>>>>>> will generate 32-bit OpenSBI images. And vice vesa.
    >>>>>>>>>> 
    >>>>>>>>>> +Building with Clang/LLVM
    >>>>>>>>>> +------------------------
    >>>>>>>>>> +
    >>>>>>>>>> +OpenSBI can also be built with Clang/LLVM. To build with just Clang but keep
    >>>>>>>>>> +the default binutils (which will still use the *CROSS_COMPILE* prefix if
    >>>>>>>>>> +defined), override the *CC* make variable with:
    >>>>>>>>>> +```
    >>>>>>>>>> +make CC=clang
    >>>>>>>>> 
    >>>>>>>>> Testing with the pre-built official LLVM 12 release for Ubuntu 20.04
    >>>>>>>>> [1], along with bootlin pre-built cross-compile GCC [2]:
    >>>>>>>>> 
    >>>>>>>>> There are 3 build warnings when using the default binutils:
    >>>>>>>>> 
    >>>>>>>>> AS        platform/generic/firmware/fw_dynamic.o
    >>>>>>>>> firmware/fw_base.S:557:2: warning: fw_platform_init changed binding to STB_WEAK
    >>>>>>>>> .weak fw_platform_init
    >>>>>>>>> ^
    >>>>>>>>> 
    >>>>>>>>> AS        platform/generic/firmware/fw_jump.o
    >>>>>>>>> firmware/fw_base.S:557:2: warning: fw_platform_init changed binding to STB_WEAK
    >>>>>>>>> .weak fw_platform_init
    >>>>>>>>> ^
    >>>>>>>>> 
    >>>>>>>>> AS        platform/generic/firmware/fw_payload.o
    >>>>>>>>> firmware/fw_base.S:557:2: warning: fw_platform_init changed binding to STB_WEAK
    >>>>>>>>> .weak fw_platform_init
    >>>>>>>>> ^
    >>>>>>>> 
    >>>>>>>> Yeah, those are known. They?re harmless and easy to fix (just delete
    >>>>>>>> the .globl lines, as the two are mutually exclusive), so I didn?t
    >>>>>>>> include it as part of this patch series, LLVM 12 just got stricter
    >>>>>>>> about this as it?s dodgy code.
    >>>>>>> 
    >>>>>>> Please include a patch to fix these warnings as part of this series.
    >>>>>>> We should not allow any building warnings to happen.
    >>>>>> 
    >>>>>> Ok, that?s a trivial patch to include in v3.
    >>>>>> 
    >>>>>>>>> And several warnings from the GNU linker:
    >>>>>>>>> 
    >>>>>>>>> /share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
    >>>>>>>>> search path "/lib/../lib64" is unsafe for cross-compilation
    >>>>>>>>> /share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
    >>>>>>>>> search path "/usr/lib/../lib64" is unsafe for cross-compilation
    >>>>>>>>> /share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
    >>>>>>>>> search path "/lib" is unsafe for cross-compilation
    >>>>>>>>> /share/toolchains/riscv64/bin/riscv64-linux-ld: warning: library
    >>>>>>>>> search path "/usr/lib" is unsafe for cross-compilation
    >>>>>>>> 
    >>>>>>>> Hm, indeed, Clang likes to add some host directories to the search
    >>>>>>>> path, seemingly only for RISC-V. RISC-V?s bare-metal toolchain driver
    >>>>>>>> is a bit quirky due to all the multilib stuff the GNU world decided to
    >>>>>>>> introduce so that?s a bug. They should be harmless though given we
    >>>>>>>> don?t pass -lfoo, when linking in SBI libraries we pass the path.
    >>>>>>> 
    >>>>>>> Is it a bug of clang, or GNU ld? Could you please file a bug report to
    >>>>>>> get this issue tracked (if there isn't one already), and mentioned in
    >>>>>>> the commit message?
    >>>>>> 
    >>>>>> Clang, though I suspect some of these are a result of you using the
    >>>>>> wrong triple (see below).
    >>>>>> 
    >>>>>>>>> The generated fw_dynamic firmware image does not boot on QEMU 'virt'.
    >>>>>>>>> Initial debugging shows that it returns SBI_EINVAL in
    >>>>>>>>> sanitize_domain().
    >>>>>>>> 
    >>>>>>>> My pure LLVM=1-built fw_dynamic binary on FreeBSD boots U-Boot just fine
    >>>>>>>> (-M virt -m 2048 -nographic -bios fw_dynamic.elf -kernel u-boot), as
    >>>>>>>> does an LLVM=1 with LD overridden to be GNU ld 2.33.1 (also on FreeBSD)
    >>>>>>>> so I don?t know what?s going on there. Though I did discover that
    >>>>>>>> -fuse-ld=bfd is needed for the non-LLD case otherwise Clang won?t pick
    >>>>>>>> up an ld.bfd intended to override a system LLD. So my guess is that one
    >>>>>>>> or other of the binaries you downloaded has broken something. Does
    >>>>>>>> using LLD work? If you tell me exactly what you ran I can try it on a
    >>>>>>>> Linux machine myself and see if I can reproduce it.
    >>>>>>> 
    >>>>>>> Switching to full LLVM build does not build for me.
    >>>>>>> 
    >>>>>>> ELF       platform/generic/firmware/fw_dynamic.elf
    >>>>>>> ld.lld: error: can't create dynamic relocation R_RISCV_64 against
    >>>>>>> symbol: _fw_start in readonly segment; recompile object files with
    >>>>>>> -fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
    >>>>>>>>>> defined in opensbi/build/platform/generic/firmware/fw_dynamic.elf.ld:8
    >>>>>>>>>> referenced by fw_base.S:502 (opensbi/firmware/fw_base.S:502)
    >>>>>>>>>>            opensbi/build/platform/generic/firmware/fw_dynamic.o:(.entry+0x3A0)
    >>>>>>> 
    >>>>>>> ld.lld: error: can't create dynamic relocation R_RISCV_64 against
    >>>>>>> symbol: _fw_reloc_end in readonly segment; recompile object files with
    >>>>>>> -fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
    >>>>>>>>>> defined in opensbi/build/platform/generic/firmware/fw_dynamic.elf.ld:92
    >>>>>>>>>> referenced by fw_base.S:502 (opensbi/firmware/fw_base.S:502)
    >>>>>>>>>>            opensbi/build/platform/generic/firmware/fw_dynamic.o:(.entry+0x3B0)
    >>>>>>> clang-12: error: linker command failed with exit code 1 (use -v to see
    >>>>>>> invocation)
    >>>>>>> make: *** [Makefile:396:
    >>>>>>> opensbi/build/platform/generic/firmware/fw_dynamic.elf] Error 1
    >>>>>> 
    >>>>>> This is a result of you using the wrong triple, though it?s also a sign
    >>>>>> that we do slightly bogus things. For FW_PIC we link with -pie, but
    >>>>>> that doesn?t make sense for bare-metal. We also don?t link with
    >>>>>> -static, but it?s the default (and only) supported thing for bare-metal
    >>>>>> targets. If you use a bare-metal triple then the -pie gets ignored (we
    >>>>>> should probably remove it from objects.mk) and -static is implied. If
    >>>>>> you use a Linux triple then the -pie gets honoured and the lack of
    >>>>>> -static means it defaults to dynamic linking, so LLD rightly complains
    >>>>>> about the fact that fw_base.S is creating a pointer in a read-only
    >>>>>> section that requires run-time relocation. I don?t know why you don?t
    >>>>>> see the same thing with GNU ld but it?s probably just silently allowing
    >>>>>> it and leaving it to crash at run time.
    >>>>> 
    >>>>> I am confused. Did you mean "riscv64-linux-" is a bare-metal triple? I
    >>>>> thought "riscv64-unknown-elf-" is one bare-metal triple, and "-target
    >>>>> riscv64" is too.
    >>>>> 
    >>>>> I changed to pass "-target riscv64" to clang, and now it builds and
    >>>>> boots fine with LLVM=1 case.
    >>>> 
    >>>> I further looked at this one. Even passing "-target riscv64" leads to
    >>>> a successful build and boot to U-Boot, I checked the generated ELF
    >>>> image and found the .rela.dyn section is empty.
    >>> 
    >>> By hardcoding "-target riscv64-unknown-elf", and
    >>> 
    >>> $ make LLVM=1 PLATFORM=generic
    >>> 
    >>> I got the same result as "-target riscv64". It builds and boots, but
    >>> with an empty.rela.dyn
    >> 
    >> If unspecified, the vendor and OS default to unknown and elf
    >> respectively, so the two are entirely equivalent, but I felt it best to
    >> be explicit, especially since anyone without an LLVM background reading
    >> the Makefile might be confused.
    >> 
    > 
    > Ah, thanks! I am not aware of this clang triple convention :)
    > 
    >> This is a bare-metal binary, of course .rela.dyn is going to be empty,
    >> there?s no run-time linker to do any relocations. How on earth is the
    >> FW_PIC support supposed to work?
    > 
    > See commit 0f20e8adcf42 ("firmware: Support position independent
    > execution") for the FW_PIC changes. Basically OpenSBI relocates itself
    > at the very beginning of the boot phase if building with -fpie.

    Sure, but riscv64-unknown-elf PIEs do not exist, same as
    aarch64-unknown-elf or any other triple.

    >> That looks utterly broken to me. Is it *intended* to be abusing riscv64-linux-gnu? Because that?s just plain wrong...
    > 
    > I am not sure what you mean by "abusing riscv64-linux-gnu"? But this
    > -fpie stuff is perfectly okay and commonly used by every architecture
    > in the U-Boot world.

    Ewwwww. That is horrendous. I think other toolchain authors would be
    horrified to know this is happening. This has never been supported and
    (as an LLVM developer) there are all manner of subtle issues here that
    don?t matter until they do. It is *not* ok, it?s an awful awful hack
    that someone should have fixed by adding static PIE support for
    bare-metal binaries. But then I don?t understand why GNU ld isn?t
    giving errors about the relocations in read-only sections. Is its error
    checking just broken? GNU ld normal gives errors for that kind of
    thing, but maybe it?s just broken on RISC-V. Building myself with a
    FreeBSD triple (on FreeBSD) I can reproduce the errors, and using GNU
    ld instead of LLD I don?t see them, but inspecting the binary I see
    there are relocations against .text and it?s become writeable but
    there?s no DT_TEXTREL in the output, so GNU ld is definitely broken
    somehow here (even -Wl,-z,text to forcefully disable text relocations
    in case it?s just a different default behaves no differently, though
    even if it were the default it still must emit a DT_TEXTREL, which it
    doesn?t).

    By ?abuse?, I mean: OpenSBI is neither a Linux kernel nor something
    running in Linux userspace, therefore using a riscv64-linux-gnu triple
    is categorically wrong. However, people are lazy so reuse their Linux
    toolchains rather than building a whole new bare-metal toolchain to
    compile bare-metal applications. FW_PIC support then gets added and
    appears to work because people are incorrectly using Linux toolchains,
    and anyone using a bare-metal toolchain still sees the build succeeding
    and the binary boot just fine *unless they load it to a different
    location, at which point there are no relocations for OpenSBI to
    process and relocate itself*. Thus, using a Linux toolchain becomes a
    *requirement*, despite the fact that the README only documents
    riscv64-unknown-elf as an expected prefix and a Linux toolchain should
    never have been permitted in the first place.

    In my opinion, FW_PIC as it stands is broken by design without proper
    toolchain support. If you want to still support it with Linux toolchains
    despite the fact that shouldn?t be a thing you?re allowed to use then
    fine, but if a bare-metal toolchain is used OpenSBI should error out if
    you ever try to enable FW_PIC (and default it to off) because that will
    silently produce a non-PIE binary.

I totally disagree that FW_PIC is broken. There is no restriction on users
to use a particular type of toolchain with OpenSBI. Lot of people use same
toolchain to compile Linux kernel, RootFS, U-Boot, and OpenSBI and there
is nothing wrong in it. We can't expect people to use special toolchain just
for OpenSBI.

What is missing is a check in Makefile for toolchain PIC support when
FW_PIC is enabled.

Regards,
Anup

    Jess


    -- 
    opensbi mailing list
    opensbi at lists.infradead.org
    http://lists.infradead.org/mailman/listinfo/opensbi

