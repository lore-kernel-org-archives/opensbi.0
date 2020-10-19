From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Mon, 19 Oct 2020 23:02:51 +0000
Subject: [PATCH] Makefile: Don't specify mabi or march
In-Reply-To: <86597E3E-0796-48AA-9FB1-665A2E7A9102@jrtc27.com>
References: <20201019224108.99481-1-alistair.francis@wdc.com>
 <86597E3E-0796-48AA-9FB1-665A2E7A9102@jrtc27.com>
Message-ID: <27758a2d4af9da67e8740577cc71d0595bbb6f11.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 23:56 +0100, Jessica Clarke wrote:
> On 19 Oct 2020, at 23:41, Alistair Francis <alistair.francis@wdc.com>
> wrote:
> > To avoid
> >    can't link double-float modules with soft-float modules
> > errors when building 32-bit openSBI don't specify mabi or march.
> 
> What happens if you want to build for a different ABI or ISA string
> deliberately? Especially with something like Clang where every
> compiler
> is a cross-compiler. Users should be able to specify an ABI or ISA
> string if they want and have it honoured, either via
> PLATFORM_RISCV_ABI/ISA or by using += for CFLAGS everywhere rather
> than
> overwriting it entirely (which is the more standard thing to do for
> software that isn't RISC-V-specific).

A user could do that by specifying their own CFLAGS when building to
allow them to specify a ISA or ABI.

Currently no platform set PLATFORM_RISCV_ABI as it defaults to ilp32 or
lp64.

No platform also sets PLATFORM_RISCV_ISA which is always rv32/64imafdc.

Alistair

> 
> Jess
> 
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > Makefile | 2 --
> > 1 file changed, 2 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index a231881..3f819d9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -196,7 +196,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
> > CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib
> > -fno-strict-aliasing -O2
> > CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-
> > sibling-calls
> > CFLAGS		+=	-mno-save-restore -mstrict-align
> > -CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI)
> > -march=$(PLATFORM_RISCV_ISA)
> > CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> > CFLAGS		+=	$(GENFLAGS)
> > CFLAGS		+=	$(platform-cflags-y)
> > @@ -210,7 +209,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
> > ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
> > ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-
> > sibling-calls
> > ASFLAGS		+=	-mno-save-restore -mstrict-align
> > -ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI)
> > -march=$(PLATFORM_RISCV_ISA)
> > ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> > ASFLAGS		+=	$(GENFLAGS)
> > ASFLAGS		+=	$(platform-asflags-y)
> > -- 
> > 2.28.0
> > 
> > 
> > -- 
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
