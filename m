From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 11 Jul 2021 15:46:54 +0100
Subject: [PATCH v5 5/6] Makefile: Support building with Clang and LLVM
 binutils
In-Reply-To: <CAEUhbmUj_W5oCjFioDUHyHc998p1_0LvPuEZkT5tZRLkmZhOpw@mail.gmail.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
 <20210711022824.29915-6-jrtc27@jrtc27.com>
 <CAEUhbmUj_W5oCjFioDUHyHc998p1_0LvPuEZkT5tZRLkmZhOpw@mail.gmail.com>
Message-ID: <DAE5C3C5-1B59-4474-AE42-AA48816205D8@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11 Jul 2021, at 15:26, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> On Sun, Jul 11, 2021 at 10:29 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> This is intended to mirror the Linux kernel. Building with CC=clang will
>> use Clang as the compiler but default to using the existing binutils.
>> Building with LLVM=1 will default to using Clang and LLVM binutils.
>> 
>> Whilst GCC will accept the -N linker option and forward it on to the
>> linker, Clang will not, and so in order to support both compilers we
>> must use -Wl, to forward it to the linker as is required for most other
>> linker options.
>> 
>> Note that there is currently a bug when using Clang as the compiler and
>> riscv64-linux-gnu-ld as the linker for FW_PIC=y. At first glance this
>> appears to be a bug in GNU binutils, but this could also be Clang or
>> OpenSBI at fault in some subtle way. Thus, for now, advise that this
>> combination be avoided.
>> 
>> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
>> ---
>> Makefile  | 66 +++++++++++++++++++++++++++++++++++++++++++++++++------
>> README.md | 48 ++++++++++++++++++++++++++++++++++++++--
>> 2 files changed, 105 insertions(+), 9 deletions(-)
>> 
>> diff --git a/Makefile b/Makefile
>> index ba06313..5c188d5 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -76,26 +76,54 @@ OPENSBI_VERSION_MINOR=`grep "define OPENSBI_VERSION_MINOR" $(include_dir)/sbi/sb
>> OPENSBI_VERSION_GIT=$(shell if [ -d $(src_dir)/.git ]; then git describe 2> /dev/null; fi)
>> 
>> # Setup compilation commands
>> +ifneq ($(LLVM),)
>> +CC             =       clang
>> +AR             =       llvm-ar
>> +LD             =       ld.lld
>> +OBJCOPY                =       llvm-objcopy
>> +else
>> ifdef CROSS_COMPILE
>> CC             =       $(CROSS_COMPILE)gcc
>> -CPP            =       $(CROSS_COMPILE)cpp
>> AR             =       $(CROSS_COMPILE)ar
>> LD             =       $(CROSS_COMPILE)ld
>> OBJCOPY                =       $(CROSS_COMPILE)objcopy
>> else
>> CC             ?=      gcc
>> -CPP            ?=      cpp
>> AR             ?=      ar
>> LD             ?=      ld
>> OBJCOPY                ?=      objcopy
>> endif
>> +endif
>> +CPP            =       $(CC) -E
>> AS             =       $(CC)
>> DTC            =       dtc
>> 
>> -# Guess the compillers xlen
>> -OPENSBI_CC_XLEN := $(shell TMP=`$(CC) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
>> +ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>> +CC_IS_CLANG    =       y
>> +else
>> +CC_IS_CLANG    =       n
>> +endif
>> +
>> +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
>> +LD_IS_LLD      =       y
>> +else
>> +LD_IS_LLD      =       n
>> +endif
>> +
>> +ifeq ($(CC_IS_CLANG),y)
>> +ifneq ($(CROSS_COMPILE),)
>> +CLANG_TARGET   =       --target=$(notdir $(CROSS_COMPILE:%-=%))
>> +endif
>> +endif
>> +
>> +# Guess the compiler's XLEN
>> +OPENSBI_CC_XLEN := $(shell TMP=`$(CC) $(CLANG_TARGET) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
>> +
>> +# Guess the compiler's ABI and ISA
>> +ifneq ($(CC_IS_CLANG),y)
>> OPENSBI_CC_ABI := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-abi=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
>> OPENSBI_CC_ISA := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-arch=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
>> +endif
>> 
>> # Setup platform XLEN
>> ifndef PLATFORM_RISCV_XLEN
>> @@ -106,8 +134,21 @@ ifndef PLATFORM_RISCV_XLEN
>>   endif
>> endif
>> 
>> +ifeq ($(CC_IS_CLANG),y)
>> +ifeq ($(CROSS_COMPILE),)
>> +CLANG_TARGET   =       --target=riscv$(PLATFORM_RISCV_XLEN)-unknown-elf
>> +endif
>> +endif
>> +
>> +ifeq ($(LD_IS_LLD),y)
>> +RELAX_FLAG     =       -mno-relax
>> +USE_LD_FLAG    =       -fuse-ld=lld
>> +else
>> +USE_LD_FLAG    =       -fuse-ld=bfd
>> +endif
>> +
>> # Check whether the linker supports creating PIEs
>> -OPENSBI_LD_PIE := $(shell $(CC) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
>> +OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
> 
> It looks like this combination does not work? Both
> riscv64-unknown-elf-gcc and LLVM are in my $PATH, but ld.lld cannot be
> located.
> 
> $ riscv64-unknown-elf-gcc -fPIE -fuse-ld=lld -nostdlib -Wl,-pie -x c
> /dev/null -o /dev/null 2>&1
> collect2: fatal error: cannot find 'ld'
> compilation terminated.
> 
> So this will result in a PDE image, even though LLD supports PIE.

Isn?t this the same issue as you reported elsewhere, and will
ultimately result in the same error, this time not suppressed, at link
time too? Using GCC as a driver for LLD has always been a painful
combination, in part because historically there?s been very little
interest in supporting it from the GNU side; it wasn?t until a few
years ago (I think late 2018 or early 2019?) that -fuse-ld=lld was even
accepted as an option, and that was just a minimal patch that reused
all the logic for BFD and gold despite the fact that that?s
unnecessarily restrictive for LLD and doesn?t support cases like this
properly.

Jess


