From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 11 Jul 2021 21:08:41 +0800
Subject: [PATCH v5 3/6] firmware: Explicitly pass -pie to the linker, not
 just the driver
In-Reply-To: <7E2B3D66-7E2D-473C-95A2-DC9CEEACBCF3@jrtc27.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
 <20210711022824.29915-4-jrtc27@jrtc27.com>
 <CAEUhbmW3SgKdTLMRcQd9=ZT4m=nBF5FU2obXJbuno3zTKzi56Q@mail.gmail.com>
 <7E2B3D66-7E2D-473C-95A2-DC9CEEACBCF3@jrtc27.com>
Message-ID: <CAEUhbmXsgN6Qf+3Teqek7gATaT2-zJiHvq6LpjAdP32GMdJMCw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 9:06 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 11 Jul 2021, at 14:05, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Sun, Jul 11, 2021 at 10:29 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>
> >> When using Clang with a bare-metal triple, -pie does not get passed to
> >> the linker as it's not normally a thing that makes sense, unlike GCC
> >> which will unconditionally forward it on and potentially result in a
> >
> > It seems GCC driver does not unconditionally forward it to the linker, see:
> >
> > $ riscv64-unknown-elf-gcc -fPIE -nostdlib -x c /dev/null -o /dev/null
> > 2>&1 && echo y
> > /opt/riscv-unknown-elf/lib/gcc/riscv64-unknown-elf/10.1.0/../../../../riscv64-unknown-elf/bin/ld:
> > warning: cannot find entry symbol _start; defaulting to
> > 0000000000010040
> > y
> >
> > But
> >
> > $ riscv64-unknown-elf-gcc -fPIE -nostdlib -Wl,-pie -x c /dev/null -o
> > /dev/null 2>&1 && echo y
> > /opt/riscv-unknown-elf/lib/gcc/riscv64-unknown-elf/10.1.0/../../../../riscv64-unknown-elf/bin/ld:
> > -pie not supported
> > collect2: error: ld returned 1 exit status
> >
> > So regarding bare-metal triple, GCC driver and  clang driver behave
> > the same way. It's just GNU bare-metal ld does not support PIE, while
> > LLD supports.
> >
> > So we need to revise the above commit message.
>
> You didn?t pass -pie, only -fPIE.

Ah, yes. Indeed -pie is the linker option. Then we are good.

Regards,
Bin

