From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Jul 2021 00:13:28 +0800
Subject: undefined reference to `__dyn_sym_start' since commit
 bf3ef53bb7f5 ("firmware: Enable FW_PIC by default")
In-Reply-To: <00eeaf45-1291-4c03-a504-ee1aeb8d9ee7@gmx.de>
References: <056b2e37-0806-216d-18e7-6f7807ad90e9@gmx.de>
 <CAEUhbmUeAQ3M5zOeZWn_7G3MXBWT6c_V+sWCUuCPFzQn0ogteg@mail.gmail.com>
 <00eeaf45-1291-4c03-a504-ee1aeb8d9ee7@gmx.de>
Message-ID: <CAEUhbmXQMHkDwJRovFLxCx_GdgpUpMwuwzdcmHQENH1435PKBg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 3, 2021 at 11:58 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 7/3/21 5:07 PM, Bin Meng wrote:
> > On Sat, Jul 3, 2021 at 7:37 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>
> >> make \
> >>           PLATFORM=kendryte/k210 \
> >>           FW_PAYLOAD=y \
> >>           FW_PAYLOAD_OFFSET=0x20000 \
> >>           FW_PAYLOAD_PATH=u-boot-dtb.bin
> >>
> >> fails with
> >
> > I don't see any problem with building it with current opensbi/master.
> > I am using GCC 10.2.0.
>
> The missing symbols are created by a linker script. So I guess the
> important thing is the linker version.
>
> My tools are
>
> riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110
> GNU ld (GNU Binutils for Debian) 2.35.2
>
> on an *aarch64* Debian Bullseye system.
>
> I am on commit a731c7e36988c33.

I have:

GCC 10.2.0
GNU ld 2.34

on my x86 machine, and could not reproduce this on the same commit.

>
> On an amd64 system with the same software release I am not able to
> reproduce the problem.
>

Regards,
Bin

