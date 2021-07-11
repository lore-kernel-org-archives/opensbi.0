From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 11 Jul 2021 03:28:18 +0100
Subject: [PATCH v5 0/6] Fully support standalone Clang/LLVM toolchains
Message-ID: <20210711022824.29915-1-jrtc27@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series is comprised of six parts.

The first patch fixes a warning seen when building with LLVM due to a
bogus combination of assembly directives.

The second patch fixes errors seen when trying to build OpenSBI as a
position-independent binary using LLD that may or may not be an LLD bug
(the exact meaning of -N/--omagic isn't clear) but can easily be worked
around without any issue either way.

The third patch bypasses the Clang driver's helpful nature of not
honouring -pie for bare-metal binaries as it's normally not something
you want (arguably that should be an error though, or passed on, since
just giving a -Wunused-command-line-argument warning can get lost, and
may be disabled).

The fourth patch fixes the FW_PIC support added recently to be disabled
by default when unsupported, since bare-metal GNU ld does not support
PIE and so currently building with a bare-metal GNU ld will fail unless
FW_PIC is manually disabled. Disabling FW_PIC is suboptimal but restores
the pre-FW_PIC behaviour so is no longer a regression.

The fifth patch adds build system support for using Clang and LLVM
binutils, provided your Clang is able to locate a libgcc.a in its search
path.

However, pure LLVM toolchains do not use libgcc, they use compiler-rt
(libclang_rt.builtins.<arch>.a). We could change the Makefile to not
hard-code -lgcc and instead use -print-libgcc-file-name, but that still
requires a bare metal compiler-rt built for the right -march/-mabi to be
present, which is often not the case. Moreover, we need very little from
libgcc/compiler-rt; RV64 needs nothing, and RV32 only needs 64-bit
division. Thus, the sixth patch vendors part of FreeBSD's libquad and
stops linking against libgcc entirely, allowing OpenSBI to be built with
just a cross-compiler. This means that building with any distro-provided
LLVM just works, as does compiling with the system Clang compiler and
LLD linker on FreeBSD without any external packages needed (beyond GNU
make).

Note that using Clang with the current bleeding-edge riscv64 glibc
toolchain from Bootlin's linker is currently broken; around 60
relocations, or about a third of the number expected, go missing, with a
big gap in the relocations emitted, causing various global data
structures to not be correctly initialised. In particular, root's
possible_harts and regions fields lose their relocations during linking
so are left as NULL, causing sanitize_domain to immediately fail with
SBI_EINVAL. The relocations exist in the object files and look
completely sane so this appears to be a GNU ld bug, but I have not
narrowed it down enough to be sure it's not something weird that OpenSBI
or Clang are doing. I do not think this should be a blocker, and have
added a note about this currently-broken combination to the README.

Changes in v5:
 * Disable FW_PIC by default when unsupported
 * Pulled out -mno-relax and -fuse-ld flags into variables for reusing
   in the code for the above change, and to deduplicate the existing
   -mno-relax code
 * Note in the README that riscv64-linux-gnu-ld + Clang is currently
   broken due to what appears to be a GNU ld bug

Changes in v4:
 * Avoid read-only dynamic relocation error with LLD
 * Support FW_PIC with LLD when using a bare-metal triple

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

Jessica Clarke (6):
  fw_base: Don't mark fw_platform_init as both global and weak
  fw_base: Put data in .data rather than .text
  firmware: Explicitly pass -pie to the linker, not just the driver
  firmware: Only default FW_PIC to y if supported
  Makefile: Support building with Clang and LLVM binutils
  Drop dependency on libgcc by importing part of FreeBSD's libquad

 Makefile                              |  67 ++++++-
 README.md                             |  48 ++++-
 firmware/fw_base.S                    |   2 +-
 firmware/objects.mk                   |   4 +-
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
 14 files changed, 792 insertions(+), 11 deletions(-)
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


