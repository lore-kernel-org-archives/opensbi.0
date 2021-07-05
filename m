From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 5 Jul 2021 14:35:47 +0100
Subject: [PATCH 0/2] Fully support standalone Clang/LLVM toolchains
In-Reply-To: <CAEUhbmU65LjUkaDwZve=vj5EqSTYO5yJUAKf8_3Eq85LF-b_1Q@mail.gmail.com>
References: <20210703175607.92532-1-jrtc27@jrtc27.com>
 <CAEUhbmU65LjUkaDwZve=vj5EqSTYO5yJUAKf8_3Eq85LF-b_1Q@mail.gmail.com>
Message-ID: <FCA77967-C02F-45DB-BCA2-9D81467F7FAE@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5 Jul 2021, at 14:14, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> On Sun, Jul 4, 2021 at 1:56 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> This patch series is comprised of two parts.
>> 
>> The first patch adds build system support for using Clang and LLVM
>> binutils, provided your Clang is able to locate a libgcc.a in its search
>> path.
>> 
>> However, pure LLVM toolchains do not use libgcc, they use compiler-rt
>> (libclang_rt.builtins.<arch>.a). We could change the Makefile to not
>> hard-code -lgcc and instead use -print-libgcc-file-name, but that still
>> requires a bare metal compiler-rt built for the right -march/-mabi to be
>> present, which is often not the case. Moreover, we need very little from
>> libgcc/compiler-rt; RV64 needs nothing, and RV32 only needs 64-bit
>> division. Thus, the second patch vendors part of FreeBSD's libquad and
>> stops linking against libgcc entirely, allowing OpenSBI to be built with
>> just a cross-compiler. This means that building with any distro-provided
>> LLVM just works, as does compiling with the system Clang compiler and
>> LLD linker on FreeBSD without any external packages needed (beyond GNU
>> make).
> 
> I am concerned about removing libgcc. If we want to support running
> OpenSBI on a processor without M extension, it would require us to
> link with libgcc, or compiler-rt.

I don?t think such a processor is of interest to OpenSBI; you?re not
going to be running any Unix OS on that kind of extremely basic core.
We already have assembly that assumes M, and IMA is the documented
requirement. If someone really wants to patch OpenSBI to add support
for M-less cores then they can either vendor the needed
u?{mul,div,mod,divmod}si3 files as well or add back an option to use
libgcc/compiler-rt in such a case, but I don?t think that should be an
argument for requiring a full libgcc in the only cases supported today
that would still be orders of magnitude more common. I?m just following
U-Boot*, BBL, TF-A and FreeBSD and Linux kernels in not having a
libgcc/compiler-rt dependency; OpenSBI is currently the annoying
odd-one-out. And yes, some of those will include full soft-multiply
code too, it?s really not that many additional files, though you
wouldn?t be able to get them from FreeBSD as it doesn?t support such
processors. You could however just adapt its muldi and divdi functions
to mulsi and divsi without much difficulty. The alternative is to take
files from compiler-rt but the license is Apache with LLVM exceptions
so not quite as permissive as the BSD-2/3-clause files in tree today.

My point is, I don?t think we should use improbable hypotheticals as a
justification for blocking patches that solve real problems faced
today, especially when the solution for those real problems is not
incompatible with the hypothetical situations.

Jess

* Currently it requires libgcc/compiler-rt on RISC-V because nobody?s
done this yet for its RISC-V port, but other architectures (arc, arm,
m68k, mips, powerpc, sh, x86) all have the ability to not use libgcc


