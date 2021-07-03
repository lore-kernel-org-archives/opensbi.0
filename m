From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sat,  3 Jul 2021 18:56:05 +0100
Subject: [PATCH 0/2] Fully support standalone Clang/LLVM toolchains
Message-ID: <20210703175607.92532-1-jrtc27@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series is comprised of two parts.

The first patch adds build system support for using Clang and LLVM
binutils, provided your Clang is able to locate a libgcc.a in its search
path.

However, pure LLVM toolchains do not use libgcc, they use compiler-rt
(libclang_rt.builtins.<arch>.a). We could change the Makefile to not
hard-code -lgcc and instead use -print-libgcc-file-name, but that still
requires a bare metal compiler-rt built for the right -march/-mabi to be
present, which is often not the case. Moreover, we need very little from
libgcc/compiler-rt; RV64 needs nothing, and RV32 only needs 64-bit
division. Thus, the second patch vendors part of FreeBSD's libquad and
stops linking against libgcc entirely, allowing OpenSBI to be built with
just a cross-compiler. This means that building with any distro-provided
LLVM just works, as does compiling with the system Clang compiler and
LLD linker on FreeBSD without any external packages needed (beyond GNU
make).

Jessica Clarke (2):
  Makefile: Support building with Clang and LLVM binutils
  Drop dependency on libgcc by importing part of FreeBSD's libquad

 Makefile                              |  59 ++++--
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
 11 files changed, 729 insertions(+), 12 deletions(-)
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


