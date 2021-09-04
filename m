From: Anup Patel <anup@brainfault.org>
Date: Sat, 4 Sep 2021 21:07:18 +0530
Subject: [RFC 1/1] platform/kendryte: disable FW_PIC
In-Reply-To: <83b0c28e-4150-dfe9-19db-172365758b3c@gmail.com>
References: <20210904094814.157823-1-xypron.glpk@gmx.de>
 <CAEUhbmWCFfPXTzOAenONkq3kUkuNuS4ctTPTPPvYDNrPsUK0Kw@mail.gmail.com>
 <83b0c28e-4150-dfe9-19db-172365758b3c@gmail.com>
Message-ID: <CAAhSdy09GB8Ni5QxCZ9kik-O531AqRyM7bGvZoaqDinH1ab-hg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 4, 2021 at 8:38 PM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 9/4/21 9:56 AM, Bin Meng wrote:
> > On Sat, Sep 4, 2021 at 5:49 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>
> >> Since commit bf3ef53bb7f5 ("firmware: Enable FW_PIC by default")
> >> building with
> >>
> >> make \
> >> PLATFORM=kendryte/k210 \
> >> FW_PAYLOAD=y \
> >> FW_PAYLOAD_OFFSET=0x40000 \
> >> FW_PAYLOAD_PATH=u-boot-dtb.bin
> >>
> >> fails:
> >>
> >> riscv64-linux-gnu/bin/ld:
> >> opensbi/build/platform/kendryte/k210/firmware/fw_payload.o:
> >> in function `.L0 ':
> >> opensbi/firmware/fw_base.S:77:
> >> undefined reference to `__rel_dyn_start'
> >> riscv64-linux-gnu/bin/ld:
> >> opensbi/firmware/fw_base.S:78:
> >> undefined reference to `__rel_dyn_end'
> >> riscv64-linux-gnu/bin/ld:
> >> opensbi/firmware/fw_base.S:89:
> >> undefined reference to `__dyn_sym_start'
> >> collect2: error: ld returned 1 exit status
> >>
> >
> > It looks like your toolchain is broken. I can build with your command
> > without any error. I am using buildroot 2020.08-1 toolchain.
>
> With the "riscv64-linux-gnu" [1] toolchain, I get the above error.
>
> With the "riscv64-elf" toolchain [2], everything compiles fine.

I am not seeing this compile error. I am using riscv64-unknown-linux-gnu
toolchain.

Using built-in specs.
COLLECT_GCC=riscv64-unknown-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/home/anup/Work/tools/riscv/mlocal/libexec/gcc/riscv64-unknown-linux-gnu/9.2.0/lto-wrapper
Target: riscv64-unknown-linux-gnu
Configured with:
/home/anup/Work/riscv-test/riscv-gnu-toolchain/riscv-gcc/configure
--target=riscv64-unknown-linux-gnu
--prefix=/home/anup/Work/tools/riscv/mlocal
--with-sysroot=/home/anup/Work/tools/riscv/mlocal/sysroot
--with-system-zlib --enable-shared --enable-tls
--enable-languages=c,c++,fortran --disable-libmudflap --disable-libssp
--disable-libquadmath --disable-nls --disable-bootstrap
--src=.././riscv-gcc --enable-multilib --with-abi=lp64d
--with-arch=rv64imafdc --with-tune=rocket 'CFLAGS_FOR_TARGET=-O2
-mcmodel=medlow' 'CXXFLAGS_FOR_TARGET=-O2   -mcmodel=medlow'
Thread model: posix
gcc version 9.2.0 (GCC)

What am I missing ?

Regards,
Anup

>
> --Sean
>
> [1] https://archlinux.org/packages/community/x86_64/riscv64-linux-gnu-gcc/
> [2] https://archlinux.org/packages/community/x86_64/riscv64-elf-gcc/
>
> >
> >> With FW_PIC=n building becomes possible.
> >>
> >> Fixes: bf3ef53bb7f5 ("firmware: Enable FW_PIC by default")
> >> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >> ---
> >> We need a description of what FW_PIC does in and
> >> a description of how to build for the K210 platform.
> >> in doc/.
> >> ---
> >>   platform/kendryte/k210/config.mk | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/platform/kendryte/k210/config.mk b/platform/kendryte/k210/config.mk
> >> index 8a9b814..c664ba1 100644
> >> --- a/platform/kendryte/k210/config.mk
> >> +++ b/platform/kendryte/k210/config.mk
> >> @@ -17,3 +17,6 @@ platform-ldflags-y =
> >>   FW_TEXT_START=0x80000000
> >>   FW_PAYLOAD=y
> >>   FW_PAYLOAD_ALIGN=0x1000
> >> +
> >> +# Others
> >> +FW_PIC=n
> >>
> >
> > Regards,
> > Bin
> >
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

