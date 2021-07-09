From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 9 Jul 2021 18:27:55 +0800
Subject: [PATCH v3 2/3] Makefile: Support building with Clang and LLVM
 binutils
In-Reply-To: <20210709041213.11883-3-jrtc27@jrtc27.com>
References: <20210709041213.11883-1-jrtc27@jrtc27.com>
 <20210709041213.11883-3-jrtc27@jrtc27.com>
Message-ID: <CAEUhbmWX0zhXsMEWu8KzTZGt89ppCa4C8NgyTo=E7X9_A4jPsw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 9, 2021 at 12:12 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> This is intended to mirror the Linux kernel. Building with CC=clang will
> use Clang as the compiler but default to using the existing binutils.
> Building with LLVM=1 will default to using Clang and LLVM binutils.
>
> Whilst GCC will accept the -N linker option and forward it on to the
> linker, Clang will not, and so in order to support both compilers we
> must use -Wl, to forward it to the linker as is required for most other
> linker options.
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>  Makefile  | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  README.md | 43 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 100 insertions(+), 8 deletions(-)
>

Hardcoding "-target" to riscv64-unknown-elf, and building with clang
and gnu ld, I got:

$ make CC=clang CROSS_COMPILE=riscv64-linux- PLATFORM=generic

 ELF       platform/generic/firmware/payloads/test.elf
/usr/bin/ld.bfd: cannot represent machine `riscv'
clang-12: error: ld.lld command failed with exit code 1 (use -v to see
invocation)
make: *** [Makefile:404:
opensbi/build/platform/generic/firmware/payloads/test.elf] Error 1

Regards,
Bin

