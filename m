From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Wed, 21 Oct 2020 00:55:46 +0000
Subject: [PATCH] Makefile: Don't specify mabi or march
In-Reply-To: <4DA494CC-CB3D-427B-966E-3A59DE7722A9@jrtc27.com>
References: <20201019224108.99481-1-alistair.francis@wdc.com>
 <86597E3E-0796-48AA-9FB1-665A2E7A9102@jrtc27.com>
 <27758a2d4af9da67e8740577cc71d0595bbb6f11.camel@wdc.com>
 <9CE3772E-7817-45AB-BF84-304E0FCA3423@jrtc27.com>
 <ebad7c513b7450d143556bc8af629cf46187e2c9.camel@wdc.com>
 <4DA494CC-CB3D-427B-966E-3A59DE7722A9@jrtc27.com>
Message-ID: <a708b537e43b3818673ad58ca35c3f523fbf5be6.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-20 at 00:38 +0100, Jessica Clarke wrote:
> On 20 Oct 2020, at 00:32, Alistair Francis <Alistair.Francis@wdc.com>
> wrote:
> > On Tue, 2020-10-20 at 00:05 +0100, Jessica Clarke wrote:
> > > On 20 Oct 2020, at 00:02, Alistair Francis <
> > > alistair.francis at wdc.com>
> > > wrote:
> > > > On Mon, 2020-10-19 at 23:56 +0100, Jessica Clarke wrote:
> > > > > On 19 Oct 2020, at 23:41, Alistair Francis <
> > > > > alistair.francis at wdc.com>
> > > > > wrote:
> > > > > > To avoid
> > > > > >  can't link double-float modules with soft-float modules
> > > > > > errors when building 32-bit openSBI don't specify mabi or
> > > > > > march.
> > > > > 
> > > > > What happens if you want to build for a different ABI or ISA
> > > > > string
> > > > > deliberately? Especially with something like Clang where
> > > > > every
> > > > > compiler
> > > > > is a cross-compiler. Users should be able to specify an ABI
> > > > > or
> > > > > ISA
> > > > > string if they want and have it honoured, either via
> > > > > PLATFORM_RISCV_ABI/ISA or by using += for CFLAGS everywhere
> > > > > rather
> > > > > than
> > > > > overwriting it entirely (which is the more standard thing to
> > > > > do
> > > > > for
> > > > > software that isn't RISC-V-specific).
> > > > 
> > > > A user could do that by specifying their own CFLAGS when
> > > > building
> > > > to
> > > > allow them to specify a ISA or ABI.
> > > 
> > > Makefile:196:CFLAGS		=	-g -Wall -Werror
> > > -ffreestanding
> > > -nostdlib -fno-strict-aliasing -O2
> > 
> > Ah, I didn't realise this. I'll change it to a +=
> 
> Thanks. Same goes for AFLAGS, and I didn't check LDFLAGS etc.
> 
> > > That doesn't work so well with user-supplied CFLAGS.
> > > 
> > > > Currently no platform set PLATFORM_RISCV_ABI as it defaults to
> > > > ilp32 or
> > > > lp64.
> > > 
> > > We do. We have new ABIs for our extension (see cheri-cpu.org).
> > 
> > Ah ok. Maybe it's worth upstreamign the cheri implementaiton then?
> 
> We never really finished it properly and have been stuck on BBL. 

That is annoying.

> Well,
> in theory it works, but it just hasn't seen the same amount of
> testing
> as it's not in day-to-day use. I don't think it makes much sense to
> upstream the very CHERI-specific bits (instructions, configuration,
> etc) since it's ultimately a research architecture for now and we do
> want to be able to make breaking changes, but there may well be 

Agreed, but I'm sure at least some of it could be upstreamed. That
helps us at least build test other platforms.

> things
> we can upstream that make our fork's diff smaller (the nature of the
> architecture and software model means that we routinely find
> integer/pointer confusion in projects and can upstream many of our
> diffs as simple code quality improvements to use the right type). I 

That would be great!

> do
> know it required substantially less hacking than BBL though to get
> something that booted, especially in the build system.

I'm glad to hear that :)

Alistair

> 
> Jess
> 
