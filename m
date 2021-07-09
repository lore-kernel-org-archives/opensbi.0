From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri,  9 Jul 2021 05:12:10 +0100
Subject: [PATCH v3 0/3] Fully support standalone Clang/LLVM toolchains
Message-ID: <20210709041213.11883-1-jrtc27@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series is comprised of three parts.

The first patch fixes a warning seen when building with LLVM due to a
bogus combination of assembly directives.

The second patch adds build system support for using Clang and LLVM
binutils, provided your Clang is able to locate a libgcc.a in its search
path.

However, pure LLVM toolchains do not use libgcc, they use compiler-rt
(libclang_rt.builtins.<arch>.a). We could change the Makefile to not
hard-code -lgcc and instead use -print-libgcc-file-name, but that still
requires a bare metal compiler-rt built for the right -march/-mabi to be
present, which is often not the case. Moreover, we need very little from
libgcc/compiler-rt; RV64 needs nothing, and RV32 only needs 64-bit
division. Thus, the third patch vendors part of FreeBSD's libquad and
stops linking against libgcc entirely, allowing OpenSBI to be built with
just a cross-compiler. This means that building with any distro-provided
LLVM just works, as does compiling with the system Clang compiler and
LLD linker on FreeBSD without any external packages needed (beyond GNU
make).

Changes in v3:
  * Fixed the binding warning seen when building with LLVM
  * Provide a default -target when CROSS_COMPILE isn't set so the
    variable isn't normally required to be set when cross-compiling with
    LLVM (but is still honoured if set).
  * Pass -fuse=bfd when not using LLD to ensure an ld.bfd gets correctly
    picked up over a plain ld when ld is LLD. Now we always explicitly
    request Clang and GCC use the linker type corresponding to LD. This
    allows BFD to be used on FreeBSD for testing purposes despite LLD
    being the system linker.

Changes in v2:
  * Add documentation to README.md
  * Pass -fuse-ld=lld to Clang when using LLD
  * Modify commit message of first commit to explain -N -> -Wl,-N change
  * Bring back the old ?= uses for the non-CROSS_COMPILE (and, now,
    non-LLVM) case; whilst I still think that's how it should be, it's
    not required for this patch, just related cleanup I did to reduce
    the complexity of adding the LLVM case.

Jessica Clarke (3):
  fw_base: Don't mark fw_platform_init as both global and weak
  Makefile: Support building with Clang and LLVM binutils
  Drop dependency on libgcc by importing part of FreeBSD's libquad

 Makefile                              |  65 +++++-
 README.md                             |  43 +++-
 firmware/fw_base.S                    |   1 -
 lib/utils/libquad/divdi3.c            |  64 ++++++
 lib/utils/libquad/include/limits.h    |  12 ++
 lib/utils/libquad/include/sys/cdefs.h |  12 ++
 lib/utils/libquad/include/sys/types.h |  25 +++
 lib/utils/libquad/moddi3.c            |  66 ++++++
 lib/utils/libquad/objects.mk          |  14 ++
 lib/utils/libquad/qdivrem.c           | 278 ++++++++++++++++++++++++++
 lib/utils/libquad/quad.h              | 105 ++++++++++
 lib/utils/libquad/udivdi3.c           |  52 +++++
 lib/utils/libquad/umoddi3.c           |  54 +++++
 13 files changed, 782 insertions(+), 9 deletions(-)
 create mode 100644 lib/utils/libquad/divdi3.c
 create mode 100644 lib/utils/libquad/include/limits.h
 create mode 100644 lib/utils/libquad/include/sys/cdefs.h
 create mode 100644 lib/utils/libquad/include/sys/types.h
 create mode 100644 lib/utils/libquad/moddi3.c
 create mode 100644 lib/utils/libquad/objects.mk
 create mode 100644 lib/utils/libquad/qdivrem.c
 create mode 100644 lib/utils/libquad/quad.h
 create mode 100644 lib/utils/libquad/udivdi3.c
 create mode 100644 lib/utils/libquad/umoddi3.c

-- 
2.31.0


