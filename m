From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 8 Jul 2021 18:16:33 +0100
Subject: [PATCH 1/2] Makefile: Support building with Clang and LLVM
 binutils
In-Reply-To: <CAAhSdy23rk=i3uk=LbmYZmv+3ZfG75+1vTTpPv4fr_-H7aMuOA@mail.gmail.com>
References: <20210703175607.92532-1-jrtc27@jrtc27.com>
 <20210703175607.92532-2-jrtc27@jrtc27.com>
 <CAEUhbmV_0-01B7x750yyDd_A9k91TPjtN0Jn6BfeE1u43FqQJQ@mail.gmail.com>
 <CAAhSdy23rk=i3uk=LbmYZmv+3ZfG75+1vTTpPv4fr_-H7aMuOA@mail.gmail.com>
Message-ID: <077E395B-CA6C-472D-B060-0C4F45CB2858@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6 Jul 2021, at 09:33, Anup Patel <anup@brainfault.org> wrote:
> 
> On Mon, Jul 5, 2021 at 6:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> 
>> On Sun, Jul 4, 2021 at 1:56 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>> 
>>> This is intended to mirror the Linux kernel. Building with CC=clang will
>>> use Clang as the compiler but default to using the existing binutils.
>>> Building with LLVM=1 will default to using Clang and LLVM binutils.
>>> 
>>> Note that the ifdef CROSS_COMPILE is removed, since it served little
>>> purpose. Variables assigned with = are still overridable on the command
>>> line, the only difference compared with ?= is whether environment
>>> variables also override them, but that's not something Kbuild-using
>>> projects usually support (at least Linux and U-Boot both unconditionally
>>> use = like this now does).
>>> 
>> 
>> Please update the documentation for how to use LLVM to build as well.
> 
> Yes, we will need some documentation about building with LLVM. If you don't
> want to add it as part of this series then some of us can add it separately.

I can add some basic documentation in a v2.

>>> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
>>> ---
>>> Makefile | 59 ++++++++++++++++++++++++++++++++++++++++++++------------
>>> 1 file changed, 47 insertions(+), 12 deletions(-)
>>> 
>>> diff --git a/Makefile b/Makefile
>>> index 6b64205..40bcab6 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -76,26 +76,47 @@ OPENSBI_VERSION_MINOR=`grep "define OPENSBI_VERSION_MINOR" $(include_dir)/sbi/sb
>>> OPENSBI_VERSION_GIT=$(shell if [ -d $(src_dir)/.git ]; then git describe 2> /dev/null; fi)
>>> 
>>> # Setup compilation commands
>>> -ifdef CROSS_COMPILE
>>> +ifneq ($(LLVM),)
>>> +CC             =       clang
>>> +AR             =       llvm-ar
>>> +LD             =       ld.lld
>>> +OBJCOPY                =       llvm-objcopy
>>> +else
>>> CC             =       $(CROSS_COMPILE)gcc
>>> -CPP            =       $(CROSS_COMPILE)cpp
>>> AR             =       $(CROSS_COMPILE)ar
>>> LD             =       $(CROSS_COMPILE)ld
>>> OBJCOPY                =       $(CROSS_COMPILE)objcopy
>>> -else
>>> -CC             ?=      gcc
>>> -CPP            ?=      cpp
>>> -AR             ?=      ar
>>> -LD             ?=      ld
>>> -OBJCOPY                ?=      objcopy
>>> endif
>>> +CPP            =       $(CC) -E
>>> AS             =       $(CC)
>>> DTC            =       dtc
> 
> There were build issues reported by yocto folks so we had to
> bring-in "?=" assignments.
> 
> How about this ....
> 
> ifneq ($(LLVM),)
> CC             =       clang
> AR             =       llvm-ar
> LD             =       ld.lld
> OBJCOPY                =       llvm-objcopy
> else
> CC             ?=       $(CROSS_COMPILE)gcc
> AR             ?=       $(CROSS_COMPILE)ar
> LD             ?=       $(CROSS_COMPILE)ld
> OBJCOPY               ?=       $(CROSS_COMPILE)objcopy
> endif
> CPP         =   $(CC) -E

Well, that then reverts 2e5ede82796960435fff80b27b21dfb399d2e2fb which
deliberately stopped using ?= for the non-CROSS_COMPILE case. But the
fact that Yocto was seeing build issues makes me think they?re doing
something wrong, to be honest. Linux does = not ?= and Yocto can build
Linux fine, and it?s always been make CC=foo not CC=foo make as the
standard way to override these things. I don?t see anything in
opensbi_0.9.bb that messes with these variables; do you have a pointer
to reports of the issue? Perhaps whatever was happening several years
ago has since been fixed? I can add back the existing code for the
non-LLVM case but it?d be nicer to drop it unless someone can
demonstrate it?s still needed...

>>> -# Guess the compillers xlen
>>> -OPENSBI_CC_XLEN := $(shell TMP=`$(CC) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
>>> +ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>>> +CC_IS_CLANG    =       y
>>> +else
>>> +CC_IS_CLANG    =       n
>>> +endif
>>> +
>>> +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
>>> +LD_IS_LLD      =       y
>>> +else
>>> +LD_IS_LLD      =       n
>>> +endif
>>> +
>>> +ifeq ($(CC_IS_CLANG),y)
>>> +ifneq ($(CROSS_COMPILE),)
>>> +CLANG_TARGET   =       -target $(notdir $(CROSS_COMPILE:%-=%))
>>> +endif
>>> +endif
>>> +
>>> +# Guess the compiler's XLEN
>>> +OPENSBI_CC_XLEN := $(shell TMP=`$(CC) $(CLANG_TARGET) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
>>> +
>>> +# Guess the compiler's ABI and ISA
>>> +ifneq ($(CC_IS_CLANG),y)
>>> OPENSBI_CC_ABI := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-abi=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
>>> OPENSBI_CC_ISA := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-arch=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
>>> +endif
>>> 
>>> # Setup platform XLEN
>>> ifndef PLATFORM_RISCV_XLEN
>>> @@ -194,7 +215,11 @@ else
>>> endif
>>> 
>>> # Setup compilation commands flags
>>> -GENFLAGS       =       -I$(platform_src_dir)/include
>>> +ifeq ($(CC_IS_CLANG),y)
>>> +GENFLAGS       +=      $(CLANG_TARGET)
>>> +GENFLAGS       +=      -Wno-unused-command-line-argument
>>> +endif
>>> +GENFLAGS       +=      -I$(platform_src_dir)/include
>>> GENFLAGS       +=      -I$(include_dir)
>>> ifneq ($(OPENSBI_VERSION_GIT),)
>>> GENFLAGS       +=      -DOPENSBI_VERSION_GIT="\"$(OPENSBI_VERSION_GIT)\""
>>> @@ -208,6 +233,9 @@ CFLAGS              +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>>> CFLAGS         +=      -mno-save-restore -mstrict-align
>>> CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>>> CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>>> +ifeq ($(LD_IS_LLD),y)
>>> +CFLAGS         +=      -mno-relax
>>> +endif
>>> CFLAGS         +=      $(GENFLAGS)
>>> CFLAGS         +=      $(platform-cflags-y)
>>> CFLAGS         +=      -fno-pie -no-pie
>>> @@ -222,18 +250,25 @@ ASFLAGS           +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>>> ASFLAGS                +=      -mno-save-restore -mstrict-align
>>> ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>>> ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>>> +ifeq ($(LD_IS_LLD),y)
>>> +ASFLAGS                +=      -mno-relax
>>> +endif
>>> ASFLAGS                +=      $(GENFLAGS)
>>> ASFLAGS                +=      $(platform-asflags-y)
>>> ASFLAGS                +=      $(firmware-asflags-y)
>>> 
>>> ARFLAGS                =       rcs
>>> 
>>> -ELFFLAGS       +=      -Wl,--build-id=none -N -static-libgcc -lgcc
>>> +ELFFLAGS       +=      -Wl,--build-id=none -Wl,-N -static-libgcc -lgcc
>> 
>> This looks like an irrelevant bug fix?
> 
> I think it makes sense to keep this change here because it is required for
> clang support and this patch adds clang support.
> 
> It will be certainly good to have one sentence in the commit description
> describing this change. No need to have a separate patch for this change.

Sure, will add in v2.

Jess


