From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Oct 2020 10:03:34 +0530
Subject: [PATCH] Makefile: Don't specify mabi or march
In-Reply-To: <CAAhSdy0nB1ydfPznXrS2UnhuZFGK6p01-H5LBkZkD+2Ce7b5Kw@mail.gmail.com>
References: <20201019224108.99481-1-alistair.francis@wdc.com>
 <CAAhSdy0nB1ydfPznXrS2UnhuZFGK6p01-H5LBkZkD+2Ce7b5Kw@mail.gmail.com>
Message-ID: <CAAhSdy3+bvE+FR+Dgu3XnMQUcN4Q0R2v8J8pc_LL6CNh_dGaTQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 20, 2020 at 9:22 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Oct 20, 2020 at 4:22 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > To avoid
> >     can't link double-float modules with soft-float modules
> > errors when building 32-bit openSBI don't specify mabi or march.
>
> We have a lot of users (including me) who use multilib toolchain to compile
> OpenSBI for desired mabi and march. In fact, I have one common toolchain
> for ilp32, ilp32d, lp64, and lp64d.
>
> By removing "-mabi" and "-march", we are enforcing users to depend on
> default mabi and march of toolchain. This means we can't use multilib
> toolchain for OpenSBI.
>
> I would suggest to add a separate makefile option (e.g.
> PLATFORM_USE_TOOLCHAIN_MABI, PLATFORM_USE_TOOLCHAIN_MARCH)
> which when enabled will skip specifying "-mabi" and "-march" in various
> compiler/assembler/linker flags.

Here's a change which will work for your case as well as with multilib
toolchains:


diff --git a/Makefile b/Makefile
index a231881..dd5f4ce 100644
--- a/Makefile
+++ b/Makefile
@@ -94,6 +94,8 @@ DTC           =       dtc

 # Guess the compillers xlen
 OPENSBI_CC_XLEN := $(shell TMP=`$(CC) -dumpmachine | sed
's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
+OPENSBI_CC_ABI := $(shell TMP=`$(CC) -v 2>&1 | sed -n
's/.*\(with\-abi=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
+OPENSBI_CC_ISA := $(shell TMP=`$(CC) -v 2>&1 | sed -n
's/.*\(with\-arch=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})

 # Setup platform XLEN
 ifndef PLATFORM_RISCV_XLEN
@@ -143,14 +145,22 @@ deps-y+=$(firmware-objs-path-y:.o=.dep)

 # Setup platform ABI, ISA and Code Model
 ifndef PLATFORM_RISCV_ABI
-  ifeq ($(PLATFORM_RISCV_XLEN), 32)
-    PLATFORM_RISCV_ABI = ilp$(PLATFORM_RISCV_XLEN)
+  ifndef PLATFORM_USE_TOOLCHAIN_ABI
+    ifeq ($(PLATFORM_RISCV_XLEN), 32)
+      PLATFORM_RISCV_ABI = ilp$(PLATFORM_RISCV_XLEN)
+    else
+      PLATFORM_RISCV_ABI = lp$(PLATFORM_RISCV_XLEN)
+    endif
   else
-    PLATFORM_RISCV_ABI = lp$(PLATFORM_RISCV_XLEN)
+    PLATFORM_RISCV_ABI = $(OPENSBI_CC_ABI)
   endif
 endif
 ifndef PLATFORM_RISCV_ISA
-  PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc
+  ifndef PLATFORM_USE_TOOLCHAIN_ISA
+    PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc
+  else
+    PLATFORM_RISCV_ISA = $(OPENSBI_CC_ISA)
+  endif
 endif
 ifndef PLATFORM_RISCV_CODE_MODEL
   PLATFORM_RISCV_CODE_MODEL = medany


Regards,
Anup

>
> Regards,
> Anup
>
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  Makefile | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index a231881..3f819d9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -196,7 +196,6 @@ GENFLAGS    +=      $(firmware-genflags-y)
> >  CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
> >  CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> >  CFLAGS         +=      -mno-save-restore -mstrict-align
> > -CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> >  CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> >  CFLAGS         +=      $(GENFLAGS)
> >  CFLAGS         +=      $(platform-cflags-y)
> > @@ -210,7 +209,6 @@ CPPFLAGS    +=      $(firmware-cppflags-y)
> >  ASFLAGS                =       -g -Wall -nostdlib -D__ASSEMBLY__
> >  ASFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> >  ASFLAGS                +=      -mno-save-restore -mstrict-align
> > -ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> >  ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> >  ASFLAGS                +=      $(GENFLAGS)
> >  ASFLAGS                +=      $(platform-asflags-y)
> > --
> > 2.28.0
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

