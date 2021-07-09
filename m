From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 9 Jul 2021 14:49:03 +0100
Subject: [PATCH v3 0/3] Fully support standalone Clang/LLVM toolchains
In-Reply-To: <1480faa5d70aca5788d8a5f0909aeba9f737b230.camel@126.com>
References: <20210709041213.11883-1-jrtc27@jrtc27.com>
 <1480faa5d70aca5788d8a5f0909aeba9f737b230.camel@126.com>
Message-ID: <F28A4A8F-EC89-484F-9CF3-522CC3237FBC@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Jul 2021, at 14:46, Xiang W <wxjstz@126.com> wrote:
> 
> ? 2021-07-09???? 05:12 +0100?Jessica Clarke???
> I tested these patches. Some bugs reported
> 
> ld.lld: error: can't create dynamic relocation R_RISCV_32 against
> symbol: _fw_start in readonly segment; recompile object files with -
> fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
>>>> defined in
> /home/merle/workspaces/opensbi/build/platform/generic/firmware/fw_dynam
> ic.elf.ld:9
>>>> referenced by fw_base.S:502
> (/home/merle/workspaces/opensbi/firmware/fw_base.S:502)
>>>> 
> /home/merle/workspaces/opensbi/build/platform/generic/firmware/fw_dynam
> ic.o:(.entry+0x3BC)

This was reported by Bin. Don?t use a Linux triple for something that?s
neither the Linux kernel nor a Linux userspace executable/library.

Jess

> Data is stored in the code segment of base.S. Can be fix by:
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index ee2a51b..f8aea05 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -501,6 +501,7 @@ _skip_trap_exit_rv32_hyp:
>        /* We don't expect to reach here hence just hang */
>        j       _start_hang
> 
> +       .data
>        .align 3
> #ifdef FW_PIC
> _runtime_offset:
> 
> 
> 
> 
>> This patch series is comprised of three parts.
>> 
>> The first patch fixes a warning seen when building with LLVM due to a
>> bogus combination of assembly directives.
>> 
>> The second patch adds build system support for using Clang and LLVM
>> binutils, provided your Clang is able to locate a libgcc.a in its
>> search
>> path.
>> 
>> However, pure LLVM toolchains do not use libgcc, they use compiler-rt
>> (libclang_rt.builtins.<arch>.a). We could change the Makefile to not
>> hard-code -lgcc and instead use -print-libgcc-file-name, but that
>> still
>> requires a bare metal compiler-rt built for the right -march/-mabi to
>> be
>> present, which is often not the case. Moreover, we need very little
>> from
>> libgcc/compiler-rt; RV64 needs nothing, and RV32 only needs 64-bit
>> division. Thus, the third patch vendors part of FreeBSD's libquad and
>> stops linking against libgcc entirely, allowing OpenSBI to be built
>> with
>> just a cross-compiler. This means that building with any distro-
>> provided
>> LLVM just works, as does compiling with the system Clang compiler and
>> LLD linker on FreeBSD without any external packages needed (beyond
>> GNU
>> make).
>> 
>> Changes in v3:
>>   * Fixed the binding warning seen when building with LLVM
>>   * Provide a default -target when CROSS_COMPILE isn't set so the
>>     variable isn't normally required to be set when cross-compiling
>> with
>>     LLVM (but is still honoured if set).
>>   * Pass -fuse=bfd when not using LLD to ensure an ld.bfd gets
>> correctly
>>     picked up over a plain ld when ld is LLD. Now we always
>> explicitly
>>     request Clang and GCC use the linker type corresponding to LD.
>> This
>>     allows BFD to be used on FreeBSD for testing purposes despite LLD
>>     being the system linker.
>> 
>> Changes in v2:
>>   * Add documentation to README.md
>>   * Pass -fuse-ld=lld to Clang when using LLD
>>   * Modify commit message of first commit to explain -N -> -Wl,-N
>> change
>>   * Bring back the old ?= uses for the non-CROSS_COMPILE (and, now,
>>     non-LLVM) case; whilst I still think that's how it should be,
>> it's
>>     not required for this patch, just related cleanup I did to reduce
>>     the complexity of adding the LLVM case.
>> 
>> Jessica Clarke (3):
>>   fw_base: Don't mark fw_platform_init as both global and weak
>>   Makefile: Support building with Clang and LLVM binutils
>>   Drop dependency on libgcc by importing part of FreeBSD's libquad
>> 
>>  Makefile                              |  65 +++++-
>>  README.md                             |  43 +++-
>>  firmware/fw_base.S                    |   1 -
>>  lib/utils/libquad/divdi3.c            |  64 ++++++
>>  lib/utils/libquad/include/limits.h    |  12 ++
>>  lib/utils/libquad/include/sys/cdefs.h |  12 ++
>>  lib/utils/libquad/include/sys/types.h |  25 +++
>>  lib/utils/libquad/moddi3.c            |  66 ++++++
>>  lib/utils/libquad/objects.mk          |  14 ++
>>  lib/utils/libquad/qdivrem.c           | 278
>> ++++++++++++++++++++++++++
>>  lib/utils/libquad/quad.h              | 105 ++++++++++
>>  lib/utils/libquad/udivdi3.c           |  52 +++++
>>  lib/utils/libquad/umoddi3.c           |  54 +++++
>>  13 files changed, 782 insertions(+), 9 deletions(-)
>>  create mode 100644 lib/utils/libquad/divdi3.c
>>  create mode 100644 lib/utils/libquad/include/limits.h
>>  create mode 100644 lib/utils/libquad/include/sys/cdefs.h
>>  create mode 100644 lib/utils/libquad/include/sys/types.h
>>  create mode 100644 lib/utils/libquad/moddi3.c
>>  create mode 100644 lib/utils/libquad/objects.mk
>>  create mode 100644 lib/utils/libquad/qdivrem.c
>>  create mode 100644 lib/utils/libquad/quad.h
>>  create mode 100644 lib/utils/libquad/udivdi3.c
>>  create mode 100644 lib/utils/libquad/umoddi3.c
>> 
>> -- 
>> 2.31.0
>> 
>> 
> 
> 


