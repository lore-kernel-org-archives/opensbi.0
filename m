From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Jul 2021 21:14:50 +0800
Subject: [PATCH 0/2] Fully support standalone Clang/LLVM toolchains
In-Reply-To: <20210703175607.92532-1-jrtc27@jrtc27.com>
References: <20210703175607.92532-1-jrtc27@jrtc27.com>
Message-ID: <CAEUhbmU65LjUkaDwZve=vj5EqSTYO5yJUAKf8_3Eq85LF-b_1Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 4, 2021 at 1:56 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> This patch series is comprised of two parts.
>
> The first patch adds build system support for using Clang and LLVM
> binutils, provided your Clang is able to locate a libgcc.a in its search
> path.
>
> However, pure LLVM toolchains do not use libgcc, they use compiler-rt
> (libclang_rt.builtins.<arch>.a). We could change the Makefile to not
> hard-code -lgcc and instead use -print-libgcc-file-name, but that still
> requires a bare metal compiler-rt built for the right -march/-mabi to be
> present, which is often not the case. Moreover, we need very little from
> libgcc/compiler-rt; RV64 needs nothing, and RV32 only needs 64-bit
> division. Thus, the second patch vendors part of FreeBSD's libquad and
> stops linking against libgcc entirely, allowing OpenSBI to be built with
> just a cross-compiler. This means that building with any distro-provided
> LLVM just works, as does compiling with the system Clang compiler and
> LLD linker on FreeBSD without any external packages needed (beyond GNU
> make).

I am concerned about removing libgcc. If we want to support running
OpenSBI on a processor without M extension, it would require us to
link with libgcc, or compiler-rt.

Regards,
Bin

