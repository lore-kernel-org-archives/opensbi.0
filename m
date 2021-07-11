From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 11 Jul 2021 23:34:22 +0800
Subject: [PATCH v5 5/6] Makefile: Support building with Clang and LLVM
 binutils
In-Reply-To: <CAAhSdy0qMOD2OAOMkaQNFLO8e+1r4jayZzodnRU16yK1On+4zA@mail.gmail.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
 <20210711022824.29915-6-jrtc27@jrtc27.com>
 <CAAhSdy0qMOD2OAOMkaQNFLO8e+1r4jayZzodnRU16yK1On+4zA@mail.gmail.com>
Message-ID: <CAEUhbmWx69=7BXS_F4KLPMaCOO2=42feTQsxZA0jkf7fPxZ5Mw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 11:11 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sun, Jul 11, 2021 at 7:58 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >
> > This is intended to mirror the Linux kernel. Building with CC=clang will
> > use Clang as the compiler but default to using the existing binutils.
> > Building with LLVM=1 will default to using Clang and LLVM binutils.
> >
> > Whilst GCC will accept the -N linker option and forward it on to the
> > linker, Clang will not, and so in order to support both compilers we
> > must use -Wl, to forward it to the linker as is required for most other
> > linker options.
> >
> > Note that there is currently a bug when using Clang as the compiler and
> > riscv64-linux-gnu-ld as the linker for FW_PIC=y. At first glance this
> > appears to be a bug in GNU binutils, but this could also be Clang or
> > OpenSBI at fault in some subtle way. Thus, for now, advise that this
> > combination be avoided.
> >
> > Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
>
> I tried this patch using GCC linux toolchain and U-Boot SPL which
> worked fine for me. I don't have bare-metal GCC toolchain and LLVM
> but I assume LLVM is tested by Jessica.

It's nothing related to bare-metal, but a mixed usage of GCC and LLVM
(the 3rd combination in the README)

>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Tested-by: Anup Patel <anup.patel@wdc.com>
>
> If there are other compile issues then please send fix as a separate
> patch. I insist more people to play around with LLVM and GCC
> bare-metal so that we catch issues early.
>
> Applied this patch to the riscv/opensbi repo.

Oops, I was about to give my RB / TB tags, but that's not a big deal :)

Regards,
Bin

