From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jul 2021 12:47:02 +0530
Subject: [PATCH 0/2] Fully support standalone Clang/LLVM toolchains
In-Reply-To: <CAEUhbmVn9egqR-FvJE9aL1dZrJ5c-YYV-s18fpCmrQ9rCP_tSw@mail.gmail.com>
References: <20210703175607.92532-1-jrtc27@jrtc27.com>
 <CAEUhbmU65LjUkaDwZve=vj5EqSTYO5yJUAKf8_3Eq85LF-b_1Q@mail.gmail.com>
 <CAAhSdy1UqFK872A4YOscv5_k6+2S0Q-_Ehg143GFpTMgorRydg@mail.gmail.com>
 <CAEUhbmVn9egqR-FvJE9aL1dZrJ5c-YYV-s18fpCmrQ9rCP_tSw@mail.gmail.com>
Message-ID: <CAAhSdy2PhD4QZ69Lbj5OFwOD6qHKVrzSOsG3MimmsA=RKzhB5g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 6, 2021 at 12:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Jul 6, 2021 at 2:47 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jul 5, 2021 at 6:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Sun, Jul 4, 2021 at 1:56 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> > > >
> > > > This patch series is comprised of two parts.
> > > >
> > > > The first patch adds build system support for using Clang and LLVM
> > > > binutils, provided your Clang is able to locate a libgcc.a in its search
> > > > path.
> > > >
> > > > However, pure LLVM toolchains do not use libgcc, they use compiler-rt
> > > > (libclang_rt.builtins.<arch>.a). We could change the Makefile to not
> > > > hard-code -lgcc and instead use -print-libgcc-file-name, but that still
> > > > requires a bare metal compiler-rt built for the right -march/-mabi to be
> > > > present, which is often not the case. Moreover, we need very little from
> > > > libgcc/compiler-rt; RV64 needs nothing, and RV32 only needs 64-bit
> > > > division. Thus, the second patch vendors part of FreeBSD's libquad and
> > > > stops linking against libgcc entirely, allowing OpenSBI to be built with
> > > > just a cross-compiler. This means that building with any distro-provided
> > > > LLVM just works, as does compiling with the system Clang compiler and
> > > > LLD linker on FreeBSD without any external packages needed (beyond GNU
> > > > make).
> > >
> > > I am concerned about removing libgcc. If we want to support running
> > > OpenSBI on a processor without M extension, it would require us to
> > > link with libgcc, or compiler-rt.
> >
> > We have mandated rv32ima or rv64ima as minimal requirement in
> > docs/platform_requirements.md. The 'I', 'M' and 'A' are very fundamental
> > extensions and we don't want to emulate these extensions in OpenSBI.
> >
>
> I don't understand why we have to emulate 'M' or 'A' in OpenSBI. It's
> perfectly okay to run OpenSBI in a uniprocessor environment, all the
> way up to the operating system which is configured to UP mode. No 'A'
> extension will be used in the software stack hence no need to emulate
> 'A'.

There was a proposal in the past to have 'A' emulated in OpenSBI
using LR/SC instructions so we had to define a minimal requirement
from platform support in OpenSBI.

The rv32ima and rv64ima requirements came as a subset of
requirements enforced by general purpose OSes (like Linux). In fact,
Linux RISC-V makefile mandates rv32ima or rv64ima as minimal
requirement and there is "NO WAY" to disable 'A' for Linux RISC-V.

I think it makes sense to mandate 'A' for UP systems as well because
'A' instructions can be used by user-space apps on UP systems for
inter-thread synchronization. If 'A' is not mandated for a UP system
then user-space apps will have to detect and use 'A' instructions or
LR/SC whichever is available.

Regards,
Anup

>
> > Further, a platform must support rv32gc or rv64gc to have platform
> > firmware binaries as-part of OpenSBI release tarball. If a platform
> > supports rv32ima or rv64ima but does not support rv32gc or rv64gc
> > then users have to compile platform firmware binaries from sources.
> >
> > I think we are okay removing dependency on libgcc. since it allows
> > us to have llvm toolchain support in OpenSBI. Overall, I am quite
> > happy with this series.
> >
> > Is there a pre-built llvm risc-v toolchain ?? or steps to create one ??
> >
> > The BSD-2-clause is compatible with the BSD-3-clause used by
> > PATCH2. Am I correct ?
> >
> > I hope we don't need to specifically mention anything in the
> > "Copyright and License" section of the top-level README.md
> > for BSD-3-clause licensed code ??
>
> Regards,
> Bin

